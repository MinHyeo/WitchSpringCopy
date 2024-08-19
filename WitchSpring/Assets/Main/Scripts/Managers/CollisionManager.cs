using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public class CollisionManager : MonoBehaviour
{
    public UnityEvent<GameObject> OnFight = new UnityEvent<GameObject>();

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            gameObject.GetComponentInChildren<MeshRenderer>().enabled = false;

            Transform parentTransform = transform.parent;
            GameManager.Data.GetCollidedObjectName(parentTransform.gameObject.name);
            
            OnFight.Invoke(parentTransform.gameObject); // °ð »èÁ¦

            // Battle Manager
            GameManager.Battle.PlayerInMonsterDetect(parentTransform.gameObject);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            gameObject.GetComponentInChildren<MeshRenderer>().enabled = true;
        }
    }
}
