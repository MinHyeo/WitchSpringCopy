using System.Collections;
using UnityEngine;

namespace Character.Player
{
    public interface IPlayerState 
    {
        void ChangeState(PlayerController playerController);
    }
}