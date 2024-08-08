using System.Collections;
using System.Collections.Generic;
using System.Xml.Serialization;
using TreeEditor;
using UnityEngine;
using UnityEngine.EventSystems;

public class MonsterController : MonoBehaviour
{
    GameObject _player = null;
    Vector3 _originalPos;
    Vector3 _desPos;

    string _monsterObjectName;
    string _monsterName;
    string _monsterDescription;
    int _maxHp;
    int _hp;
    int _str;
    int _int;
    int _dex;
    int _def;
    int _mdef;

    float _speed = 6.0f;
    float _attackDistance = 3.0f;

    [SerializeField]
    public Define.MonsterState _state = Define.MonsterState.Idle;
    // Start is called before the first frame update
    void Start()
    {
        // 데이터 연동
        _monsterObjectName = gameObject.name;
        GameManager.Data.GetCollidedObjectName(_monsterObjectName);
        _monsterName = GameManager.Data.GetMonsterName();
        _monsterDescription = GameManager.Data.GetMonsterInfo();
        _player = GameObject.Find("Player");

        _maxHp = int.Parse(GameManager.Data.GetMonsterStats("HP"));
        _str = int.Parse(GameManager.Data.GetMonsterStats("STR"));
        _int = int.Parse(GameManager.Data.GetMonsterStats("INT"));
        _dex = int.Parse(GameManager.Data.GetMonsterStats("DEX"));
        _def = int.Parse(GameManager.Data.GetMonsterStats("DEF"));
        _mdef = int.Parse(GameManager.Data.GetMonsterStats("MDEF"));

        // 체력 세팅
        _hp = _maxHp;
    }

    void UpdateIdle()
    {
        _speed = 0.0f;
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("Speed", _speed);
    }

    void UpdataATK()
    {
        _speed = 6.0f;

        Vector3 dir = (_player.transform.position - transform.position).normalized;

        float distanceToMonster = Vector3.Distance(transform.position, _player.transform.position);

        if (distanceToMonster <= _attackDistance)
        {
            Animator anim = GetComponent<Animator>();
            anim.SetTrigger("Attack");
        }
        else
        {
            float moveDist = _speed * Time.deltaTime;
            transform.position += dir * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

            // Animation
            Animator anim = GetComponent<Animator>();
            anim.SetFloat("Speed", _speed);
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
            transform.LookAt(_player.transform.position);
            GameManager.UI.ShowPopupUI<UI_Behaviors>();
            _state = Define.MonsterState.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(_originalPos);

            Animator anim = GetComponent<Animator>();
            anim.SetFloat("Speed", _speed);
        }
    }
    void UpdateHit()
    {
        _hp -= (_def );
        Animator anim = GetComponent<Animator>();
        anim.SetTrigger("Hit");
    }
    void UpdateDie()
    {
        Animator anim = GetComponent<Animator>();
        anim.SetTrigger("Die");
    }
    void Update()
    {
        switch(_state)
        {
            case Define.MonsterState.Idle:
                UpdateIdle();
                break;

            case Define.MonsterState.Attack:
                UpdataATK();
                break;

            case Define.MonsterState.Comeback:
                UpdateComeback();
                break;

            case Define.MonsterState.Hit:
                CheckHealth();
                break;

            case Define.MonsterState.Die:
                break;
        }
        
    }

    public void OnIdle()
    {
        _state = Define.MonsterState.Idle;
        _originalPos = transform.position;
    }
    public void OnAttack()
    {
        _originalPos = transform.position;
        _state = Define.MonsterState.Attack;
    }
    public void OnHit() 
    {
        _state = Define.MonsterState.Hit;
    }
    public void OnDie()
    {
        _state = Define.MonsterState.Die;
    }

    public void OnComeBack()
    {
        
        _state = Define.MonsterState.Comeback;
    }

    public void OnHit(int Damage)
    {
        Animator anim = GetComponent<Animator>();
        anim.SetTrigger("Hit");
        _hp -= Damage;
    }

    public void CheckHealth()
    {
        if(_hp < 0)
        {
            _state = Define.MonsterState.Die;
        }
    }

    public void Attacking()
    {
        PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        playerController.OnHit(1);
    }


}
