using System;
using System.Collections;
using System.Collections.Generic;
using TMPro.Examples;
using UnityEngine;
using UnityEngine.UIElements;

[System.Serializable]
public class PlayerController : MonoBehaviour
{

    [SerializeField]
    float move_speed = 10.0f;
    Vector3 destPos;
    Vector3 monsterPos;
    Vector3 playerPos;
    Animator anim;
    Player player;

    public ParticleSystem swordParticle;
    public ParticleSystem[] magicEffect;
    [SerializeField] DollRange  dollRange;
    [SerializeField] GameObject  doll;
    int magicNumber = 0;
    int attackNumber = 0;
    public bool isLive = true;

    public bool isDoll_ON = false;
    private void Awake()
    {
        anim = GetComponent<Animator>();
        player = GetComponent<Player>();
    }
    void Start()
    {
        
        Managers.Input.MouseAction -= OnMouseClicked;
        Managers.Input.MouseAction += OnMouseClicked;
        
    }

    public enum PlayerState
    {
        Die,
        Moving,
        Idle,
        Escaping,
        Idle_Battle,
        Attacking,
        Attacking_End,
        DollUsing,
        Others,
    }

    [SerializeField] PlayerState state = PlayerState.Idle;
    void Update()
    {
        if (!isLive)
            return;
        if(player.manaSwordCount <= 0)
        {
            swordParticle.Stop();
        }
        switch (state)
        {
            case PlayerState.Die:
                UpdateDie();
                break;
            case PlayerState.Moving:
                UpdateMoving();
                break;
            case PlayerState.Idle:
                UpdateIdle();
                break;
            case PlayerState.Idle_Battle:
                UpdateIdle_Battle();
                break;
            case PlayerState.Escaping:
                Escape();
                break;
            case PlayerState.Attacking:
                UpdateAttacking(); 
                break;
            case PlayerState.Attacking_End:
                EndAttack();
                break;
            case PlayerState.DollUsing:
                DollUsing();
                break;
            case PlayerState.Others:
                break;


        }
    }

    private void UpdateIdle()
    {
        
        anim.Play("idle0");
    }
    private void UpdateIdle_Battle()
    {
        anim.Play("idle_battle");
    }

    private void UpdateMoving()
    {
        Vector3 dir = destPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            state = PlayerState.Idle;
        }
        else
        {
            float moveDist = Mathf.Clamp(move_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;

            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }

        // 애니메이션
        anim.Play("run0");
    }

    private void UpdateDie()
    {
        // 아무것도 못함

    }



    void OnMouseClicked(Define.MouseEvent evt)
    {
        if (Managers.Battle.GetIsBattle())
            return;
        if (state == PlayerState.Die&& state==PlayerState.Escaping)
            return;

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        Debug.DrawRay(Camera.main.transform.position, ray.direction * 100.0f, Color.red, 1.0f);

        RaycastHit hit;
        if (Physics.Raycast(ray, out hit, 100.0f, LayerMask.GetMask("Wall")))
        {
            destPos = hit.point;
            state = PlayerState.Moving;
        }
    }

    public void MonsterEncounter(Vector3 monsterPos)
    {
        destPos = transform.position;
        this.monsterPos = monsterPos; 
        transform.LookAt(monsterPos);
    }
    public void Escape()
    {
        if (!isLive)
            return;
        Debug.Log("도망");
        Vector3 directionToMonster = transform.position - monsterPos;
        directionToMonster.Normalize();
        destPos = transform.position + directionToMonster * 3.0f;

        state = PlayerState.Moving;
        Managers.Battle.SetIsBattle(false);
    }
    public void StartBattle()
    {
        state = PlayerState.Idle_Battle;
    }
    public void PlayerTurnOn()
    {
        if(isDoll_ON)
            StartCoroutine(ExecuteActionsWithDelay());
    }
    public void Attack(int attackNumber)
    {
        GameObject target = Managers.Battle.CurMonster().gameObject;
        monsterPos = target.transform.position;
        playerPos = gameObject.transform.position;
        this.attackNumber = attackNumber;
        switch (attackNumber)
        {
            case 1: break;
            case 2: player.hp -= 4; break;
            case 3: player.hp -= 7; break;
            case 4: player.hp -= 17; break;
            case 5: player.hp -= 24; break;
            case 6: player.hp -= 28; break;
            case 7: player.hp -= 32; break;
        }
        state = PlayerState.Attacking;
        Managers.Battle.PlayerAtioning();
    }


    public void EndTurn()
    {
        if (player.manaSwordCount > 0)
            player.manaSwordCount--;
        if (player.manaBallCount > 0)
            player.manaBallCount--;
        if (player.absorbSwordCount > 0)
            player.absorbSwordCount--;
        if (player.manaTraceCount > 0)
            player.manaTraceCount--;

        Managers.Battle.EndTurn();

        
    }
    private void UpdateAttacking()
    {
        if (Managers.Battle.CurMonster() != null)
        {
            GameObject target = Managers.Battle.CurMonster().gameObject;
            destPos = target.transform.position;
            float distance = (destPos - transform.position).magnitude;
            if (distance <= 1.5f)
            {
                anim.Play("attack" + attackNumber);
                return;
            }
        }

        Vector3 dir = monsterPos - transform.position;
        float moveDist = Mathf.Clamp(move_speed * Time.deltaTime, 0, dir.magnitude);
        transform.position += dir.normalized * moveDist;
        transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);

        // 애니메이션
        anim.Play("run0");
    }

    public void EndAttack()
    {
        state = PlayerState.Attacking_End;
        Vector3 dir = playerPos - transform.position;
        if (dir.magnitude < 0.0001f)
        {
            state = PlayerState.Idle_Battle;
            transform.LookAt(monsterPos);
            EndTurn();
        }
        else
        {
            float moveDist = Mathf.Clamp(move_speed * Time.deltaTime, 0, dir.magnitude);
            transform.position += dir.normalized * moveDist;
            transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(dir), 20 * Time.deltaTime);
        }

        // 애니메이션
        anim.Play("run0");
    }
    public void GiveAttackDamage(float damageRatio)
    {
        
        float damage;
        Managers.Sound.Play("attack_1", Define.Sound.Effect);
        if (player.absorbSwordCount > 0)
        {
            Debug.Log("흡수검술: " + (int)((player.strength + player.spellPower) * 0.08f));
            player.hp += (int)((player.strength + player.spellPower) * 0.08f);
        }
        if (player.manaBallCount > 0)
        {
            float magicDamage = player.spellPower * 1.5f;
            Managers.Battle.CurMonster().TakeDamage_Magic(magicDamage);
            Debug.Log("마력구체:" + magicDamage);
        }
        if (player.manaSwordCount > 0)
        {
            Debug.Log("+마력검술");
            damage = (player.strength * damageRatio) * (0.1f * player.manaSwordCount + 1.0f) + player.strength * (0.1f * player.manaSwordCount);
        }
        else
        {
            damage = player.strength * damageRatio;
        }
        if (player.manaTraceCount > 0)
        {
            Managers.Battle.CurMonster().TakeDamage(damage);
            GiveMagicDamage(1.0f);
            return;
        }
        Managers.Battle.CurMonster().TakeDamage(damage);
        Debug.Log("검술:" + damage);
    }

    public void GiveMagicDamage(float damageRatio)
    {
        float damage;
        damage = player.spellPower * damageRatio;
        Managers.Battle.CurMonster().TakeDamage_Magic(damage);
    }

    public void Magic(int magicID)
    {
        player.mp -= 20;
        magicNumber = magicID;
        state = PlayerState.Others;
        anim.Play("magic");
        Managers.Battle.PlayerAtioning();
        Managers.Sound.Play("magic_1");
    }
    public void EffectMagic()
    {
        Debug.Log("파티클");
        magicEffect[magicNumber].gameObject.transform.position = monsterPos;
        magicEffect[magicNumber].Play();
        Managers.Sound.Play("magicEffect_"+ magicNumber, Define.Sound.Effect);
    }
    public void EndMagic()
    {
        state = PlayerState.Idle_Battle;
        EndTurn();
    }

    public void TakeDamage(float damage)
    {
        Managers.Sound.Play("hit_1", Define.Sound.Effect);
        player.hp -= (int)(damage - player.defence);
        if(player.hp <= 0)
        {
            Die();
        }
    }


    public void OnManaSword()
    {
        Debug.Log("마나 검술ON");
        swordParticle.Play();
        player.manaSwordCount = 3;
        player.mp -= 40;
    }
    public void OnAbsorbSword()
    {
        player.absorbSwordCount = 8;
        player.mp -= 30;
    }

    public void OnManaBall()
    {
        player.manaBallCount = 4;
        player.mp -= 50;
    }
    public void OnManaTrace()
    {
        player.manaTraceCount = 5;
    }
    public void EndBattle()
    {
        player.manaSwordCount = 0;
        player.absorbSwordCount = 0;
        player.manaBallCount = 0;
        player.manaTraceCount = 0;
        DollReturn();
    }

    public void Die()
    {
        isLive = false;
        state = PlayerState.Die;
        anim.Play("down");
        Managers.Battle.EndBattle();
    }
    public void MoveSound()
    {
        Managers.Sound.Play("vanish", Define.Sound.Effect);
    }

    public void Doll()
    {
        state = PlayerState.DollUsing;
        dollRange.Range_On();
    }
    private void DollUsing()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            Debug.DrawRay(Camera.main.transform.position, ray.direction * 100.0f, Color.red, 1.0f);

            // "Range" 태그가 있는 오브젝트와의 충돌 검사
            if (Physics.Raycast(ray, out hit))
            {
                GameObject hitObject = hit.collider.gameObject;

                float distanceToPlayer = Vector3.Distance(hit.point, transform.position);

                if (distanceToPlayer <= 0.5f)
                {
                    Debug.Log("충돌 위치가 플레이어 위치와 너무 가까움");
                }
                else if (hitObject.CompareTag("DollRange"))
                {
                    Debug.Log("인형");
                    Vector3 pos = hit.point;
                    pos.y += 0.5f; // y 축으로 0.5 유닛만큼 위로 이동
                    magicEffect[3].transform.position = pos;
                    magicEffect[3].Play();
                    isDoll_ON = true;
                    doll.transform.position = hit.point;
                    dollRange.Range_Off();
                    Managers.Sound.Play("makingSound");
                    Managers.Battle.PlayerDollUseing();
                }
            }
        }
    }

    private void DollAbility()
    {
        magicEffect[4].transform.position = transform.position;
        magicEffect[4].Play();
        Managers.Sound.Play("recover");
        player.hp += player.maxHp /10;
    }
    public void DollReturn()
    {
        magicEffect[3].Play();
        Managers.Sound.Play("makingSound");
        doll.transform.position = new Vector3(0, -10, 0);
    }

    private IEnumerator ExecuteActionsWithDelay()
    {
        CameraController cameraController = Camera.main.GetComponent<CameraController>();
        cameraController.SwitchTarget(doll);

        // 0.5초 기다림
        yield return new WaitForSeconds(1f);

        DollAbility();

        // 0.5초 기다림
        yield return new WaitForSeconds(0.5f);
        cameraController.SwitchTarget(gameObject);
        yield return new WaitForSeconds(0.5f);

        Managers.UI.ShowPopupUI<UI_Popup>("UI_BattleBehavior");
        Managers.Sound.Play("put_1", Define.Sound.Effect);
    }
}