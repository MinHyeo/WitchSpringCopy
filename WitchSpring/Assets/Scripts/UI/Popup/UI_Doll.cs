using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_Doll : MonoBehaviour
{
    UI_Popup popup;
    UI_Scene scene;
    void Start()
    {
        popup = GetComponent<UI_Popup>();
    }

    public void Button_Doll()
    {
        if (Managers.Player.playerController.isDoll_ON)
        {
            Managers.Sound.Play("infoSound_4");
            if (scene != null)
                return;
            scene = Managers.UI.ShowSceneUI<UI_Scene>("UI_Doll_used");
        }
        else
        {
            Managers.UI.ClosePopupUI(popup);
            Managers.UI.ShowPopupUI<UI_Popup>("UI_DollInfo");
        }
        
    }

    public void Button_Cancel()
    {
        popup.ClosePopupUI();
        scene.CloseSceneUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }


}
