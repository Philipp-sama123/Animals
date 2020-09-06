using Cinemachine;
using MalbersAnimations;
using MalbersAnimations.Controller;
using MalbersAnimations.Events;
using MalbersAnimations.Scriptables;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeActivePlayer : MonoBehaviour
{
    [SerializeField] private GameObject CurrentAnimal;
    [SerializeField] private GameObject AnimalPrefab;// todo probably unnecessary
    [SerializeField] private GameObject NextAnimalPrefab;

    [SerializeField] private GameObject[] AnimalPrefabList;

    [SerializeField] private ModeID modeID;
    [SerializeField] private Action ActionID;

    private CinemachineVirtualCamera followCamera;
    private CinemachineFreeLook freeLookCamera;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }
    public void SelectNextAnimalPrefab()
    {
        foreach (GameObject animal in AnimalPrefabList)
        {
            if (CurrentAnimal.GetComponent<AnimalController>().AnimalType != animal.GetComponent<AnimalController>().AnimalType)
            {
                AnimalPrefab = animal;
            }
            else
            {
                NextAnimalPrefab = animal;
            }
        }
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
            if (!player.IsPlayerActive) player.DestroyGameObject(3);
        }
        SelectNextAnimalPrefab();
        // AnimalPrefab = NextAnimalPrefab;
    }

    private void DisableOldAnimal()
    {
        CurrentAnimal.GetComponent<MEventListener>().enabled = false;
        CurrentAnimal.GetComponent<MAnimal>().isPlayer.Value = false;
        CurrentAnimal.GetComponent<AnimalController>().IsPlayerActive = false;
        StopMoving();
    }

    private void StopMoving()
    {
        CurrentAnimal.GetComponent<MAnimal>().MovementAxis = CurrentAnimal.GetComponent<MAnimal>().MovementAxisSmoothed = Vector3.zero;
        CurrentAnimal.GetComponent<MAnimal>().Mode_Activate(modeID, ActionID);
    }

    private void InstantiateNewAnimal()
    {
        GameObject newAnimal = Instantiate(AnimalPrefab, new Vector3(CurrentAnimal.transform.position.x, CurrentAnimal.transform.position.y + 1, CurrentAnimal.transform.position.z), Quaternion.identity);

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
