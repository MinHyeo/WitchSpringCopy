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
        int curMP = GameManager.Player.GetComponent<PlayerController>().CurrentMP;
        int MaxMP = GameManager.Player.GetComponent<PlayerController>().MaxMP;
        playerHP.text = $"{curHp}/{maxHp}";
        playerMp.text = $"{curMP}/{MaxMP}";   
    }
    public void UpdateLocatinInfo(string locationName = "���� ���??") { 
        location.text = locationName;
    }
}
