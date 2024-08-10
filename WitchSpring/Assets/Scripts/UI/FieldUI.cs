using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FieldUI : MonoBehaviour
{
    [Header("UI Text")]
    [SerializeField] Text times;
    [SerializeField] Text availvableTrainingDay;
    [SerializeField] Text location;
    [SerializeField] Text playerHP;
    [SerializeField] Text playerMp;
    [SerializeField] Text playerSp;
    [Header("UI Silder")]
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mpBar;
    [SerializeField] Slider soulBar;


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

        float curSp = GameManager.Player.GetComponent<PlayerController>().CurrentSP;
        float maxSp = GameManager.Player.GetComponent<PlayerController>().MaxSP;
        playerSp.text = $"{curSp}/{maxSp}";
        soulBar.value = curSp / maxSp;  
            
        times.text = $"{GameManager.Instance.Time}일 차";

        availvableTrainingDay.text = $"{GameManager.Instance.TrainDay}";
    }
    public void UpdateLocatinInfo(string locationName = "여기 어디??") { 
        location.text = locationName;
    }
}
