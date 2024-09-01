using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_DollInfo : MonoBehaviour
{
    UI_Popup popup;
    void Start()
    {
        popup = GetComponent<UI_Popup>();
    }

    public void Button_UseDoll()
    {
        popup.ClosePopupUI();
        Managers.Battle.playerController.Doll();
    }
    public void Button_Cancel()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_Doll");
    }
}
