using System;
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
    [Header("UI Image & Sprite")]
    [SerializeField] Image emotion;
    [SerializeField] Dictionary<int, Sprite> healNum = new Dictionary<int, Sprite>();
    [Header("UI Sprite")]
    [SerializeField] Sprite[] emotionSprites;
    [SerializeField] Dictionary<string, Sprite> uiSprites= new Dictionary<string, Sprite>();
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
    [SerializeField] float totalTurn = 0.0f;
    [SerializeField] bool IsBattle = false;
    [Header("UI Componet")]
    [SerializeField] Animator UIAni;

    private void Awake()
    {

        UIAni = GetComponent<Animator>();


        for (int i = 0; i < (int)Define.EmotionType.MaxEmotion; i++)
        {
            uiSprites.Add(emotionSprites[i].name, emotionSprites[i]);
        }

        for (int i = 0; i < 10; i++)
        {
            Sprite number = GameManager.Resource.Load<Sprite>($"Sprite/Heal/{i}");
            healNum.Add(i, number);
        }
    }

    void Start()
    {
        buffList.text = "";

        emotion.gameObject.SetActive(false);

        pData = GameManager.Player.GetComponent<PlayerController>();
    }

    // Update is called once per frame
    void LateUpdate()
    {
        UpdateCharactorInfo();
        UpdateLocatinInfo();
        UpdateBuffInfo();
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

        if (IsBattle){
            if (totalTurn == 0.0f) {
                totalTurn = pData.PlayerAgility +
                        GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterAility;
            }
            if (pData.PlayerTurn) {
                turnBar.value = 1.0f;
                return;
            }
            turnBar.value = (float)pData.PlayerCurAgt /totalTurn;
            if (turnBar.value >= 1) {
                pData.PlayerTurn = true;
            }
        }

    }
    public void UpdateLocatinInfo(string locationName = "어디지??") {
        location.text = locationName;
    }

    public void UpdateBuffInfo() {
        buffList.text = "";
        for (int i = 0; i < (int)Define.PlayerBuff.MaxBuff; i++) {
            string BuffName = Enum.GetName(typeof(Define.PlayerBuff), i);
            if (GameManager.Player.GetComponent<PlayerController>().Buff[BuffName] > 0) { 
                buffList.text += $"{GameManager.Data.BuffDict[BuffName].Korean} - 효과 {GameManager.Player.GetComponent<PlayerController>().Buff[BuffName]}회 남음\n";
            }
        }
    }
    #endregion

    //Crystal Test Code
    public void UseCrystalButton() {
        if (curSp <= 0) {
            GameManager.UI.SendUIMassage("영혼석에 저장된 생명력이 없습니다.", Define.MessageType.System);
            return;
        }
        //Use Soul
        pData.RecoverHP(curSp);
        pData.RecoverMP(curSp);

        GameManager.UI.SendUIMassage($"영혼석 사용으로 체력과 마나를 {pData.CurrentSP}만큼씩 회복했습니다!", Define.MessageType.System);

        //Reset Soul
        pData.CurrentSP = 0.0f;
    }
    public void InventoryButton()
    {
        GameManager.UI.SendUIMassage("아직 구현 중...", Define.MessageType.System);
    }
    public void BattleMode() {
        IsBattle = true;
        //Block
        inventory.interactable = false;
        buffList.gameObject.SetActive(true);
        turnBar.gameObject.SetActive(true);
        emotion.gameObject.SetActive(false);
        GameManager.GM_Instance.Battle = true;
    }
    public void NormalMode()
    {
        IsBattle = false;
        totalTurn = 0.0f;
        inventory.interactable = true;
        buffList.gameObject.SetActive(false);
        turnBar.gameObject.SetActive(false);
        emotion.gameObject.SetActive(false);
        GameManager.GM_Instance.Battle = false;
    }

    public void ShowFieldUI() {
        UIAni.Play("Show");
    }

    public void HideFieldUI() {
        UIAni.Play("Hide");
    }

    public void ShowQuestion(Define.EmotionType emotionType)
    {
        string type = emotionType.ToString();
        emotion.sprite = uiSprites[type];
        emotion.gameObject.SetActive(true); 
    }

    public void ShowHeal(int Heal)
    {
        List<Sprite> Hsprite = new List<Sprite>();
        while (Heal > 0)
        {
            Hsprite.Add(healNum[(int)(Heal % 10)]);
            //Debug.Log($"{Count + 1}의 자리 수: {damage % 10}");
            Heal /= 10;
        }
        HealBoxUI DamageBox = GameManager.Resource.Instantiate("UI/HealBox", gameObject.transform).GetComponent<HealBoxUI>();
        DamageBox.SetHeal(Hsprite);
    }

    IEnumerator EmotionTime() { 
        yield return new WaitForSeconds(0.5f);
        emotion.gameObject.SetActive(false);
    }
}
