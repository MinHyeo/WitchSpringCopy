using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class BattleTrigger : MonoBehaviour
{
    private CapsuleCollider col;
    private UI_Popup popup;
    public GameObject monster;
    void Start()
    {
        col = GetComponent<CapsuleCollider>();
        monster = transform.parent.gameObject;
    }

    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Debug.Log("��Ʋ Ʈ����");
            popup = Managers.UI.ShowPopupUI<UI_Popup>("UI_MonsterEncounter");
            // �ӽ�
            Managers.Player.EncounterMonster(monster.GetComponent<littleDampFrog>());
            

            Managers.Player.playerController.MonsterEncounter(monster.transform.position);
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