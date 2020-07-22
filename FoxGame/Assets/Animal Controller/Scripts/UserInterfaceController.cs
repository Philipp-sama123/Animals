using Cinemachine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
public class UserInterfaceController : MonoBehaviour
{
    [SerializeField] private GameObject controlAlignmentRaccoon;
    [SerializeField] private GameObject controlAlignmentFox;
    private CinemachineFreeLook freeLookCamera;
    private AnimalType activePlayerType;
    void Start()
    {
        freeLookCamera = FindObjectOfType<CinemachineFreeLook>();
        setControlsForActiveAnimal();
    }

    // Update is called once per frame
    void Update()
    {
        setControlsForActiveAnimal();
    }

    private void setControlsForActiveAnimal()
    {
        activePlayerType = FindObjectOfType<AnimalController>().AnimalType;
        if (activePlayerType == AnimalType.Raccoon)
        {
            ShowControlsPlayerRaccoon();
        }
        else if (activePlayerType == AnimalType.Fox)
        {
            ShowControlsFoxPlayer();
        }
    }

    private void ShowControlsPlayerRaccoon()
    {
        controlAlignmentRaccoon.SetActive(true);
        controlAlignmentFox.SetActive(false);
    }

    private void ShowControlsFoxPlayer()
    {
        controlAlignmentRaccoon.SetActive(false);
        controlAlignmentFox.SetActive(true);
    }
    private bool IsPointerOverUIObject()
    {
        if (EventSystem.current.IsPointerOverGameObject())
            return true;

        for (int touchIndex = 0; touchIndex < Input.touchCount; touchIndex++)
        {
            Touch touch = Input.GetTouch(touchIndex);
            if (EventSystem.current.IsPointerOverGameObject(touch.fingerId))
                return true;
        }

        return false;
    }

    public void LOGStuff()
    {
        Debug.LogError("PRESSED!!");
    }

}
