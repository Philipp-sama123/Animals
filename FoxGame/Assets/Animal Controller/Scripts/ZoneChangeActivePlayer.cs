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
        public ZoneType zoneType = ZoneType.Mode;
        public StateAction stateAction = StateAction.Activate;
        public StanceAction stanceAction = StanceAction.Enter;

        [SerializeField] private GameObject animalPrefab;
        [SerializeField] private Transform spawnPoint;
        [SerializeField] private CinemachineVirtualCamera activeCamera;

        public ModeID modeID;
        public StateID stateID;
        public Action ActionID;

        /// <summary> Mode Index Value</summary>
        [SerializeField] private IntReference modeIndex = new IntReference(0);

        /// <summary> Mode Index Value</summary>
        public int ModeIndex => modeID.ID == 4 ? ActionID.ID : modeIndex.Value;

        /// <summary>Current Animal the Zone is using </summary>
        public MAnimal CurrentAnimal { get; internal set; }
        protected List<Collider> animal_Colliders = new List<Collider>();

        public float AnimHeight = 0;
        public bool RemoveAnimalOnActive = false;

        [UnityEngine.Serialization.FormerlySerializedAs("StatModifier")]
        public StatModifier StatModifierOnActive;
        public StatModifier StatModifierOnEnter;
        public StatModifier StatModifierOnExit;

        public AnimalEvent OnEnter = new AnimalEvent();
        public AnimalEvent OnExit = new AnimalEvent();
        public AnimalEvent OnZoneActivation = new AnimalEvent();

        protected Collider ZoneCollider;
        protected Stats AnimalStats;

        /// <summary>Keep a Track of all the Zones on the Scene </summary>
        public static List<ZoneChangeActivePlayer> Zones;

        /// <summary>Is the zone a Mode Zone</summary>
        public bool IsMode => zoneType == ZoneType.Mode;

        /// <summary>Is the zone a Mode Zone</summary>
        public bool IsState => zoneType == ZoneType.State;

    


        void OnTriggerEnter(Collider other)
        {
            if (other.isTrigger) return;

            if (!MalbersTools.CollidersLayer(other, LayerMask.GetMask("Animal"))) return;           //Just accept animal layer only

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
                AnimalStats = CurrentAnimal.GetComponentInParent<Stats>();

                StatModifierOnEnter.ModifyStat(AnimalStats);                         //Modify the stats when exit
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
                StatModifierOnExit.ModifyStat(AnimalStats);                         //Modify the stats when exit

                /*                if (zoneType == ZoneType.Stance && stanceAction == StanceAction.Stay && CurrentAnimal.Stance == stanceID.ID)
                                {
                                    CurrentAnimal.Stance_Reset();
                                }
                */

                ResetStoredAnimal();
            }
        }


        /// <summary>Activate the Zone depending the Zone Type</summary>
        /// <param name="forced"></param>
        public virtual void ActivateZone(bool forced = false)
        {
            if (CurrentAnimal)
            {
                CurrentAnimal.IsOnZone = true;
                CurrentAnimal.SetAnimHeight(AnimHeight); //Set the correct height for the Animal Animation
            }
            switch (zoneType)
            {
                case ZoneType.Mode:
                    ActivateModeZone(forced);
                    break;
                    /*          case ZoneType.State:
                            ActivateStateZone(); //State Zones does not require to be delay or prepared to be activated
                            break;
                           case ZoneType.Stance:
                                     ActivateStanceZone(); //State Zones does not require to be delay or prepared to be activated
                                     break;
                            */
            }
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

            CurrentAnimal = null;
            AnimalStats = null;
            animal_Colliders = new List<Collider>();                            //Clean the colliders
        }


        public virtual void Animal_StopMoving()
        {
            if (CurrentAnimal)
                CurrentAnimal.MovementAxis = CurrentAnimal.MovementAxisSmoothed = Vector3.zero;
        }

        private void ActivateModeZone(bool forced)
        {
            var PreMode = CurrentAnimal.Mode_Get(modeID);

            if (PreMode == null || !PreMode.HasAbilityIndex(ModeIndex)) //If the Animal does not have that mode or that Ability Index exti
            {
                Debug.LogWarning($"<B>[{name}]</B> cannot be activated by <B>[{CurrentAnimal.name}]</B>. It does not have that <B>[mode]</B> or <B>[ModeIndex]</B>");
                return;
            }

            if (forced)
            {
                CurrentAnimal.Mode_Activate(modeID.ID, ModeIndex);
                OnZONEActive();
            }
            else//In Case the Zone is not Automatic
            {
                if (PreMode != null)
                {
                    PreMode.AbilityIndex = ModeIndex;
                    PreMode.GlobalProperties.OnEnter.AddListener(OnZONEActive);
                }
            }
        }


        void OnZONEActive()
        {
            StatModifierOnActive.ModifyStat(AnimalStats);
            OnZoneActivation.Invoke(CurrentAnimal);

            GameObject newAnimal = Instantiate(animalPrefab, spawnPoint.transform.position, Quaternion.identity);
            newAnimal.GetComponent<MAnimal>().isPlayer.Value = true;

            CurrentAnimal.GetComponent<MEventListener>().enabled = false;
            CurrentAnimal.GetComponent<MAnimal>().isPlayer.Value = false;


            activeCamera.LookAt = newAnimal.transform;
            activeCamera.Follow = newAnimal.transform;

            AnimalController player = GameObject.FindObjectOfType<AnimalController>();
            if (player != null) player.DestroyGameObject(3);  // destroy active player
            Zone_Destroy(0);

            // destroy zone
            //  --> Death(?)   animalToDisable.State_Activate(stateID); 

            //    GameObject obj = GameObject.Find("ACRaccoon@Mobile");
            //    if (obj != null) Destroy(obj);

            // if (RemoveAnimalOnActive)
            //{
            //   ResetStoredAnimal();
            // }
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

        public void Interact() { ActivateZone(true); }

        public void TargetArrived(GameObject target)
        {
            CurrentAnimal = target.GetComponent<MAnimal>();
            ActivateZone(true);
        }


        [HideInInspector] public bool EditorShowEvents = false;
        [HideInInspector] public bool ShowStatModifiers = false;
    }
}
