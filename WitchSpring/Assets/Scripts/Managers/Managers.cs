using System.Collections;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.Resources;
using UnityEditor.EditorTools;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Managers : MonoBehaviour
{
    static Managers s_instance;
    public static Managers Instance { get { Init(); return s_instance; } }

    InputManager s_input = new InputManager();

    public static InputManager Input { get { return Instance.s_input; } }
    void Start()
    {
        Init();
    }

    // Update is called once per frame
    void Update()
    {
        s_input.OnUpdate();
    }

    static void Init()
    {
        if (s_instance == null)
        {
            GameObject go = GameObject.Find("Managers");
            if (go == null)
            {
                go = new GameObject { name = "Managers" };
                go.AddComponent<Managers>();
            }

            DontDestroyOnLoad(go);
            s_instance = go.GetComponent<Managers>();

        }
    }

    public static void Clear()
    {
        Input.Clear();
    }
}