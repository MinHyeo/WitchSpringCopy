using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using static UnityEngine.GraphicsBuffer;

public class Nums : MonoBehaviour
{
    public static Nums instance;
    Canvas canvas;
    Camera hpCamera;
    RectTransform rectParent;
    RectTransform rectNums;

    Vector3 offset = new Vector3(0.5f, 2.0f, 0.0f);
    Transform targetTr = null;

    Transform _monsterPos;
    Transform _playerPos;

    [SerializeField]
    public ShowState currentState;

    public enum ShowState
    {
        Player,
        Monster,
    }


    void Start()
    {
        canvas = GetComponentInParent<Canvas>();
        hpCamera = canvas.worldCamera;
        rectParent = canvas.GetComponent<RectTransform>();
        rectNums = GetComponent<RectTransform>();

        _monsterPos = Camera.main.GetComponent<CameraController>()._monster.transform;
        _playerPos = Camera.main.GetComponent<CameraController>()._player.transform;

        SetShowState(ShowState.Monster);
    }

    private void LateUpdate()
    {
        var screenPos = Camera.main.WorldToScreenPoint(targetTr.position + offset); // 몬스터의 월드 3d좌표를 스크린좌표로 변환

        if (screenPos.z < 0.0f)
        {
            screenPos *= -1.0f;
        }

        var localPos = Vector2.zero;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(rectParent, screenPos, hpCamera, out localPos); // 스크린 좌표를 다시 체력바 UI 캔버스 좌표로 변환

        rectNums.localPosition = localPos; // 체력바 위치조정
    }

    public void SetShowState(ShowState state)
    {
        currentState = state;

        // 새로운 상태에 맞게 타겟을 업데이트
        switch (currentState)
        {
            case ShowState.Monster:
                targetTr = _monsterPos;
                break;
            case ShowState.Player:
                targetTr = _playerPos;
                break;
        }
    }
}
