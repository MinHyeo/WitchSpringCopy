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
        switch (buffName) {
            case "MagicWord":
                buffInfo = "3ȸ ���� ���°˳�";
                break;
            case "AbsorbSword":
                buffInfo = "8ȸ ���� ����˳�";
                break;
            case "MagicMaterialize":
                buffInfo = "4ȸ ���� ���±�ü";
                break;
            case "MagicTrace":
                buffInfo = "5Ÿ�� ���� ������ �砬";
                break;
        }
        GameManager.UI.SendUIMassage(buffInfo + " ȿ���� ����ȼ�ϴ�.", Define.MessageType.Normal);
        GameManager.UI.ChangeUI("BattleUI");
    }
}
