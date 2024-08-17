using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DamageBoxUI : MonoBehaviour
{
    
    void Start()
    {
        
    }

    public void DestroyBox() {
        Destroy(transform.gameObject);
    }
}
