using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    [Header("UI Setting")]
    public UIGroup UIRoot = null;
    public bool IsMessageOn = false;

    public void Init() {
        GameObject uimanager = GameObject.Find("UI_Root");
        if (uimanager == null) {
            uimanager = new GameObject { name = "UI_Root" };
            UIRoot =  Util.GetOrAddComponent<UIGroup>(uimanager);
            UIRoot.DontDestroy();

            //Create and Store All UI
            for (int i = 0; i < (int)Define.UITypes.MaxUI; i++)
            {
                string UIName = Enum.GetName(typeof(Define.UITypes), i);
                UIRoot.UIList.Add(UIName, GameManager.Resource.Instantiate($"UI/{UIName}", uimanager.transform));
                UIRoot.UIList[UIName].SetActive(false);
            }
        }
        ChangeUI("FieldUI");
    }

    //UI Change
    public void ChangeUI(string UIName) {
        if (UIRoot.CurrentUI != null)
        {
            HideUI();
        }
        UIRoot.CurrentUI = UIRoot.UIList[UIName];
        ShowUI();
        //Switch for Animation
        switch (UIName) {
            case "FieldUI":
                UIRoot.UIList[UIName].GetComponent<FieldUI>().NormalMode();
                UIRoot.UIList[UIName].GetComponent<FieldUI>().ShowFieldUI();
                //UIRoot.UIList["MonsterHPUI"].SetActive(false);
                break;
            case "BattleUI":
                UIRoot.UIList["FieldUI"].SetActive(true);
                UIRoot.UIList["FieldUI"].GetComponent<FieldUI>().BattleMode();
                UIRoot.UIList["FieldUI"].GetComponent<FieldUI>().ShowFieldUI();
                //UIRoot.UIList["MonsterHPUI"].SetActive(true);
                UIRoot.UIList[UIName].GetComponent<BattleUI>().ShowBattleUI();
                break;
            case"FenceUI":
                UIRoot.UIList[UIName].GetComponent<FenceUI>().ShowFenceUI();
                break;
            case "MagicFenceUI":
                UIRoot.UIList[UIName].GetComponent<MagicFenceUI>().ShowMagicFenceUI();
                break;
            case "MagicUI":
                UIRoot.UIList[UIName].GetComponent<MagicUI>().ShowMagicUI();
                break;
        }
    }

    public void SetData(string MonsterID = null) {
        EnterUI enterUI = Util.GetOrAddComponent<EnterUI>(UIRoot.CurrentUI);
        enterUI.Init(MonsterID);
    }

    public void HideUI() {
        if (UIRoot.CurrentUI != null)
        {
            UIRoot.CurrentUI.SetActive(false);
        }
        return;
    }

    public void ShowUI() {
        UIRoot.CurrentUI.SetActive(true);
        return;
    }

    public void SendUIMassage(string message, Define.MessageType messageType = Define.MessageType.System) {
        UIRoot.UIList["MessageUI"].GetComponent<MessageUI>().ShowMessage(message, messageType);
        IsMessageOn = true;
    }

    public void CloseUIMessage() {
        UIRoot.UIList["MessageUI"].SetActive(false);
        IsMessageOn = false;
    }

    public void Question(Define.EmotionType emotionType) {
        UIRoot.UIList["FieldUI"].GetComponent<FieldUI>().ShowQuestion(emotionType);
    }

    public void Heal(int Heal) {
        UIRoot.UIList["FieldUI"].GetComponent<FieldUI>().ShowHeal(Heal);
    }
}
