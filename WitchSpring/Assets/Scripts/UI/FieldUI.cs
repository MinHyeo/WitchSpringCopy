using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FieldUI : MonoBehaviour
{
    [Header("UI Text")]
    [SerializeField] Text Days;
    [SerializeField] Text availvableTrainingDay;
    [SerializeField] Text location;
    [SerializeField] Text playerHP;
    [SerializeField] Text playerMp;
    [Header("UI Silder")]
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mpBar;


    void Start()
    {
        
    }

    // Update is called once per frame
    void LateUpdate()
    {
        UpdateCharactorInfo();
        UpdateLocatinInfo();
    }

    public void UpdateCharactorInfo() {
        float curHp = GameManager.Player.GetComponent<PlayerController>().CurrentHP;
        float maxHp = GameManager.Player.GetComponent<PlayerController>().MaxHP;
        playerHP.text = $"{curHp}/{maxHp}";
        hpBar.value = curHp / maxHp;

        float curMP = GameManager.Player.GetComponent<PlayerController>().CurrentMP;
        float maxMP = GameManager.Player.GetComponent<PlayerController>().MaxMP;
        playerMp.text = $"{curMP}/{maxMP}";
        mpBar.value = curMP / maxMP;

    }
    public void UpdateLocatinInfo(string locationName = "여기 어디??") { 
        location.text = locationName;
    }
}
