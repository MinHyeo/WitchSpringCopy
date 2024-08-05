using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class UI_MonsterEncounter : MonoBehaviour
{
    UI_Popup popup;
    [SerializeField] Text text_monsterName;
    [SerializeField] Text text_monsterInfo;
    [SerializeField] Text text_monsterStat;
    littleDampFrog monster;
   
    void Start()
    {
        popup = gameObject.GetComponent<UI_Popup>();
        Init();
    }

    void Update()
    {
        
    }

    public void Button_EnterBattle()
    {
        Managers.UI.ClosePopupUI(popup);
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }

    public void Button_Avoid()
    {
        Managers.UI.ClosePopupUI(popup);
        Managers.Player.playerController.Escape();
    }

    public void Init()
    {
        monster = Managers.Player.CurMonster();
        if (monster != null)
        {
            text_monsterName.text = monster.monsterName;
            text_monsterInfo.text = monster.monsterInfo;
            text_monsterStat.text = 
                $"ü��: {monster.hp}\n" +
                $"��: {monster.strength}\n" +
                $"����: {monster.spellPower}\n" +
                $"��ø: {monster.speed}\n"+
                $"�������: {monster.defense}\n" +
                $"�������: {monster.spellDefense}\n";
        }
        else
        {
            Debug.LogWarning("Monster instance is null.");
        }
    }
}
