using System.Collections;
using System.Collections.Generic;
using UnityEngine;

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

    enum monsterState
    {
        Idle,
        InBattle
    }
    
    void Start()
    {
        if(Managers.Data.MonsterStatDict.TryGetValue(monsterName, out MonsterStat monsterStat))
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
        else
        {
           // Debug.LogError($"MonsterStat with ID {monsterID} not found.");
        }
    }
 
    void Update()
    {
        
    }
    public void TakeDamage(float damage)
    {
        float finalDamage = damage - defense;
        Debug.Log("데미지 받음: " + finalDamage);
        hp -= (int)finalDamage;
    }
    public void TakeDamage_Magic(float damage)
    {
        float finalDamage = damage - spellDefense;
        Debug.Log("데미지 받음: " + finalDamage);
        hp -= (int)finalDamage;
    }
}
