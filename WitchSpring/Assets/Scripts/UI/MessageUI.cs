using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MessageUI : MonoBehaviour
{
    [Header("Message Info")]
    [SerializeField] Text messagData;
    [SerializeField] Image messageBox;
    [Header("Message Sprite")]
    [SerializeField] Sprite normal;
    [SerializeField] Sprite system;

    public void ShowMessage(string message = "(대충 메시지 내용)", Define.MessageType messageType = Define.MessageType.System) {
        switch (messageType) {
            case Define.MessageType.Normal:
                messageBox.sprite = normal;
                break;
            case Define.MessageType.System:
                messageBox.sprite = system;
                break;
        }
        messagData.text = message;
        transform.gameObject.SetActive(true);
        //Animaion TODO
    }

}
