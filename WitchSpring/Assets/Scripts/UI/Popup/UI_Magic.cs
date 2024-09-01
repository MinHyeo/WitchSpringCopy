using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_Magic : MonoBehaviour
{
    UI_Popup popup;

    [SerializeField] GameObject[] slot;
    [SerializeField] GameObject[] magic;
    [SerializeField] GameObject[] prefabs;

   
    void Start()
    {
        popup = GetComponent<UI_Popup>();

    }

    void Update()
    {
    }

    public void Button_Cancel()
    {
        popup.ClosePopupUI();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }

    public void Button_Magic()
    {
        popup.ClosePopupUI();
    }

    public void CheckMagic()
    {
        for (int i = 0; i < 3; i++)
        {
            if (slot[i].transform.childCount == 0)
            {
                Instantiate(prefabs[i], slot[i].transform);
            }
        }

        if (slot[3].transform.childCount >= 2)
        {
            Destroy(slot[3].transform.GetChild(0).gameObject);
        }
    }


}
