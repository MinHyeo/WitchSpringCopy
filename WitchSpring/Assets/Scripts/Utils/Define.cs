using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Define
{
    public enum PlayerStates
    {
        Idle,
        Walk,
        Dead,
        Battle
    }
    public enum CameraMode
    {
        QuaterView,
        ZoomInView,
    }

    public enum MouseEvent
    {
        Press,
        Click,
    }

    public enum Sound
    {
        BGM,
        Effect,
        MaxCount,
    }

    public enum UIEvents
    {
        Click,
        Drag,
    }

    public enum Scenes
    {
        GameScene,
    }

    public enum UITypes
    {
        BattleUI,
        EnterUI,
        FieldUI,
        FenceUI,
        MagicFenceUI,
        MagicUI,
        //InventoryUI,
        MessageUI,
        MaxUI
    }

    public enum Situations
    {
        Normal,
        Contact,
        Battle,
        StartAttack,
        EndAttack,
    }

}
