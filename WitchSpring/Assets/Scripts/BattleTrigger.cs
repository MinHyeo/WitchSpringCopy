using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BattleTrigger : MonoBehaviour
{
    private CapsuleCollider col;

    void Start()
    {
        col = GetComponent<CapsuleCollider>();
    }

    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("��Ʋ Ʈ����");
            UIManager.Instance.MonsterEncounterUI(true);
        }
            
    }

    private void OnDrawGizmos()
    {
        if (col == null) return;

        // ĸ�� �ݶ��̴��� �߽����� �������� �����ɴϴ�.
        Vector3 center = transform.position;
        float radius = col.radius;

        // ����� ���� ����
        Gizmos.color = Color.red;

        // �ٴڿ� ���� �׸��ϴ�.
        Vector3 bottomCenter = new Vector3(center.x, transform.position.y, center.z);
        Gizmos.DrawWireSphere(bottomCenter, radius);
    }
}
