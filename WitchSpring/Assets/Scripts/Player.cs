using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public int hp;
    public int maxHp=80;
    public int mp;
    public int maxMp=170;
    public float spellPower=10;
    public float strength=10;
    public float agility=12;
    public float defence = 2;


    void Start()
    {
        hp = maxHp;
        mp = maxMp;
    }

    
    void Update()
    {
        
    }
}
