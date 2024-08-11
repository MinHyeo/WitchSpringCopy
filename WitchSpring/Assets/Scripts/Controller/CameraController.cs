using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [Header("Camera Info")]
    [SerializeField] Define.CameraMode Cam_Mode = Define.CameraMode.PlayerView;
    [SerializeField] GameObject Target = null;
    [SerializeField] Vector3 Cam_Pos = new Vector3(0.0f, 5.0f, -5.0f);
    void Start()
    {
        Target = GameManager.Player;
    }


    //Update Camera Position
    private void LateUpdate()
    {
        if (Cam_Mode == Define.CameraMode.PlayerView) {
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

        if (Cam_Mode == Define.CameraMode.MonsterView) {
            transform.position = Target.transform.position + Cam_Pos;
            transform.LookAt(Target.transform.position);
        }
    }

    //Set QuaterView Mode
    public void WatchPlayer() {
        Target = GameManager.Player;
        Cam_Mode = Define.CameraMode.PlayerView;
    }

    //Set ZoomIn Mode
    public void WatchMonster() {
        Target = GameManager.Instance.Monster;
        Cam_Mode = Define.CameraMode.MonsterView;
    }
}
