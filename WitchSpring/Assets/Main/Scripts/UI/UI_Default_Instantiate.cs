using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UI_Default_Instantiate : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        GameManager.UI.ShowPopupUI<UI_Default>();
        
    }
}
