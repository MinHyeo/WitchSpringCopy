using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FieldUI : MonoBehaviour
{
    [Header("UI Text")]
    [SerializeField] Text days;
    [SerializeField] Text location;
    [SerializeField] Text playerHP;
    [SerializeField] Text playerMp;
    [Header("UI Silder")]
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mpBar;



    void Start()
    {
        UpdateCharactorInfo();
        UpdateLocatinInfo();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void UpdateCharactorInfo() {
        int curHp = GameManager.Player.GetComponent<PlayerController>().CurrentHP;
        int maxHp = GameManager.Player.GetComponent<PlayerController>().MaxHP;
        playerHP.text = $"{curHp}/{maxHp}";
        hpBar.value = curHp / maxHp;

        int curMP = GameManager.Player.GetComponent<PlayerController>().CurrentMP;
        int maxMP = GameManager.Player.GetComponent<PlayerController>().MaxMP;
        playerMp.text = $"{curMP}/{maxMP}";
        mpBar.value = curMP / maxMP;

    }
    public void UpdateLocatinInfo(string locationName = "여기 어디??") { 
        location.text = locationName;
    }
}
