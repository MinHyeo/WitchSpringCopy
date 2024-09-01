using System.Collections;
using Unity.AI.Navigation;
using UnityEngine;
using UnityEngine.AI;

namespace Assets.Main.Scripts
{
    public class CreateNavMesh : MonoBehaviour
    {
        private NavMeshSurface _navMeshSurface;

        void Start()
        {
            _navMeshSurface = GetComponent<NavMeshSurface>();

            CreateMesh();
        }
        private void CreateMesh()
        {
            _navMeshSurface.collectObjects = CollectObjects.All;
            _navMeshSurface.BuildNavMesh();
        }
    }
}