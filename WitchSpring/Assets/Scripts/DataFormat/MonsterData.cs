using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

#region MonsterData
[Serializable] //파일로 변환(데이터 형태, 공식임)
public class MonsterInfo
{
    public string MonsterID;
    public string Name;
    public string Explain;
    public int HP;
    public int Strength;
    public int Magic;
    public int Agility;
    public int Defense;
    public int MagicResist;
}

[Serializable]
public class MonsterData : ILoader<string, MonsterInfo>
{
    public List<MonsterInfo> Monsters = new List<MonsterInfo>();

    public Dictionary<string, MonsterInfo> MakeDic()
    {
        Dictionary<string, MonsterInfo> dict = new Dictionary<string, MonsterInfo>();
        foreach (MonsterInfo Info in Monsters)
        {
            dict.Add(Info.MonsterID, Info);
        }
        return dict;
    }
}
#endregion