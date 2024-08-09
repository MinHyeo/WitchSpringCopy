using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;
using TMPro;

public class UI_Default : UI_Popup
{

    enum Buttons
    {
    }
    enum Texts
    {
        Text_HPRatio,
        Text_MPRatio,
    }
    enum GameObjects
    {
    }

    enum Images
    {
    }

    enum Sliders
    {
        Slider_HP,
        Slider_MP,
    }



    void Start()
    {
        Init();
    }

    public override void Init()
    {
        base.Init();

        Bind<Slider>(typeof(Sliders));
        Bind<TextMeshProUGUI>(typeof(Texts));
        //Bind<Button>(typeof(Buttons));
        //Bind<Text>(typeof(Texts));
        //Bind<Image>(typeof(Images));

        //GetButton((int)Buttons.PointButton).gameObject.AddUIEvent(OnButtonClicked);

        //GameObject go = GetImage((int)Images.ItemIcon).gameObject;
        //AddUIEvent(go, (PointerEventData data) => { go.gameObject.transform.position = data.position; }, Define.UIEvent.Drag);
        InitializeSliders();
        UpdateText();
    }

    private void InitializeSliders()
    {
        PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();

        Get<Slider>((int)Sliders.Slider_HP).maxValue = playerController.MaxHP;
        Get<Slider>((int)Sliders.Slider_MP).maxValue = playerController.MaxMP;

        Get<Slider>((int)Sliders.Slider_HP).value = playerController.HP;
        Get<Slider>((int)Sliders.Slider_MP).value = playerController.MP;
    }

    public void UpdateText()
    {
        var HPRatio = GetText((int)Texts.Text_HPRatio);
        var MPRatio = GetText((int)Texts.Text_MPRatio);

        PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();
        string maxHP = playerController.MaxHP.ToString();
        string HP = playerController.HP.ToString();
        string maxMP = playerController.MaxMP.ToString();
        string MP = playerController.MP.ToString();

        Get<Slider>((int)Sliders.Slider_HP).value = playerController.HP;
        Get<Slider>((int)Sliders.Slider_MP).value = playerController.MP;

        HPRatio.text = $"{HP}/{maxHP}";
        MPRatio.text = $"{MP}/{maxMP}";
    }

    // 슬라이더 값을 변경하는 메서드
    /*public void UpdateSliderValue(Sliders sliderType, float value)
    {
        // 슬라이더 값을 0과 1 사이로 클램프
        value = Mathf.Clamp(value, 0.0f, 1.0f);
        Get<Slider>((int)sliderType).value = value;
    }*/


}
