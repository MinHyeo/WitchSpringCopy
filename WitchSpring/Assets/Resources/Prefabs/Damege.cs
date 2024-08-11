using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Damege : MonoBehaviour
{

    [SerializeField] private float waitTime = 0.3f; // 대기 시간
    [SerializeField] private float moveDistance = 0.8f; // 이동 거리
    [SerializeField] private float duration = 1.0f; // 이동 및 사라짐의 지속 시간

    private void Awake()
    {
        Debug.Log("코루틴시작");
        StartCoroutine(HandleDamageEffect());
        Debug.Log("코루틴끝");
    }

    private IEnumerator HandleDamageEffect()
    {
        // 0.5초 동안 가만히 대기
        yield return new WaitForSeconds(waitTime);

        // 시작 위치 및 목표 위치 설정
        Vector3 startPosition = transform.position;
        Vector3 endPosition = startPosition + new Vector3(0, moveDistance, 0);

        float elapsed = 0f;

        while (elapsed < duration)
        {
            // 위치와 색상 보간
            transform.position = Vector3.Lerp(startPosition, endPosition, elapsed / duration);
            // 색상 보간 (투명도)
            Color color = GetComponent<Image>().color;
            color.a = Mathf.Lerp(1, 0, elapsed / duration);
            GetComponent<Image>().color = color;

            elapsed += Time.deltaTime;
            yield return null;
        }

        // 마지막 위치 및 색상 설정
        transform.position = endPosition;
        Color finalColor = GetComponent<Image>().color;
        finalColor.a = 0;
        GetComponent<Image>().color = finalColor;

        // 오브젝트 삭제
        Destroy(gameObject);
    }
}

