using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using UnityEngine;


//��ɼ� �Լ� ����� Ŭ����(Find �޼���)
public class Util
{

    //Component ��������, ������ �߰�
    public static T GetOrAddComponent<T>(GameObject gameObject) where T : UnityEngine.Component
    {
        T component = gameObject.GetComponent<T>();
        if (component == null)
        {
            component = gameObject.AddComponent<T>();
        }
        return component;
    }

    public static GameObject FindChild(GameObject gameObject, string name = null, bool recursive = false)
    {
        //Debug.Log($"Util.GameObject.FindChild()");
        Transform transform = FindChild<Transform>(gameObject, name, recursive);
        if (transform == null)
        {
            return null;
        }
        return transform.gameObject;
    }
    public static T FindChild<T>(GameObject gameObject, string name = null, bool recursive = false) where T : UnityEngine.Object
    {
        //Debug.Log($"Util.T.FindChild()");
        //�ֻ��� ��ü(�θ�)�� ������
        if (gameObject == null)
        {
            return null;
        }
        //recursive: �ڽ��� �ڽı��� ã�°�(��� ����)
        if (recursive)
        {
            for (int i = 0; i < gameObject.transform.childCount; i++)
            {
                Transform transform = gameObject.transform.GetChild(i);
                if (string.IsNullOrEmpty(name) || transform.name == name)
                {
                    //�ڽ� Object�� Component ���� ����
                    T component = transform.GetComponent<T>();
                    if (component != null)
                    {
                        return component;
                    }
                }
            }
        }
        else
        {
            foreach (T component in gameObject.GetComponentsInChildren<T>())
            {
                if (string.IsNullOrEmpty(name) || component.name == name)
                {
                    return component;
                }
            }
        }
        return null;
    }
}