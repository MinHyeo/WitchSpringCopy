using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    GameObject go = null;
    GameObject canvas = null;
    float _delay = 1.0f;

    private void Start()
    {
        go = Resources.Load<GameObject>("Prefabs/UI/UI_Default");
        canvas = Instantiate(go);
    }
    public void OnFightEnter()
    {
        CheckUIDup();
        go = Resources.Load<GameObject>("Prefabs/UI/UI_Question");
        canvas = Instantiate(go);

        Invoke("MonsterInfo", _delay);
    }
    public void MonsterInfo()
    {
        CheckUIDup();
        go = Resources.Load<GameObject>("Prefabs/UI/UI_FightEnter");
        canvas = Instantiate(go);
    }

    public void StartFIght()
    {
        CheckUIDup();
        go = Resources.Load<GameObject>("Prefabs/UI/UI_Behaviors");
        canvas = Instantiate(go);
    }

    public void Escape()
    {
        CheckUIDup();
        go = Resources.Load<GameObject>("Prefabs/UI/UI_FightEnter");
        canvas = Instantiate(go);
    }

    void CheckUIDup()
    {
        if (GameObject.FindWithTag("UI") != null)
        {
            Destroy(GameObject.FindWithTag("UI"));
        }
    }
}
