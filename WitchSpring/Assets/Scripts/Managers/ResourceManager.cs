using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;

public class ResourceManager
{

   public T Load<T>(string path) where T : Object
    {
        //pool�� �ִ��� Ȯ��
        if (typeof(T) == typeof(GameObject))
        {
            string name = path;
            int index = name.LastIndexOf('/');
            if (index >= 0)
            {
                name = name.Substring(index + 1);
            }
            /*GameObject gameObject = Managers.Pool.GetOriginal(name);
            if (gameObject != null)
            {
                return gameObject as T;
            }*/
        }
        return Resources.Load<T>(path);
    }

    public GameObject Instantiate(string path, Transform parent = null)
    {
        
        GameObject original = Load<GameObject>($"Prefabs/{path}");
        if (original == null)
        {
            Debug.Log($"Fail to load Prefab : {path}");
            return null;
        }

        GameObject gameObject = Object.Instantiate(original, parent);
        gameObject.name = original.name;

        return gameObject;
    }

    public void Destroy(GameObject gO)
    {
        if (gO == null)
        {
            return;
        }
    }
}
