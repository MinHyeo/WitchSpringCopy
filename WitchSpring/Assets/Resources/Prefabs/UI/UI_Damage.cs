using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_Damage : MonoBehaviour
{
    [SerializeField] Sprite[] numberSprites; // 0~9 ���� ��������Ʈ �迭
    [SerializeField] GameObject damageImagePrefab; // UI Image ������
    [SerializeField] Transform damagePosition; // ������ �̹����� ��Ÿ�� ��ġ

    private void Awake()
    {
        damagePosition = transform.parent;
    }

    public void ShowDamage(int damage)
    {
        Debug.Log("������ ǥ��");
        string damageText = damage.ToString();
        float offset = 0.0f;

        foreach (char digit in damageText)
        {
            int number = int.Parse(digit.ToString());
            GameObject damageImage = Instantiate(damageImagePrefab, damagePosition.position + new Vector3(offset, 2, 0), Quaternion.identity, transform);
            damageImage.GetComponentInChildren<Image>().sprite = numberSprites[number];
            offset += 0.6f; // �� ���� �̹��� ���� ���� ����
            Debug.Log("������ ����");
        }
    }
}
