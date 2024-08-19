using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class BattleManager : MonoBehaviour
{
    // Player, Monster, Camera
    PlayerController _player = null;
    MonsterController _monster = null;
    CameraController _camera = null;

    // Action Gauge
    public float player_ActionGauge = 0.0f;
    public float monster_ActionGauge = 0.0f;

    // Event Func
    public Action<GameObject> PlayerEnter = null;
    public Action<GameObject> CameraMove = null;

    int Player_DEX;
    int Monster_DEX;
    float maxDEX;

    bool isFighting = false;

    public enum GaugeState
    {
        Update,
        Turn,
    }

    public GaugeState Gstate = GaugeState.Update;


    public void Start()
    {
        // Player Init
        _player = GameManager.player;
        _camera = Camera.main.GetComponent<CameraController>();
        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
    }

    public void PlayerInMonsterDetect(GameObject monster)
    {
        // Collision Manager으로부터 접촉한 몬스터의 GameObject 전달받음
        _monster = monster.GetComponent<MonsterController>();

        GetStats();
    }

    public void GetStats()
    {
        Player_DEX = _player.DEX;
        Monster_DEX = _monster.DEX;

        if(Monster_DEX > Player_DEX)
            maxDEX = Monster_DEX;

        else
            maxDEX = Player_DEX;
    }

    void Update()
    {
        if (!isFighting)
            return;

        switch (Gstate)
        {
            case GaugeState.Update:
                IncreaseActionGauge();
                break;

            case GaugeState.Turn:
                break;

        } 
    }

    // 행동 게이지 증가 로직
    public void IncreaseActionGauge()
    {

        // 플레이어와 몬스터의 행동 게이지가 100에 도달할 때까지 계속 증가
        if (player_ActionGauge < 100f)
        {
            player_ActionGauge += (Player_DEX / maxDEX) * Time.deltaTime * 90f;
            player_ActionGauge = Mathf.Clamp(player_ActionGauge, 0f, 100f);
        }

        if (monster_ActionGauge < 100f)
        {
            monster_ActionGauge += (Monster_DEX / maxDEX) * Time.deltaTime * 90f;
            monster_ActionGauge = Mathf.Clamp(monster_ActionGauge, 0f, 100f);
        }

        UpdateActionGauge();

        // 플레이어의 게이지가 100에 도달했을 때
        if (player_ActionGauge >= 100f)
        {
            Gstate = GaugeState.Turn;
            
            StartTurn("Player");
            
        }

        // 몬스터의 게이지가 100에 도달했을 때
        if (monster_ActionGauge >= 100f)
        {
            Gstate = GaugeState.Turn;
            StartTurn("Monster");
            
        }
    }

    void StartTurn(string Character)
    {
        switch(Character)
        {
            case "Player":
                player_ActionGauge = 0.0f;
                GameManager.UI.ShowPopupUI<UI_Behaviors>("UI_Behaviors");
                _camera.SetPlayerView();
                break;

            case "Monster":
                monster_ActionGauge = 0.0f;
                _monster.OnAttack();
                break;
        }
    }

    private void UpdateActionGauge()
    {
        GameObject UI_Root = GameObject.Find("@UI_Root");
        Transform UI_MonsterHP = UI_Root.transform.Find("UI_MonsterHP(Clone)");
        Transform UI_Default = UI_Root.transform.Find("UI_Default(Clone)");

        UI_MonsterHP.GetComponent<UI_MonsterHP>().UpdateActionGauge(monster_ActionGauge);
        UI_Default.GetComponent<UI_Default>().UpdateActionGauge(player_ActionGauge);
    }

    public void StartBattle()
    {
        isFighting = true;
    }

    public void TurnOver()
    {
        Gstate = GaugeState.Update;
    }

    // =========================================================test

    /*public void ShowUI_Question()
    {
        //UI
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Question>();

        Invoke("ShowUI_FightEnter", 0.5f);
    }

    public void ShowUI_FightEnter()
    {
        //UI
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_FightEnter>();

        //CameraController에 전달 (몬스터 중심 뷰)
        _camera.SetFightView(_monster.gameObject);
    }

    public void PlayerBehaviors() //전투하기 버튼 클릭 시 시작
    {
        //CameraController에 전달 (플레이어 중심 뷰)
        _camera.SetPlayerView();
    }

    public void PlayerBehaviors_SwordATK(int NumATK)
    {

    }

    public void PlayerBehaviors_ManaSword(string Mana)
    {

    }

    public void PlayerEscape()
    {
        GameManager.UI.CloseAllPopupUI();
        GameManager.UI.ShowPopupUI<UI_Default>();

        // 카메라 모드: 플레이어 뷰
    }

    public void MonsterAttack()
    {
        return;
    }*/


}
