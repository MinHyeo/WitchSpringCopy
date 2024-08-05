using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;
using TMPro;

public class UI_FightEnter : UI_Popup
{

    enum Buttons
    {
        Button_Fight,
        Button_Escape,
    }
    enum Texts
    {
        Text_MonsterName,
        Text_MonsterInfo,
        Text_MonsterStats,
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
        Bind<TextMeshProUGUI>(typeof(Texts));
        //Bind<Image>(typeof(Images));

        GameObject Button_Fight = GetButton((int)Buttons.Button_Fight).gameObject;
        AddUIEvent(Button_Fight, OnFightClicked, Define.UIEvent.Click);

        GameObject Button_Escape = GetButton((int)Buttons.Button_Escape).gameObject;
        AddUIEvent(Button_Escape, OnEscClicked, Define.UIEvent.Click);


        UpdateText();
        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }



    public void OnFightClicked(PointerEventData data)
    {
        // ���� ���� UI �ݰ�, �⺻ UI����, ���� �ൿ UI ����
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
        GameManager.UI.ShowPopupUI<UI_Behaviors>("UI_Behaviors");

        GameObject camera = GameObject.Find("Main Camera");
        CameraController cameraController = camera.GetComponent<CameraController>();
        cameraController._mode = Define.CameraMode.PlayerFocused;
        
    }

    public void OnEscClicked(PointerEventData data)
    {
        // ���ϱ� ���� ���� !!�����ʿ�!!
        GameObject player = GameObject.Find("Player");
        PlayerController playerController = player.GetComponent<PlayerController>();
        playerController._state = Define.PlayerState.Escape;

        GameObject camera = GameObject.Find("Main Camera");
        CameraController cameraController = camera.GetComponent<CameraController>();
        cameraController._mode = Define.CameraMode.QuarterView;

        // ���� ���� UI �ݰ�, �⺻ UI ����
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
    }

    // ���� ������ ����
    public void UpdateText()
    {
        var nameText = GetText((int)Texts.Text_MonsterName);
        var infoText = GetText((int)Texts.Text_MonsterInfo);
        var statsText = GetText((int)Texts.Text_MonsterStats);

        nameText.text = GameManager.Data.GetMonsterName();
        infoText.text = GameManager.Data.GetMonsterInfo();
        statsText.text = GameManager.Data.GetMonsterStats();
    }
}
