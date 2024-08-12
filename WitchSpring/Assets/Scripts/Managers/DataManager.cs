using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public interface ILoader<Key, Value>
{
    Dictionary<Key, Value> MakeDic();
}

public class DataManager
{
    public Dictionary<string, MonsterInfo> MosterDict { get; private set; } = new Dictionary<string, MonsterInfo>();
    public Dictionary<string, BuffInfo> BuffDict { get; private set; } = new Dictionary<string, BuffInfo>();

    public void Init() {
        //SetData
        MosterDict = LoadJson<MonsterData, string, MonsterInfo>("MonsterData").MakeDic();
        BuffDict = LoadJson<BuffKorData, string, BuffInfo>("BuffEngToKor").MakeDic();
    }

    Loader LoadJson<Loader, Key, Value>(string path) where Loader : ILoader<Key, Value>
    {
        //ReadData
        TextAsset textAsset = GameManager.Resource.Load<TextAsset>($"Data/{path}");
        return JsonUtility.FromJson<Loader>(textAsset.text);
    }
}
