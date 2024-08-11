using System.Collections;
using System.Collections.Generic;
using TMPro.Examples;
using UnityEngine;

public class BattleManager
{
    public PlayerController playerController;
    public Player player;
    private littleDampFrog monster;
    public UI_Scene hpUI;
    private CameraController cameraController;
    private bool isBattle=false;


    public void Init()
    {
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
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        hpUI = Managers.UI.ShowSceneUI<UI_Scene>("UI_MonsterHpBar");
    }
    public void EndBattle()
    {
        cameraController.SwitchTarget(player.gameObject);
        playerController.Escape();
        playerController.EndBattle();
        monster.EndBattle();
        if (hpUI != null)
        {
            Managers.UI.CloseSceneUI(hpUI);
        }
    }

    public void PlayerTrunOn()
    {
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
    }
    public bool GetIsBattle()
    {
        return isBattle;
    }
    public void SetIsBattle(bool isbattle)
    {
        isBattle = isbattle;
    }
}
