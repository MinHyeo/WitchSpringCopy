using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MagicUI : MonoBehaviour
{
    [SerializeField] Animator UIAni;
    private void Awake()
    {
        UIAni = GetComponent<Animator>();
    }
    public void TempCancelButton()
    {
        GameManager.UI.ChangeUI("BattleUI"); 
    }
    public void ShowMagicUI()
    {
        UIAni.Play("Show");
    }
}
