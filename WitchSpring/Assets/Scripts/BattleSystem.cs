using System.Collections;
using System.Collections.Generic;
using TMPro.Examples;
using UnityEngine;

public class BattleSystem : MonoBehaviour
{
    [SerializeField] float playerAtion;
    [SerializeField] float monsterAtion;
    [SerializeField] float maxAtion;
    float playerSpeed;
    float monsterSpeed;
    private PlayerController playerController;
    private Player player;
    private littleDampFrog monster;
    private CameraController cameraController;
    public bool isAtioning = false;

    public float maxIncrease_monster;
    public float maxIncrease_player;
    public float oldPlayerAtion;
    public float oldMonsterAtion;
    public enum BattleState
    {
        Idle,
        Standby,
        PlayerTurn,
        MonsterTurn,
        PlayerActioning,
        MonsterActioning,
    }
    public BattleState state = BattleState.Idle;

    void Start()
    {
        Init();
    }

    void Update()
    {
        switch(state)
        {
            case BattleState.Idle:
                UpdateIdle();
                break;
            case BattleState.Standby:
                UpdateStandby();
                break;
            case BattleState.PlayerTurn:
                UpdatePlayerTurn();
                break;
            case BattleState.MonsterTurn:
                UpdateMonsterTurn();
                break;
            case BattleState.PlayerActioning:
                UpdatePlayerActioning();
                break;
            case BattleState.MonsterActioning:
                UpdateMonsterActioning();
                break;
        }
    }

    public void Init()
    {
        cameraController = Camera.main.GetComponent<CameraController>();
        GameObject playerObject = GameObject.FindGameObjectWithTag("Player");
        if (playerObject != null)
        {
            playerController = playerObject.GetComponent<PlayerController>();
            player = playerObject.GetComponent<Player>();
        }
    }

    public void StartBattle()
    {
        //�÷���� ������ ��ø�� ���� ���� �Ҵ�
        playerSpeed = Managers.Battle.player.speed;
        monsterSpeed = Managers.Battle.CurMonster().speed;
        maxAtion = Mathf.Max(playerSpeed, monsterSpeed);
        playerAtion = 0;
        monsterAtion =0;
        maxIncrease_player = playerSpeed / monsterSpeed * maxAtion;
        maxIncrease_monster = monsterSpeed / playerSpeed * maxAtion;
        state = BattleState.Standby;

    }
    void UpdateIdle()
    {
        // Idle ������ �� ������ �ڵ�
    }

    void UpdateStandby()
    {
        // �ൿ ������ ����
        playerAtion += playerSpeed * Time.deltaTime;
        monsterAtion += monsterSpeed * Time.deltaTime;

        // �÷��̾� �Ǵ� ������ �ൿ �������� �ִ�ġ�� �ʰ��ߴ��� Ȯ��
        if (playerAtion >= maxAtion || monsterAtion >= maxAtion)
        {
            if (playerAtion >= maxAtion)
            {
                // �÷��̾��� �ൿ �������� ���� 100%�� ������ ���
                state = BattleState.PlayerTurn;
                Managers.Battle.PlayerTrunOn();
                playerAtion = maxAtion; // �������� 100%�� ����
                oldMonsterAtion = monsterAtion;
            }
            else if (monsterAtion >= maxAtion)
            {
                // ������ �ൿ �������� ���� 100%�� ������ ���
                state = BattleState.MonsterTurn;
                Managers.Battle.MonsterTrunOn();
                monsterAtion = maxAtion; // �������� 100%�� ����
                oldPlayerAtion = playerAtion;
            }
        }
    }

    void UpdatePlayerTurn()
    {
    }

    void UpdateMonsterTurn()
    {
    }

    void UpdatePlayerActioning()
    {
        playerAtion -= playerSpeed * Time.deltaTime; //�÷��̾� ����

        if (monsterAtion < oldMonsterAtion + maxIncrease_monster)
        {
            if (monsterAtion < maxAtion)
                monsterAtion += monsterSpeed * Time.deltaTime; //���� ����
        }

        if (playerAtion <= 0)
        {
            playerAtion = 0;
            if(!isAtioning)
                state = BattleState.Standby;
        }
    }

    void UpdateMonsterActioning()
    {
        monsterAtion -= monsterSpeed * Time.deltaTime; //���� ����

        if (playerAtion < oldPlayerAtion + maxIncrease_player)
        {
            if (playerAtion < maxAtion)
                playerAtion += playerSpeed * Time.deltaTime; //���� ����
        }

        if (monsterAtion <= 0)
        {
            monsterAtion = 0;
            if (!isAtioning)
                state = BattleState.Standby;
        }
        
    }

    public float GetPlayerAction()
    {
        return playerAtion;
    }
    public float GetMonsterAction()
    {
        return monsterAtion;
    }
    public float GetMaxAtion()
    {
        return maxAtion;
    }

}
