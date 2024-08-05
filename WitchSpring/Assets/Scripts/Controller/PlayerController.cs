using System.Collections;
using System.Collections.Generic;
using UnityEngine;


//This Script is invoked in MosterBattle and GameManager
public class PlayerController : MonoBehaviour
{
    [Header("Player Info")]
    [SerializeField] float P_Speed;
    [SerializeField] float wait_run_ration;
    [SerializeField] Vector3 M_Pos;
    [SerializeField] Define.PlayerStates P_State = Define.PlayerStates.Idle;

    [Header("Player Components")]
    [SerializeField] Animator P_Animator;

    //상태에 따른 행동 메서드
    void StateIdle(){
        wait_run_ration = Mathf.Lerp(wait_run_ration, 0, 10.0f * Time.deltaTime);

        //Set Idle Animation
        P_Animator.SetFloat("Speed", 0.0f);
    }

    void StateWalk()
    {
        Vector3 dir = M_Pos - transform.position;
        if (dir.magnitude < 0.00001f)
        {
            //Change State
            P_State = Define.PlayerStates.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(P_Speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(M_Pos);
        }

        //Set Walk Animation
        P_Animator.SetFloat("Speed", P_Speed);
        P_Animator.SetBool("IsBattle", false);
    }

    void StateDead()
    {
        //TODO

        //Set Dead Animation

        return;
    }

    void StateAttack() {
        //TODO

        //Set Dead Animation

        return;
    }

    void StateBattle() {
        P_Animator.SetFloat("Speed", 0.0f);
        P_Animator.SetBool("IsBattle", true);
        return;
    }

    void Start()
    {
        P_Speed = 5.0f;
        GameManager.Input.MouseAction -= ClickToMove;
        GameManager.Input.MouseAction += ClickToMove;
        P_Animator = GetComponent<Animator>();
    }

    void Update()
    {
        //Status Pattern
        switch (P_State) {
            case Define.PlayerStates.Idle:
                StateIdle();
                break;
            case Define.PlayerStates.Walk:
                StateWalk();
                break;
            case Define.PlayerStates.Dead:
                StateDead();
                break;
            case Define.PlayerStates.Attack:
                StateAttack();
                break;
            case Define.PlayerStates.Battle:
                StateBattle();
                break;
        }
    }

    void ClickToMove(Define.MouseEvent mouseEvent) {
        if (P_State == Define.PlayerStates.Dead || P_State == Define.PlayerStates.Battle
            || GameManager.Situation.currentSituations == Define.Situations.Contact) {
            return;
        }
        
        Ray Mouse_Ray = Camera.main.ScreenPointToRay(Input.mousePosition);

        RaycastHit Hit;
        if (Physics.Raycast(Mouse_Ray, out Hit, 100.0f, LayerMask.GetMask("Terrain")))
        {
            //Get mouse position (Destination position)
            M_Pos = Hit.point;
            P_State = Define.PlayerStates.Walk;
        }
    }

    public void SetPlayerState(Define.PlayerStates playerState, Vector3 Dest = default(Vector3)) { 
        P_State = playerState;
        M_Pos = Dest;
    }

}
