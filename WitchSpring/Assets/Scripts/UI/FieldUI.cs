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
    [Header("UI Silder")]
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mpBar;
    [SerializeField] Slider soulBar;
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
    }

    // Update is called once per frame
    void LateUpdate()
    {
        UpdateCharactorInfo();
        UpdateLocatinInfo();
    }

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

        times.text = $"{GameManager.Instance.Time}�� ��";

        availvableTrainingDay.text = $"{GameManager.Instance.TrainDay}";
    }
    public void UpdateLocatinInfo(string locationName = "���� ���??") {
        location.text = locationName;
    }

    //Crystal Test Code
    public void UseCrystalButton() {
        if (curSp <= 0) {
            GameManager.UI.SendUIMassage("��ȥ�� ��� ��� �� �� ����", Define.MessageType.System);
            return;
        }
        //Use Soul
        pData.RecoverHP(curSp);
        pData.RecoverMP(curSp);

        GameManager.UI.SendUIMassage($"��ȥ������ ü�°� ������ {pData.CurrentSP}��ŭ�� ȸ���߽��ϴ�!", Define.MessageType.System);

        //Reset Soul
        pData.CurrentSP = 0.0f;
        //Data Update
        UpdateCharactorInfo();
    }
    public void InventoryButton()
    {
        GameManager.UI.SendUIMassage("���� �غ���...", Define.MessageType.System);
    }
    public void BattleMode() {
        //Bock Button
        inventory.interactable = false;
    }
    public void NormalMode()
    {
        inventory.interactable = true;
    }
}
