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
        Managers.Sound.Play("magicSwordBuff", Define.Sound.Effect);
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaSword();
    }
    public void Button_AbsorbSword()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnAbsorbSword();
        Managers.Sound.Play("magicSwordBuff", Define.Sound.Effect);
    }

    public void Button_ManaBall()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaBall();
        Managers.Sound.Play("magicSwordBuff", Define.Sound.Effect);
    }
    public void Button_ManaTrace()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Battle.playerController.OnManaTrace();
        Managers.Sound.Play("magicSwordBuff", Define.Sound.Effect);
    }

}
