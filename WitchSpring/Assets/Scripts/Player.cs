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
    public float speed=12;
    public float defence = 2;

    public int manaSwordCount = 0;
    public int absorbSwordCount = 0;
    public int manaBallCount = 0;
    public int manaTraceCount = 0;

    void Start()
    {
        hp = maxHp;
        mp = maxMp;
    }

    
    void Update()
    {
        
    }
}
