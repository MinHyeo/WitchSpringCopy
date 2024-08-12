using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Particle_ManaSword : MonoBehaviour
{
    public ParticleSystem particle;

    private void Start()
    {
        particle = GetComponent<ParticleSystem>();
    }
    // Start is called before the first frame update
    public void StartParticle_ManaSword()
    {
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
        particle.Play();
    }
    public void SetATK()
    {
        var main = particle.main;
        var shape = particle.shape;

        // �ùķ��̼� ������ World�� �����մϴ�.
        main.simulationSpace = ParticleSystemSimulationSpace.World;
        main.startSize = 0.85f;
    }
    public void SetIdle_ManaSword()
    {
        var main = particle.main;

        // �ùķ��̼� ������ World�� �����մϴ�.
        main.simulationSpace = ParticleSystemSimulationSpace.Local;
        main.startSize = 0.35f;
    }
    public void StopParticle_ManaSword()
    {
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
    }
    public void SetupExplosionEffect()
    {
        // Main module ����
        var main = particle.main;
        main.duration = 1;  // ���� ���� �ð�
        main.startSpeed = new ParticleSystem.MinMaxCurve(5, 10);  // ���� �ӵ�
        main.startSize = new ParticleSystem.MinMaxCurve(0.5f, 1.5f);  // ��ƼŬ ũ��
        main.startColor = Color.yellow;  // �ʱ� ����

        // Emission module ����
        var emission = particle.emission;
        emission.rateOverTime = 0;  // �ð��� �����
        emission.SetBursts(new ParticleSystem.Burst[] {
            new ParticleSystem.Burst(0.0f, 100)  // ���� �� 100���� ��ƼŬ�� �� ���� ����
        });

        // Shape module ����
        var shape = particle.shape;
        shape.shapeType = ParticleSystemShapeType.Sphere;  // �������� ��ƼŬ ����
        shape.radius = 1;  // ���� ������

        // Color over Lifetime module Ȱ��ȭ �� ����
        var colorOverLifetime = particle.colorOverLifetime;
        colorOverLifetime.enabled = true;
        Gradient gradient = new Gradient();
        gradient.SetKeys(
            new GradientColorKey[] { new GradientColorKey(Color.yellow, 0.0f), new GradientColorKey(Color.red, 1.0f) },
            new GradientAlphaKey[] { new GradientAlphaKey(1.0f, 0.0f), new GradientAlphaKey(0.0f, 1.0f) }
        );
        colorOverLifetime.color = new ParticleSystem.MinMaxGradient(gradient);

        // Size over Lifetime module Ȱ��ȭ �� ����
        var sizeOverLifetime = particle.sizeOverLifetime;
        sizeOverLifetime.enabled = true;
        sizeOverLifetime.size = new ParticleSystem.MinMaxCurve(1, 0);  // �����ֱ� ���� ũ�� ����

        // ���� ����Ʈ�� ���
        particle.Play();
    }
}
