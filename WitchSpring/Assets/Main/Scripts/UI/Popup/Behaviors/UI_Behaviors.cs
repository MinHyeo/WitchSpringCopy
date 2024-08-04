using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;

public class UI_Behaviors : UI_Popup
{

    enum Buttons
    {
        Button_STONE,
        Button_ATK,
        Button_MANAS,
        Button_MATK,
        Button_ITEM,
        Button_DOLL,
        Button_DEF,
        Button_ESC,
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

        GameObject Button_STONE = GetButton((int)Buttons.Button_STONE).gameObject;
        AddUIEvent(Button_STONE, OnSTONEClicked, Define.UIEvent.Click);

        GameObject Button_ATK = GetButton((int)Buttons.Button_ATK).gameObject;
        AddUIEvent(Button_ATK, OnATKClicked, Define.UIEvent.Click);

        GameObject Button_MANAS = GetButton((int)Buttons.Button_MANAS).gameObject;
        AddUIEvent(Button_MANAS, OnMANASClicked, Define.UIEvent.Click);

        GameObject Button_MATK = GetButton((int)Buttons.Button_MATK).gameObject;
        AddUIEvent(Button_MATK, OnMATKClicked, Define.UIEvent.Click);

        GameObject Button_ITEM = GetButton((int)Buttons.Button_ITEM).gameObject;
        AddUIEvent(Button_ITEM, OnITEMClicked, Define.UIEvent.Click);

        GameObject Button_DOLL = GetButton((int)Buttons.Button_DOLL).gameObject;
        AddUIEvent(Button_DOLL, OnDOLLClicked, Define.UIEvent.Click);

        GameObject Button_DEF = GetButton((int)Buttons.Button_DEF).gameObject;
        AddUIEvent(Button_DEF, OnDEFClicked, Define.UIEvent.Click);

        GameObject Button_ESC = GetButton((int)Buttons.Button_ESC).gameObject;
        AddUIEvent(Button_ESC, OnEscClicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }

    public void OnSTONEClicked(PointerEventData data)
    {
        // 전투행동 UI 닫기, 영혼석 UI 열기
    }

    public void OnATKClicked(PointerEventData data)
    {

        // 전투 행동 UI 닫기, 검술 공격 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors_ATK>();
    }
    public void OnMANASClicked(PointerEventData data)
    {
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors_MANAS>();
    }

    public void OnMATKClicked(PointerEventData data)
    {
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors_MATK>();
    }
    public void OnITEMClicked(PointerEventData data)
    {
        // 전투행동 UI 닫기, 인벤토리 UI 열기
    }
    public void OnDOLLClicked(PointerEventData data)
    {
        // 전투행동 UI 닫기, 인형소환 UI 열기
    }
    public void OnDEFClicked(PointerEventData data)
    {
        // 전투행동 UI 닫기, 방어 UI 열기
    }
    public void OnEscClicked(PointerEventData data)
    {
        // 피하기 로직 구현
        GameObject player = GameObject.Find("Player");
        PlayerController playerController = player.GetComponent<PlayerController>();
        playerController._state = Define.PlayerState.Escape;

        GameObject camera = GameObject.Find("Main Camera");
        CameraController cameraController = camera.GetComponent<CameraController>();
        cameraController._mode = Define.CameraMode.QuarterView;

        // 전투 행동 UI 닫기
        GameManager.UI.ClosePopupUI();
    }
}