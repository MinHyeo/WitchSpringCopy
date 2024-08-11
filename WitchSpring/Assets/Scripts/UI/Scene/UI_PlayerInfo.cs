using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_PlayerInfo : MonoBehaviour
{
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mppBar;
    [SerializeField] Text hpText;
    [SerializeField] Text mppText;
    [SerializeField] Text buffText;

    private List<Buff> activeBuffs = new List<Buff>();
    private Player player;

    private void Awake()
    {
        player = Managers.Player.player;
    }

    void Update()
    {
        UpdateInfo();
        UpdateBuffs();
        DisplayBuffs();
    }

    void UpdateInfo()
    {
        hpBar.value = (float)player.hp / player.maxHp;
        mppBar.value = (float)player.mp / player.maxMp;
        hpText.text = $"{player.hp}/{player.maxHp}";
        mppText.text = $"{player.mp}/{player.maxMp}";
    }

    void UpdateBuffs()
    {
        activeBuffs.RemoveAll(buff => buff.turnsRemaining <= 0);

        AddOrUpdateBuff("마력 검술", player.manaSwordCount);
        AddOrUpdateBuff("흡수 검술", player.absorbSwordCount);
        AddOrUpdateBuff("마력 구체", player.manaBallCount);
        AddOrUpdateBuff("마력의 흔적", player.manaTraceCount);
    }

    void AddOrUpdateBuff(string buffName, int turns)
    {
        Buff existingBuff = activeBuffs.Find(buff => buff.name == buffName);
        if (existingBuff != null)
        {
            existingBuff.turnsRemaining = turns;
        }
        else if (turns > 0)
        {
            activeBuffs.Add(new Buff(buffName, turns));
        }
    }

    void DisplayBuffs()
    {
        if (buffText == null)
            return;

        buffText.text = "";

        if (activeBuffs.Count > 0)
        {
            foreach (Buff buff in activeBuffs)
            {
                buffText.text += $"{buff.name} {buff.turnsRemaining}턴 남음\n";
            }
        }
        else
        {
            buffText.text = "";
        }
    }
}

public class Buff
{
    public string name;
    public int turnsRemaining;

    public Buff(string name, int turnsRemaining)
    {
        this.name = name;
        this.turnsRemaining = turnsRemaining;
    }
}
