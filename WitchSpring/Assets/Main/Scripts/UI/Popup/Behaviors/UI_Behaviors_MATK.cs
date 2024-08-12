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
        IMG_MainSlot,
        IMG_ComSlot,
        IMG_SubSlot,
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
        Bind<Image>(typeof(Images));

        GameObject Button_Close = GetButton((int)Buttons.Button_Close).gameObject;
        AddUIEvent(Button_Close, OnCloseClicked, Define.UIEvent.Click);


        GameObject IMG_MainSlot = GetImage((int)Images.IMG_MainSlot).gameObject;
        AddUIEvent(IMG_MainSlot, (PointerEventData data) => { IMG_MainSlot.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);

        GameObject IMG_ComSlot = GetImage((int)Images.IMG_ComSlot).gameObject;
        AddUIEvent(IMG_ComSlot, (PointerEventData data) => { IMG_ComSlot.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);

        GameObject IMG_SubSlot = GetImage((int)Images.IMG_SubSlot).gameObject;
        AddUIEvent(IMG_SubSlot, (PointerEventData data) => { IMG_SubSlot.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }
    public void OnCloseClicked(PointerEventData data)
    {
        // 마법공격 UI 닫기, 전투행동 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }

    public void OnMainSlotDraged(PointerEventData data)
    {

    }
    public void OnComSlotDraged(PointerEventData data)
    {

    }

    public void OnSubSlotDraged(PointerEventData data)
    {

    }

    // 이벤트 콜백 함수
}
