using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using static UnityEngine.GraphicsBuffer;

public class MonsterHP : MonoBehaviour
{
    Canvas canvas;
    Camera hpCamera;
    RectTransform rectParent;
    RectTransform rectHp;

    Vector3 offset = new Vector3(0.0f, -0.3f, 0.0f);
    Transform targetTr = null;


    void Start()
    {
        canvas = GetComponentInParent<Canvas>();
        hpCamera = canvas.worldCamera;
        rectParent = canvas.GetComponent<RectTransform>();
        rectHp = GetComponent<RectTransform>();

        targetTr = Camera.main.GetComponent<CameraController>()._monster.transform;
    }

    private void LateUpdate()
    {
        var screenPos = Camera.main.WorldToScreenPoint(targetTr.position + offset); // ������ ���� 3d��ǥ�� ��ũ����ǥ�� ��ȯ

        if (screenPos.z < 0.0f)
        {
            screenPos *= -1.0f;
        }

        var localPos = Vector2.zero;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(rectParent, screenPos, hpCamera, out localPos); // ��ũ�� ��ǥ�� �ٽ� ü�¹� UI ĵ���� ��ǥ�� ��ȯ

        rectHp.localPosition = localPos; // ü�¹� ��ġ����
    }
}
