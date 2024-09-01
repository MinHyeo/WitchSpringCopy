using System.Collections;
using UnityEngine;

namespace Character.Player.State
{
    public class PlayerIdleState : MonoBehaviour, IPlayerState
    {
        public void ChangeState(PlayerController playerController)
        {
            playerController.anim.SetBool("isWalk", false);
        }
    }
}