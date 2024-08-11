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
                buffInfo = "3회 동안 마력검날";
                break;
            case "AbsorbSword":
                buffInfo = "8회 동안 흡수검날";
                break;
            case "MagicMaterialize":
                buffInfo = "4회 동안 마력구체";
                break;
            case "MagicTrace":
                buffInfo = "5타에 결쳐 마력의 흔젹";
                break;
        }
        GameManager.UI.SendUIMassage(buffInfo + " 효과가 지속횝니다.", Define.MessageType.Normal);
        GameManager.UI.ChangeUI("BattleUI");
    }
}
