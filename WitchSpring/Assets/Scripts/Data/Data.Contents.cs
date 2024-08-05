using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

#region Stat
[Serializable]
public class Stat
{
    public int level;
    public int monsterID;
    public string monsterName;
    public string monsterInfo;
    public int hp;
    public float strength;
    public float spellPower;
    public float speed;
    public float defense;
    public float spellDefense;
}
[Serializable]
public class MonsterStat
{
    public int monsterID;
    public string monsterName;
    public string monsterInfo;
    public int hp;
    public float strength;
    public float spellPower;
    public float speed;
    public float defense;
    public float spellDefense;
}


[Serializable]
public class StatData : ILoader<int, Stat>
{
    public List<Stat> stats = new List<Stat>();

    public Dictionary<int, Stat> MakeDict()
    {
        Dictionary<int, Stat> dict = new Dictionary<int, Stat>();
        foreach (Stat stat in stats)
            dict.Add(stat.level, stat);
        return dict;
    }
}
[Serializable]
public class MonsterStatData : ILoader<int, MonsterStat>
{
    public List<MonsterStat> monsterStats = new List<MonsterStat>();

    public Dictionary<int, MonsterStat> MakeDict()
    {
        Dictionary<int, MonsterStat> dict = new Dictionary<int, MonsterStat>();
        foreach (MonsterStat monsterStat in monsterStats)
            dict.Add(monsterStat.monsterID, monsterStat);
        return dict;
    }
}

#endregion