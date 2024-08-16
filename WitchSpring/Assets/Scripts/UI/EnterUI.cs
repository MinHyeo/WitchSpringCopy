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
    [Tooltip("°´Ã¼ »ý¼ºÇÒ ¶§ ÇÒ´ç µÊ")]
    private Animator UIAni;

    private void Awake()
    {
        UIAni = gameObject.GetComponent<Animator>();
    }

    public void Init(string monsterID = null)
    {
        monsterinfoSet = GameManager.Data.MosterDict[monsterID];
        SetData();
        UIAni.Play("Show");
    }
    public void SetData() {
        monsterName.text = monsterinfoSet.Name;
        monsterExplain.text = monsterinfoSet.Explain;
        monsterStat.text = $"Ã¼·Â: {monsterinfoSet.HP}\n" +
                           $"Èû: {monsterinfoSet.Strength}\n" +
                           $"¸¶·Â: {monsterinfoSet.Magic}\n" +
                           $"¹ÎÃ¸: {monsterinfoSet.Agility}\n" +
                           $"¹°¸®¹æ¾î·Â: {monsterinfoSet.Defense}\n" +
                           $"¸¶¹ý¹æ¾î·Â: {monsterinfoSet.MagicResist}\n";
    }

    public void BattleButton()
    {
        GameManager.Situation.SetStiuation(Define.Situations.Battle);
        GameManager.Instance.Monster.GetComponent<MonsterController>().SetStat(monsterinfoSet);
    }

    public void EscapeButtion() {
        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }
}
