using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using UnityEngine.UI;

public class UI_PlayerInfo : MonoBehaviour
{
    [SerializeField] Slider hpBar;
    [SerializeField] Slider mppBar;
    [SerializeField] Text hpText;
    [SerializeField] Text mppText;
    [SerializeField] Text buffText;
    [SerializeField] Slider ationGaugeBar;

    private List<Buff> activeBuffs = new List<Buff>();
    private Player player;
    private BattleSystem battleSys;

    private void Start()
    {
        player = Managers.Player.player;
        battleSys = Managers.Battle.GetBattleSystem();
    }

    void Update()
    {
        UpdateInfo();
        UpdateBuffs();
        
        if(battleSys.state != BattleSystem.BattleState.Idle)
        {
            SetAtionGauge();
            DisplayBuffs();
        }

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

        AddOrUpdateBuff("���� �˼�", player.manaSwordCount);
        AddOrUpdateBuff("��� �˼�", player.absorbSwordCount);
        AddOrUpdateBuff("���� ��ü", player.manaBallCount);
        AddOrUpdateBuff("������ ����", player.manaTraceCount);
    }
    public void SetAtionGauge()
    {
        ationGaugeBar.value = battleSys.GetPlayerAction() / battleSys.GetMaxAtion();
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
                buffText.text += $"{buff.name} {buff.turnsRemaining}�� ����\n";
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
