using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FenceUI : MonoBehaviour
{
    public void CancelButton() {
        GameManager.UI.ChangeUI("BattleUI");
    }

    public void AttackButton(int attackNumber)
    {
        GameManager.Situation.SetStiuation(Define.Situations.StartAttack);

        GameManager.Player.GetComponent<Animator>().SetInteger("AttackNumber", attackNumber);
        GameManager.Player.GetComponent<Animator>().SetTrigger("Attack");
    }

}
