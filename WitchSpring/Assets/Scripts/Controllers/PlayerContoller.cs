using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    float speed = 10.0f;
    Vector3 destPos;
    Vector3 monsterPos;
    Vector3 playerPos;
    Animator anim;
    Player player;

    int attackNumber = 0;
    int manaSwordCount = 0;
    int absorbSwordCount = 0;
    int manaBallCount = 0;
    int manaTraceCount = 0;
    private void Awake()
    {
        anim = GetComponent<Animator>();
        player = GetComponent<Player>();
    }
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
        Escaping,
        Idle_Battle,
        Attacking,
        Attacking_End,
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
            case PlayerState.Idle_Battle:
                UpdateIdle_Battle();
                break;
            case PlayerState.Escaping:
                Escape();
                break;
            case PlayerState.Attacking:
                UpdateAttacking(); 
                break;
            case PlayerState.Attacking_End:
                EndAttack();
                break;


        }
    }

    private void UpdateIdle()
    {
        
        anim.Play("idle0");
    }
    private void UpdateIdle_Battle()
    {
        anim.Play("idle_battle");
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
        anim.Play("run0");
    }

    private void UpdateDie()
    {
        // 아무것도 못함

    }



    void OnMouseClicked(Define.MouseEvent evt)
    {
        if (Managers.Battle.GetIsBattle())
            return;
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
        transform.LookAt(monsterPos);
    }
    public void Escape()
    {
        Debug.Log("도망");
        Vector3 directionToMonster = transform.position - monsterPos;
        directionToMonster.Normalize();
        destPos = transform.position + directionToMonster * 3.0f;

        state = PlayerState.Moving;
        Managers.Battle.SetIsBattle(false);
    }
    public void StartBattle()
    {
        state = PlayerState.Idle_Battle;
    }
    public void Attack(int attackNumber)
    {
        GameObject target = Managers.Battle.CurMonster().gameObject;
        monsterPos = target.transform.position;
        playerPos = gameObject.transform.position;
        this.attackNumber = attackNumber;
        switch (attackNumber)
        {
            case 1: break;
            case 2: player.hp -= 4; break;
            case 3: player.hp -= 7; break;
            case 4: player.hp -= 17; break;
            case 5: player.hp -= 24; break;
            case 6: player.hp -= 28; break;
            case 7: player.hp -= 32; break;
        }
        state = PlayerState.Attacking;
    }

    private void UpdateAttacking()
    {
        if (Managers.Battle.CurMonster() != null)
        {
            GameObject target = Managers.Battle.CurMonster().gameObject;
            destPos = target.transform.position;
            float distance = (destPos - transform.position).magnitude;
            if (distance <= 1.5f)
            {
                anim.Play("attack"+attackNumber);
                return;
            }
        }

        Vector3 dir = monsterPos - transform.position;
        float moveDist = Mathf.Clamp(speed * Time.deltaTime, 0, dir.magnitude);
        transform.position += dir.normalized * moveDist;
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

        // 애니메이션
        anim.Play("run0");
    }

    public void EndAttack()
    {
        if (manaSwordCount > 0)
            manaSwordCount--;
        if(manaBallCount > 0)
            manaBallCount--;

        state = PlayerState.Attacking_End;
        Vector3 dir = playerPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            state = PlayerState.Idle_Battle;
            transform.LookAt(monsterPos);

            //테스트용
            Managers.Battle.PlayerTrunOn();
        }
        else
        {
            float moveDist = Mathf.Clamp(speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }

        // 애니메이션
        anim.Play("run0");
    }
    public void GiveAttackDamage(float damageRatio)
    {
        float damage;

        if(absorbSwordCount > 0)
        {
            Debug.Log("흡수검술: " + (int)((player.strength + player.spellPower) * 0.08f));
            player.hp += (int)((player.strength + player.spellPower) * 0.08f);
        }
        if (manaBallCount > 0)
        {
            float magicDamage = player.spellPower * 1.5f;
            Managers.Battle.CurMonster().TakeDamage_Magic(magicDamage);
            Debug.Log("마력구체:" + magicDamage);
        }
        if (manaSwordCount > 0)
        {
            Debug.Log("+마력검술");
            damage = (player.strength * damageRatio) * (0.1f * manaSwordCount + 1.0f) + player.strength * (0.1f * manaSwordCount);
        }
        else
        {
            damage = player.strength * damageRatio;
        }
        if (manaTraceCount > 0)
        {
            Managers.Battle.CurMonster().TakeDamage(damage);
            GiveMagicDamage(1.0f);
            return;
        }
        Managers.Battle.CurMonster().TakeDamage(damage);
        Debug.Log("검술:" + damage);
    }

    public void GiveMagicDamage(float damage)
    {
        Managers.Battle.CurMonster().TakeDamage_Magic(damage);
    }


    public void OnManaSword()
    {
        Debug.Log("마나 검술ON");
        manaSwordCount = 3;
        player.mp -= 40;
    }
    public void OnAbsorbSword()
    {
        absorbSwordCount = 8;
        player.mp -= 30;
    }

    public void OnManaBall()
    {
        manaBallCount = 4;
        player.mp -= 50;
    }
    public void OnManaTrace()
    {
        manaTraceCount = 5;
    }


}