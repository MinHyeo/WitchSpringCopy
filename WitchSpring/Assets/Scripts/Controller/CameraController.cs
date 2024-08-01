using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [Header("Camera Info")]
    [SerializeField] Define.CameraMode Cam_Mode = Define.CameraMode.QuaterView;
    [SerializeField] GameObject Target = null;
    [SerializeField] Vector3 Cam_Pos = new Vector3(0.0f, 5.0f, -5.0f);
    void Start()
    {
        Target = GameObject.Find("Player_Test");
    }


    //Update Camera Position
    private void LateUpdate()
    {
        if (Cam_Mode == Define.CameraMode.QuaterView) {
            RaycastHit wallHit;
            if (Physics.Raycast(Target.transform.position, Cam_Pos, out wallHit, Cam_Pos.magnitude, LayerMask.GetMask("Wall")))
            {
                float dist = (wallHit.point - Target.transform.position).magnitude * 0.8f;
                transform.position = Target.transform.position + Cam_Pos.normalized * dist;
            }
            else
            {
                transform.position = Target.transform.position + Cam_Pos;
                transform.LookAt(Target.transform.position);
            }

        }
    }

    //Set QuaterView Mode
    void SetQuaterView(Vector3 newPos) {
        Cam_Mode = Define.CameraMode.QuaterView;
        Cam_Pos = newPos;
    }

    //Set ZoomIn Mode
    void SetBattleView(Vector3 newPos) {
        Cam_Mode = Define.CameraMode.ZoomInView;
        Cam_Pos = newPos;
    }
}
