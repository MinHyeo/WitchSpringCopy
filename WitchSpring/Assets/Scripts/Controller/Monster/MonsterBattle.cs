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
            GameManager.Instance.Monster = monsterRoot;

            GameManager.UI.Question(Define.EmotionType.Exclamation);

            StartCoroutine("SituationWait");

            player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Idle);
            player.transform.LookAt(transform.position);
        }
    }

    IEnumerator SituationWait() {
        yield return new WaitForSeconds(1.0f);
        GameManager.Situation.SetStiuation(Define.Situations.Contact, transform.parent.parent.name);
    }

}