﻿using MalbersAnimations.Events;
using MalbersAnimations.Scriptables;
using MalbersAnimations.Utilities;
using System.Collections;
using UnityEngine;
using UnityEngine.Events;

namespace MalbersAnimations.Controller
{
    public class MPickUp : MonoBehaviour, IAnimatorListener
    {
        [RequiredField, Tooltip("Trigger used to find Items that can be picked Up")]
        public Collider PickUpArea;
        public LayerReference PickUpLayer = new LayerReference(1073741824);
        [Tooltip("Allows Picking Items without any Input")]
        public BoolReference AutoPick = new BoolReference(false);


        [RequiredField, Tooltip("Bone to Parent the Picked Item")]
        public Transform Holder;
        public Vector3 PosOffset;
        public Vector3 RotOffset;

        public Pickable FocusedItem;
        public Pickable item;

        // [Header("Events")]
        public BoolEvent CanPickUp = new BoolEvent();
        public BoolEvent OnFocusedItem = new BoolEvent();
        public IntEvent OnPicking = new IntEvent();
        public IntEvent OnDropping = new IntEvent();

        public float DebugRadius = 0.02f;
        public Color DebugColor = Color.yellow;


        private MAnimal animal;
        private TriggerProxy AreaTrigger;

        /// <summary>Does the Animal is holding an Item</summary>
        
        public bool Has_Item => item != null;

        private void Awake()
        {
            animal = GetComponent<MAnimal>();
        }


        void Start()
        {
            if (Has_Item) //If the animal has an item at start then make all the stuff to pick it up
            {
                PickUpItem();
                CanPickUp.Invoke(true);
            }
        }




        private void OnEnable()
        {
            AreaTrigger = PickUpArea.GetComponent<TriggerProxy>();

            if (AreaTrigger == null) AreaTrigger = PickUpArea.gameObject.AddComponent<TriggerProxy>();

            AreaTrigger.HitLayer = PickUpLayer.Value;
            AreaTrigger.IgnoreTriggers = false;

            AreaTrigger.OnTrigger_Enter.AddListener(OnAreaTriggerEnter);
            AreaTrigger.OnTrigger_Exit.AddListener(OnAreaTriggerExit);

            AreaTrigger.gameObject.SetActive(true);
        }

        private void OnDisable()
        {
            AreaTrigger.OnTrigger_Enter.RemoveListener(OnAreaTriggerEnter);
            AreaTrigger.OnTrigger_Exit.RemoveListener(OnAreaTriggerExit);
            AreaTrigger.gameObject.SetActive(false);
        }

        void OnAreaTriggerEnter(Collider col)
        {
            var newItem = col.GetComponent<Pickable>() ?? col.GetComponentInParent<Pickable>();

            if (newItem)
            {
                FocusedItem = newItem;
                FocusedItem.OnFocused.Invoke(true);
                OnFocusedItem.Invoke(FocusedItem);
                CanPickUp.Invoke(true);
                if (AutoPick.Value && !animal.IsPlayingMode)
                    TryPickUp();
            }
        }

        void OnAreaTriggerExit(Collider col)
        {
            if (FocusedItem != null)
            {
                var newItem = col.GetComponent<Pickable>() ?? col.GetComponentInParent<Pickable>();

                if (newItem && newItem == FocusedItem)
                {
                    FocusedItem.OnFocused.Invoke(false);
                    FocusedItem = null;
                    CanPickUp.Invoke(false);
                }
            }
        }


        public virtual void TryPickUpDrop()
        {
            if (animal.IsPlayingMode) return; //Do nothing if the animal is playing a mode.. let it finish

            if (!Has_Item)
            {
                TryPickUp();
            }
            else
            {
                if (item.DropAnimations)
                    UseDropAnimations();
                else
                {
                    DropItem();
                }
            }
        }

        public void UsePickUpAnimations()
        {
            if (item.Align)
            {
                StartCoroutine(MalbersTools.AlignLookAtTransform(transform, item.transform, item.AlignTime));
                StartCoroutine(MalbersTools.AlignTransformRadius(transform, item.transform, item.AlignTime, item.AlignDistance));
            }

            // Debug.Log("UsePickUpAnimations");
            if (!animal.Mode_TryActivate(item.PickUpMode.ID, item.PickUpAbility)) //Means if the animal does not have a pick up Animation that calls the PickUP method then It will do it manually
                PickUpItem();
        }

        public void UseDropAnimations()
        {
            if (!animal.Mode_TryActivate(item.DropMode, item.DropAbility))
                DropItem();
        }


        public virtual void TryPickUp()
        {
            if (FocusedItem)
            {
                item = FocusedItem;

                if (item.PickAnimations)
                {
                    UsePickUpAnimations();
                }
                else
                {
                    PickUpItem();
                }
            }
        }

        /// <summary>Pick Up Logic. It can be called by the ANimator</summary>

        public void PickUpItem()
        {
            item = FocusedItem;

            if (item)
            {
                item.Picked();                              //Tell the Item that it was picked
                item.transform.parent = Holder;             //Parent it to the Holder
                item.transform.localPosition = PosOffset;   //Offset the Position
                item.transform.localEulerAngles = RotOffset;//Offset the Rotation

                PickUpArea?.gameObject.SetActive(false);    //Disable the Pick Up Area

                FocusedItem?.OnFocused.Invoke(false);
                FocusedItem = null;                         //Remove the Focused Item

                animal?.UpdateAttackTriggers();

                OnPicking.Invoke(item.ID);                         //Invoke the Method
            }
        }
 

        public virtual void DropItem()
        {
            if (Has_Item)
            { 
                item.transform.parent = null;
                item.Dropped();                                 //Tell the item is being droped
                OnDropping.Invoke(item.ID);                     //Invoke the method
                item = null;                                    //Remove the Item

                PickUpArea?.gameObject.SetActive(true);         //Enable the Pick up Area
                animal?.UpdateAttackTriggers();
            }
        }


        public virtual void OnAnimatorBehaviourMessage(string message, object value)
        {
            this.InvokeWithParams(message, value);
        }


        [HideInInspector] public bool ShowEvents = true;
#if UNITY_EDITOR
        private void OnDrawGizmos()
        {
            UnityEditor.Handles.color = Gizmos.color = DebugColor;

            if (Holder)
            {
                Gizmos.DrawWireSphere(Holder.TransformPoint(PosOffset), 0.02f);
                Gizmos.DrawSphere(Holder.TransformPoint(PosOffset), 0.02f);

            }
           // UnityEditor.Handles.DrawWireDisc(transform.position, transform.up, AlignDistance);
        }
#endif
    }
}