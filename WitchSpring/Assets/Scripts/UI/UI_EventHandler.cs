using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class UI_EventHandler : MonoBehaviour, IBeginDragHandler, IDragHandler, IPointerClickHandler
{
    [Header("UI Drag Event")]
    public Action<PointerEventData> onBeginDragHanbler = null;
    public Action<PointerEventData> onDragHanbler = null;
    public Action<PointerEventData> onClickHandler = null;

    public void OnBeginDrag(PointerEventData eventData)
    {
        if (onBeginDragHanbler != null)
        {
            onBeginDragHanbler.Invoke(eventData);
        }
    }

    public void OnDrag(PointerEventData eventData)
    {
        if (onDragHanbler != null)
        {
            onDragHanbler.Invoke(eventData);
        }
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        if (onClickHandler != null)
        {
            onClickHandler.Invoke(eventData);
        }
    }
}