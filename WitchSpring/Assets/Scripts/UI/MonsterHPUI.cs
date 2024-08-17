using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using UnityEngine.UI;

public class MonsterHPUI : MonoBehaviour
{
    [Header("UI Canvas")]
    Canvas canvas;
    [Header("UI Silder")]
    [SerializeField] Slider monsterHPBar;
    [Header("UI Text")]
    [SerializeField] Text monsterHPText;

    private void Awake()
    {
        canvas = GetComponent<Canvas>();
        Init();
    }

    public void Init()
    {
        canvas.renderMode = RenderMode.WorldSpace;
        canvas.worldCamera = Camera.main;
        canvas.gameObject.transform.position = Vector3.zero;
        canvas.gameObject.transform.localScale = new Vector3(0.01f, 0.01f, 0.01f);
    }

    public void ShowHP()
    {
        //Set Data
        GetMonsterHP();
        //Set position
        Vector3 sliderPos = GameManager.Instance.Monster.transform.position + new Vector3(0.0f, 0.1f, -1.2f);
        canvas.transform.position = sliderPos;
        canvas.transform.Rotate(45.0f, 0.0f, 0.0f);
    }

    public void GetMonsterHP() {
        int curhp = GameManager.Instance.Monster.GetComponent<MonsterController>().CurrentHP;
        int maxhp = GameManager.Instance.Monster.GetComponent<MonsterController>().MaxHP;
        monsterHPBar.value = (float)curhp / (float)maxhp;
        monsterHPText.text = curhp.ToString();
    }
}
