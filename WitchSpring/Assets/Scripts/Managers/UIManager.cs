using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    [Header("UI Setting")]
    public GameObject CurrentUI = null;
    public GameObject[] UIList = new GameObject[(int)Define.UITypes.MaxUI];

    public void Init() {
        GameObject uimanager = GameObject.Find("@UIManager");
        if (uimanager == null) {
            uimanager = new GameObject { name = "@UIManager" };
            //Util.GetOrAddComponent<UIManager>(uimanager);
            //DontDestroyOnLoad(uimanager);
        }
        //Create and Store All UI
        for (int i = 0; i < (int)Define.UITypes.MaxUI; i++) {
            UIList[i] = GameManager.Resource.Instantiate($"UI/{Enum.GetName(typeof(Define.UITypes) , i)}", uimanager.transform);
            UIList[i].SetActive(false);
        }

        //Set default UI
        CurrentUI = UIList[(int)Define.UITypes.FieldUI]; 
        CurrentUI.SetActive(true); //Enter UI가 켜지는 버그 발생
    }

    //UI Change
    public void ChangeUI(int uiNumber) {
        CurrentUI.SetActive(false);
        CurrentUI = UIList[uiNumber];
        CurrentUI.SetActive(true);
    }
}
