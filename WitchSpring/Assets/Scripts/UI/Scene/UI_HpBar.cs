using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_HpBar : MonoBehaviour
{
    [SerializeField] Transform monster;
    [SerializeField] Slider hpBar;
    [SerializeField] Slider ationGaugeBar;
    [SerializeField] Vector3 offset= new Vector3(0,0.3f,0);
    [SerializeField] Text hpText;
    private BattleSystem battleSys;
    private void Start()
    {
        monster = Managers.Battle.CurMonster().transform;
        battleSys = Managers.Battle.GetBattleSystem();
    }

    private void Update()
    {
        if (monster != null)
        {
            SetHpBar();
            SetAtionGauge();
        }
            

    }


    public void SetHpBar()
    {
        if (monster != null)
        {
            Vector3 screenPosition = Camera.main.WorldToScreenPoint(monster.position + offset);
            hpBar.value = (float)Managers.Battle.CurMonster().hp / Managers.Battle.CurMonster().maxHp;
            hpText.text = $"{Managers.Battle.CurMonster().hp}";
            hpText.transform.position = screenPosition;
            hpBar.transform.position = screenPosition;
        }
    }
    public void SetAtionGauge()
    {
        Vector3 screenPosition = Camera.main.WorldToScreenPoint(monster.position);
        ationGaugeBar.transform.position = screenPosition;

        ationGaugeBar.value = battleSys.GetMonsterAction()/battleSys.GetMaxAtion();
    }
    public void EndBattle()
    {
        UI_Scene ui = GetComponent<UI_Scene>();
        Managers.UI.CloseSceneUI(ui);
        
    }
}
