using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DollRange : MonoBehaviour
{
    [SerializeField] GameObject Range;

    public void Range_On()
    {
        Range.SetActive(true);
    }
    public void Range_Off()
    {
        Range.SetActive(false);

    }
}
