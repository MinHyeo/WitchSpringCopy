using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static Define;

public class DataManager
{
    string _objectName = null;
    Dictionary<string, string> monsterNames = new Dictionary<string, string>();
    Dictionary<string, string> monsterInfos = new Dictionary<string, string>();
    Dictionary<string, string> monsterHP = new Dictionary<string, string>();
    Dictionary<string, string> monsterSTR = new Dictionary<string, string>();
    Dictionary<string, string> monsterINT = new Dictionary<string, string>();
    Dictionary<string, string> monsterDEX = new Dictionary<string, string>();
    Dictionary<string, string> monsterDEF = new Dictionary<string, string>();
    Dictionary<string, string> monsterMDEF = new Dictionary<string, string>();
    Dictionary<string, string> playerStats = new Dictionary<string, string>();

    #region Monster
    [Serializable]
    public class Monster
    {
        public string objectName;
        public string name;
        public string description;
        public string HP;
        public string STR;
        public string INT;
        public string DEX;
        public string DEF;
        public string MDEF;
    }

    [Serializable]
    public class MonsterData
    {
        public List<Monster> Monsters;
    }
    #endregion

    #region Player
    [Serializable]
    public class Player
    {
        public string HP;
        public string MP;
        public string STR;
        public string INT;
        public string DEX;
        public string DEF;
        public string MS;
    }

    [Serializable]
    public class PlayerData
    {
        public Player[] Player;
    }
    #endregion

    public void Init()
    {
        // 몬스터
        TextAsset monsterJson = GameManager.resource.Load<TextAsset>("Data/MonsterData");
        MonsterData monsterData = JsonUtility.FromJson<MonsterData>(monsterJson.text);

        foreach (var monster in monsterData.Monsters)
        {
            monsterNames[monster.objectName] = monster.name;
            monsterInfos[monster.objectName] = monster.description;
            monsterHP[monster.objectName] = monster.HP;
            monsterSTR[monster.objectName] = monster.STR;
            monsterINT[monster.objectName] = monster.INT;
            monsterDEX[monster.objectName] = monster.DEX;
            monsterDEF[monster.objectName] = monster.DEF;
            monsterMDEF[monster.objectName] = monster.MDEF;
        }

        // 플레이어
        TextAsset playerJson = GameManager.resource.Load<TextAsset>("Data/PlayerData");
        PlayerData playerData = JsonUtility.FromJson<PlayerData>(playerJson.text);

        Player player = playerData.Player[0]; // 배열의 첫 번째 요소에 접근
        playerStats["HP"] = player.HP;
        playerStats["MP"] = player.MP;
        playerStats["STR"] = player.STR;
        playerStats["INT"] = player.INT;
        playerStats["DEX"] = player.DEX;
        playerStats["DEF"] = player.DEF;
        playerStats["MS"] = player.MS;
    }

    #region Monster Accessors
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

    public string GetMonsterStats(string statType)
    {
        switch (statType)
        {
            case "HP":
                monsterHP.TryGetValue(_objectName, out string HP);
                return HP;

            case "STR":
                monsterSTR.TryGetValue(_objectName, out string STR);
                return STR;

            case "INT":
                monsterINT.TryGetValue(_objectName, out string INT);
                return INT;

            case "DEX":
                monsterDEX.TryGetValue(_objectName, out string DEX);
                return DEX;

            case "DEF":
                monsterDEF.TryGetValue(_objectName, out string DEF);
                return DEF;

            case "MDEF":
                monsterMDEF.TryGetValue(_objectName, out string MDEF);
                return MDEF;

            default:
                return null;
        }
    }

    public string GetPlayerStat(string statType)
    {
        if (playerStats.ContainsKey(statType))
        {
            return playerStats[statType];
        }
        else
        {
            Debug.Log($"{statType} is not a valid player stat.");
            return null;
        }
    }

    public void GetCollidedObjectName(string objectName)
    {
        _objectName = objectName;
    }
    #endregion
}
