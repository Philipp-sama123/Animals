using MalbersAnimations;
using MalbersAnimations.Controller;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimalController : MonoBehaviour
{
    [SerializeField] GameObject bloodSplashEffect;
    private ParticleSystem bloodSplash;
    private MAnimal mAnimal;
    private Stats stats; 

    void Start()
    {
        bloodSplash = bloodSplashEffect.GetComponent<ParticleSystem>();
        mAnimal = gameObject.GetComponentInParent<MAnimal>();
        bloodSplash.Play(false);
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

    public void OnHealthDecreased()
    {
        bloodSplash.Play(true);
        Debug.LogError("bloodSplash ....");
        new WaitForSeconds(2);
        Debug.LogError("bloodSplash ....");
        bloodSplash.Play();

     

    }
}
