using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [SerializeField]
    public Define.CameraMode _mode = Define.CameraMode.QuarterView;
    [SerializeField]
    Vector3 _delta = new Vector3(0.0f, 5.0f, -8.0f);
    public GameObject _monster;
    Vector3 _monsterPos;

    [SerializeField]
    public GameObject _player = null;
    [SerializeField]
    float playerYDelta = 0.9f;

    public Vector3 testVec = new Vector3(-8, 4, -3);

    bool _isFightEntered = false;

    public float shakeMagnitude = 1.0f; 
    private float shakeTimeRemaining;
    private float shakeDuration = 0.2f;


    void LateUpdate()
    {
        switch (_mode)
        {
            case Define.CameraMode.QuarterView:
                CheckMonsterDie();
                UpdateQuaterView();
                break;

            case Define.CameraMode.MonsterFocused:
                CheckMonsterDie();
                UpdateMonsterFocusedView(); 
                break;

            case Define.CameraMode.PlayerFocused:
                CheckMonsterDie();
                UpdatePlayerFocusedView();
                break;

            case Define.CameraMode.CentralFocused:
                CheckMonsterDie();
                UpdateCentralFocusedView();
                break;

            case Define.CameraMode.Shaking:
                CheckMonsterDie();
                UpdateShaking();
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

        Vector3 _center = (_player.transform.position + _monster.transform.position) / 2;

        Vector3 destPos = _center + testVec;

        transform.position = Vector3.Lerp(transform.position, destPos, 0.05f);

        Vector3 targetDirection = (_monster.transform.position - transform.position).normalized;

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
        Vector3 _center = (_player.transform.position + _monsterPos) / 2;
        Vector3 destPos = _center + testVec;
        transform.position = Vector3.Lerp(transform.position, destPos, 0.05f);
        Vector3 targetDirection = (_player.transform.position - transform.position + new Vector3(0, playerYDelta, 0)).normalized;

        Quaternion targetRotation = Quaternion.LookRotation(targetDirection);
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);

    }

    void UpdateCentralFocusedView()
    {
        Vector3 _center = (_player.transform.position + _monsterPos) / 2;

        Vector3 destPos = _center + testVec;
        transform.position = Vector3.Lerp(transform.position, destPos, 0.08f);

        Vector3 targetDirection = (_center - transform.position).normalized;
        Quaternion targetRotation = Quaternion.LookRotation(targetDirection);

        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.1f);
    }

    void UpdateShaking()
    {

        if (shakeTimeRemaining > 0)
        {
            shakeTimeRemaining -= Time.deltaTime;

            // ��鸲�� ������ ���� ������ ȸ�� ���� ����
            float x = Random.Range(-shakeMagnitude, shakeMagnitude) * 5.5f; // ���� ����
            float y = Random.Range(-shakeMagnitude, shakeMagnitude) * 5.5f; // ���� ����
            float z = Random.Range(-shakeMagnitude, shakeMagnitude) * 5.5f;

            // Euler ���� Quaternion���� ��ȯ
            transform.rotation = Quaternion.Euler(x, y, z) * transform.rotation;
        }
        else
        {
            SetPlayerView(); // ��鸲 ���� �� �÷��̾� �並 �ʱ�ȭ
            shakeTimeRemaining = shakeDuration; // �ʿ��� ��츦 ����� �ð��� �缳��
        }
    }


    public void SetQuarterView(Vector3 delta)
    {
        _mode = Define.CameraMode.QuarterView;
        _delta = delta;
    }

    public void SetFightView(GameObject monster)
    {
        _isFightEntered = true;

        _monster = monster;
        _monsterPos = monster.transform.position;
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

    public void SetShakingCamera()
    {
        shakeTimeRemaining = shakeDuration;
        _mode = Define.CameraMode.Shaking;
    }

    public void CheckMonsterDie()
    {
        if (_monster == null)
            return;

        else if (_monster.GetComponent<MonsterController>()._isDead)
            _mode = Define.CameraMode.QuarterView;
    }
}
