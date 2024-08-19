using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class BattleTrigger : MonoBehaviour
{
    private CapsuleCollider col;
    private UI_Popup popup;
    public GameObject monster;
    [SerializeField] GameObject trigger;
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
            if (Managers.Battle.GetIsBattle() == false)
            {
                Debug.Log("��Ʋ Ʈ����");
                popup = Managers.UI.ShowPopupUI<UI_Popup>("UI_MonsterEncounter");
                Managers.Battle.EncounterMonster(monster.GetComponent<littleDampFrog>());
                Managers.Player.playerController.MonsterEncounter(monster.transform.position);


            }
        }
    }

    public void Trigger_Off()
    {
        trigger.SetActive(false);
    }
    public void Trigger_On()
    {
        trigger.SetActive(true) ;
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
