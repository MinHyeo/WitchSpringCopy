using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SituationManager
{
    public Define.Situations currentSituations;

    public void Init() {
        currentSituations = Define.Situations.Normal;
    }

    public void SetStiuation (Define.Situations situations, string monsterID = null){
        currentSituations = situations;

        switch (situations) {
            case Define.Situations.Normal:
                GameManager.UI.ChangeUI("FieldUI");

                GameManager.Player.transform.Rotate(0.0f, 180.0f, 0.0f, Space.Self);
                
                Vector3 playerDest = GameManager.Player.transform.TransformPoint(new Vector3(0.0f, 0.0f, 1.0f)); 
                GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Walk, playerDest); 
                break;
            case Define.Situations.Contact:
                GameManager.UI.ChangeUI("EnterUI");
                GameManager.UI.SetData(monsterID);
                break;
            case Define.Situations.Battle:
                GameManager.UI.ChangeUI("BattleUI");

                GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Battle);
                
                break;
        }
    }
}
