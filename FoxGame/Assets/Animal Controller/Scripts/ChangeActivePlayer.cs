using Cinemachine;
using MalbersAnimations.Controller;
using MalbersAnimations.Events;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeActivePlayer : MonoBehaviour
{
    [SerializeField] private GameObject CurrentAnimal;
    [SerializeField] private GameObject AnimalPrefab;
    [SerializeField] private GameObject NextAnimalPrefab;

    [SerializeField] private Transform spawnPoint;
    private CinemachineVirtualCamera followCamera;
    private CinemachineFreeLook freeLookCamera;
    public AnimalEvent OnZoneActivation = new AnimalEvent();
    // Start is called before the first frame update
    void Start()
    {
      
    }

    // Update is called once per frame
    void Update()
    {

    }


    public void ChangeAnimal()
    {
        DisableOldAnimal();
        InstantiateNewAnimal();
        DestroyOldAnimal();
    }
    private void DestroyOldAnimal()
    {
        AnimalController[] players = FindObjectsOfType<AnimalController>();
        foreach (AnimalController player in players)
        {
            Debug.LogError("Player" + player.ToString());
            if (!player.IsPlayerActive) player.DestroyGameObject(3);
        }
        AnimalPrefab = NextAnimalPrefab;
    }

    private void DisableOldAnimal()
    {
        CurrentAnimal.GetComponent<MEventListener>().enabled = false;
        CurrentAnimal.GetComponent<MAnimal>().isPlayer.Value = false;
        CurrentAnimal.GetComponent<AnimalController>().IsPlayerActive = false;
        // todo stop moving
        // todo force sleeping mode
    }

    private void InstantiateNewAnimal()
    {
        GameObject newAnimal = Instantiate(AnimalPrefab, spawnPoint.transform.position, Quaternion.identity);
 
        newAnimal.GetComponent<MAnimal>().SetMainPlayer();
        newAnimal.GetComponent<MEventListener>().enabled = true;
        CurrentAnimal = newAnimal; 

        freeLookCamera = GameObject.FindGameObjectWithTag("FreeLookCamera").GetComponent<CinemachineFreeLook>();
        followCamera = GameObject.FindGameObjectWithTag("FollowCamera").GetComponent<CinemachineVirtualCamera>();

        followCamera.LookAt = newAnimal.transform;
        followCamera.Follow = newAnimal.transform;

        freeLookCamera.LookAt = newAnimal.transform;
        freeLookCamera.Follow = newAnimal.transform;
    }
}
