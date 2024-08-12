using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleManager : MonoBehaviour
{
    PlayerController _player = null;
    MonsterController _monster = null;

    public Action<GameObject> PlayerEnter = null;
    public Action<GameObject> CameraMove = null;

    //Player Stats
    int Player_MaxHP;
    int Player_HP;
    int Player_MaxMP;
    int Player_MP;
    int Player_INT;
    int Player_STR;
    int Player_DEX;
    int Player_DEF;
    float Player_MS;

    //Monster Stats
    int Monster_MaxHP;
    int Monster_HP;
    int Monster_STR;
    int Monster_INT;
    int Monster_DEX;
    int Monster_DEF;
    int Monster_MDEF;

    public void Start()
    {
        _player = GameObject.Find("Player").GetComponent<PlayerController>();
    }

    public void PlayerInMonsterDetect(GameObject monster)
    {
        _monster = monster.GetComponent<MonsterController>();
        // UnityEvent로 몬스터 값 전달받기.
        PlayerEnter.Invoke(monster);
        // PlayerController에 전달

        GetStats();

    }

    public void GetStats()
    {
        //Player
        Player_MaxHP = _player.MaxHP;
        Player_HP = _player.HP;
        Player_MP = _player.MP;
        Player_INT = _player.INT;
        Player_DEX = _player.DEX;
        Player_DEF = _player.DEF;
        //Player_MS = _player.speed;

        //Monster
        Monster_MaxHP = _monster.MaxHP;
        Monster_HP = _monster.HP;
        Monster_STR = _monster.STR;
        Monster_INT = _monster.INT;
        Monster_DEX = _monster.DEX;
        Monster_DEF = _monster.DEF;
    }
        
    public void ShowQuestion_UI()
    {
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Question>();

        Invoke("ShowUI_FightEnter", 0.5f);
    }

    public void ShowUI_FightEnter()
    {
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_FightEnter>();
        //CameraController에 전달 (몬스터 중심 뷰)
    }

    public void PlayerBehaviors() //전투하기 버튼 클릭 시 시작
    {
        GameManager.UI.ClosePopupUI();

        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
        GameManager.UI.ShowPopupUI<UI_MonsterHP>("UI_MonsterHP");
        GameManager.UI.ShowPopupUI<UI_Behaviors>("UI_Behaviors");
        //CameraController에 전달 (플레이어 중심 뷰)
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

}
