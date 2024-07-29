using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    Define.CameraMode _mode = Define.CameraMode.QuarterView;
    [SerializeField]
    Vector3 _delta = new Vector3(0.0f, 5.0f, -8.0f);
    Vector3 _monster;
    [SerializeField]
    GameObject _player = null;
    [SerializeField]
    float playerYDelta = 0.9f;


    void Start()    
    {

    }


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
        if (Physics.Raycast(_player.transform.position, _delta, out hit, _delta.magnitude, LayerMask.GetMask("Wall")))
        {
            float dist = (hit.point - _player.transform.position).magnitude * 0.8f;
            transform.position = _player.transform.position + _delta.normalized * dist;
        }

        else
        {

            Vector3 lookPos = new Vector3(_player.transform.position.x, _player.transform.position.y + playerYDelta, _player.transform.position.z);
            transform.position = _player.transform.position + _delta;
            transform.LookAt(lookPos);
        }
    }
    void UpdateMonsterFocusedView()
    {
        Vector3 lookPos = transform.position;
        Vector3 _center = (_player.transform.position + _monster) / 2;

        transform.position = Vector3.Lerp(transform.position, _center + _delta + new Vector3(-8, 0, 5), Time.deltaTime*3);
        transform.LookAt(Vector3.Lerp(lookPos, _monster, Time.deltaTime*3));
    }

    void UpdatePlayerFocusedView()
    {
        Vector3 lookPos = transform.position;
        Vector3 _center = (_player.transform.position + _monster) / 2;

        transform.position = Vector3.Lerp(transform.position, _center + _delta + new Vector3(-8, 0, 5), 0.1f);
        transform.LookAt(Vector3.Lerp(lookPos, _monster, 0.1f));

    }

    void UpdateCentralFocusedView()
    {
        Vector3 lookPos = transform.position;
        Vector3 _center = (_player.transform.position + _monster) / 2;

        transform.position = Vector3.Lerp(transform.position, _center + _delta + new Vector3(-8, 0, 5), 0.1f);
        transform.LookAt(Vector3.Lerp(lookPos, _center, 0.1f));
        Debug.DrawLine(transform.position, _center);

    }

    public void SetQuarterView(Vector3 delta)
    {
        _mode = Define.CameraMode.QuarterView;
        _delta = delta;
    }

    public void SetFightView(Vector3 monsterPos)
    {
        _mode = Define.CameraMode.MonsterFocused; 
        _monster = monsterPos;
        Debug.Log("카메라 모드: 전투");
    }

    public void SetPlayerView()
    {
        _mode = Define.CameraMode.PlayerFocused;
    }
}
