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
