using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class UI_Damage : MonoBehaviour
{
    [SerializeField] Sprite[] numberSprites; // 0~9 숫자 스프라이트 배열
    [SerializeField] GameObject damageImagePrefab; // UI Image 프리팹
    [SerializeField] Transform damagePosition; // 데미지 이미지가 나타날 위치

    private void Awake()
    {
        damagePosition = transform.parent;
    }

    public void ShowDamage(int damage)
    {
        Debug.Log("데미지 표시");
        string damageText = damage.ToString();
        float offset = 0.0f;

        foreach (char digit in damageText)
        {
            int number = int.Parse(digit.ToString());
            GameObject damageImage = Instantiate(damageImagePrefab, damagePosition.position + new Vector3(offset, 2, 0), Quaternion.identity, transform);
            damageImage.GetComponentInChildren<Image>().sprite = numberSprites[number];
            offset += 0.6f; // 각 숫자 이미지 간의 간격 조정
            Debug.Log("데미지 생성");
        }
    }
}
