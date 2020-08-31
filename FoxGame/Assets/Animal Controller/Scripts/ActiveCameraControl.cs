using Cinemachine;
using MalbersAnimations;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveCameraControl : MonoBehaviour
{
    private CinemachineFreeLook freeLookCamera = null;

    private void Start()
    {
        if (freeLookCamera == null)
            freeLookCamera = GameObject.FindObjectOfType<CinemachineFreeLook>();
    }

    public void ToggleCameraActivity()
    {
        freeLookCamera.enabled = !freeLookCamera.enabled;
    }
}
