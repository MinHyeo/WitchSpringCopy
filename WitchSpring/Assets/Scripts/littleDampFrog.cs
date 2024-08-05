using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class littleDampFrog : MonoBehaviour
{
    private int monsterID=1;
    public string monsterName;
    public string monsterInfo;
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
        if(Managers.Data.StatDict.TryGetValue(monsterID, out Stat monsterStat))
        {
            hp = monsterStat.hp;
            strength = monsterStat.strength;
            spellPower = monsterStat.spellPower;
            speed = monsterStat.speed;
            defense = monsterStat.defense;
            spellDefense = monsterStat.spellDefense;
            monsterName = monsterStat.monsterName;
            monsterInfo = monsterStat.monsterInfo;
        }
        else
        {
           // Debug.LogError($"MonsterStat with ID {monsterID} not found.");
        }
    }
 
    void Update()
    {
        
    }
}
