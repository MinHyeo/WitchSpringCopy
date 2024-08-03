using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class Monster
{
    public int id;
    public string name;
    public string description;
    public Stats stats;
}

[Serializable]
public class Stats
{
    public int HP;
    public int STR;
    public int INT;
    public int DEX;
    public int DEF;
    public int MDEF;
}

[Serializable]
public class MonsterData
{
    public List<Monster> monsters = new List<Monster>();
}


public class DataManager
{
    public Dictionary<int, Monster> monsterDict {  get; private set; } = new Dictionary<int, Monster>();
    public void Init()
    {
        TextAsset textAsset = GameManager.resource.Load<TextAsset>("Data/MonsterData");
        Monster monsterData = JsonUtility.FromJson<Monster>(textAsset.text);
    }
}
