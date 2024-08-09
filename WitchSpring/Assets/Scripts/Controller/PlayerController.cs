using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//This Script is invoked in MosterBattle and GameManager
public class PlayerController : MonoBehaviour
{
    [Header("Player Info")]
    [SerializeField] int curHp = 100;
    [SerializeField] int maxHp = 100;
    [SerializeField] int curmp = 100;
    [SerializeField] int maxmp = 100;
    [SerializeField] float strength = 10.0f;
    [SerializeField] int attack_count = 1;
    [SerializeField] float p_speed;
    [SerializeField] float wait_run_ration;
    [SerializeField] Vector3 m_pos;
    [SerializeField] Define.PlayerStates p_state = Define.PlayerStates.Idle;

    [Header("Player Components")]
    [SerializeField] Animator P_Animator;

    #region Get/Set
    public int CurrentHP { get { return curHp; } set { curHp = value; } }
    public int MaxHP { get { return maxHp; } set { maxHp = value; } }
    public int CurrentMP { get { return curmp; } set { curmp = value; } }
    public int MaxMP { get { return maxHp; } set { maxmp = value; } }

    #endregion

    //상태에 따른 행동 메서드
    void StateIdle(){
        wait_run_ration = Mathf.Lerp(wait_run_ration, 0, 10.0f * Time.deltaTime);

        //Set Idle Animation
        P_Animator.SetFloat("Speed", 0.0f);
    }

    void StateWalk()
    {
        Vector3 dir = m_pos - transform.position;
        if (dir.magnitude < 0.00001f)
        {
            //Change State
            p_state = Define.PlayerStates.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(p_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(m_pos);
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


    void StateBattle() {
        P_Animator.SetFloat("Speed", 0.0f);
        P_Animator.SetBool("IsBattle", true);
        return;
    }

    void Start()
    {
        p_speed = 5.0f;
        GameManager.Input.MouseAction -= ClickToMove;
        GameManager.Input.MouseAction += ClickToMove;
        P_Animator = GetComponent<Animator>();
    }

    void Update()
    {
        //Status Pattern
        switch (p_state) {
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

    void ClickToMove(Define.MouseEvent mouseEvent) {
        if (p_state == Define.PlayerStates.Dead || p_state == Define.PlayerStates.Battle
            || GameManager.Situation.currentSituations == Define.Situations.Contact) {
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

    public void SetPlayerState(Define.PlayerStates playerState, Vector3 Dest = default(Vector3)) { 
        p_state = playerState;
        m_pos = Dest;
    }

    public void PlayerAttack() {
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
    }

    public void PlayerAttackReset() {
        Debug.Log("Reset Attack Count");
        attack_count = 1;
        GameManager.Situation.SetStiuation(Define.Situations.EndAttack);
    }

    public void PlayerHit(int damage) {
        curHp -= damage;
        if (curHp < 0){
            p_state = Define.PlayerStates.Dead;
        }

    }
}
