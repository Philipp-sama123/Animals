using Cinemachine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActiveCameraControl : MonoBehaviour
{
    [SerializeField] CinemachineFreeLook freeLookCamera;
    // Update is called once per frame
    private void Start()
    {
        if (freeLookCamera == null)
            freeLookCamera = GameObject.FindObjectOfType<CinemachineFreeLook>(); 
    }

    public void toggleCameraActivity()
    {
        freeLookCamera.enabled = !freeLookCamera.enabled; 
    }
}
