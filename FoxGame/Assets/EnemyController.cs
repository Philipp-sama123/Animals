using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EnemyController : MonoBehaviour
{
    [SerializeField] private GameObject enemyDeathPrefab;
    [SerializeField] private GameObject deathParticleEffect;
    public void DestroyGameObject()
    {
        StartCoroutine(DestroyEnemyGameObject());
    }
    private IEnumerator DestroyEnemyGameObject()
    {
        deathParticleEffect.GetComponent<ParticleSystem>().Play();
        yield return new WaitForSecondsRealtime(5);
        Instantiate(enemyDeathPrefab, transform.position, transform.rotation);
        Destroy(gameObject);
    }
}
