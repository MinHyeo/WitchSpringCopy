using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Particle_AbsorptionBlade : MonoBehaviour
{
    public ParticleSystem particle;

    private void Start()
    {
        particle = GetComponent<ParticleSystem>();
    }
    // Start is called before the first frame update
    public void StartParticle_AbsorptionBlade()
    {
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
        particle.Play();
    }
    public void SetATK()
    {
        var main = particle.main;

        // �ùķ��̼� ������ World�� �����մϴ�.
        main.simulationSpace = ParticleSystemSimulationSpace.World;
        main.startSize = 0.85f;
    }
    public void SetIdle_AbsorptionBlade()
    {
        var main = particle.main;

        // �ùķ��̼� ������ World�� �����մϴ�.
        main.simulationSpace = ParticleSystemSimulationSpace.Local;
        main.startSize = 0.35f;
    }
    public void StopParticle_AbsorptionBlade()
    {
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
    }
}
