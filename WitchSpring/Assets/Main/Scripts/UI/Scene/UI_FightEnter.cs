using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;

public class UI_FightEnter : UI_Popup
{

    enum Buttons
    {
        Button_Fight,
        Button_Escape,
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

        GameObject go1 = GetButton((int)Buttons.Button_Fight).gameObject;
        AddUIEvent(go1, OnFightClicked, Define.UIEvent.Click);

        GameObject go2 = GetButton((int)Buttons.Button_Escape).gameObject;
        AddUIEvent(go2, OnEscClicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }


    public void OnFightClicked(PointerEventData data)
    {
        // 전투 입장 UI 닫고, 기본 UI열고, 전투 행동 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
        GameManager.UI.ShowPopupUI<UI_Behaviors>("UI_Behaviors");

        GameObject camera = GameObject.Find("Main Camera");
        CameraController cameraController = camera.GetComponent<CameraController>();
        cameraController._mode = Define.CameraMode.PlayerFocused;
        
    }

    public void OnEscClicked(PointerEventData data)
    {
        // 피하기 로직 구현 !!수정필요!!
        GameObject player = GameObject.Find("Player");
        PlayerController playerController = player.GetComponent<PlayerController>();
        playerController._state = Define.PlayerState.Escape;

        GameObject camera = GameObject.Find("Main Camera");
        CameraController cameraController = camera.GetComponent<CameraController>();
        cameraController._mode = Define.CameraMode.QuarterView;



        // 전투 입장 UI 닫고, 기본 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
    }
}
