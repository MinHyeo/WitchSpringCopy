using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager
{
    public Canvas CurrentUI = null;
    public Define.UITypes CurrentUIMode = Define.UITypes.FieldUI;

    public void SetCanvas(GameObject gameObject, bool sort = false)
    {
        Canvas canvas = Util.GetOrAddComponent<Canvas>(gameObject);
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;

    }
    //----------------------------------------------------SceneUI ���� �޼���
    /*public T ShowSceneUI<T>(string PrefabName = null)
    {
        if (string.IsNullOrEmpty(PrefabName))
        { //�̸��� ������
            PrefabName = typeof(T).Name;
        }

        GameObject gameObject = Managers.Resource.Instantiate($"UI/Scene_UI/{PrefabName}");
        T Scene = Util.GetOrAddComponent<T>(gameObject);
        _sceneUI = Scene;

        //UI ���� Ȯ�ο� �ڵ�
        Debug.Log($"PopupUI Created: {Scene.gameObject.name}");

        gameObject.transform.SetParent(Root.transform);

        return Scene;
    }*/

}
