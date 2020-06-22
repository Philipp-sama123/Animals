using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimalController : MonoBehaviour
{
    public void DestroyGameObject(float time)
    {
        if (time == 0)
            Destroy(gameObject);
        else
        {
            Destroy(gameObject, time);
        }
    }
}
