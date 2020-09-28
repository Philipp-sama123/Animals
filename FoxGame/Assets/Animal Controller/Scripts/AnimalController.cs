using MalbersAnimations;
using MalbersAnimations.Controller;
using MalbersAnimations.Scriptables;
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
    [SerializeField] ParticleSystem bloodSplashEffect;
    [SerializeField] ParticleSystem rageModeEffect;
    [SerializeField] GameObject destroyEffect;

    [SerializeField] AudioSource hitSound;
    [SerializeField] private AnimalType animalType;

    [SerializeField] float rageModeDuration = 60f;

    private bool isPlayerActive = true;

    public bool IsPlayerActive { get => isPlayerActive; set => isPlayerActive = value; }
    public AnimalType AnimalType { get => animalType; set => animalType = value; }

    void Start()
    {
        bloodSplashEffect.GetComponent<ParticleSystem>().Stop();
    }

    public void DestroyGameObject(float time)
    {
        destroyEffect.SetActive(true);

        if (time == 0)
        {
            Destroy(gameObject);
        }
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
    public void StartRageMode()
    {
        StartCoroutine(RageMode());
    }
    private IEnumerator RageMode()
    {
        MAnimal animal = gameObject.GetComponent<MAnimal>();
        rageModeEffect.Play();
        
        animal.SpeedUp();
        yield return new WaitForSecondsRealtime(rageModeDuration);
        animal.SpeedDown();

        rageModeEffect.Stop();
    }
}
