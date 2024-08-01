using System.Collections;
using System.Collections.Generic;
using System.Resources;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    static GameManager s_instance;
    static GameManager instance { get { Init(); return s_instance; } }

    InputManager _input = new InputManager();
    public static InputManager input { get { return instance._input; } }

    ResourceManager _resources = new ResourceManager();
    public static ResourceManager resource { get { return instance._resources; } }

    UIManager _ui = new UIManager();
    public static UIManager UI { get { return instance._ui; } }


    private void Start()
    {
        Init();
    }
    void Update()
    {
        _input.OnUpdate();
    }
    static void Init()
    {
        if (s_instance == null)
        {
            GameObject go = GameObject.Find("@Managers");
            if (go == null)
            {
                go = new GameObject { name = "@Managers" };
                go.AddComponent<GameManager>();
            }

            DontDestroyOnLoad(go);
            s_instance = go.GetComponent<GameManager>();
        }

    }
}
