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
        Button_ESC,
        Button_ATK,
        Button_MATK,
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

        GameObject Button_ESC = GetButton((int)Buttons.Button_ESC).gameObject;
        AddUIEvent(Button_ESC, OnEscClicked, Define.UIEvent.Click);

        GameObject Button_ATK = GetButton((int)Buttons.Button_ATK).gameObject;
        AddUIEvent(Button_ATK, OnATKClicked, Define.UIEvent.Click);

        GameObject Button_MATK = GetButton((int)Buttons.Button_MATK).gameObject;
        AddUIEvent(Button_MATK, OnMATKClicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
    }

    public void OnEscClicked(PointerEventData data)
    {
        // ���ϱ� ���� ����

        // ���� �ൿ UI �ݱ�
        GameManager.UI.ClosePopupUI();
    }

    public void OnATKClicked(PointerEventData data)
    {

        // ���� �ൿ UI �ݱ�, �˼� ���� UI ����
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors_ATK>();
    }

    public void OnMATKClicked(PointerEventData data)
    {
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors_MATK>();
    }
    // �̺�Ʈ �ݹ� �Լ�
}