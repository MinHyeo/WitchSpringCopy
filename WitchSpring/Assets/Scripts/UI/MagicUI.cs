using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MagicUI : MonoBehaviour
{
    public void TempCancelButton()
    {
        GameManager.UI.ChangeUI("BattleUI"); 
    }
}
