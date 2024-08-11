using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleUI : MonoBehaviour
{
    public void SoulCystalButton() {
        GameManager.UI.UIRoot.UIList["FieldUI"].GetComponent<FieldUI>().UseCrystalButton();
    }
    public void FenceButton() {
        GameManager.UI.ChangeUI("FenceUI");
    }

    public void MaficFenceButton() {
        GameManager.UI.ChangeUI("MagicFenceUI");
    
    }

    public void MagicButton() {
        GameManager.UI.ChangeUI("MagicUI");
    }

    public void InventoryButton() {
        GameManager.UI.ChangeUI("InventoryUI");
    }

    public void DollButton() {
        GameManager.UI.ChangeUI("DollUI");
    }
    public void ShiledButton() {
        //TODO

    }
    public void EscapelButton() {
        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }

}
