using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_magicSword : MonoBehaviour
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

    public void Button_ManaSword()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaSword();
    }
    public void Button_AbsorbSword()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnAbsorbSword();
    }

    public void Button_ManaBall()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaBall();
    }
    public void Button_ManaTrace()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaTrace();
    }

}
