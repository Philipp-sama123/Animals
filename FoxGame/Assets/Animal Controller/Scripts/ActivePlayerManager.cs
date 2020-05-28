using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Cinemachine;

public class ActivePlayerManager : MonoBehaviour
{
    [SerializeField] GameObject racoonController;
    [SerializeField] GameObject foxController;


    public CinemachineVirtualCamera followCam;
    public GameObject RacoonController { get => racoonController; set => racoonController = value; }
    public GameObject FoxController { get => foxController; set => foxController = value; }
    // Start is called before the first frame update
    void Start()
    {
        followCam = this.gameObject.GetComponent<CinemachineVirtualCamera>();
        followCam.LookAt = foxController.transform;
        followCam.Follow = foxController.transform; 
        //  virtualCamera = (CinemachineVirtualCamera)FindObjectOfType(typeof(CinemachineVirtualCamera));
        // virtualCamera = this.gameObject.GetCinemachineComponent<CinemachineVirtualCamera>();
        Debug.Log(this.gameObject);
        Debug.Log(foxController); 
    }

    // Update is called once per frame
    void Update()
    {
        
    }


}
