using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    [Header("Player Info")]
    [SerializeField] float P_Speed;
    [SerializeField] float wait_run_ration;
    [SerializeField] Vector3 M_Pos;
    [SerializeField] PlayerStates P_State = PlayerStates.Idle;

    [Header("Player Components")]
    [SerializeField] Animator P_Animator;

    public enum PlayerStates { 
        Idle,
        Walk,
        Attack,
        Dead,
    }

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
            P_State = PlayerStates.Idle;
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

    void Start()
    {
        P_Speed = 10.0f;
        GameManager.Input.MouseAction -= ClickToMove;
        GameManager.Input.MouseAction += ClickToMove;
        P_Animator = GetComponent<Animator>();
    }

    void Update()
    {
        //Status Pattern
        switch (P_State) {
            case PlayerStates.Idle:
                StateIdle();
                break;
            case PlayerStates.Walk:
                StateWalk();
                break;
            case PlayerStates.Dead:
                StateDead();
                break;
            case PlayerStates.Attack:
                StateAttack();
                break;
        }
    }

    void ClickToMove(Define.MouseEvent mouseEvent) {
        if (P_State == PlayerStates.Dead) {
            return;
        }
        
        Ray Mouse_Ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        //Check Mouse Ray
        Debug.DrawRay(Camera.main.transform.position, Mouse_Ray.direction * 100.0f, Color.white, 1.0f);

        RaycastHit Hit;
        if (Physics.Raycast(Mouse_Ray, out Hit, 100.0f, LayerMask.GetMask("Terrain")))
        {
            //Get mouse position (Destination position)
            M_Pos = Hit.point;
            //Debug.Log($"Destination Pos : {Hit.point.x} {Hit.point.y} {Hit.point.z}");
            P_State = PlayerStates.Walk;
        }
    }
}
