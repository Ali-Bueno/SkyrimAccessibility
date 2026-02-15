Scriptname AccessibilityScriptLockPick extends ObjectReference

;ToDo Add Unlock Sound to have audio feedback

MiscObject Property Lockpick Auto
MiscObject Property SkeletonKey Auto

Perk Property NoviceLocks00 Auto
Perk Property ApprenticeLocks25 Auto
Perk Property AdeptLocks50 Auto
Perk Property ExpertLocks75 Auto
Perk Property MasterLocks100 Auto

Event OnInit()
    RegisterForKey(34)
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 34 && !Utility.IsInMenuMode()
        ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 210.0)
        Int ContainerIndex = 0
        While ContainerIndex < ContainerArray.Length
            If (ContainerArray[ContainerIndex] != None) && (ContainerArray[ContainerIndex].IsLocked()) && (!ContainerArray[ContainerIndex].GetLockLevel() == 255)
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (ContainerArray[ContainerIndex].Lock(false))
                Else
                    If (ContainerArray[ContainerIndex].GetLockLevel() >= 0 && ContainerArray[ContainerIndex].GetLockLevel() <= 1)
                        If (Game.GetPlayer().HasPerk(NoviceLocks00))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (ContainerArray[ContainerIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(NoviceLocks00))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 5)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (ContainerArray[ContainerIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 5))
                                    (Game.AdvanceSkill("Lockpicking", 3.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 5))
                                    (Game.AdvanceSkill("Lockpicking", 2.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (ContainerArray[ContainerIndex].GetLockLevel() >= 2 && ContainerArray[ContainerIndex].GetLockLevel() <= 25)    
                        If (Game.GetPlayer().HasPerk(ApprenticeLocks25))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (ContainerArray[ContainerIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(ApprenticeLocks25))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 10)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (ContainerArray[ContainerIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 10))
                                    (Game.AdvanceSkill("Lockpicking", 7.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 10))
                                    (Game.AdvanceSkill("Lockpicking", 4.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (ContainerArray[ContainerIndex].GetLockLevel() >= 26 && ContainerArray[ContainerIndex].GetLockLevel() <= 50)    
                        If (Game.GetPlayer().HasPerk(AdeptLocks50))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (ContainerArray[ContainerIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(AdeptLocks50))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 15)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (ContainerArray[ContainerIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 15))
                                    (Game.AdvanceSkill("Lockpicking", 11.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 15))
                                    (Game.AdvanceSkill("Lockpicking", 8.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (ContainerArray[ContainerIndex].GetLockLevel() >= 51 && ContainerArray[ContainerIndex].GetLockLevel() <= 75)    
                        If (Game.GetPlayer().HasPerk(ExpertLocks75))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (ContainerArray[ContainerIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(ExpertLocks75))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 20)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (ContainerArray[ContainerIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 20))
                                    (Game.AdvanceSkill("Lockpicking", 15.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 20))
                                    (Game.AdvanceSkill("Lockpicking", 12.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (ContainerArray[ContainerIndex].GetLockLevel() >= 76 && ContainerArray[ContainerIndex].GetLockLevel() <= 254)    
                        If (Game.GetPlayer().HasPerk(MasterLocks100))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (ContainerArray[ContainerIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(MasterLocks100))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 25)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (ContainerArray[ContainerIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 25))
                                    (Game.AdvanceSkill("Lockpicking", 20.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 25))
                                    (Game.AdvanceSkill("Lockpicking", 15.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                EndIf
            EndIf
            ContainerIndex += 1
        EndWhile
        ObjectReference[] DoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 210.0)
        Int DoorIndex = 0
        While DoorIndex < DoorArray.Length
            If (DoorArray[DoorIndex] != None) && (DoorArray[DoorIndex].IsLocked()) && (!DoorArray[DoorIndex].GetLockLevel() == 255)
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (DoorArray[DoorIndex].Lock(false))
                Else
                    If (DoorArray[DoorIndex].GetLockLevel() >= 0 && DoorArray[DoorIndex].GetLockLevel() <= 1)
                        If (Game.GetPlayer().HasPerk(NoviceLocks00))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (DoorArray[DoorIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(NoviceLocks00))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 5)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (DoorArray[DoorIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 5))
                                    (Game.AdvanceSkill("Lockpicking", 3.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 5))
                                    (Game.AdvanceSkill("Lockpicking", 2.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (DoorArray[DoorIndex].GetLockLevel() >= 2 && DoorArray[DoorIndex].GetLockLevel() <= 25)    
                        If (Game.GetPlayer().HasPerk(ApprenticeLocks25))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (DoorArray[DoorIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(ApprenticeLocks25))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 10)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (DoorArray[DoorIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 10))
                                    (Game.AdvanceSkill("Lockpicking", 7.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 10))
                                    (Game.AdvanceSkill("Lockpicking", 4.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (DoorArray[DoorIndex].GetLockLevel() >= 26 && DoorArray[DoorIndex].GetLockLevel() <= 50)    
                        If (Game.GetPlayer().HasPerk(AdeptLocks50))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (DoorArray[DoorIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(AdeptLocks50))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 15)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (DoorArray[DoorIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 15))
                                    (Game.AdvanceSkill("Lockpicking", 11.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 15))
                                    (Game.AdvanceSkill("Lockpicking", 8.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (DoorArray[DoorIndex].GetLockLevel() >= 51 && DoorArray[DoorIndex].GetLockLevel() <= 75)    
                        If (Game.GetPlayer().HasPerk(ExpertLocks75))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (DoorArray[DoorIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(ExpertLocks75))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 20)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (DoorArray[DoorIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 20))
                                    (Game.AdvanceSkill("Lockpicking", 15.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 20))
                                    (Game.AdvanceSkill("Lockpicking", 12.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                    If (DoorArray[DoorIndex].GetLockLevel() >= 76 && DoorArray[DoorIndex].GetLockLevel() <= 254)    
                        If (Game.GetPlayer().HasPerk(MasterLocks100))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                                (DoorArray[DoorIndex].Lock(false))
                                (Game.GetPlayer().RemoveItem(Lockpick, 1))
                                (Game.AdvanceSkill("Lockpicking", 1.0))
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        ElseIf (!Game.GetPlayer().HasPerk(MasterLocks100))
                            If (Game.GetPlayer().GetItemCount(Lockpick) >= 25)
                                If (Utility.RandomInt(0, 1) == 0)
                                    (DoorArray[DoorIndex].Lock(false))
                                    (Game.GetPlayer().RemoveItem(Lockpick, 25))
                                    (Game.AdvanceSkill("Lockpicking", 20.0))
                                Else
                                    (Game.GetPlayer().RemoveItem(Lockpick, 25))
                                    (Game.AdvanceSkill("Lockpicking", 15.0))
                                EndIf
                            Else
                                Debug.Notification("Not enough Lockpicks")
                            EndIf
                        EndIf
                    EndIf
                EndIf
            EndIf
            DoorIndex += 1
        EndWhile
    EndIf
EndEvent