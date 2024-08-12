using Microsoft.Win32.SafeHandles;
using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.Playables;

public class PlayerController : MonoBehaviour
{
    public GameObject testParticle;
    public GameObject testParticle2;
    public GameObject testParticle3;
    public GameObject testParticle4;

    Vector3 _desPos;
    Vector3 _monsterPos;
    Vector3 _originalPos;

    int _maxHp;
    int _hp;
    int _maxMp;
    int _mp;
    int _int;
    int _str;
    int _dex;
    int _def;
    float _speed;

    public int MaxHP { get { return _maxHp; } }
    public int HP { get { return _hp; } }
    public int MaxMP { get { return _maxMp; } }
    public int MP { get { return _mp; } }
    public int INT { get { return _int; } }
    public int STR { get { return _str; } }
    public int DEX { get { return _dex; } }
    public int DEF { get { return _def; } }

    float _escapeDistance = 8.0f;
    float _attackDistance = 3.5f;
    int _attackNum = 0;

    public bool isMana = false;
    int ManaCount = 0;

    GameObject _monster = null;

    [SerializeField]
    public Define.PlayerState _state = Define.PlayerState.Idle;

    // Start is called before the first frame update
    void Start()
    {
        GameManager.input.MouseAction -= OnMouseClicked;
        GameManager.input.MouseAction += OnMouseClicked;

        Init();
    }

    void Init()
    {
        _maxHp = int.Parse(GameManager.Data.GetPlayerStat("HP"));
        _maxMp = int.Parse(GameManager.Data.GetPlayerStat("MP"));
        _int = int.Parse(GameManager.Data.GetPlayerStat("INT"));
        _str = int.Parse(GameManager.Data.GetPlayerStat("STR"));
        _dex = int.Parse(GameManager.Data.GetPlayerStat("DEX"));
        _def = int.Parse(GameManager.Data.GetPlayerStat("DEF"));
        _speed = float.Parse(GameManager.Data.GetPlayerStat("MS"));

        _hp = _maxHp;
        _mp = _maxMp;
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
            transform.LookAt(_monsterPos);
            MonsterController monsterController = _monster.GetComponent<MonsterController>();
            monsterController.OnAttack();


            //GameManager.UI.ShowPopupUI<UI_Behaviors>();
            _state = Define.PlayerState.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

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

            case Define.PlayerState.Hit:
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
        testParticle.GetComponent<Particle_ManaSword>().SetIdle_ManaSword();
    }

    public void OnEscape()
    {
        _state = Define.PlayerState.Escape;
    }

    public void OnHit(int Damage)
    {
        int trueDamage = Damage - _def;
        _hp -= (trueDamage);

        GameObject UI = GameObject.Find("@UI_Root");
        Transform ShowNum = UI.transform.Find("UI_MonsterHP(Clone)");

        UI.transform.Find("UI_Default(Clone)").GetComponent<UI_Default>().UpdateText();
        ShowNum.Find("Text_Damage").GetComponent<Nums>().SetShowState(Nums.ShowState.Player);
        ShowNum.GetComponent<UI_MonsterHP>().UpdateDamageText(trueDamage.ToString());

        Debug.Log(_hp);
        Debug.Log("플레이어 피격");
    }

    public void Attacking(int ATKnum)
    {
        if(isMana)
        {
            testParticle.GetComponent<Particle_ManaSword>().SetATK();
            
            ManaCount++;
            Debug.Log($"마나검술 {ManaCount}회");
            if (ManaCount >= 10) 
            {
                _str -= 10;
                testParticle.GetComponent<Particle_ManaSword>().StopParticle_ManaSword();
                isMana = false;
                ManaCount = 0;
            }
        }
        MonsterController monsterController = _monster.GetComponent<MonsterController>();
        int trueDamage = 0;

        switch (ATKnum)
        {
            case 1:
                trueDamage = _str;
                break;
            case 2:
                trueDamage = Convert.ToInt32(_str * 1.2f);
                break;
            case 3:
                trueDamage = Convert.ToInt32(_str * 1.25f);
                break;
            case 4:
                trueDamage = Convert.ToInt32(_str * 1.3f);
                break;
            case 5:
                trueDamage = Convert.ToInt32(_str * 1.35f);
                break;
            case 6:
                trueDamage = Convert.ToInt32(_str * 1.4f);
                break;
            case 7:
                trueDamage = Convert.ToInt32(_str * 1.45f);
                break;
        }

        monsterController.OnHit(trueDamage); //데미지
        
        Camera.main.GetComponent<CameraController>().SetShakingCamera();
        
    }

    public void ManaSword(string Mana)
    {
        isMana = true;
        switch(Mana)
        {
            case "ManaSword":
                testParticle.GetComponent<Particle_ManaSword>().StartParticle_ManaSword();
                _str += 10; //계산식 추가
                break;
            case "AbsorptionBlade":
                testParticle2.GetComponent<Particle_AbsorptionBlade>().StartParticle_AbsorptionBlade();
                break;
            case "ManaOrb":
                break;
            case "TraceOfMana":
                break;
        }
    }
}
