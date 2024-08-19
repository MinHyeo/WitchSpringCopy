using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UI_Behaviors_MATK : UI_Popup
{
    [SerializeField]
    GameObject Particle;
    private class SlotData
    {
        public GameObject slotObject;
        public Vector3 originalPosition;
        public bool isSnapped = false;

        public SlotData(GameObject slotObject)
        {
            this.slotObject = slotObject;
            this.originalPosition = slotObject.transform.position;
        }
    }

    private SlotData mainSlotData;
    private SlotData comSlotData;
    private SlotData subSlotData;

    private SlotData currentSnappedSlot = null; // ���� ���յ� ������ ����
    private float snapDistance = 45.0f;
    private GameObject button_Combine = null;

    enum Buttons
    {
        Button_Close,
        Button_MainSlot,
        Button_ComSlot,
        Button_SubSlot,
        Button_Combine,
    }

    enum Images
    {
        IMG_MainSlot,
        IMG_ComSlot,
        IMG_SubSlot,
    }

    void Start()
    {
        Init();
    }

    public override void Init()
    {
        base.Init();

        // ���ε�
        Bind<Button>(typeof(Buttons));
        Bind<Image>(typeof(Images));

        // ��ư �� �̹��� ������Ʈ ����
        button_Combine = GetButton((int)Buttons.Button_Combine).gameObject;

        // ���� ������ �ʱ�ȭ
        mainSlotData = new SlotData(GetImage((int)Images.IMG_MainSlot).gameObject);
        comSlotData = new SlotData(GetImage((int)Images.IMG_ComSlot).gameObject);
        subSlotData = new SlotData(GetImage((int)Images.IMG_SubSlot).gameObject);

        // �ݱ� ��ư �̺�Ʈ
        AddUIEvent(GetButton((int)Buttons.Button_Close).gameObject, OnCloseClicked, Define.UIEvent.Click);
        AddUIEvent(GetButton((int)Buttons.Button_Combine).gameObject, OnCombineClicked, Define.UIEvent.Click);

        // ���� �̺�Ʈ �߰�
        AddSlotEvents(mainSlotData);
        AddSlotEvents(comSlotData);
        AddSlotEvents(subSlotData);
    }

    // ���Կ� �巡�� �̺�Ʈ �߰�
    private void AddSlotEvents(SlotData slotData)
    {
        AddUIEvent(slotData.slotObject, (PointerEventData data) => BeginDrag(slotData), Define.UIEvent.BeginDrag);
        AddUIEvent(slotData.slotObject, (PointerEventData data) => Dragging(slotData, data), Define.UIEvent.Drag);
        AddUIEvent(slotData.slotObject, (PointerEventData data) => EndDrag(slotData), Define.UIEvent.EndDrag);
    }

    // �巡�� ���۽� ���� ��ġ ���
    private void BeginDrag(SlotData slotData)
    {
        if (slotData.isSnapped)
            return;

        slotData.originalPosition = slotData.slotObject.transform.position;
    }

    // �巡�� �� ��ġ ������Ʈ
    private void Dragging(SlotData slotData, PointerEventData data)
    {
        if (slotData.isSnapped)
            return;

        slotData.slotObject.transform.position = data.position;
    }

    // �巡�� ���� �� ���� ���� �Ǵ�
    private void EndDrag(SlotData slotData)
    {
        if (slotData.isSnapped)
            return;

        // ���� ��ư���� �Ÿ� ���
        float distanceToCombine = Vector3.Distance(slotData.slotObject.transform.position, button_Combine.transform.position);

        // �Ÿ��� �Ӱ谪���� ������ ����
        if (distanceToCombine < snapDistance)
        {
            // �̹� ���յ� ������ ������ ���� ��ġ�� �ǵ���
            if (currentSnappedSlot != null)
            {
                currentSnappedSlot.slotObject.transform.position = currentSnappedSlot.originalPosition;
                currentSnappedSlot.isSnapped = false;
            }

            // ���� ������ ���յ� �������� ����
            slotData.slotObject.transform.position = button_Combine.transform.position;
            slotData.isSnapped = true;
            currentSnappedSlot = slotData;

            GameManager.resource.Instantiate("Particle_MATK", button_Combine.transform);
        }
        else
        {
            // ���յ��� ������ ���� ��ġ�� ����
            slotData.slotObject.transform.position = slotData.originalPosition;
        }
    }

    #region �ݱ� ��ư
    public void OnCloseClicked(PointerEventData data)
    {
        // ���� ���� UI �ݱ� �� ���� �ൿ UI ����
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }
    #endregion

    // ���� Ȯ�� �� ���յ� ���� ���� ���
    public void OnCombineClicked(PointerEventData data)
    {
        if (currentSnappedSlot != null)
        {
            PlayerController player = GameObject.Find("Player").GetComponent<PlayerController>();
            player.OnMATK(currentSnappedSlot.slotObject.name);
        }
        else
        {
            Debug.Log("���յ� ������ �����ϴ�.");
        }

        GameManager.UI.ClosePopupUI();
    }
}
