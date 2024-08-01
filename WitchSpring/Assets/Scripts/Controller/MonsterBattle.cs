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
            GameManager.Situation.SetStiuation(Define.Situations.Contact);

            player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Battle);
            player.transform.LookAt(transform.position);
            //transform.parent.transform.LookAt(new Vector3(player.transform.position.x, 0.0f, player.transform.position.x)); //몬스터의 좌표도 달라지는 버그 발생
        }
    }
}
