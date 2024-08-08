using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_attack : MonoBehaviour
{
    UI_Popup popup;
    void Start()
    {
        popup = GetComponent<UI_Popup>();
    }

    public void Button_Cancel()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }

    public void Button_Attack()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(1);
    }

    public void Button_Attack2()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(2);
    }
    public void Button_Attack3()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(3);
    }
    public void Button_Attack4()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(4);
    }
    public void Button_Attack5()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(5);
    }
    public void Button_Attack6()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(6);
    }
    public void Button_Attack7()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Attack(7);
    }
}
