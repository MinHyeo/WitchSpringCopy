using Microsoft.Win32.SafeHandles;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    float _speed = 6.0f;
    Vector3 _desPos;
    Vector3 _monsterPos;

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
        //animation
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

            // animation
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

    void UpdateEscape()
    {
        Vector3 dir = ((transform.position - _monsterPos).normalized) * 3;
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

            // animation
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

    public void OnFightStated(Vector3 monster)
    {
        _state = Define.PlayerState.FightEnter;
        _monsterPos = monster;
        Debug.Log("½Î¿ò ¹ß»ý!");
    }

    public void OnEscape()
    {
        _state = Define.PlayerState.Escape;
    }
}
