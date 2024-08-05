using System.Collections;
using System.Collections.Generic;
using System.Xml.Serialization;
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
    float _attackDistance = 2.0f;

    public Define.MonsterState _state = Define.MonsterState.Idle;
    // Start is called before the first frame update
    void Start()
    {
        // 데이터 연동
        _monsterObjectName = gameObject.name;
        GameManager.Data.GetCollidedObjectName(_monsterObjectName);
        _monsterName = GameManager.Data.GetMonsterName();
        _monsterDescription = GameManager.Data.GetMonsterInfo();

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
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("speed", 0);
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
    void UpdateHit()
    {

    }
    void UpdateDie()
    {

    }
    void Update()
    {
        switch(_state)
        {
            case Define.MonsterState.Idle:
                break;

            case Define.MonsterState.Attack:
                break;

            case Define.MonsterState.Hit:
                break;

            case Define.MonsterState.Die:
                break;
        }
        
    }

    public void OnIdle()
    {
        _state = Define.MonsterState.Idle;
    }
    public void OnAttack()
    {
        _originalPos = transform.position;
        _player = GameObject.Find("Player");
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

    public void OnHit(int Damage)
    {
        Animator anim = GetComponent<Animator>();
        anim.SetTrigger("Hit");
        _hp -= Damage;
    }


}
