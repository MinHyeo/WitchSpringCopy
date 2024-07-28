using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngineInternal;

public class CameraController : MonoBehaviour
{
    //[SerializeField] Define.CameraMode mode = Define.CameraMode.QuarterView;
    [SerializeField] Vector3 delta;
    [SerializeField] GameObject player;
    [SerializeField] private cameraTarget currentTarget = cameraTarget.Player;
    [SerializeField] enum cameraTarget
    {
        Player,
        Monster,
    }

    void Start()
    {

    }

    // Update is called once per frame
    void LateUpdate()
    {
        switch (currentTarget)
        {
            case cameraTarget.Player:
                FollowTarget(player);
                break;
            case cameraTarget.Monster:
                // FollowTarget(monster);
                break;
        }
    }

    public void FollowTarget(GameObject target)
    {
        if (target == null)
            return;

        RaycastHit hit;
        if (Physics.Raycast(target.transform.position, delta, out hit, delta.magnitude, LayerMask.GetMask("Wall")))
        {
            float dist = (hit.point - target.transform.position).magnitude * 0.8f;
            transform.position = target.transform.position + delta.normalized * dist;
        }
        else
        {
            transform.position = target.transform.position + delta;
        }
        transform.LookAt(target.transform);
    }

    public void SetQuaterView(Vector3 delta) {
        //mode = Define.CameraMode.QuarterView;
        this.delta = delta;
    }
}