using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterBattle : MonoBehaviour
{
    private void OnTriggerEnter(Collider player)
    {
        player.GetComponent<PlayerController>();
        if(player.gameObject.tag == "Player")
        {
            GameManager.Situation.SetStiuation(Define.Situations.Contact, "� �Ȱ��β���");

            player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Idle);
            player.transform.LookAt(transform.position);

           /* Vector3 dirToPlayer = player.transform.position - transform.parent.position;
            dirToPlayer.y = 0; 
            transform.parent.Rotate(dirToPlayer, Space.Self);*/

            //transform.gameObject.transform.parent.transform.LookAt(new Vector3(player.transform.position.x, 0.0f, player.transform.position.z)); //������ ��ǥ�� �޶����� ���� �߻�
        }
    }
}
