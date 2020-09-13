using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DeathObjectController : MonoBehaviour
{
    [SerializeField] private ParticleSystem eatParticleSystem;
    [SerializeField] private float destroyDuration = 4f; 

public void DestroyGameObject()
    {
        eatParticleSystem.Play(); 
        Destroy(gameObject, destroyDuration); 
    }
}
