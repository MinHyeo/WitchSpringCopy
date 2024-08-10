using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIGroup : MonoBehaviour
{
    public GameObject CurrentUI = null;
    public Dictionary<string, GameObject> UIList = new Dictionary<string, GameObject>();


    public void DontDestroy() { 
        Object.DontDestroyOnLoad(this);
    }
}
