using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterController : MonoBehaviour
{
    [Header("Monster Info")]
    [SerializeField] int HP;
    [SerializeField] int Strength;
    [SerializeField] int Magic;
    [SerializeField] int Agility;
    [SerializeField] int Defense;
    [SerializeField] int MagicResist;
    [SerializeField] public bool IsDead;

    [Header("Monster Component")]
    [SerializeField] Animator monsterAni;

    public void SetStat(MonsterInfo data) {
        HP = data.HP;
        Strength = data.Strength;
        Magic = data.Magic;
        Agility = data.Agility;
        Defense = data.Defense;
        MagicResist = data.MagicResist;
        monsterAni = transform.parent.GetComponent<Animator>();
    }

    public void MonsterHit(float damage) {
        Debug.Log($"Monster Hitted {(int)damage}");

        HP -= (int)damage;

        if (HP < 0)
        {
            Debug.Log("Monster Dead");
            monsterAni.SetBool("IsDead", true);
            IsDead = true;
            return;
        }
    }
}
