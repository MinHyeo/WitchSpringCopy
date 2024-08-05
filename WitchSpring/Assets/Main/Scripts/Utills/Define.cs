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
        Figjt_ATK,
        Comeback,
        Escape,
        
    }
    public enum MonsterState
    {
        Idle,
        Attack,
        Hit,
        Die,

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
