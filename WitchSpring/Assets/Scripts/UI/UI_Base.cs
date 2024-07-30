using System;
using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;


public abstract class UI_Base : MonoBehaviour
{
    Dictionary<Type, UnityEngine.Object[]> _objects = new Dictionary<Type, UnityEngine.Object[]>();
    void Start()
    {

    }

    public abstract void Init();

    public static void BindEvent(GameObject gameO, Action<PointerEventData> action, Define.UIEvents type = Define.UIEvents.Click)
    {
        UI_EventHandler evt = Util.GetOrAddComponent<UI_EventHandler>(gameO);

        switch (type)
        {
            case Define.UIEvents.Click:
                evt.onClickHandler -= action;
                evt.onClickHandler += action;
                break;
            case Define.UIEvents.Drag:
                evt.onBeginDragHanbler -= action;
                evt.onBeginDragHanbler += action;
                break;
        }

        evt.onBeginDragHanbler += ((PointerEventData data) => {
            evt.gameObject.transform.position = data.position;
        });
    }


    protected void Bind<T>(Type type) where T : UnityEngine.Object
    {
        string[] names = Enum.GetNames(type);

        UnityEngine.Object[] objects = new UnityEngine.Object[names.Length];

        _objects.Add(typeof(T), objects);

        for (int i = 0; i < names.Length; i++)
        {
            if (typeof(T) == typeof(GameObject))
            {
                objects[i] = Util.FindChild(gameObject, names[i], true);
            }
            else
            {
                objects[i] = Util.FindChild<T>(gameObject, names[i], true);
            }
            if (objects[i] == null)
            {
                Debug.Log($"Failed to bind");
            }
        }
    }

    protected T Get<T>(int index) where T : UnityEngine.Object
    {
        UnityEngine.Object[] objects = null;
        if (_objects.TryGetValue(typeof(T), out objects) == false)
        {
            return null;
        }
        return objects[index] as T;
    }

    protected Text GetText(int index)
    {
        return Get<Text>(index);
    }
    protected Button GetButton(int index)
    {
        return Get<Button>(index);
    }
    protected GameObject GetGameObject(int index)
    {
        return Get<GameObject>(index);
    }
    protected Image GetImage(int index)
    {
        return Get<Image>(index);
    }
}
