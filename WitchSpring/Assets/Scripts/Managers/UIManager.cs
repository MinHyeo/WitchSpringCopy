using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    [Header("UI Setting")]
    public GameObject CurrentUI = null;
    public Define.UITypes CurrentUIMode = Define.UITypes.FieldUI;
    public GameObject[] UIList = new GameObject[(int)Define.UITypes.MaxUI];


    public void Init() {
        GameObject uimanager = GameObject.Find("@UIManager");
        if (uimanager != null) {
            uimanager = new GameObject { name = "@UIManager" };
            //uimanager = Util.GetOrAddComponent<UIManager>(uimanager);
            Object.DontDestroyOnLoad(uimanager);
        }
    }


    /*public void SetCanvas(GameObject gameObject, bool sort = false)
    {
        Canvas canvas = Util.GetOrAddComponent<Canvas>(gameObject);
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;

    }
    //----------------------------------------------------SceneUI 관련 메서드
    public T ShowSceneUI<T>(string PrefabName = null)
    {
        if (string.IsNullOrEmpty(PrefabName))
        { //이름이 없으면
            PrefabName = typeof(T).Name;
        }

        GameObject gameObject = GameManager.Resource.Instantiate($"UI/{PrefabName}");
        T Scene = Util.GetOrAddComponent<T>(gameObject);
        _sceneUI = Scene;

        //UI 생성 확인용 코드
        Debug.Log($"PopupUI Created: {Scene.gameObject.name}");

        gameObject.transform.SetParent(Root.transform);

        return Scene;
    }*/

}
