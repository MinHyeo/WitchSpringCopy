using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class InputManager
{
    public Action<Define.MouseEvent> MouseAction = null;
    public bool _pressed = false;

    public void OnUpdate()
    {
        if (MouseAction != null)
        {
            //우클릭 입력 처리(눌렀을 때)
            if (Input.GetMouseButton(1))
            {
                //클릭 신호 전달
                MouseAction.Invoke(Define.MouseEvent.Press);
                _pressed = true;
            }
            else
            {
                if (_pressed)
                {
                    MouseAction.Invoke(Define.MouseEvent.Click);
                    _pressed = false;
                }
            }
            if (Input.GetMouseButton(0)) {
                MouseAction.Invoke(Define.MouseEvent.Check);
            }
        }

    }

    //Initialize InputManager, When Scene loaded
    public void Clear()
    {
        MouseAction = null;
    }
}
