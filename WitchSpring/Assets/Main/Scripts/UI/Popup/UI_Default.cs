using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;
using UnityEngine.EventSystems;
using TMPro;

public class UI_Default : UI_Popup
{
    GameObject menuButton;
    GameObject AGTslider;

    enum Buttons
    {
        Menu,
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
        Slider_AGT
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
        Bind<Button>(typeof(Buttons));

        GameObject Menu = GetButton((int)Buttons.Menu).gameObject;
        menuButton = Menu;

        GameObject Slider_AGT = Get<Slider>((int)Sliders.Slider_HP).gameObject;
        AGTslider = Slider_AGT;


        InitializeSliders();
        UpdateText();
    }

    private void InitializeSliders()
    {
        PlayerController playerController = GameObject.Find("Player").GetComponent<PlayerController>();

        Get<Slider>((int)Sliders.Slider_HP).maxValue = playerController.MaxHP;
        Get<Slider>((int)Sliders.Slider_MP).maxValue = playerController.MaxMP;

        Get<Slider>((int)Sliders.Slider_AGT).maxValue = 100.0f;
        Get<Slider>((int)Sliders.Slider_AGT).value = 0.0f;

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

    public void FightMode()
    {
        menuButton.GetComponent<Button>().interactable = false;
        AGTslider.SetActive(true);
    }

    public void UpdateActionGauge(float value)
    {
        Debug.Log(value);
        Get<Slider>((int)Sliders.Slider_AGT).value = value;
    }


}
