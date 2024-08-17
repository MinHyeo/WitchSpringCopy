using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MonsterController : MonoBehaviour
{
    [Header("Monster Info")]
    [SerializeField] int curHP;
    [SerializeField] int maxHP;
    [SerializeField] int strength;
    [SerializeField] int magic;
    [SerializeField] int agility;
    [SerializeField] int defense;
    [SerializeField] int magicResist;
    [SerializeField] int soul;
    [SerializeField] public bool IsDead;
    [SerializeField] MonsterHPUI Hpbar;
    [SerializeField] GameObject hp = null;

    [Header("Monster Component")]
    [SerializeField] Animator monsterAni;


    #region Get/Set
    public int CurrentHP { get { return curHP; } }

    public int MaxHP { get { return maxHP; } }

    #endregion

    public void SetStat(MonsterInfo data) {
        curHP = data.HP;
        maxHP = data.HP;
        strength = data.Strength;
        magic = data.Magic;
        agility = data.Agility;
        defense = data.Defense;
        magicResist = data.MagicResist;
        soul = data.Soul;
        monsterAni = transform.parent.GetComponent<Animator>();
    }

    public void SetHpBar() {
        hp = GameManager.Resource.Instantiate("UI/MonsterHPUI");
        Hpbar = hp.GetComponent<MonsterHPUI>();
        Hpbar.ShowHP();
        hp.transform.parent = transform.parent;
    }

    public void Disconnect()
    {
        if (hp != null)
        {
            Destroy(hp);
        }
        GameManager.Instance.Monster = null;
    }

    public void MonsterHit(float damage) {
        Debug.Log($"Monster Hitted {(int)damage}");

        curHP -= (int)damage;

        Hpbar.GetMonsterHP();

        if (curHP < 0 && !IsDead)
        {
            Debug.Log("Monster Dead");
            monsterAni.SetBool("IsDead", true);
            GameManager.UI.SendUIMassage($"영혼석 채우기 + {soul}", Define.MessageType.Normal);
            GameManager.Player.GetComponent<PlayerController>().CurrentSP += (float)soul;
            IsDead = true;
            return;
        }
    }
}
