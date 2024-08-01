using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    [Header("UI Setting")]
    public UI_Group UIRoot = null;

    public void Init() {
        GameObject uimanager = GameObject.Find("UI_Root");
        if (uimanager == null) {
            uimanager = new GameObject { name = "UI_Root" };
            UIRoot =  Util.GetOrAddComponent<UI_Group>(uimanager);
            UIRoot.DontDestroy();
        }
        //Create and Store All UI
        for (int i = 0; i < (int)Define.UITypes.MaxUI; i++) {
            string UIName = Enum.GetName(typeof(Define.UITypes), i);
            UIRoot.UIList.Add(UIName, GameManager.Resource.Instantiate($"UI/{UIName}", uimanager.transform));
            UIRoot.UIList[UIName].SetActive(false);
        }
        ChangeUI("FieldUI");
    }

    //UI Change
    public void ChangeUI(string UIName) {
        if (UIRoot.CurrentUI != null) {
            Debug.Log($"Hide UI : {UIRoot.CurrentUI.transform.name}");
            UIRoot.CurrentUI.SetActive(false);
        }
        UIRoot.CurrentUI = UIRoot.UIList[UIName];
        Debug.Log(UIName);
        Debug.Log($"Set UI : {UIName}");
        UIRoot.CurrentUI.SetActive(true);
        Debug.Log($"Active UI: {UIName}");
    }
}
