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

    public enum PlayerBuff 
    { 
        MagicWord,
        AbsorbSword,
        MagicMaterialize,
        MagicTrace,
        //Acceleration,
        MaxBuff
    }
    public enum CameraMode
    {
        PlayerView,
        MonsterView,
    }

    public enum MouseEvent
    {
        Press,
        Click,
        Check,
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

    public enum MessageType 
    { 
        Normal,
        System,
    }

}
