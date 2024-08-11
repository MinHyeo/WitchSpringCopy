using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SituationManager
{
    public Define.Situations currentSituations;

    public void Init() {
        currentSituations = Define.Situations.Normal;
    }

    public void SetStiuation (Define.Situations situations, string monsterID = null){
        currentSituations = situations;

        switch (situations) {
            case Define.Situations.Normal:
                GameManager.Camera.GetComponent<CameraController>().WatchPlayer();

                GameManager.UI.ChangeUI("FieldUI");

                GameManager.Player.transform.Rotate(0.0f, 180.0f, 0.0f, Space.Self);
                
                //�÷��̾� ���� z�� �������� 2.0f�� �̵��ϱ� ���� Local��ǥ�� ���
                Vector3 playerDest = GameManager.Player.transform.TransformPoint(new Vector3(0.0f, 0.1f, 2.0f));
                //��� ��� ����
                GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Walk, playerDest); 

                break;

            case Define.Situations.Contact:
                GameManager.Camera.GetComponent<CameraController>().WatchMonster();

                GameManager.UI.ChangeUI("EnterUI");
                GameManager.UI.SetData(monsterID);
                break;

            case Define.Situations.Battle:
                GameManager.Camera.GetComponent<CameraController>().WatchPlayer();

                GameManager.UI.ChangeUI("BattleUI");

                GameManager.Player.GetComponent<PlayerController>().SetPlayerState(Define.PlayerStates.Battle);

                GameManager.Instance.Monster.transform.LookAt(GameManager.Player.transform.position);
                break;

            case Define.Situations.StartAttack:
                GameManager.UI.HideUI();
                break;

            case Define.Situations.EndAttack:
                GameManager.UI.ShowUI();
                GameManager.UI.ChangeUI("BattleUI");
                break;
        }
    }
}
