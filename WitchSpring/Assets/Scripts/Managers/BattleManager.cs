using System.Collections;
using System.Collections.Generic;
using TMPro.Examples;
using UnityEngine;

public class BattleManager
{
    public PlayerController playerController;
    public Player player;
    private littleDampFrog monster;
    private UI_Scene hpUI;
    private CameraController cameraController;
    private BattleSystem battleSystem;
    private bool isBattle=false;
    

    public void Init()
    {
        GameObject battleSys = GameObject.FindGameObjectWithTag("BattleSystem");
        battleSystem = battleSys.GetComponent<BattleSystem>();
        cameraController = Camera.main.GetComponent<CameraController>();
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        if (playerObject != null)
        {
            playerController = playerObject.GetComponent<PlayerController>();
            player = playerObject.GetComponent<Player>();
        }
    }

    public void EncounterMonster(littleDampFrog monster)
    {
        isBattle = true;
        this.monster = monster;
        cameraController.SwitchTarget(monster.gameObject);
        Managers.Sound.Play("pop_2", Define.Sound.Effect);

    }

    public littleDampFrog CurMonster()
    {
        return this.monster;
    }


    public void StartBattle()
    {
        cameraController.SwitchTarget(player.gameObject);
        playerController.StartBattle();
        monster.StartBattle();
        battleSystem.StartBattle();
        hpUI = Managers.UI.ShowSceneUI<UI_Scene>("UI_MonsterHpBar");
    }
    public void EndBattle()
    {
        cameraController.SwitchTarget(player.gameObject);
        playerController.Escape();
        playerController.EndBattle();
        monster.EndBattle();
        battleSystem.EndBattle();
        if (hpUI != null)
        {
            Managers.UI.CloseSceneUI(hpUI);
        }
    }

    public void PlayerTrunOn()
    {
        if (playerController.isDoll_ON)
        {
            playerController.PlayerTurnOn();
        }
        else
        {
            Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
            Managers.Sound.Play("put_1", Define.Sound.Effect);
        }
        
    }
    public void PlayerAtioning()
    {
        battleSystem.state = BattleSystem.BattleState.PlayerActioning;
        battleSystem.isAtioning = true;
    }
    public void PlayerDollUseing()
    {
        battleSystem.state = BattleSystem.BattleState.PlayerDollUsing;
    }

    public void MonsterTrunOn()
    {
        monster.Attack();
        battleSystem.state = BattleSystem.BattleState.MonsterActioning;
        battleSystem.isAtioning = true;
        Managers.Sound.Play("enemyTurn", Define.Sound.Effect);
    }
    public void EndTurn()
    {
        battleSystem.isAtioning = false;
    }
    public bool GetIsBattle()
    {
        return isBattle;
    }
    public void SetIsBattle(bool isbattle)
    {
        isBattle = isbattle;
    }
    public BattleSystem GetBattleSystem()
    {
        return battleSystem;
    }
    
}