using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class MonsterController : MonoBehaviour
{
    [Header("Monster Info")]
    [SerializeField] float curHP;
    [SerializeField] float maxHP;
    [SerializeField] float strength;
    [SerializeField] float magic;
    [SerializeField] float agility;
    [SerializeField] float curAGT;
    [SerializeField] float defense;
    [SerializeField] float magicResist;
    [SerializeField] float soul;
    [SerializeField] public bool IsDead = false;
    [SerializeField] public bool IsTurn = false;
    [SerializeField] public bool IsWait = false;
    [SerializeField] MonsterHPUI HPUI;
    [SerializeField] GameObject UIObject = null;

    [Header("Monster Component")]
    [SerializeField] Animator monsterAni;


    #region Get/Set
    public float CurrentHP { get { return curHP; } }

    public float MaxHP { get { return maxHP; } }

    public float MonsterAility { get { return agility; } }

    public float MonsterCurAgt { get { return curAGT; } set { curAGT = value; } }

    public bool MonsterTurn { get { return IsTurn; } set { IsTurn = value; } }

    public bool MonsterWait { get { return IsWait; } set { IsWait = value; } }
    #endregion

    public void SetStat(MonsterInfo data) {
        curHP = data.HP;
        maxHP = data.HP;
        strength = data.Strength;
        magic = data.Magic;
        agility = data.Agility;
        curAGT = data.Agility;
        defense = data.Defense;
        magicResist = data.MagicResist;
        soul = data.Soul;
        monsterAni = transform.parent.GetComponent<Animator>();
    }

    public void SetHpBar() {
        UIObject = GameManager.Resource.Instantiate("UI/MonsterHPUI");
        HPUI = UIObject.GetComponent<MonsterHPUI>();
        HPUI.ShowHUD();
        UIObject.transform.parent = transform.parent;
    }

    public void Disconnect()
    {
        if (UIObject != null)
        {
            Destroy(UIObject);
        }
        GameManager.Instance.Monster = null;
    }

    public void MonsterHit(float damage) {
        Debug.Log($"Monster Hitted {(int)damage}");

        curHP -= (int)damage;

        HPUI.GetMonsterHP();
        HPUI.ShowDamage((int)damage);

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

    public void Attack() {
        GameManager.Player.GetComponent<PlayerController>().PlayerHit((int)strength);
        IsTurn = false;
        IsWait = false;
        curAGT = 0.0f;
    }
}
