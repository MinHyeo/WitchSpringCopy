using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Damege : MonoBehaviour
{

    [SerializeField] private float waitTime = 0.3f; // ��� �ð�
    [SerializeField] private float moveDistance = 0.8f; // �̵� �Ÿ�
    [SerializeField] private float duration = 1.0f; // �̵� �� ������� ���� �ð�

    private void Awake()
    {
        Debug.Log("�ڷ�ƾ����");
        StartCoroutine(HandleDamageEffect());
        Debug.Log("�ڷ�ƾ��");
    }

    private IEnumerator HandleDamageEffect()
    {
        // 0.5�� ���� ������ ���
        yield return new WaitForSeconds(waitTime);

        // ���� ��ġ �� ��ǥ ��ġ ����
        Vector3 startPosition = transform.position;
        Vector3 endPosition = startPosition + new Vector3(0, moveDistance, 0);

        float elapsed = 0f;

        while (elapsed < duration)
        {
            // ��ġ�� ���� ����
            transform.position = Vector3.Lerp(startPosition, endPosition, elapsed / duration);
            // ���� ���� (����)
            Color color = GetComponent<Image>().color;
            color.a = Mathf.Lerp(1, 0, elapsed / duration);
            GetComponent<Image>().color = color;

            elapsed += Time.deltaTime;
            yield return null;
        }

        // ������ ��ġ �� ���� ����
        transform.position = endPosition;
        Color finalColor = GetComponent<Image>().color;
        finalColor.a = 0;
        GetComponent<Image>().color = finalColor;

        // ������Ʈ ����
        Destroy(gameObject);
    }
}

