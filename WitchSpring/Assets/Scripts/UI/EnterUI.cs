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
    [Tooltip("��ü ������ �� �Ҵ� ��")]
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
        GameManager.Instance.Monster.GetComponent<MonsterController>().SetStat(monsterinfoSet);
    }

    public void EscapeButtion() {
        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }
}
