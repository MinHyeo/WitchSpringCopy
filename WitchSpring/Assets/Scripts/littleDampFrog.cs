using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static PlayerController;

public class littleDampFrog : MonoBehaviour
{
    public string monsterName = "어린 안개 두꺼비";
    public string monsterInfo;
    public int maxHp;
    public int hp;
    public float strength;
    public float spellPower;
    public float speed;
    public float defense;
    public float spellDefense;

    float move_speed = 10.0f;
    Vector3 destPos;
    Vector3 monsterPos;
    Vector3 playerPos;

    private Animator anim;
    enum monsterState
    {
        Idle,
        InBattle,
        Die,
        Moving,
        Idle_Battle,
        Attacking,
        Attacking_End,
    }
    private monsterState state = monsterState.Idle;
    
    void Start()
    {
        anim = GetComponent<Animator>();
        if(Managers.Data.MonsterStatDict.TryGetValue(monsterName, out MonsterStat monsterStat))
        {
            SetStat(monsterStat);
        }
        else
        {
           // Debug.LogError($"MonsterStat with ID {monsterID} not found.");
        }
    }
 
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Alpha0))
        {
            Attack();
        }
        switch (state)
        {
            case monsterState.Idle:
                break;
            case monsterState.Idle_Battle:
                UpdateIdle_Battle();
                break;
            case monsterState.Attacking:
                UpdateAttacking();
                break;
            case monsterState.Attacking_End:
                EndAttack();
                break;
        }
    }
    private void UpdateIdle_Battle()
    {
        anim.Play("Idle");
    }

    public void Attack()
    {
        GameObject target = Managers.Battle.player.gameObject;
        monsterPos = gameObject.transform.position;
        playerPos = target.transform.position;
        
        state = monsterState.Attacking;
    }

    private void UpdateAttacking()
    {

        GameObject target = Managers.Battle.player.gameObject;
        destPos = target.transform.position;
        float distance = (destPos - transform.position).magnitude;
        if (distance <= 1.5f)
        {
            anim.Play("Basic Attack");
            return;
        }

        Vector3 dir = playerPos - transform.position;
        float moveDist = Mathf.Clamp(move_speed * Time.deltaTime, 0, dir.magnitude);
        transform.position += dir.normalized * moveDist;
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

        // 애니메이션
        anim.Play("Run");
    }
    public void EndTurn()
    {
        Managers.Battle.EndTurn();
    }

    public void EndAttack()
    {
        state = monsterState.Attacking_End;
        Vector3 dir = monsterPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            state = monsterState.Idle;
            anim.Play("Idle");
            transform.LookAt(playerPos);
            EndTurn();
        }
        else
        {
            float moveDist = Mathf.Clamp(move_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }

        // 애니메이션
        anim.Play("Run");
    }

    public void GiveDamage(float damageRatio)
    {
        float damage = damageRatio*strength;
        Managers.Battle.playerController.TakeDamage(damage);
    }


    public void TakeDamage(float damage)
    {
        float finalDamage = damage - defense;
        hp -= (int)finalDamage;
        UI_Damage du = GetComponentInChildren<UI_Damage>();
        du.ShowDamage((int)finalDamage);
        anim.Play("Hit", -1, 0f);
    }
    public void TakeDamage_Magic(float damage)
    {
        float finalDamage = damage - spellDefense;
        hp -= (int)finalDamage;
        UI_Damage du = GetComponentInChildren<UI_Damage>();
        du.ShowDamage((int)finalDamage);
        anim.Play("Hit", -1, 0f);
    }

    public void StartBattle()
    {
        transform.LookAt(Managers.Battle.player.transform);
        if (Managers.Data.MonsterStatDict.TryGetValue(monsterName, out MonsterStat monsterStat))
        {
            SetStat(monsterStat);
        }
        BattleTrigger go = GetComponentInChildren<BattleTrigger>();
        go.Trigger_Off();
    }

    public void EndBattle()
    {
        BattleTrigger go = GetComponentInChildren<BattleTrigger>();
        go.Trigger_On();
    }

    public void SetStat(MonsterStat monsterStat)
    {
        maxHp = monsterStat.maxHp;
        strength = monsterStat.strength;
        spellPower = monsterStat.spellPower;
        speed = monsterStat.speed;
        defense = monsterStat.defense;
        spellDefense = monsterStat.spellDefense;
        monsterName = monsterStat.monsterName;
        monsterInfo = monsterStat.monsterInfo;

        hp = maxHp;
    }
}
