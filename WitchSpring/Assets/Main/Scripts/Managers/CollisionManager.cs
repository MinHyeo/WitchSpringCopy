using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionManager : MonoBehaviour
{
    public UnityEvent<Vector3> OnFight = new UnityEvent<Vector3>();

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            OnFight.Invoke(transform.position);


            // �⺻ UI �ݰ� ���� ���� UI ȣ��
            GameManager.UI.ClosePopupUI();
            GameManager.UI.ShowPopupUI<UI_FightEnter>();
        }
    }
}
