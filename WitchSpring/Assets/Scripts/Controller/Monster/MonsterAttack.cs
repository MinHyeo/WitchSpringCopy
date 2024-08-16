using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterAttack : MonoBehaviour
{
    private PlayerController pController;
    private void OnTriggerEnter(Collider player)
    {
        if (player.gameObject.tag == "Player")
        {
            pController = player.transform.GetComponent<PlayerController>();
            pController.SetPlayerState(Define.PlayerStates.Battle);
            pController.FenceAttack();
        }
    }
}
