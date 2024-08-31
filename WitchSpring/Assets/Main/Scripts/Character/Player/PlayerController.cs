using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace Character.Player
{
    public class PlayerStat 
    {
        public float Health;
        public float Mana;
        public float Magic;
        public float Power;
        public float Agility;
        public float Defense;
    }

    [RequireComponent(typeof(NavMeshAgent))]
    public class PlayerController : MonoBehaviour
    {
        private NavMeshAgent agent;

        [SerializeField]
        private float speed;
        public Animator anim;

        private IPlayerState _idleState, _walkState, _battleState;
        private PlayerStateContext _playerStateContext;

        private void Awake()
        {
            agent = GetComponent<NavMeshAgent>();
            anim = GetComponent<Animator>();
        }
        private void Start()
        {
            _playerStateContext = new PlayerStateContext(this);

            _idleState = gameObject.AddComponent<State.PlayerIdleState>();
            _walkState = gameObject.AddComponent<State.PlayerWalkState>();

            _playerStateContext.Transition(_idleState);
        }
        private void Update()
        {
            if (Input.GetMouseButtonDown(1))
            {
                Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                RaycastHit hit;

                if(Physics.Raycast(ray, out hit))
                {
                    agent.SetDestination(hit.point);
                    _playerStateContext.Transition(_walkState);
                }
            }

            if (IsArrived())
            {
                _playerStateContext.Transition(_idleState);
            }
        }

        private bool IsArrived()
        {
            if (!agent.pathPending)
            {
                if(agent.remainingDistance <= agent.stoppingDistance)
                {
                    if (!agent.hasPath || agent.velocity.sqrMagnitude == 0f) 
                    {
                        return true;
                    }
                }
            }
            return false;
        }
    }
}