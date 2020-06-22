using Cinemachine;
using MalbersAnimations.Controller;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivePlayerChanger : MonoBehaviour
{
    [SerializeField] GameObject animalToSpawn;
    [SerializeField] GameObject activeAnimalPlayer;
    [SerializeField] CinemachineVirtualCamera activeCamera;

    // Start is called before the first frame update
    void Start()
    {
        // instaniate the player
        // be known from enemy AI 

    }

    // Update is called once per frame
    void Update()
    {

    }
    void OnTriggerEnter(Collider other)
    {
        Debug.LogError("collider: " + other);
        MAnimal newAnimal = other.GetComponentInParent<MAnimal>();
        // Todo maybe display clickable button on screen --> touch change character ! 
    }
    private void OnCollissionEnter(Collider other)
    {
        Debug.LogError("collider: " + other);
        // Todo maybe display clickable button on screen --> touch change character ! 
    }
}
