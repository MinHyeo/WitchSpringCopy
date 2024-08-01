using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Define
{
    public enum UIEvent
    {
        Click,
        Drag,
    }
    public enum PlayerState
    {
        Idle,
        Moving,
        FightEnter,
        Escape,
    }
    public enum MouseEvent
    {
        Press,
        Click,
    }

    public enum CameraMode
    {
        QuarterView,
        MonsterFocused,
        PlayerFocused,
        CentralFocused,
    }

}
