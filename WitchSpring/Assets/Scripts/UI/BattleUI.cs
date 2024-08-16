using System;
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
        GameManager.UI.SendUIMassage("아직 구현 중...", Define.MessageType.System);
        //GameManager.UI.ChangeUI("InventoryUI");
    }

    public void DollButton() {
        GameManager.UI.SendUIMassage("아직 구현 중...", Define.MessageType.System);
        //GameManager.UI.ChangeUI("DollUI");
    }
    public void ShiledButton() {
        GameManager.UI.SendUIMassage("아직 구현 중...", Define.MessageType.System);
        //TODO

    }
    public void EscapelButton() {
        for (int i = 0; i < (int)Define.PlayerBuff.MaxBuff; i++) {
            string bufName = Enum.GetName(typeof(Define.PlayerBuff), i);
            GameManager.Player.GetComponent<PlayerController>().Buff[bufName] = 0;
        }
        GameManager.Player.GetComponent<PlayerController>().MagicFenceBuffSet();

        GameManager.Situation.SetStiuation(Define.Situations.Normal);
    }

}
