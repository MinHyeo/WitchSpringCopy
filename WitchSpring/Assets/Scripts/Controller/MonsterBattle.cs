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
            //transform.parent.transform.LookAt(player.transform.position); //������ ��ǥ�� �޶����� ���� �߻�

            GameManager.UI.ChangeUI("EnterUI");
        }
    }
}
