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

    public int MaxHP { get { return _maxHp; } }
    public int HP { get { return _hp; } }
    public int INT { get { return _int; } }
    public int STR { get { return _str; } }
    public int DEX { get { return _dex; } }
    public int DEF { get { return _def; } }

    float _speed = 6.0f;
    float _attackDistance = 2.0f;

    public bool _isDead = false;
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
            anim.SetBool("Attack", true);
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

            if(GameManager.UI.CheckPopupUI<UI_Behaviors>()==false)
                GameManager.UI.ShowPopupUI<UI_Behaviors>();

            _state = Define.MonsterState.Idle;
            Camera.main.GetComponent<CameraController>()._mode = Define.CameraMode.PlayerFocused;
        }
        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

            Animator anim = GetComponent<Animator>();
            anim.SetFloat("Speed", _speed);
        }
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
        }
        
    }

    public void OnIdle()
    {
        _state = Define.MonsterState.Idle;
        _originalPos = transform.position;
    }
    public void OnAttack()
    {
        if(_isDead) return;

        _originalPos = transform.position;
        _state = Define.MonsterState.Attack;
        Camera.main.GetComponent<CameraController>()._mode = Define.CameraMode.MonsterFocused;
    }
    public void OnDie()
    {
        _state = Define.MonsterState.Die;
    }

    public void OnComeBack()
    {
        Animator anim = GetComponent<Animator>();
        anim.SetBool("Attack", false);
        _state = Define.MonsterState.Comeback;
    }

    public void OnHit(int Damage)
    {
        int trueDamage = Damage - _def;
        _hp -= trueDamage;

        GameObject UI = GameObject.Find("@UI_Root");
        Transform ShowNum = UI.transform.Find("UI_MonsterHP(Clone)");
        UI.transform.Find("UI_Default(Clone)").GetComponent<UI_Default>().UpdateText();
        ShowNum.Find("Text_Damage").GetComponent<Nums>().SetShowState(Nums.ShowState.Monster);
        ShowNum.GetComponent<UI_MonsterHP>().UpdateDamageText(trueDamage.ToString());

        CheckHealth();

        GameObject.Find("@UI_Root").transform.Find("UI_MonsterHP(Clone)").GetComponent<UI_MonsterHP>().UpdateText();
        Animator anim = GetComponent<Animator>();
        if (anim.GetCurrentAnimatorStateInfo(0).IsName("Get Hit") &&
            anim.GetCurrentAnimatorStateInfo(0).normalizedTime < 1.0f)
        {
            // 이미 실행 중인 애니메이션이면, 애니메이터를 리셋합니다.
            anim.Play("Get Hit", 0, 0.0f);
        }
        else
        {
            // 애니메이션이 실행 중이지 않다면, 애니메이션을 시작합니다.
            anim.Play("Get Hit");
        }
    }

    public void CheckHealth()
    {
        if(_hp <= 0 && !_isDead)
        {
            _isDead = true;
            _state = Define.MonsterState.Die;
            Animator anim = GetComponent<Animator>();
            anim.SetTrigger("Die");

            GameManager.UI.ClosePopupUI();

            PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();
            playerController._state = Define.PlayerState.Escape;

            Camera.main.GetComponent<CameraController>()._mode = Define.CameraMode.QuarterView;

            gameObject.GetComponentInChildren<CollisionManager>().gameObject.SetActive(false);
        }
        else
        {
            return;
        }
    }

    public void Attacking()
    {
        CheckHealth();
        PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        playerController.OnHit(_str);
        Camera.main.GetComponent<CameraController>().SetShakingCamera();

    }


}
