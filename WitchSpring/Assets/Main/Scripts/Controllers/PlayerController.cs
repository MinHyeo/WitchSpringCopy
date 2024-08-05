using Microsoft.Win32.SafeHandles;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    Vector3 _desPos;
    Vector3 _monsterPos;
    Vector3 _originalPos;

    float _speed = 6.0f;
    float _escapeDistance = 8.0f;
    float _attackDistance = 2.0f;
    int _attackNum = 0;

    GameObject _monster = null;

    [SerializeField]
    public Define.PlayerState _state = Define.PlayerState.Idle;

    // Start is called before the first frame update
    void Start()
    {
        GameManager.input.MouseAction -= OnMouseClicked;
        GameManager.input.MouseAction += OnMouseClicked;
    }

    void UpdateIdle()
    {
        // Animation
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("speed", 0);
    }

    void UpdateMoving()
    {
        Vector3 dir = _desPos - transform.position;

        if (dir.magnitude < 0.0001f)
        {
            _state = Define.PlayerState.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(_desPos);

            // Animation
            Animator anim = GetComponent<Animator>();
            anim.SetFloat("speed", _speed);
        }
    }

    void UpdateFight()
    {
        _speed = 0.0f;
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("speed", _speed);
    }

    void UpdataATK()
    {
        _speed = 6.0f;
        
        Vector3 dir = (_monsterPos - transform.position).normalized;

        float distanceToMonster = Vector3.Distance(transform.position, _monsterPos);

        if (distanceToMonster <= _attackDistance)
        {
            Animator anim = GetComponent<Animator>();
            anim.SetInteger("ATK", _attackNum);
        }
        else
        {
            float moveDist = _speed * Time.deltaTime;
            transform.position += dir * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

            // Animation
            Animator anim = GetComponent<Animator>();
            anim.SetFloat("speed", _speed);
        }
    }
    void UpdateComeback()
    {
        
        _speed = 6.0f;

        Vector3 dir = _originalPos - transform.position;
        // 원래 위치로 이동하는 방향 계산
        if (dir.magnitude < 0.1f)
        {
            _speed = 0.0f;
            transform.LookAt(_monsterPos);
            GameManager.UI.ShowPopupUI<UI_Behaviors>();
            _state = Define.PlayerState.FightEnter;
        }
        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(_originalPos);

            Animator anim = GetComponent<Animator>();
            anim.SetFloat("speed", _speed);
        }
    }

    void UpdateEscape()
    {
        _speed = 6.0f;

        // Calculate the direction while keeping Y component zero
        Vector3 dir = (transform.position - _monsterPos).normalized;
        dir.y = 0f;  // Ensure no vertical movement

        float distanceToMonster = Vector3.Distance(transform.position, _monsterPos);

        if (distanceToMonster >= _escapeDistance)
        {
            _state = Define.PlayerState.Idle;
        }
        else
        {
            float moveDist = _speed * Time.deltaTime;
            transform.position += dir * moveDist;

            // Lock rotation to the XZ plane by setting dir's Y component to zero
            if (dir != Vector3.zero) // Check to prevent NaN in Quaternion.LookRotation
            {
                transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            }

            // Animation
            Animator anim = GetComponent<Animator>();
            anim.SetFloat("speed", _speed);
        }
    }

    void Update()
    {
        switch (_state)
        {
            case Define.PlayerState.Idle:
                UpdateIdle();
                break;

            case Define.PlayerState.Moving:
                UpdateMoving();
                break;

            case Define.PlayerState.FightEnter:
                UpdateFight();
                break;

            case Define.PlayerState.Figjt_ATK:
                UpdataATK();
                break;

            case Define.PlayerState.Comeback:
                UpdateComeback();
                break;

            case Define.PlayerState.Escape:
                UpdateEscape();
                break;
        }
    }

    void OnMouseClicked(Define.MouseEvent evt)
    {
        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        Debug.DrawRay(Camera.main.transform.position, ray.direction * 100.0f, Color.red, 1.0f);

        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100.0f, LayerMask.GetMask("Wall")))
        {
            _desPos = hit.point;
            _state = Define.PlayerState.Moving;
        }
    }

    public void OnFightStated(GameObject monster)
    {
        _monster = monster; 
        _originalPos = transform.position;
        _state = Define.PlayerState.FightEnter;
        _monsterPos = monster.transform.position;
        _monsterPos.y = 0.0f;
    }

    public void OnATK(int attack)
    {
        _attackNum = attack;
        _state = Define.PlayerState.Figjt_ATK;
    }

    public void OnComeback()
    {
        Animator anim = GetComponent<Animator>();
        anim.SetInteger("ATK", 0);

        _state = Define.PlayerState.Comeback;
    }

    public void OnEscape()
    {
        _state = Define.PlayerState.Escape;
    }

    public void Attacking()
    {
        MonsterController monsterController = _monster.GetComponent<MonsterController>();
        monsterController.OnHit(1);
    }
}
