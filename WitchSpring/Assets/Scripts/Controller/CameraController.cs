using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    [Header("Camera Info")]
    [SerializeField] Define.CameraMode Cam_Mode = Define.CameraMode.PlayerView;
    [SerializeField] GameObject Target = null;
    [SerializeField] Vector3 Cam_Pos = new Vector3(0.0f, 5.0f, -5.0f);
    [SerializeField] float cameraSpeed = 4.0f;
    [SerializeField] bool flag = false;

    public bool CameraMoving { get  { return flag; } }
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
                Debug.Log(wallHit.transform.name);
            }
            else
            {
                if (!flag)
                {
                    transform.position = Target.transform.position + Cam_Pos;
                    transform.LookAt(Target.transform.position);
                }
                else
                {
                    Vector3 dest = Target.transform.position + Cam_Pos;
                    transform.position = Vector3.Lerp(transform.position, dest, cameraSpeed * Time.deltaTime);

                    Quaternion rot = Quaternion.LookRotation(Target.transform.position - transform.position);
                    transform.rotation = Quaternion.Slerp(transform.rotation, rot, cameraSpeed * Time.deltaTime);
                    StartCoroutine("CameraMoveWait");
                }
            }
        }

        if (Cam_Mode == Define.CameraMode.MonsterView) {
            Vector3 dest = Target.transform.position + Cam_Pos;
            transform.position = Vector3.Lerp(transform.position, dest, cameraSpeed * Time.deltaTime);

            Quaternion rot = Quaternion.LookRotation(Target.transform.position - transform.position);
            transform.rotation = Quaternion.Slerp(transform.rotation, rot, cameraSpeed * Time.deltaTime);
        }
    }

    //Set QuaterView Mode
    public void WatchPlayer() {
        Target = GameManager.Player;
        Cam_Mode = Define.CameraMode.PlayerView;
    }

    //Set ZoomIn Mode
    public void WatchMonster() {
        //StartCoroutine("CameraEnterWait");
        Target = GameManager.Instance.Monster;
        Cam_Mode = Define.CameraMode.MonsterView;
        flag = true;
    }

    #region Coroutine
    IEnumerator CameraMoveWait() {
        yield return new WaitForSeconds(1.0f);
        flag = false;
    }
    IEnumerator CameraEnterWait()
    {
        yield return new WaitForSeconds(0.1f);
        Target = GameManager.Instance.Monster;
        Cam_Mode = Define.CameraMode.MonsterView;
        flag = true;
    }

    #endregion
}
