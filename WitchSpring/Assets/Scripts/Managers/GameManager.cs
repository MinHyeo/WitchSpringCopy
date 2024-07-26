using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    static GameManager GM_Instance; 
    public static GameManager Instance { get { Init(); return GM_Instance; } }

    InputManager M_Input = new InputManager();
    public static InputManager Input { get { return Instance.M_Input; } }



    void Start()
    {
       
    }

    // Update is called once per frame
    void Update()
    {
        //InputManager call
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
        }
    }
}
