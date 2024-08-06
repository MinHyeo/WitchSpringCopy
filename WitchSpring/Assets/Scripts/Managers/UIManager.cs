using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    [Header("UI Setting")]
    public UIGroup UIRoot = null;

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
        HideUI();
        UIRoot.CurrentUI = UIRoot.UIList[UIName];
        ShowUI();
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

}
