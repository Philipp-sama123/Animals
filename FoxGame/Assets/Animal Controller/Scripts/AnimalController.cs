using MalbersAnimations;
using MalbersAnimations.Controller;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimalController : MonoBehaviour
{
    public enum AnimalType
    {
        Fox,
        Raccoon
    }
    [SerializeField] GameObject bloodSplashEffect;
    [SerializeField] AudioSource hitSound;
    [SerializeField] AnimalType animalType; 
    private bool isPlayerActive = true;

    public bool IsPlayerActive { get => isPlayerActive; set => isPlayerActive = value; }

    void Start()
    {
      bloodSplashEffect.GetComponent<ParticleSystem>().Stop();
    }
     void Update()
    {
    }
    public void DestroyGameObject(float time)
    {
        if (time == 0)
            Destroy(gameObject);
        else
        {
            Destroy(gameObject, time);
        }
    }

    public void AnimalDamaged()
    {
        PlayBloodSplashEffect();
        PlayHitSound();
    }

    private void PlayHitSound()
    {
        hitSound.PlayOneShot(hitSound.clip);
    }

    private void PlayBloodSplashEffect()
    {
        ParticleSystem bloodSplash = bloodSplashEffect.GetComponent<ParticleSystem>();
        bloodSplash.Play();
    }
}
