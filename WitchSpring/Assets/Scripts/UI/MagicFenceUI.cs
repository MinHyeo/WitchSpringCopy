using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MagicFenceUI : MonoBehaviour
{
    public void CancelButton() {
        GameManager.UI.ChangeUI("BattleUI");
    }

    public void MagicButton(string buffName) {
        string buffInfo = "";

        float Mpcost = 0.0f;
        PlayerController playerHp = GameManager.Player.GetComponent<PlayerController>();

        switch (buffName) {
            case "MagicSword":
                buffInfo = "3회 동안 마력검날";
                Mpcost = 40.0f;
                break;
            case "AbsorbSword":
                buffInfo = "8회 동안 흡수검날";
                Mpcost = 30.0f;
                break;
            case "MagicMaterialize":
                buffInfo = "4회 동안 마력구체";
                Mpcost = 50.0f;
                break;
            case "MagicTrace":
                buffInfo = "5타에 결쳐 마력의 흔젹";
                Mpcost = 70.0f;
                break;
        }
        if (playerHp.CurrentMP <= Mpcost)
        {
            GameManager.UI.SendUIMassage("마나 부족합니다!", Define.MessageType.System);
            return;
        }
        playerHp.UseMP(Mpcost);

        GameManager.UI.SendUIMassage(buffInfo + " 효과가 지속횝니다.", Define.MessageType.System);
        GameManager.UI.ChangeUI("BattleUI");
    }
}
