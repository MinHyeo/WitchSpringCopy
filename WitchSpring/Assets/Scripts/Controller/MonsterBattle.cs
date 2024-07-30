using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterBattle : MonoBehaviour
{
    private void OnTriggerEnter(Collider player)
    {
        //player.gameObject.GetComponent<PlayerController>().SetPlayerState();
        PlayerController test = player.GetComponent<PlayerController>();
        if(test != null)
        {
            test.SetPlayerState();
        }
    }
}
