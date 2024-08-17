using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DamageBoxUI : MonoBehaviour
{
    [SerializeField] List<Image> Num;
    void Start()
    {
    }

    public void SetDamage(List<Sprite> number) {
        for (int i = 0; i < number.Count; i++) {
            Num[i].gameObject.SetActive(true);
            Num[i].sprite = number[i];
        }
    }

    public void DestroyBox() {
        Destroy(transform.gameObject);
    }
}
