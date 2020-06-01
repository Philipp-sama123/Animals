using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;
using MalbersAnimations.Controller;
using MalbersAnimations.Events;
using UnityEngine.AI;

public class ActivePlayerManager : MonoBehaviour
{
    [SerializeField] GameObject racoonController;
    [SerializeField] GameObject foxController;
    [SerializeField] MalbersAnimations.ModeID modeIdRaccoon;
    [SerializeField] float stoppingDistanceFox = 1f; 
    public CinemachineVirtualCamera followCam;
    public GameObject RacoonController { get => racoonController; set => racoonController = value; }
    public GameObject FoxController { get => foxController; set => foxController = value; }

    private bool isRacoonActivePlayer = true;
    // Start is called before the first frame update
    void Start()
    {
        isRacoonActivePlayer = true;
        SetActivePlayerRaccoon();
    }

    void Update()
    {
        isRacoonActivePlayer = racoonController.GetComponent<MAnimal>().isPlayer.Value;
        Debug.Log(isRacoonActivePlayer);
    }

    public void ChangeActivePlayer()
    {
        //todo: maybe change the tag of the animal played(!) 
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

        ActivateControlsForFox();
        DisableControlsForRaccoon();


    }

    private void SetActivePlayerRaccoon()
    {
        isRacoonActivePlayer = true;

        ActivateControlsForRaccoon();
        DisableControlsForFox();
    }

    private void DisableControlsForFox()
    {
        (foxController.GetComponent<MAnimal>()).isPlayer.Value = false;
        (foxController.GetComponent<MEventListener>()).enabled = false;
        // set AI 
        MAnimalAIControl aiControlFox = (foxController.GetComponent<MAnimalAIControl>());
        aiControlFox.enabled = true;
        aiControlFox.SetTarget(racoonController.transform, true);
        aiControlFox.StoppingDistance = stoppingDistanceFox;
    }

    private void DisableControlsForRaccoon() // fox! (make dynamic)
    {
        MAnimal mAnimalRaccoon = racoonController.GetComponent<MAnimal>();
        mAnimalRaccoon.isPlayer.Value = false;
        mAnimalRaccoon.Mode_Interrupt();
        mAnimalRaccoon.Mode_Pin(modeIdRaccoon);
        mAnimalRaccoon.Mode_Pin_Input(true);

        (racoonController.GetComponent<MEventListener>()).enabled = false;
    }
    private void ActivateControlsForFox()
    {
        SetCameraToActiveAnimal(foxController.transform);
        (foxController.GetComponent<MAnimal>()).isPlayer.Value = true;
        (foxController.GetComponent<MEventListener>()).enabled = true;
        (foxController.GetComponent<MAnimalAIControl>()).enabled = false;
    }

    private void ActivateControlsForRaccoon()
    {
        SetCameraToActiveAnimal(racoonController.transform);
        (racoonController.GetComponent<MAnimal>()).isPlayer.Value = true;
        (racoonController.GetComponent<MEventListener>()).enabled = true;
    }

    private void SetCameraToActiveAnimal(Transform activeAnimalTransform)
    {
        followCam.LookAt = activeAnimalTransform;
        followCam.Follow = activeAnimalTransform;
    }
}
