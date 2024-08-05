using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;

public class UI_Behaviors_ATK : UI_Popup
{

    enum Buttons
    {
        Button_Close,
        Button_ATK1,
        Button_ATK2,
        Button_ATK3,
        Button_ATK4,
        Button_ATK5,
        Button_ATK6,
        Button_ATK7,
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

        GameObject Button_ATK1 = GetButton((int)Buttons.Button_ATK1).gameObject;
        AddUIEvent(Button_ATK1, OnATK1Clicked, Define.UIEvent.Click);

        GameObject Button_ATK2 = GetButton((int)Buttons.Button_ATK2).gameObject;
        AddUIEvent(Button_ATK2, OnATK2Clicked, Define.UIEvent.Click);

        GameObject Button_ATK3 = GetButton((int)Buttons.Button_ATK3).gameObject;
        AddUIEvent(Button_ATK3, OnATK3Clicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }
    public void OnCloseClicked(PointerEventData data)
    {
        // 검술공격 UI 닫기, 전투행동 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }

    public void OnATK1Clicked(PointerEventData data)
    {
    }

    public void OnATK2Clicked(PointerEventData data)
    {

    }

    public void OnATK3Clicked(PointerEventData data)
    {

    }
    public void OnATK4Clicked(PointerEventData data)
    {

    }

    // 이벤트 콜백 함수
}
