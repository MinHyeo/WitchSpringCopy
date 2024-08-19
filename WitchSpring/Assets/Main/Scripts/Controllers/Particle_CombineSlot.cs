using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Particle_CombineSlot : MonoBehaviour
{
    public ParticleSystem particle;

    private void Start()
    {
        particle = GetComponent<ParticleSystem>();
    }
    // Start is called before the first frame update
    public void StartParticle()
    {
        Debug.Log("파티클 시작");
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
        particle.Play();
    }
}
