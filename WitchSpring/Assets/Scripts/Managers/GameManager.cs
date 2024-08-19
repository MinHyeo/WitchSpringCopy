using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    #region ManagerObject

    public static GameManager GM_Instance; 
    public static GameManager Instance { get { Init(); return GM_Instance; } }

    InputManager M_Input = new InputManager();
    public static InputManager Input { get { return Instance.M_Input; } }

    ResourceManager M_Resource = new ResourceManager();
    public static ResourceManager Resource { get { return Instance.M_Resource; } }

    UIManager M_UI = new UIManager();
    public static UIManager UI { get{ return Instance.M_UI; } }

    DataManager M_Data = new DataManager();
    public static DataManager Data { get { return Instance.M_Data; } }

    SituationManager M_Situation = new SituationManager();
    public static SituationManager Situation { get { return Instance.M_Situation; } }

    /*SceneManager M_Scene = new SceneManager();
    public static SceneManager Scene { get { return Instance.M_Scene; } }*/

    #endregion

    #region Player,Monster,Camera
    GameObject player;
    public static GameObject Player { get { return Instance.player; } }

    GameObject monster = null;
    public GameObject Monster { get { return Instance.monster; } set { monster = value; } }

    GameObject mainCamera;
    public static GameObject Camera { get { return Instance.mainCamera;} }

    #endregion

    #region GameElements
    private int times = 0;
    public int Time { get { return Instance.times; } set { times = value; } }

    private int traindays = 0;
    public int TrainDay { get { return Instance.times; } set { traindays = value; } }

    private List<GameObject> TurnList = new List<GameObject>();

    private bool IsBattle = false;
    public bool Battle { get { return IsBattle; } set { IsBattle = value; } }

    #endregion


    void Awake()
    {
        player = GameObject.Find("Player_Test");
        mainCamera = GameObject.Find("Main Camera");
        times = 0;
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

            GM_Instance.M_Situation.Init();

            GM_Instance.M_Data.Init();
        }
    }

    public void StartBattle() {
        IsBattle = true;
        StartCoroutine("TurnManage");
    }

    public void EndBattle() {
        if (IsBattle) {
            StopCoroutine("TurnMamage");
            IsBattle = false;
        }
    }

    IEnumerator TurnManage() {
        while (true) { 
            yield return new WaitForSeconds(0.7f);
            if (Player.GetComponent<PlayerController>().PlayerTurn)
            {
                if (!Player.GetComponent<PlayerController>().PlayerWait && !Monster.GetComponent<MonsterController>().MonsterWait)
                {
                    Camera.GetComponent<CameraController>().WatchPlayer();
                    Player.GetComponent<PlayerController>().PlayerWait = true;
                    Situation.SetStiuation(Define.Situations.EndAttack);
                }
            }
            else if (Monster != null && Monster.GetComponent<MonsterController>().MonsterTurn)
            {
                if (!Monster.GetComponent<MonsterController>().MonsterWait && !Player.GetComponent<PlayerController>().PlayerWait)
                {
                    Camera.GetComponent<CameraController>().WatchMonster();
                    Monster.GetComponent<MonsterController>().MonsterWait = true;
                    Monster.GetComponent<MonsterController>().MonsterAttackSignal();
                }
            }
            else if (Monster != null && !Player.GetComponent<PlayerController>().PlayerTurn && !Monster.GetComponent<MonsterController>().MonsterTurn &&
                    !Player.GetComponent<PlayerController>().PlayerWait && !Monster.GetComponent<MonsterController>().MonsterWait)
            {
                Debug.Log("Monster and Player Trun AGT");
                Player.GetComponent<PlayerController>().PlayerCurAgt += Player.GetComponent<PlayerController>().PlayerAgility;
                Monster.GetComponent<MonsterController>().MonsterCurAgt += Monster.GetComponent<MonsterController>().MonsterAility;
            }

        }
    
    }
}
