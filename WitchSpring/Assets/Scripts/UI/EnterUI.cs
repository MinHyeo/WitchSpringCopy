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


    public void Init(string monstername = "� �Ȱ��β���")
    {
        monsterinfoSet = GameManager.Data.MosterDict[monstername];
        SetData();
    }
    public void SetData() {
        monsterName.text = monsterinfoSet.Name;
        monsterExplain.text = monsterinfoSet.Explain;
        monsterStat.text = $"ü��: {monsterinfoSet.HP}\n" +
                           $"��: {monsterinfoSet.Strength}\n" +
                           $"����: {monsterinfoSet.Magic}\n" +
                           $"��ø: {monsterinfoSet.Agility}\n" +
                           $"��������: {monsterinfoSet.Defense}\n" +
                           $"��������: {monsterinfoSet.MagicResist}\n";
    }

    public void BattleButton()
    {
        GameManager.Situation.SetStiuation(Define.Situations.Battle);
    }

    public void EscapeButtion() {
        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }
}
