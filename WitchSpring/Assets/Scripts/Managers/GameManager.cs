using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    #region Manager

    public static GameManager GM_Instance; 
    public static GameManager Instance { get { Init(); return GM_Instance; } }

    InputManager M_Input = new InputManager();
    public static InputManager Input { get { return Instance.M_Input; } }

    SceneManager M_Scene = new SceneManager();
    public static SceneManager Scene { get { return Instance.M_Scene; } }

    UIManager M_UI = new UIManager();
    public static UIManager UI { get{ return Instance.M_UI; } }

    ResourceManager M_Resource = new ResourceManager();
    public static ResourceManager Resource { get { return Instance.M_Resource; } }

    /*DataManager M_Data = new DataManager();
    public static DataManager Data { get { return Instance.M_Data; } }*/

    #endregion


    void Start()
    {
       
    }

    void Update()
    {
        M_Input.OnUpdate();
    }

    //Creat GameManager Object and Get GameManager Component
    static void Init()
    {
        if (GM_Instance == null) {
            GameObject gmObject = GameObject.Find("GameManager");
            if (gmObject == null){
                gmObject = new GameObject { name = "GameManager"};
                gmObject.AddComponent<GameManager>();
            }
            DontDestroyOnLoad(gmObject);
            GM_Instance = gmObject.GetComponent<GameManager>();
            GM_Instance.M_UI.Init();
        }
    }
}
