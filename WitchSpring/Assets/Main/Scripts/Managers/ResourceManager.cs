using System.Collections;
using System.Collections.Generic;
using UnityEngine;


// ���ҽ��� Load, Instantiate, Destroy �� �����ϴ� ���ҽ� �Ŵ���. 
public class ResourceManager
{

    // path�� �ִ� ������ �ε��ϴ� �Լ�, �ε�Ǵ� ������ Object �� ��
    public T Load<T>(string path) where T : Object
    {
        return Resources.Load<T>(path);
    }


    // ���� 
    // parent�� �������� �����ؼ� ���� �� 
    public GameObject Instantiate(string path, Transform parent = null)
    {
        GameObject prefab = Load<GameObject>($"Prefabs/{path}");

        if (prefab == null)
        {
            Debug.Log($"Failed to load prefab : {path}");
            return null;
        }

        return Object.Instantiate(prefab, parent);
    }


    public void Destroy(GameObject go)
    {
        if (go == null) return;
        Object.Destroy(go);
    }

}