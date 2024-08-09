using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MonsterBattle : MonoBehaviour
{
    public GameObject monsterRoot;

    private void OnTriggerEnter(Collider player)
    {
        if (player.gameObject.tag == "Player")
        {
            GameManager.Situation.SetStiuation(Define.Situations.Contact, transform.parent.name);

            player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Idle);
            player.transform.LookAt(transform.position);

            GameManager.Instance.Monster = monsterRoot;
        }
    }
}
