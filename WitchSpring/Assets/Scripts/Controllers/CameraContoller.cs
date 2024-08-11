using Cinemachine;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using UnityEngine;
using UnityEngineInternal;

public class CameraController : MonoBehaviour
{
    [SerializeField] Vector3 delta;
    [SerializeField] GameObject currentTarget;
    Vector3 targetPosition;

    private GameObject newTarget;
    private GameObject oldTarget;
    float distance;
    [SerializeField]
    enum CameraState
    {
        FollowTarget,
        Moving,
    }
    [SerializeField] CameraState state;


    void Start()
    {

    }

    // Update is called once per frame
    void LateUpdate()
    {
        if (currentTarget == null)
            return;
        switch (state)
        {
            case CameraState.FollowTarget:
                FollowTarget(currentTarget);
                break;
            case CameraState.Moving:
                UpdateSwitching();
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

    public void SetQuaterView(Vector3 delta)
    {
        //mode = Define.CameraMode.QuarterView;
        this.delta = delta;
    }

    public void SwitchTarget(GameObject newTarget)
    {
        if (newTarget == null || newTarget == currentTarget)
            return;

        oldTarget = currentTarget;
        this.newTarget = newTarget;
        state = CameraState.Moving;
    }

    public void UpdateSwitching()
    {
        transform.position = Vector3.Lerp(transform.position, newTarget.transform.position + delta, Time.deltaTime*5f);

        distance = Vector3.Distance(transform.position, newTarget.transform.position + delta);

        if(distance <= 0.3f) 
        {
            currentTarget = newTarget;
            newTarget = null;
            state = CameraState.FollowTarget;
        }
    }

}