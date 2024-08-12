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

        // 시뮬레이션 공간을 World로 설정합니다.
        main.simulationSpace = ParticleSystemSimulationSpace.World;
        main.startSize = 0.85f;
    }
    public void SetIdle_ManaSword()
    {
        var main = particle.main;

        // 시뮬레이션 공간을 World로 설정합니다.
        main.simulationSpace = ParticleSystemSimulationSpace.Local;
        main.startSize = 0.35f;
    }
    public void StopParticle_ManaSword()
    {
        particle.Stop(true, ParticleSystemStopBehavior.StopEmitting);
    }
    public void SetupExplosionEffect()
    {
        // Main module 설정
        var main = particle.main;
        main.duration = 1;  // 폭발 지속 시간
        main.startSpeed = new ParticleSystem.MinMaxCurve(5, 10);  // 시작 속도
        main.startSize = new ParticleSystem.MinMaxCurve(0.5f, 1.5f);  // 파티클 크기
        main.startColor = Color.yellow;  // 초기 색상

        // Emission module 설정
        var emission = particle.emission;
        emission.rateOverTime = 0;  // 시간당 방출률
        emission.SetBursts(new ParticleSystem.Burst[] {
            new ParticleSystem.Burst(0.0f, 100)  // 시작 시 100개의 파티클을 한 번에 방출
        });

        // Shape module 설정
        var shape = particle.shape;
        shape.shapeType = ParticleSystemShapeType.Sphere;  // 구형으로 파티클 방출
        shape.radius = 1;  // 구의 반지름

        // Color over Lifetime module 활성화 및 설정
        var colorOverLifetime = particle.colorOverLifetime;
        colorOverLifetime.enabled = true;
        Gradient gradient = new Gradient();
        gradient.SetKeys(
            new GradientColorKey[] { new GradientColorKey(Color.yellow, 0.0f), new GradientColorKey(Color.red, 1.0f) },
            new GradientAlphaKey[] { new GradientAlphaKey(1.0f, 0.0f), new GradientAlphaKey(0.0f, 1.0f) }
        );
        colorOverLifetime.color = new ParticleSystem.MinMaxGradient(gradient);

        // Size over Lifetime module 활성화 및 설정
        var sizeOverLifetime = particle.sizeOverLifetime;
        sizeOverLifetime.enabled = true;
        sizeOverLifetime.size = new ParticleSystem.MinMaxCurve(1, 0);  // 생명주기 동안 크기 감소

        // 폭발 이펙트를 재생
        particle.Play();
    }
}
