using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using MalbersAnimations.Scriptables;
using UnityEngine.Events;
using MalbersAnimations.Utilities;
using MalbersAnimations.Events;
using Cinemachine;

namespace MalbersAnimations.Controller
{

    /// <summary>When an animal Enters this Zone it will change to an other active animal</summary>
    public class ZoneChangeActivePlayer : MonoBehaviour, IDestination, IInteractable
    {
        [SerializeField] private GameObject animalPrefab;
        [SerializeField] private Transform spawnPoint;
        private CinemachineVirtualCamera followCamera;
        private CinemachineFreeLook freeLookCamera;

        public ModeID modeID;
        public StateID stateID;
        public Action ActionID;

        /// <summary> Mode Index Value</summary>
        [SerializeField] private IntReference modeIndex = new IntReference(0);

        /// <summary> Mode Index Value</summary>
        public int ModeIndex => modeID.ID == 4 ? ActionID.ID : modeIndex.Value;

        public MAnimal CurrentAnimal { get; internal set; }
        protected List<Collider> animal_Colliders = new List<Collider>();

        public bool RemoveAnimalOnActive = false;

        public AnimalEvent OnEnter = new AnimalEvent();
        public AnimalEvent OnExit = new AnimalEvent();
        public AnimalEvent OnZoneActivation = new AnimalEvent();

        protected Collider ZoneCollider;
        private ZoneType zoneType = ZoneType.Mode;
        void OnTriggerEnter(Collider other)
        {
            // if (other.isTrigger) return;

            // if (!MalbersTools.CollidersLayer(other, LayerMask.GetMask("Animal"))) return;           //Just accept animal layer only

            MAnimal newAnimal = other.GetComponentInParent<MAnimal>();                              //Get the animal on the entering collider

            if (!newAnimal) return;                                                                 //If there's no animal do nothing

            if (animal_Colliders.Find(coll => coll == other) == null)                               //if the entering collider is not already on the list add it
            {
                animal_Colliders.Add(other);
            }

            if (newAnimal == CurrentAnimal) return;                                    //if the animal is the same do nothing (when entering two animals on the same Zone)
            else
            {
                if (CurrentAnimal)
                    animal_Colliders = new List<Collider>();                            //Clean the colliders

                CurrentAnimal = newAnimal;                                             //Set a new Animal

                OnEnter.Invoke(CurrentAnimal);
                ActivateZone();
            }
        }
        void OnTriggerExit(Collider other)
        {
            if (other.isTrigger) return;

            MAnimal existing_animal = other.GetComponentInParent<MAnimal>();

            if (!existing_animal) return;                                            //If there's no animal script found skip all
            if (existing_animal != CurrentAnimal) return;                            //If is another animal exiting the zone SKIP

            if (animal_Colliders.Find(item => item == other))                       //Remove the collider from the list that is exiting the zone.
            {
                animal_Colliders.Remove(other);
            }

            if (animal_Colliders.Count == 0)                                        //When all the collides are removed from the list..
            {
                OnExit.Invoke(CurrentAnimal);                                      //Invoke On Exit when all animal's colliders has exited the Zone

                ResetStoredAnimal();
            }
        }


        /// <summary>Activate the Zone depending the Zone Type</summary>
        /// <param name="forced"></param>
        public virtual void ActivateZone()
        {
            if (CurrentAnimal)
            {
                CurrentAnimal.IsOnZone = true;
            }

            ActivateModeZone();
        }

        public virtual void ResetStoredAnimal()
        {
            CurrentAnimal.IsOnZone = false;

            if (zoneType == ZoneType.Mode)
            {
                var PreMode = CurrentAnimal.Mode_Get(modeID);
                if (PreMode != null)
                {
                    PreMode.ResetAbilityIndex();
                    PreMode.GlobalProperties.OnEnter.RemoveListener(OnZONEActive);
                }
            }

            //CurrentAnimal = null;
            animal_Colliders = new List<Collider>();                            //Clean the colliders
        }


        public virtual void Animal_StopMoving()
        {
            if (CurrentAnimal)
                CurrentAnimal.MovementAxis = CurrentAnimal.MovementAxisSmoothed = Vector3.zero;
        }

        private void ActivateModeZone()
        {
            var PreMode = CurrentAnimal.Mode_Get(modeID);
            if (PreMode == null || !PreMode.HasAbilityIndex(ModeIndex)) //If the Animal does not have that mode or that Ability Index exti
            {
                Debug.LogWarning($"<B>[{name}]</B> cannot be activated by <B>[{CurrentAnimal.name}]</B>. It does not have that <B>[mode]</B> or <B>[ModeIndex]</B>");
                return;
            }
            PreMode.AbilityIndex = ModeIndex;
            PreMode.GlobalProperties.OnEnter.AddListener(OnZONEActive);
        }

        void OnZONEActive()
        {
            OnZoneActivation.Invoke(CurrentAnimal);

            ChangeAnimal();

            Zone_Destroy(0);
        }
        private void ChangeAnimal()
        {
            DisableOldAnimal();
            InstantiateNewAnimal();
            DestroyOldAnimal();
        }
        private static void DestroyOldAnimal()
        {
            AnimalController[] players = FindObjectsOfType<AnimalController>();
            foreach (AnimalController player in players)
            {
                if (!player.IsPlayerActive) player.DestroyGameObject(3);
            }
        }

        private void DisableOldAnimal()
        {
            CurrentAnimal.GetComponent<MEventListener>().enabled = false;
            CurrentAnimal.GetComponent<MAnimal>().isPlayer.Value = false;
            CurrentAnimal.GetComponent<AnimalController>().IsPlayerActive = false;
        }

        private void InstantiateNewAnimal()
        {
            GameObject newAnimal = Instantiate(animalPrefab, spawnPoint.transform.position, Quaternion.identity);
            newAnimal.GetComponent<MAnimal>().SetMainPlayer();

            freeLookCamera = GameObject.FindGameObjectWithTag("FreeLookCamera").GetComponent<CinemachineFreeLook>();
            followCamera = GameObject.FindGameObjectWithTag("FollowCamera").GetComponent<CinemachineVirtualCamera>();

            followCamera.LookAt = newAnimal.transform;
            followCamera.Follow = newAnimal.transform;

            freeLookCamera.LookAt = newAnimal.transform;
            freeLookCamera.Follow = newAnimal.transform;

        }

        /// <summary> Destroy the Zone after x Time</summary>
        public virtual void Zone_Destroy(float time)
        {
            if (time == 0)
                Destroy(gameObject);
            else
            {
                Destroy(gameObject, time);
            }
        }

        public void ResetInteraction() {/* Do nothing  */}

        public void Interact() { ActivateZone(); }

    }
}
