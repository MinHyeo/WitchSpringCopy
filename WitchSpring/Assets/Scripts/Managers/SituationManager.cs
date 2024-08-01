using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SituationManager
{
    Define.Situations currentSituations;

    public void Init() {
        currentSituations = Define.Situations.Normal;
    }

    public void SetStiuation (Define.Situations situations){
        currentSituations = situations;
        switch (situations) {
            case Define.Situations.Normal:
                GameManager.UI.ChangeUI("FieldUI");
                break;
            case Define.Situations.Contact:
                GameManager.UI.ChangeUI("EnterUI");
                break;
            case Define.Situations.Battle:
                GameManager.UI.ChangeUI("BattleUI");
                break;
        }
    }
}
