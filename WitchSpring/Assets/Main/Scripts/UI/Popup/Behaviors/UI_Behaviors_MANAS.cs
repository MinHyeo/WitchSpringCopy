using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class UI_Behaviors_MANAS : UI_Popup
{
    enum Buttons
    {
        Button_Close,
        Button_ManaSword1,
        Button_ManaSword2,
        Button_ManaSword3,
        Button_ManaSword4,
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

        GameObject Button_ManaSword1 = GetButton((int)Buttons.Button_ManaSword1).gameObject;
        AddUIEvent(Button_ManaSword1, OnMana1Clicked, Define.UIEvent.Click);

        GameObject Button_ManaSword2 = GetButton((int)Buttons.Button_ManaSword2).gameObject;
        AddUIEvent(Button_ManaSword2, OnMana2Clicked, Define.UIEvent.Click);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
        //������ �������� �̺�Ʈ�� �ް� �װ� �ٽ� ��ü(�÷��̾�, ����, UI ��)�� �ѷ��ٰǵ� ���� ������ ��ü�� ���� �Ǿ���ϳ�
    }
    public void OnCloseClicked(PointerEventData data)
    {
        // ���°˼� UI �ݱ�, �����ൿ UI ����
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }

    public void OnMana1Clicked(PointerEventData data)
    {
        // ���°˼� UI �ݱ�, �����ൿ UI ����
        GameObject.Find("Player").GetComponent<PlayerController>().ManaSword("ManaSword");
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
        
    }

    public void OnMana2Clicked(PointerEventData data)
    {
        
        GameObject.Find("Player").GetComponent<PlayerController>().ManaSword("AbsorptionBlade");
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }
}
