using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_Magic : MonoBehaviour
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

    public void Button_Magic()
    {
        Managers.Battle.playerController.Magic();
        popup.ClosePopupUI();
    }
}
