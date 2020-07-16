using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UserInterfaceController : MonoBehaviour
{
    [SerializeField] private GameObject controlAlignmentRaccoon;
    [SerializeField] private GameObject controlAlignmentFox;
    private AnimalType activePlayerType;
    void Start()
    {
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
}
