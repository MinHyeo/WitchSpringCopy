using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    float speed = 10.0f;
    UI_Popup popup;
    Vector3 destPos;
    public bool isPopupActive = false;
    Vector3 monsterPos;
    void Start()
    {
        Managers.Input.MouseAction -= OnMouseClicked;
        Managers.Input.MouseAction += OnMouseClicked;
    }

    public enum PlayerState
    {
        Die,
        Moving,
        Idle,
        Encounter,
        Escaping,
        InBattle,
    }

    [SerializeField] PlayerState state = PlayerState.Idle;
    void Update()
    {
        switch (state)
        {
            case PlayerState.Die:
                UpdateDie();
                break;
            case PlayerState.Moving:
                UpdateMoving();
                break;
            case PlayerState.Idle:
                UpdateIdle();
                break;
            case PlayerState.Escaping:
                Escape();
                break;


        }
    }

    private void UpdateIdle()
    {
        //애니메이션
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("speed", 0);
    }

    private void UpdateMoving()
    {

        Vector3 dir = destPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            state = PlayerState.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }

        // 애니메이션
        Animator anim = GetComponent<Animator>();
        anim.SetFloat("speed", speed);
    }

    private void UpdateDie()
    {
        // 아무것도 못함

    }



    void OnMouseClicked(Define.MouseEvent evt)
    {
        if (state == PlayerState.Die&& state==PlayerState.Escaping)
            return;

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        Debug.DrawRay(Camera.main.transform.position, ray.direction * 100.0f, Color.red, 1.0f);

        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100.0f, LayerMask.GetMask("Wall")))
        {
            destPos = hit.point;
            state = PlayerState.Moving;
        }
    }

    public void MonsterEncounter(Vector3 monsterPos)
    {
        destPos = transform.position;
        this.monsterPos = monsterPos; 
    }
    public void Escape()
    {
        Vector3 directionToMonster = transform.position - monsterPos;
        directionToMonster.Normalize();

        destPos = transform.position + directionToMonster * 3.0f;
        state = PlayerState.Moving;
    }
}