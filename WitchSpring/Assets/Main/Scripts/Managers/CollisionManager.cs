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
            /*gameObject.SetActive(false);
            CapsuleCollider collider = gameObject.GetComponent<CapsuleCollider>();
            collider.enabled = false;*/

            Transform parentTransform = transform.parent;
            GameManager.Data.GetCollidedObjectName(parentTransform.gameObject.name);

            OnFight.Invoke(parentTransform.gameObject);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {

            /*gameObject.SetActive(true);
            CapsuleCollider collider = gameObject.GetComponent<CapsuleCollider>();
            collider.enabled = true;*/

        }
    }
}
