using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

public class UI_MonsterHP : UI_Popup
{
    MonsterController monster;
    enum Texts
    {
        Text_HPRatio
    }

    enum Sliders
    {
        Slider_HP
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

        monster = Camera.main.GetComponent<CameraController>()._monster.GetComponent<MonsterController>();

        InitializeSliders();
        UpdateText();
    }

    private void InitializeSliders()
    {
        Get<Slider>((int)Sliders.Slider_HP).maxValue = monster.MaxHP;
        Get<Slider>((int)Sliders.Slider_HP).value = monster.MaxHP;
    }

    public void UpdateText()
    {
        var HPRatio = GetText((int)Texts.Text_HPRatio);

        string maxHP = monster.MaxHP.ToString();
        string HP = monster.HP.ToString();
        Get<Slider>((int)Sliders.Slider_HP).value = monster.HP;;

        HPRatio.text = HP;
    }
}
