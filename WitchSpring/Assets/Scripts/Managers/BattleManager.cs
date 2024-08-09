using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleManager
{
    public PlayerController playerController;
    public Player player;
    private littleDampFrog monster;
    public UI_Scene hpUI;
    private GameObject camera;
    private CameraController cameraController;
    private bool isBattle=false;

    public void Init()
    {
        camera = GameObject.FindGameObjectWithTag("MainCamera");
        if (camera != null)
        {
            cameraController = camera.GetComponent<CameraController>();
        }
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
    }

    public littleDampFrog CurMonster()
    {
        return this.monster;
    }


    public void StartBattle()
    {
        playerController.StartBattle();
        monster.StartBattle();
        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        hpUI = Managers.UI.ShowSceneUI<UI_Scene>("UI_MonsterHpBar");
    }
    public void EndBattle()
    {
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
