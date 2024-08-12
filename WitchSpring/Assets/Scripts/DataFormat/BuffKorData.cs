using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[Serializable]
public class BuffInfo
{
    public string BuffName;
    public string Korean;
}

[Serializable]
public class BuffKorData : ILoader<string, BuffInfo>
{
    public List<BuffInfo> BuffList = new List<BuffInfo>();

    public Dictionary<string, BuffInfo> MakeDic()
    {
        Dictionary<string, BuffInfo> dict = new Dictionary<string, BuffInfo>();
        foreach (BuffInfo Info in BuffList)
        {
            dict.Add(Info.BuffName, Info);
        }
        return dict;
    }
}
