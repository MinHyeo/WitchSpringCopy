using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

namespace Character.Player
{
    public class PlayerStat 
    {
        public float Health = 80;
        public float Mana = 170;
        public float Magic = 28;
        public float Power = 25;
        public float Agility = 12;
        public float Defense = 2;
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

            Init();
        }
        private void Init()
        {
            agent.speed = speed;
        }
        private void Update()
        {
            if (Input.GetMouseButtonDown(1))
            {

                Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
                RaycastHit hit;

                if(Physics.Raycast(ray, out hit, Mathf.Infinity, LayerMask.GetMask("Ground")))
                {
                    Debug.Log("¿Ãµø" + hit.point);
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
                        Debug.Log("µµ¬¯");
                        return true;
                    }
                }
            }
            return false;
        }
    }
}