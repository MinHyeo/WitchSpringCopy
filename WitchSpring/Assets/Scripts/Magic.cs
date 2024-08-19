using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class Magic : MonoBehaviour, IPointerClickHandler
{
    private RawImage image;
    [SerializeField] bool available = false;
    UI_Magic ui_magic;

    private void Awake()
    {
        image = GetComponent<RawImage>();
        ui_magic = GetComponentInParent<UI_Magic>();
    }
    enum MainMagicCircle
    {
        Flame,
        Lightning,
        Frost,
        Others,
    }

    enum SubMagicCircle
    {
        Focus,
        Boost
    }

    MainMagicCircle mainMagicCircle = MainMagicCircle.Flame;
    SubMagicCircle subMagicCircle = SubMagicCircle.Focus;

    void Start()
    {
        
    }

    void Update()
    {
        if (transform.parent != null && transform.parent.name == "Slot_Use")
        {
            available = true;
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (available)
        {
            Debug.Log("¸¶¹ý");
            UseMagic();
        }
    }

    public void UseMagic()
    {
        ui_magic.Button_Magic();
    }
}
