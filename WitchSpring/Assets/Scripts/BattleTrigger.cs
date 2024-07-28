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
            Debug.Log("배틀 트리거");
            UIManager.Instance.MonsterEncounterUI(true);
        }
            
    }

    private void OnDrawGizmos()
    {
        if (col == null) return;

        // 캡슐 콜라이더의 중심점과 반지름을 가져옵니다.
        Vector3 center = transform.position;
        float radius = col.radius;

        // 기즈모 색상 설정
        Gizmos.color = Color.red;

        // 바닥에 원을 그립니다.
        Vector3 bottomCenter = new Vector3(center.x, transform.position.y, center.z);
        Gizmos.DrawWireSphere(bottomCenter, radius);
    }
}
