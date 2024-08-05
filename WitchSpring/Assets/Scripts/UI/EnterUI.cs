using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnterUI : MonoBehaviour
{
    public MonsterInfo monsterinfoSet = null;
    public Text monsterName;
    public Text monsterExplain;
    public Text monsterStat;


    public void Init(string monstername = "어린 안개두꺼비")
    {
        monsterinfoSet = GameManager.Data.MosterDict[monstername];
        SetData();
    }
    public void SetData() {
        monsterName.text = monsterinfoSet.Name;
        monsterExplain.text = monsterinfoSet.Explain;
        monsterStat.text = $"체력: {monsterinfoSet.HP}\n" +
                           $"힘: {monsterinfoSet.Strength}\n" +
                           $"마력: {monsterinfoSet.Magic}\n" +
                           $"민첩: {monsterinfoSet.Agility}\n" +
                           $"물리방어력: {monsterinfoSet.Defense}\n" +
                           $"마법방어력: {monsterinfoSet.MagicResist}\n";
    }

    public void BattleButton()
    {
        GameManager.Situation.SetStiuation(Define.Situations.Battle);
    }

    public void EscapeButtion() {
        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }
}
