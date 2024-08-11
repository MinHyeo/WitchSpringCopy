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
                buffInfo = "3ȸ ���� ���°˳�";
                Mpcost = 40.0f;
                break;
            case "AbsorbSword":
                buffInfo = "8ȸ ���� ����˳�";
                Mpcost = 30.0f;
                break;
            case "MagicMaterialize":
                buffInfo = "4ȸ ���� ���±�ü";
                Mpcost = 50.0f;
                break;
            case "MagicTrace":
                buffInfo = "5Ÿ�� ���� ������ �砬";
                Mpcost = 70.0f;
                break;
        }
        if (playerHp.CurrentMP <= Mpcost)
        {
            GameManager.UI.SendUIMassage("���� �����մϴ�!", Define.MessageType.System);
            return;
        }
        playerHp.UseMP(Mpcost);

        GameManager.UI.SendUIMassage(buffInfo + " ȿ���� ����ȼ�ϴ�.", Define.MessageType.System);
        GameManager.UI.ChangeUI("BattleUI");
    }
}
