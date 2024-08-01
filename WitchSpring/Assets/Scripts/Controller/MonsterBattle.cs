using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterBattle : MonoBehaviour
{
    private void OnTriggerEnter(Collider player)
    {
        PlayerController test = player.GetComponent<PlayerController>();
        if(test != null)
        {
            test.SetPlayerState(Define.PlayerStates.Battle);

            player.transform.LookAt(transform.position);
            //transform.parent.transform.LookAt(player.transform.position); //몬스터의 좌표도 달라지는 버그 발생

            GameManager.UI.ChangeUI("EnterUI");
        }
    }
}
