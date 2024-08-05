using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerManager
{
    public PlayerController playerController;
    private littleDampFrog monster;

    
    public void Init()
    {
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        if(playerObject != null)
        {
            playerController = playerObject.GetComponent<PlayerController>();
        }
    }

    public void EncounterMonster(littleDampFrog monster)
    {
        this.monster = monster;
    }
    public littleDampFrog CurMonster()
    {
        return this.monster;
    }
}
