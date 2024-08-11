using System.Collections;
using System.Collections.Generic;
using UnityEditor.ShaderKeywordFilter;
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
    [SerializeField] Text buffList;
    [Header("UI Silder")]
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mpBar;
    [SerializeField] Slider soulBar;
    [SerializeField] Slider turnBar;
    [Header("UI Bttton")]
    [SerializeField] Button inventory;
    [Header("Silder Data")]
    [SerializeField] PlayerController pData;
    [SerializeField] float curHp;
    [SerializeField] float maxHp;
    [SerializeField] float curMP;
    [SerializeField] float maxMP;
    [SerializeField] float curSp;
    [SerializeField] float maxSp;


    void Start()
    {
        pData = GameManager.Player.GetComponent<PlayerController>();
        buffList.text = "";
    }

    // Update is called once per frame
    void LateUpdate()
    {
        UpdateCharactorInfo();
        UpdateLocatinInfo();
    }

    #region UIDataUpdate
    public void UpdateCharactorInfo() {
        curHp = pData.CurrentHP;
        maxHp = pData.MaxHP;
        playerHP.text = $"{curHp}/{maxHp}";
        hpBar.value = curHp / maxHp;

        curMP = pData.CurrentMP;
        maxMP = pData.MaxMP;
        playerMp.text = $"{curMP}/{maxMP}";
        mpBar.value = curMP / maxMP;

        curSp = pData.CurrentSP;
        maxSp = pData.MaxSP;
        playerSp.text = $"{curSp}/{maxSp}";
        soulBar.value = curSp / maxSp;

        times.text = $"{GameManager.Instance.Time}일 차";

        availvableTrainingDay.text = $"{GameManager.Instance.TrainDay}";
    }
    public void UpdateLocatinInfo(string locationName = "어디지??") {
        location.text = locationName;
    }

    public void UpdateBuffInfo() { 

    
    
    }
    #endregion

    //Crystal Test Code
    public void UseCrystalButton() {
        if (curSp <= 0) {
            GameManager.UI.SendUIMassage("영혼석 다 씀 ㅅㄱ", Define.MessageType.System);
            return;
        }
        //Use Soul
        pData.RecoverHP(curSp);
        pData.RecoverMP(curSp);

        GameManager.UI.SendUIMassage($"영혼석 사용으로 체력과 마나를 {pData.CurrentSP}만큼씩 회복했습니다!", Define.MessageType.System);

        //Reset Soul
        pData.CurrentSP = 0.0f;
        //Data Update
        UpdateCharactorInfo();
    }
    public void InventoryButton()
    {
        GameManager.UI.SendUIMassage("아직 구현 중...", Define.MessageType.System);
    }
    public void BattleMode() {
        //Block
        inventory.interactable = false;
        buffList.gameObject.SetActive(true);
        turnBar.gameObject.SetActive(true);

    }
    public void NormalMode()
    {
        inventory.interactable = true;
        buffList.gameObject.SetActive(false);
        turnBar.gameObject.SetActive(false);
    }
}
