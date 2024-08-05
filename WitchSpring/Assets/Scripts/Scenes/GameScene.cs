using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameScene : BaseScene
{
    protected override void Init()
    {
        base.Init();

        SceneType = Define.Scene.Game;

        if (Managers.Data.MonsterStatDict.TryGetValue(1, out MonsterStat monsterStat))
        {
            Debug.Log($"{monsterStat}");
        }
    }
    
    public override void Clear()
    {
        
    }

}
