using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;

public class UI_Behaviors_MATK : UI_Popup
{

    enum Buttons
    {
        Button_Close,
        Button_MainSlot,
        Button_ComSlot,
        Button_SubSlot,
    }
    enum Texts
    {
    }
    enum GameObjects
    {
    }

    enum Images
    {
    }



    void Start()
    {
        Init();
    }

    public override void Init()
    {
        base.Init();

        Bind<Button>(typeof(Buttons));
        //Bind<Text>(typeof(Texts));
        //Bind<Image>(typeof(Images));

        GameObject Button_Close = GetButton((int)Buttons.Button_Close).gameObject;
        AddUIEvent(Button_Close, OnCloseClicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }
    public void OnCloseClicked(PointerEventData data)
    {
        // 마법공격 UI 닫기, 전투행동 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }
    // 이벤트 콜백 함수
}
