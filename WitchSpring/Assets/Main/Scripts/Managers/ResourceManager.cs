using System.Collections;
using System.Collections.Generic;
using UnityEngine;


// 리소스의 Load, Instantiate, Destroy 를 관리하는 리소스 매니저. 
public class ResourceManager
{

    // path에 있느 파일을 로드하는 함수, 로드되는 조건은 Object 일 때
    public T Load<T>(string path) where T : Object
    {
        return Resources.Load<T>(path);
    }


    // 생성 
    // parent는 프리팹을 생성해서 붙일 곳 
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