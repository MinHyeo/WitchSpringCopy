using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Define
{
    public enum UIEvent
    {
        Click,
        BeginDrag,
        Drag,
        EndDrag,
    }
    public enum PlayerState
    {
        Idle,
        Moving,
        FightEnter,
        Figjt_ATK,
        Figjt_MATK,
        Hit,
        Comeback,
        Escape,
        
    }
    public enum MonsterState
    {
        Idle,
        Attack,
        Comeback,
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
        Shaking,
    }

}
