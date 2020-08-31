using MalbersAnimations;
using MalbersAnimations.Controller;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public enum AnimalType
{
    Fox,
    Raccoon
}
public class AnimalController : MonoBehaviour
{
    [SerializeField] GameObject bloodSplashEffect;
    [SerializeField] AudioSource hitSound;
    [SerializeField] private AnimalType animalType; 
    private bool isPlayerActive = true;

    public bool IsPlayerActive { get => isPlayerActive; set => isPlayerActive = value; }
    public AnimalType AnimalType { get => animalType; set => animalType = value; }

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
    public GameObject ReturnParentGameObject()
    {
        return gameObject;
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
