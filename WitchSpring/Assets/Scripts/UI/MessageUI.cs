using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MessageUI : MonoBehaviour
{
    [Header("Message Data")]
    [SerializeField] Text messagData;

    public void ShowMessage(string message = "(대충 메시지 내용)") { 
        messagData.text = message;
        transform.gameObject.SetActive(true);
        //Animaion TODO
    }

}
