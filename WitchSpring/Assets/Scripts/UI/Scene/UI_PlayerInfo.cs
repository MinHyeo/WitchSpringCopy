using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_PlayerInfo : MonoBehaviour
{
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mppBar;
    [SerializeField] Text hpText;
    [SerializeField] Text mppText;

    private void Awake()
    {

    }
    // Update is called once per frame
    void Update()
    {
        UpdateInfo();
    }

    void UpdateInfo()
    {
        hpBar.value = (float)Managers.Player.player.hp / Managers.Player.player.maxHp;
        mppBar.value = (float)Managers.Player.player.mp / Managers.Player.player.maxMp;
        hpText.text = $"{Managers.Player.player.hp}/{Managers.Player.player.maxHp}";
        mppText.text = $"{Managers.Player.player.mp}/{Managers.Player.player.maxMp}";
    }
}
