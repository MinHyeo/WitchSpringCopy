using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterOnlyAttack : MonoBehaviour
{
    public void MonsterAttack()
    {
        int Damage = (int)GameManager.Instance.Monster.GetComponent<MonsterController>().Strength;
        GameManager.Player.GetComponent<PlayerController>().PlayerHit((int)Damage);
    }
    public void MonsterAttackReset()
    {
        GameManager.Instance.Monster.GetComponent<MonsterController>().IsWait = false;
        GameManager.Situation.SetStiuation(Define.Situations.EndAttack);
    }
}
