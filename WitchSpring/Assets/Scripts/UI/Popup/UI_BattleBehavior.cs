using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_BattleBehavior : MonoBehaviour
{
    UI_Popup popup;
    void Start()
    {
       popup = gameObject.GetComponent<UI_Popup>();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void Button_attack()
    {
        Managers.UI.ClosePopupUI(popup);
        Managers.UI.ShowPopupUI<UI_Popup>("UI_attack");
    }

    public void Button_magicSword()
    {
        Managers.UI.ClosePopupUI(popup);
        Managers.UI.ShowPopupUI<UI_Popup>("UI_magicSword");
    }

    public void Button_Avoid()
    {
        Managers.UI.ClosePopupUI(popup);
        Managers.Battle.EndBattle();
    }

}
