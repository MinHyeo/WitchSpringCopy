using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    public Define.CameraMode _mode = Define.CameraMode.QuarterView;
    [SerializeField]
    Vector3 _delta = new Vector3(0.0f, 5.0f, -8.0f);
    Vector3 _monster;
    [SerializeField]
    GameObject _player = null;
    [SerializeField]
    float playerYDelta = 0.9f;

    public Vector3 testVec = new Vector3(-8, 4, -3);

    bool _isFightEntered = false;


    void LateUpdate()
    {
        switch (_mode)
        {
            case Define.CameraMode.QuarterView:
                UpdateQuaterView();
                break;

            case Define.CameraMode.MonsterFocused:
                UpdateMonsterFocusedView(); 
                break;

            case Define.CameraMode.PlayerFocused:
                UpdatePlayerFocusedView();
                break;

            case Define.CameraMode.CentralFocused:
                UpdateCentralFocusedView();
                break;
        }
    }

    void UpdateQuaterView()
    {
        RaycastHit hit;
        Vector3 targetPosition;

        if (Physics.Raycast(_player.transform.position, _delta, out hit, _delta.magnitude, LayerMask.GetMask("Wall")))
        {
            float dist = (hit.point - _player.transform.position).magnitude * 0.8f;
            targetPosition = _player.transform.position + _delta.normalized * dist;
        }
        else
        {
            targetPosition = _player.transform.position + _delta;
        }

        transform.position = Vector3.Lerp(transform.position, targetPosition, 0.02f);
        Vector3 lookPos = new Vector3(_player.transform.position.x, _player.transform.position.y + playerYDelta, _player.transform.position.z);

        Quaternion targetRotation = Quaternion.LookRotation(lookPos - transform.position);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.08f);
    }


    void UpdateMonsterFocusedView()
    {

        Vector3 _center = (_player.transform.position + _monster) / 2;

        Vector3 destPos = _center + testVec;

        transform.position = Vector3.Lerp(transform.position, destPos, 0.05f);

        Vector3 targetDirection = (_monster - transform.position).normalized;

        Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);

        if (_isFightEntered)
        {
            Invoke("ShowFightEnter", 0.5f);
            _isFightEntered = false;
        }
    }

    void UpdatePlayerFocusedView()
    {
        Vector3 _center = (_player.transform.position + _monster) / 2;
        Vector3 destPos = _center + testVec;
        transform.position = Vector3.Lerp(transform.position, destPos, 0.05f);
        Vector3 targetDirection = (_player.transform.position - transform.position + new Vector3(0, playerYDelta, 0)).normalized;

        Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);

    }

    void UpdateCentralFocusedView()
    {
        Vector3 _center = (_player.transform.position + _monster) / 2;

        Vector3 destPos = _center + testVec;
        transform.position = Vector3.Lerp(transform.position, destPos, 0.08f);

        Vector3 targetDirection = (_center - transform.position).normalized;
        Quaternion targetRotation = Quaternion.LookRotation(targetDirection);

        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);
    }


    public void SetQuarterView(Vector3 delta)
    {
        _mode = Define.CameraMode.QuarterView;
        _delta = delta;
    }

    public void SetFightView(Vector3 monsterPos)
    {
        _isFightEntered = true;
        
        _monster = monsterPos;
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Question>();
        Invoke("SetMonsterFocus", 0.5f);
    }

    public void SetPlayerView()
    {
        _mode = Define.CameraMode.PlayerFocused;
    }

    public void SetMonsterFocus()
    {
        GameManager.UI.ClosePopupUI();
        _mode = Define.CameraMode.MonsterFocused;
    }
    public void ShowFightEnter()
    {
        GameManager.UI.ShowPopupUI<UI_FightEnter>();
    }
}
