using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerManager
{
    public PlayerController playerController;
    public Player player;
    public void Init()
    {
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        if(playerObject != null)
        {
            playerController = playerObject.GetComponent<PlayerController>();
            player = playerObject.GetComponent<Player>();
        }
    }
}
