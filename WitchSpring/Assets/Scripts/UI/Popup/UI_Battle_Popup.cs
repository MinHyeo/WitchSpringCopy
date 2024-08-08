using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_Battle_Popup : MonoBehaviour
{
    public UI_Popup popup;
    private void Start()
    {
        popup = GetComponent<UI_Popup>();
    }
    public void Button_Cancel()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }
    public void Init()
    {

    }
}
