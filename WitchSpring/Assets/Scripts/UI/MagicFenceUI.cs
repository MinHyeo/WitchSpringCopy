using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class MagicFenceType 
{
    public string name;
    public int count;
    public int mpCost;
}

public class MagicFenceUI : MonoBehaviour
{
    public void CancelButton() {
        GameManager.UI.ChangeUI("BattleUI");
    }

    public void MagicButton(string buffName) {
        string buffInfo = "";
        bool IsAlreadyUsed = false;

        float Mpcost = 0.0f;
        PlayerController playerInfo = GameManager.Player.GetComponent<PlayerController>();

        switch (buffName) {
            case "MagicSword":
                if (playerInfo.Buff[buffName] == 3) {
                    IsAlreadyUsed = true;
                    break;
                }
                buffInfo = "3회 동안 마력검날";
                playerInfo.Buff[buffName] = 3;
                Mpcost = 40.0f;
                break;
            case "AbsorbSword":
                if (playerInfo.Buff[buffName] == 8)
                {
                    IsAlreadyUsed = true;
                    break;
                }
                buffInfo = "8회 동안 흡수검날";
                playerInfo.Buff[buffName] = 8;
                Mpcost = 30.0f;
                break;
            case "MagicMaterialize":
                if (playerInfo.Buff[buffName] == 4)
                {
                    IsAlreadyUsed = true;
                    break;
                }
                buffInfo = "4회 동안 마력구체";
                playerInfo.Buff[buffName] = 4;
                Mpcost = 50.0f;
                break;
            case "MagicTrace":
                if (playerInfo.Buff[buffName] == 5)
                {
                    IsAlreadyUsed = true;
                    break;
                }
                buffInfo = "5타에 결쳐 마력의 흔젹";
                playerInfo.Buff[buffName] = 5;
                Mpcost = 70.0f;
                break;
        }

        if (playerInfo.CurrentMP <= Mpcost)
        {
            GameManager.UI.SendUIMassage("마나 부족합니다!", Define.MessageType.System);
            return;
        }

        if (IsAlreadyUsed) {
            GameManager.UI.SendUIMassage("이미 시전한 마력검술입니다!", Define.MessageType.System);
            return;
        }
        playerInfo.UseMP(Mpcost);

        playerInfo.MagicFenceBuffSet();

        GameManager.UI.ChangeUI("BattleUI");
        GameManager.UI.SendUIMassage(buffInfo + " 효과가 지속됩니다.", Define.MessageType.System);
    }
}
