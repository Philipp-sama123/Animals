using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ActivePlayerManager : MonoBehaviour
{
    [SerializeField] GameObject racoonController;
    [SerializeField] GameObject foxController;

    public GameObject RacoonController { get => racoonController; set => racoonController = value; }
    public GameObject FoxController { get => foxController; set => foxController = value; }

    // Start is called before the first frame update
    void Start()
    {
        Debug.Log(racoonController);
        Debug.Log(foxController); 
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
