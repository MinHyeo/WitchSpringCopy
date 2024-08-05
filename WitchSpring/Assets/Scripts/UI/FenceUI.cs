using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FenceUI : MonoBehaviour
{
    public void CancelButton() {
        GameManager.UI.ChangeUI("BattleUI");
    }
}
