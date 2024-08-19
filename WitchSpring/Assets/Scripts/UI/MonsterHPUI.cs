using System.Collections;
using System.Collections.Generic;
using System.Threading;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.UI;

public class MonsterHPUI : MonoBehaviour
{
    [Header("UI Canvas")]
    [SerializeField] Canvas canvas;
    [Header("UI Elements")]
    [SerializeField] Slider monsterHPBar;
    [SerializeField] Slider monsterTurnBar;
    [SerializeField] GameObject dagameRoot;
    [Header("UI Demage Sprites")]
    [SerializeField] Dictionary<int, Sprite> damageNum = new Dictionary<int, Sprite>();
    [Header("UI Text")]
    [SerializeField] Text monsterHPText;
    [Header("UI Info")]
    [SerializeField] float totalturn = 0.0f;


    private void Awake()
    {
        for (int i = 0; i < 11; i++) 
        {
            Sprite number = GameManager.Resource.Load<Sprite>($"Sprite/Damage/{i}");
            damageNum.Add(i, number);
        }

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

    public void ShowHUD()
    {
        //Set Data
        GetMonsterHP();
        //Set position
        Vector3 sliderPos = GameManager.Instance.Monster.transform.position + new Vector3(0.0f, 0.1f, -1.2f);
        canvas.transform.position = sliderPos;
        canvas.transform.Rotate(45.0f, 0.0f, 0.0f);

        totalturn = GameManager.Player.GetComponent<PlayerController>().PlayerAgility +
                    GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterAility;
        StartCoroutine("CheckTurn");
    }

    public void GetMonsterHP() {
        float curhp = GameManager.Instance.Monster.GetComponent<MonsterController>().CurrentHP;
        float maxhp = GameManager.Instance.Monster.GetComponent<MonsterController>().MaxHP;
        monsterHPBar.value = curhp / maxhp;
        monsterHPText.text = curhp.ToString();
        if (curhp <= 0)
        {
            StopCoroutine("CheckTurn");
        }
    }
    public void ShowDamage(int damage) 
    {
        bool IsAlreadyDead = false;
        List<Sprite> Dsprite = new List<Sprite>();
        while (damage > 0) {
            Dsprite.Add(damageNum[(int)(damage % 10)]);
            //Debug.Log($"{Count + 1}의 자리 수: {damage % 10}");
            damage /= 10;
        }
        if (damage < 0) {
            Dsprite.Add(damageNum[10]);
            IsAlreadyDead = true;
        }
        DamageBoxUI DamageBox = GameManager.Resource.Instantiate("UI/DamageBox",gameObject.transform).GetComponent<DamageBoxUI>();
        DamageBox.SetDamage(Dsprite, IsAlreadyDead);
    }

    IEnumerator CheckTurn() {
        while (true) {
            yield return new WaitForFixedUpdate();
            monsterTurnBar.value = GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterCurAgt / totalturn;
            if (monsterTurnBar.value >= 1) {
                GameManager.Instance.Monster.GetComponent<MonsterController>().MonsterTurn = true;
            }
        }
    }
}
