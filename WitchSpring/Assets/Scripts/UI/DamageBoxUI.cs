using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class DamageBoxUI : MonoBehaviour
{
    [SerializeField] List<Image> Num;
    void Start()
    {
    }

    public void SetDamage(List<Sprite> number, bool DeadCheck)
    {
        switch (DeadCheck)
        {
            case true:
                Num[2].gameObject.SetActive(true);
                Num[2].sprite = number[0];
                break;
            case false:
                for (int i = 0; i < number.Count; i++)
                {
                    Num[i].gameObject.SetActive(true);
                    Num[i].sprite = number[i];
                }
                break;
        }
    }

    public void DestroyBox()
    {
        Destroy(transform.gameObject);
    }
}
