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
        // UnityEvent�� ���� �� ���޹ޱ�.
        PlayerEnter.Invoke(monster);
        // PlayerController�� ����
        
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
        //CameraController�� ���� (���� �߽� ��)
    }

    public void PlayerBehaviors() //�����ϱ� ��ư Ŭ�� �� ����
    {
        GameManager.UI.ClosePopupUI();

        GameManager.UI.ShowPopupUI<UI_Default>("UI_Default");
        GameManager.UI.ShowPopupUI<UI_MonsterHP>("UI_MonsterHP");
        GameManager.UI.ShowPopupUI<UI_Behaviors>("UI_Behaviors");
        //CameraController�� ���� (�÷��̾� �߽� ��)
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

        // ī�޶� ���: �÷��̾� ��
    }

}
