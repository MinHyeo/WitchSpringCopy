using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FenceUI : MonoBehaviour
{
    public int attackNum;
    public void CancelButton() {
        GameManager.UI.ChangeUI("BattleUI");
    }

    public void AttackButton(int attackNumber)
    {
        this.attackNum = attackNumber;
        float Hpcost = 0.0f;
        PlayerController playerHp = GameManager.Player.GetComponent<PlayerController>();
        //Player HP Decrease
        switch (attackNum) {
            case 2:
                Hpcost = 4.0f;
                break;
            case 3:
                Hpcost = 7.0f;
                break;
            case 4:
                Hpcost = 30.0f;
                break;
            case 5:
                Hpcost = 44.0f;
                break;
            case 6:
                Hpcost = 64.0f;
                break;
            case 7:
                Hpcost = 64.0f;
                break;
        }
        if (playerHp.CurrentHP <= Hpcost) {
            GameManager.UI.SendUIMassage("검술공격을 위한 현재 체력이 부족합니다!",Define.MessageType.System);
            return;
        }
        playerHp.UseHPOrHit(Hpcost);


        GameManager.Situation.SetStiuation(Define.Situations.StartAttack);

        GameManager.Player.GetComponent<PlayerController>().AttackNumber = attackNumber;
        GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Walk, GameManager.Instance.Monster.transform.position);
    }

}
