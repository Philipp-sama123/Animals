using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;
using MalbersAnimations.Controller;
using MalbersAnimations.Events;

public class ActivePlayerManager : MonoBehaviour
{
    [SerializeField] GameObject racoonController;
    [SerializeField] GameObject foxController;


    public CinemachineVirtualCamera followCam;
    public GameObject RacoonController { get => racoonController; set => racoonController = value; }
    public GameObject FoxController { get => foxController; set => foxController = value; }

    private bool isRacoonActivePlayer = true; 
    // Start is called before the first frame update
    void Start()
    {
        followCam = this.gameObject.GetComponent<CinemachineVirtualCamera>();

        followCam.LookAt = racoonController.transform;
        followCam.Follow = racoonController.transform;
        //  virtualCamera = (CinemachineVirtualCamera)FindObjectOfType(typeof(CinemachineVirtualCamera));
        // virtualCamera = this.gameObject.GetCinemachineComponent<CinemachineVirtualCamera>();
        //(foxController.GetComponent<MEventListener>()).enabled = false;
        //(foxController.GetComponent<MAnimalAIControl>()).enabled = true;
        SetActivePlayerRaccoon(); 
        Debug.Log(racoonController);
        Debug.Log(foxController);
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void ChangeActivePlayer()
    {   
        //todo: maybe change the tag of the animal played(!) 
        followCam = this.gameObject.GetComponent<CinemachineVirtualCamera>();
        Debug.Log(isRacoonActivePlayer);
        if (isRacoonActivePlayer)
        {
            SetActivePlayerFox();
        }
        else
        {
            SetActivePlayerRaccoon();
        }
    }

    private void SetActivePlayerFox()
    {
        isRacoonActivePlayer = false; 
        followCam.LookAt = foxController.transform;
        followCam.Follow = foxController.transform;

        (foxController.GetComponent<MEventListener>()).enabled = true;
        (foxController.GetComponent<MAnimalAIControl>()).enabled = false;
        (foxController.GetComponent<UnityEventRaiser>()).enabled = true;

        (racoonController.GetComponent<MEventListener>()).enabled = false;
    //    (racoonController.GetComponent<MAnimalAIControl>()).enabled = true;
    //    (racoonController.GetComponent<MAnimalAIControl>()).SetTarget(racoonController);

        (racoonController.GetComponent<MEventListener>()).enabled = false;
        (racoonController.GetComponent<UnityEventRaiser>()).enabled = false;
    }

    private void SetActivePlayerRaccoon()
    {
        isRacoonActivePlayer = true;
        followCam.LookAt = racoonController.transform;
        followCam.Follow = racoonController.transform;

        (racoonController.GetComponent<MEventListener>()).enabled = true;
       // (racoonController.GetComponent<MAnimalAIControl>()).enabled = false;
        (racoonController.GetComponent<UnityEventRaiser>()).enabled = true;

        (foxController.GetComponent<MEventListener>()).enabled = false;
        (foxController.GetComponent<MAnimalAIControl>()).enabled = true;
        (foxController.GetComponent<MAnimalAIControl>()).SetTarget(foxController);

        (foxController.GetComponent<MEventListener>()).enabled = false;
        (foxController.GetComponent<UnityEventRaiser>()).enabled = false;

    }
}
