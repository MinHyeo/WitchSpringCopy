using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SituationManager
{
    Define.Situations currentSituations;

    public void Init() {
        currentSituations = Define.Situations.Normal;
    }

    public void SetStiuation (Define.Situations situations, string monsterName = ""){
        currentSituations = situations;
        switch (situations) {
            case Define.Situations.Normal:
                GameManager.UI.ChangeUI("FieldUI");
                //พ๎ป๖วิ
                GameManager.Player.transform.Rotate(new Vector3(0.0f, 180.0f,0.0f));
                Vector3 playerDest = GameManager.Player.transform.position;
                playerDest = new Vector3(playerDest.x, playerDest.y, playerDest.z + 0.5f);
                GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Walk, playerDest);
                break;
            case Define.Situations.Contact:
                GameManager.UI.ChangeUI("EnterUI");
                GameManager.UI.SetData();
                break;
            case Define.Situations.Battle:
                GameManager.UI.ChangeUI("BattleUI");
                break;
        }
    }
}
