using System;
using System.Collections.Generic;
using UnityEditor.Timeline.Actions;
using UnityEngine;


//This Script is invoked in MosterBattle and GameManager
public class PlayerController : MonoBehaviour
{
    [Header("Player Info")]
    [SerializeField] private Vector3 m_pos;
    [SerializeField] private Vector3 p_pos;
    [SerializeField] private float curHp;
    [SerializeField] private float maxHp;
    [SerializeField] private float curMp;
    [SerializeField] private float maxMp;
    [SerializeField] private float curSp;
    [SerializeField] private float maxSp;
    [SerializeField] private float magic;
    [SerializeField] private float strength;
    [SerializeField] private float agility;
    [SerializeField] private float curAgility;
    [SerializeField] private float defense;
    [SerializeField] private float attack_count = 1;
    [SerializeField] private float p_speed;
    [SerializeField] private float wait_run_ration;
    [SerializeField] private int attackNumber = 0;
    [SerializeField] private bool attackFlag= false;
    [SerializeField] private bool IsTurn= true;
    [SerializeField] private Define.PlayerStates p_state = Define.PlayerStates.Idle;
    [SerializeField] private Dictionary<string, int> buffList = new Dictionary<string, int>();

    [Header("Player Components")]
    [Tooltip("스크립트에서 가져옴")]
    [SerializeField] private Animator P_Animator;
    [Tooltip("스크립트에서 가져옴")]
    [SerializeField] private ParticleSystem P_Particle;   

    #region Get/Set
    public float CurrentHP { get { return curHp; } set { curHp = value; } }
    public float MaxHP { get { return maxHp; } set { maxHp = value; } }
    public float CurrentMP { get { return curMp; } set { curMp = value; } }
    public float MaxMP { get { return maxMp; } set { maxMp = value; } }
    public float CurrentSP { get { return curSp; } set { curSp = value; } }
    public float MaxSP { get { return maxSp; } set { maxSp = value; } }
    public float Magic { get { return magic; } set { magic = value; } }
    public float PlayerAgility { get { return agility; } }
    public float PlayerCurAgt { get { return curAgility; } set { curAgility = value; } }
    public int AttackNumber { set { attackNumber = value; } }
    public bool PlayerTurn { get { return IsTurn; } set { IsTurn = value; } }

    public Dictionary<string, int> Buff { get { return buffList; } }
    private List<MagicFenceType> magicFences;

    #endregion

    void Start()
    {
        GameManager.Input.MouseAction -= ClickToMove;
        GameManager.Input.MouseAction += ClickToMove;
        p_speed = 5.0f;
        curHp = 90.0f;
        maxHp = 100.0f;
        curMp = 150.0f;
        maxMp = 200.0f;
        curSp = 10.0f;
        maxSp = 100.0f;
        magic = 10.0f;
        strength = 10.0f;
        agility = 10.0f;
        defense = 10.0f;

        P_Animator = GetComponent<Animator>();

        P_Particle = transform.GetComponentInChildren<ParticleSystem>();

        for (int i = 0; i < (int)Define.PlayerBuff.MaxBuff; i++)
        {
            string BuffName = Enum.GetName(typeof(Define.PlayerBuff), i);
            buffList.Add(BuffName, 0);
        }
    }

    void Update()
    {
        //Status Pattern
        switch (p_state)
        {
            case Define.PlayerStates.Idle:
                StateIdle();
                break;
            case Define.PlayerStates.Walk:
                StateWalk();
                break;
            case Define.PlayerStates.Dead:
                StateDead();
                break;
            case Define.PlayerStates.Battle:
                StateBattle();
                break;
        }
    }
    //상태에 따른 행동 메서드
    void StateIdle()
    {
        wait_run_ration = Mathf.Lerp(wait_run_ration, 0, 10.0f * Time.deltaTime);

        //Set Idle Animation
        P_Animator.SetFloat("Speed", 0.0f);
        p_pos = transform.position;
    }

    void StateWalk()
    {
        if (attackFlag) {
            p_pos = transform.position;
        }
        Vector3 dir = m_pos - transform.position;
        dir.y = 0;
        if (dir.magnitude < 0.001f)
        {
            //Change State
            p_state = Define.PlayerStates.Idle;
            if (attackFlag) {
                transform.Rotate(new Vector3(0.0f,180.0f, 0.0f), Space.Self);
                attackFlag = false;
                P_Animator.SetBool("IsBattle", true);
                if (GameManager.Instance.Monster.GetComponent<MonsterController>().IsDead) {
                    GameManager.Instance.Monster.transform.parent.gameObject.SetActive(false);
                    GameManager.Instance.Monster.GetComponent<MonsterController>().Disconnect();
                    GameManager.Situation.SetStiuation(Define.Situations.Normal);
                }
                return;
            }
        }
        else
        {
            float moveDist = Mathf.Clamp(p_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }



        //Set Walk Animation
        P_Animator.SetFloat("Speed", p_speed);
        P_Animator.SetBool("IsBattle", false);
    }

    void StateDead()
    {
        //TODO

        //Set Dead Animation
        P_Animator.SetBool("IsDead", true);
        return;
    }


    void StateBattle()
    {
        P_Animator.SetFloat("Speed", 0.0f);
        P_Animator.SetBool("IsBattle", true);
        return;
    }


    void ClickToMove(Define.MouseEvent mouseEvent)
    {
        if (GameManager.UI.IsMessageOn || mouseEvent == Define.MouseEvent.Check)
        {
            GameManager.UI.CloseUIMessage();
            return;
        }

        if (p_state == Define.PlayerStates.Dead || p_state == Define.PlayerStates.Battle
            || GameManager.Situation.currentSituations == Define.Situations.Contact || GameManager.Camera.GetComponent<CameraController>().CameraMoving)
        {
            return;
        }

        Ray Mouse_Ray = Camera.main.ScreenPointToRay(Input.mousePosition);

        RaycastHit Hit;
        if (Physics.Raycast(Mouse_Ray, out Hit, 100.0f, LayerMask.GetMask("Terrain")))
        {
            //Get mouse position (Destination position)
            m_pos = Hit.point;
            p_state = Define.PlayerStates.Walk;
        }
    }

    public void SetPlayerState(Define.PlayerStates playerState, Vector3 Dest = default(Vector3))
    {
        p_state = playerState;
        m_pos = Dest;
    }

    public void PlayerAttack()
    {
        float damage = 0.0f;

        switch (attack_count)
        {
            case 1:
                damage = strength * 1.0f;
                break;
            case 2:
                damage = strength * 1.2f;
                break;
            case 3:
                damage = strength * 1.25f;
                break;
            case 4:
                damage = strength * 1.3f;
                break;
            case 5:
                damage = strength * 1.35f;
                break;
            case 6:
                damage = strength * 1.4f;
                break;
            case 7:
                damage = strength * 1.45f;
                break;
        }
        GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterHit(damage);
        attack_count++;


        if (Buff["MagicSword"] > 0)
        {
            //GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterHit(strength * 1.3f);
        }
        if (Buff["AbsorbSword"] > 0 && curHp < MaxHP)
        {
            RecoverHP(strength * magic * 0.08f);

        }
        if (Buff["MagicMaterialize"] > 0)
        {
            GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterHit(magic / 2);
        }


        if (Buff["MagicTrace"] > 0)
        {
            Buff["MagicTrace"]--;
        }
    }


    public void PlayerAttackReset()
    {
        attack_count = 1;
        MagicFenceBuffSet();
        SetPlayerState(Define.PlayerStates.Walk, p_pos);
        GameManager.GM_Instance.GetComponent<GameManager>().EndTurn();
    }

    public void UseTurn() {
        curAgility = 0.0f;
        IsTurn = false;
    }

    public void PlayerHit(int damage)
    {
        curHp -= damage;
        if (curHp < 0)
        {
            p_state = Define.PlayerStates.Dead;
        }
    }

    public void RecoverHP(float recMount = 0.0f)
    {
        curHp += recMount;

        if (curHp > MaxHP)
        {
            curHp = MaxHP;
        }
        GameManager.UI.Heal((int)recMount);
    }
    public void UseHPOrHit(float decHp)
    {
        curHp -= decHp;
    }

    public void RecoverMP(float recMount = 0.0f)
    {
        curMp += recMount;

        if (curMp > MaxHP)
        {
            curMp = MaxHP;
        }
    }
    public void UseMP(float decMP)
    {
        curMp -= decMP;
        if (curMp < 0)
        {
            curMp = 0.0f;
        }
    }

    public void MagicFenceBuffSet() {
        if (Buff["MagicSword"] > 0 || Buff["AbsorbSword"] > 0 || Buff["MagicMaterialize"] > 0)
        {
            if (!P_Particle.IsAlive()) {
                P_Particle.Play();
            }
            return;
        }
        P_Particle.Stop();
    }

    public void FenceAttack()
    {
        attackFlag = true;
        P_Animator.SetInteger("AttackNumber", attackNumber);
        P_Animator.SetTrigger("Attack");
    }
}