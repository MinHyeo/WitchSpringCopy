using System.Collections;
using System.Collections.Generic;
using System.Resources;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    static GameManager s_instance;
    static GameManager instance { get { Init(); return s_instance; } }

    DataManager _data = new DataManager();
    InputManager _input = new InputManager();
    ResourceManager _resources = new ResourceManager();
    UIManager _ui = new UIManager();

    public static DataManager Data { get { return instance._data; } }
    public static ResourceManager resource { get { return instance._resources; } }
    public static InputManager input { get { return instance._input; } }
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
            s_instance._data.Init();

            s_instance._ui.ShowPopupUI<UI_Default>();
        }
    }
}
