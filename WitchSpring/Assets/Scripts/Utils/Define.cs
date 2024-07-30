using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Define
{
    public enum CameraMode
    {
        QuaterView,
        BattleView,
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
        FieldUI,
        EnterUI,
        BattleUI,
        InventoryUI
    }
}
