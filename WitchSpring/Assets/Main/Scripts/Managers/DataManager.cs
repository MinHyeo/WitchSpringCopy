using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using static DataManager;

public class DataManager
{
    string _objectName = null;
    Dictionary<string, string> monsterNames = new Dictionary<string, string>();
    Dictionary<string, string> monsterInfos = new Dictionary<string, string>();
    Dictionary<string, string> monsterStats = new Dictionary<string, string>();


    [Serializable]
    public class Monster
    {
        public string objectName;
        public string name;
        public string description;
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
        public List<Monster> Monsters;
    }

    public void Init()
    {
        TextAsset json = GameManager.resource.Load<TextAsset>("Data/MonsterData");
        MonsterData monsterData = JsonUtility.FromJson<MonsterData>(json.text);
        
        foreach (var monster in monsterData.Monsters)
        {
            monsterNames[monster.objectName] = monster.name;
            monsterInfos[monster.objectName] = monster.description;
            monsterStats[monster.objectName] = $"Ã¼·Â: {monster.HP}\nÈû: {monster.STR}\n¸¶·Â: {monster.INT}\n¹ÎÃ¸: {monster.DEX}\n¹°¸®¹æ¾î: {monster.DEF}\n¸¶¹ý¹æ¾î: {monster.MDEF}";
        }
    }

    public string GetMonsterName()
    {
        if (monsterNames.TryGetValue(_objectName, out string name))
        {
            return name;
        }
        else
        {
            Debug.Log($"{_objectName} not found.");
            return null;
        }
    }

    public string GetMonsterInfo()
    {
        if (monsterInfos.TryGetValue(_objectName, out string description))
        {
            return description;
        }
        else
        {
            Debug.Log($"{_objectName} not found.");
            return null;
        }
    }

    public string GetMonsterStats()
    {
        if (monsterStats.TryGetValue(_objectName, out string stats))
        {
            return stats;
        }
        else
        {
            Debug.Log($"{_objectName} not found.");
            return null;
        }
    }

    public void GetCollidedObjectName(string objectName)
    {
        _objectName = objectName;
    }
}
