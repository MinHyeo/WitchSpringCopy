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

    private SlotData currentSnappedSlot = null; // 현재 결합된 슬롯을 저장
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

        // 바인딩
        Bind<Button>(typeof(Buttons));
        Bind<Image>(typeof(Images));

        // 버튼 및 이미지 오브젝트 참조
        button_Combine = GetButton((int)Buttons.Button_Combine).gameObject;

        // 슬롯 데이터 초기화
        mainSlotData = new SlotData(GetImage((int)Images.IMG_MainSlot).gameObject);
        comSlotData = new SlotData(GetImage((int)Images.IMG_ComSlot).gameObject);
        subSlotData = new SlotData(GetImage((int)Images.IMG_SubSlot).gameObject);

        // 닫기 버튼 이벤트
        AddUIEvent(GetButton((int)Buttons.Button_Close).gameObject, OnCloseClicked, Define.UIEvent.Click);
        AddUIEvent(GetButton((int)Buttons.Button_Combine).gameObject, OnCombineClicked, Define.UIEvent.Click);

        // 슬롯 이벤트 추가
        AddSlotEvents(mainSlotData);
        AddSlotEvents(comSlotData);
        AddSlotEvents(subSlotData);
    }

    // 슬롯에 드래그 이벤트 추가
    private void AddSlotEvents(SlotData slotData)
    {
        AddUIEvent(slotData.slotObject, (PointerEventData data) => BeginDrag(slotData), Define.UIEvent.BeginDrag);
        AddUIEvent(slotData.slotObject, (PointerEventData data) => Dragging(slotData, data), Define.UIEvent.Drag);
        AddUIEvent(slotData.slotObject, (PointerEventData data) => EndDrag(slotData), Define.UIEvent.EndDrag);
    }

    // 드래그 시작시 원래 위치 기록
    private void BeginDrag(SlotData slotData)
    {
        if (slotData.isSnapped)
            return;

        slotData.originalPosition = slotData.slotObject.transform.position;
    }

    // 드래그 중 위치 업데이트
    private void Dragging(SlotData slotData, PointerEventData data)
    {
        if (slotData.isSnapped)
            return;

        slotData.slotObject.transform.position = data.position;
    }

    // 드래그 종료 시 결합 여부 판단
    private void EndDrag(SlotData slotData)
    {
        if (slotData.isSnapped)
            return;

        // 결합 버튼과의 거리 계산
        float distanceToCombine = Vector3.Distance(slotData.slotObject.transform.position, button_Combine.transform.position);

        // 거리가 임계값보다 작으면 결합
        if (distanceToCombine < snapDistance)
        {
            // 이미 결합된 슬롯이 있으면 원래 위치로 되돌림
            if (currentSnappedSlot != null)
            {
                currentSnappedSlot.slotObject.transform.position = currentSnappedSlot.originalPosition;
                currentSnappedSlot.isSnapped = false;
            }

            // 현재 슬롯을 결합된 슬롯으로 설정
            slotData.slotObject.transform.position = button_Combine.transform.position;
            slotData.isSnapped = true;
            currentSnappedSlot = slotData;

            GameManager.resource.Instantiate("Particle_MATK", button_Combine.transform);
        }
        else
        {
            // 결합되지 않으면 원래 위치로 복귀
            slotData.slotObject.transform.position = slotData.originalPosition;
        }
    }

    #region 닫기 버튼
    public void OnCloseClicked(PointerEventData data)
    {
        // 마법 공격 UI 닫기 및 전투 행동 UI 열기
        GameManager.UI.ClosePopupUI();
        GameManager.UI.ShowPopupUI<UI_Behaviors>();
    }
    #endregion

    // 결합 확인 및 결합된 슬롯 정보 출력
    public void OnCombineClicked(PointerEventData data)
    {
        if (currentSnappedSlot != null)
        {
            PlayerController player = GameObject.Find("Player").GetComponent<PlayerController>();
            player.OnMATK(currentSnappedSlot.slotObject.name);
        }
        else
        {
            Debug.Log("결합된 슬롯이 없습니다.");
        }

        GameManager.UI.ClosePopupUI();
    }
}
