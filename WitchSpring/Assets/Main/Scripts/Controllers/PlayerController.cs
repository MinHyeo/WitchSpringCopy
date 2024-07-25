using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;

public class PlayerController : MonoBehaviour
{
    [SerializeField]
    float _speed = 10.0f;
    Vector3 _desPos;

    // Start is called before the first frame update
    void Start()
    {
        GameManager.input.MouseAction -= OnMouseClicked;
        GameManager.input.MouseAction += OnMouseClicked;
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 dir = _desPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            //_state = PlayerState.Idle;
        }

        else
        {
            float moveDist = Mathf.Clamp(_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
            transform.LookAt(_desPos);

            // animation
            //Animator anim = GetComponent<Animator>();
            // 현재 게임 상태에 대한 정보를 넘겨준다.
            //anim.SetFloat("speed", _speed);
        }
    }

    void OnMouseClicked(Define.MouseEvent evt)
    {

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        Debug.DrawRay(Camera.main.transform.position, ray.direction * 100.0f, Color.red, 1.0f);

        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100.0f, LayerMask.GetMask("Wall")))
        {
            _desPos = hit.point;
        }
    }
}
