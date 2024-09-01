using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using static Magic;

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
    public enum MainMagicCircle
    {
        Flame,
        Lightning,
        Frost,
        Others,
    }

    public enum SubMagicCircle
    {
        Focus,
        Boost
    }

    public MainMagicCircle mainMagicCircle;
    public SubMagicCircle subMagicCircle;

    void Start()
    {
        
    }

    void Update()
    {
        if (transform.parent != null && transform.parent.name == "Slot_Use")
        {
            if (!available)
            {
                available = true;
                Managers.Sound.Play("magic_3", Define.Sound.Effect);
                ui_magic.CheckMagic();
            }
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (available)
        {
            Debug.Log("마법");
            UseMagic();
        }
    }

    public void UseMagic()
    {
        // mainMagicCircle의 값에 따라 Magic(int n)에 다른 값을 넘겨줍니다.
        int magicNumber = -1;

        switch (mainMagicCircle)
        {
            case MainMagicCircle.Flame:
                magicNumber = 0;
                break;
            case MainMagicCircle.Lightning:
                magicNumber = 1;
                break;
            case MainMagicCircle.Frost:
                magicNumber = 2;
                break;
            case MainMagicCircle.Others:
                magicNumber = 2;
                break;
        }

        ui_magic.Button_Magic();
        Managers.Battle.playerController.Magic(magicNumber);
    }
}
