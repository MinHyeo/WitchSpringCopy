using System.Collections;
using UnityEngine;

namespace Character.Player
{
    public class PlayerStateContext : MonoBehaviour
    {
        public IPlayerState CurrentState { get; set; }

        private readonly PlayerController _playerController;
        public PlayerStateContext(PlayerController playerController)
        {
            _playerController = playerController;
        }

        public void Transition()
        {
            CurrentState.ChangeState(_playerController);
        }

        public void Transition(IPlayerState state)
        {
            CurrentState = state;
            CurrentState.ChangeState(_playerController);
        }
    }
}