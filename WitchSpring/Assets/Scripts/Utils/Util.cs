using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using UnityEngine;


//기능성 함수 저장용 클래스(Find 메서드)
public class Util
{

    //Component 가져오기, 없으면 추가
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
        //최상의 객체(부모)가 없으면
        if (gameObject == null)
        {
            return null;
        }
        //recursive: 자식의 자식까지 찾는가(재귀 여부)
        if (recursive)
        {
            for (int i = 0; i < gameObject.transform.childCount; i++)
            {
                Transform transform = gameObject.transform.GetChild(i);
                if (string.IsNullOrEmpty(name) || transform.name == name)
                {
                    //자식 Object의 Component 소유 여부
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
