Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

;ToDo Real time no pause?
;ToDo Focused target. Will spam message about distance and status to object.c++
;ToDo Realtime update of array. c++
;ToDo Add quest objectives menu c++

;ToDo Add sound for when not enough lockpicks Papyrus
;ToDo Change the lockpick ammount need and exp gain dynamicaly based on lock level instead of hardcoding every time. c++

;Tell if door leads to other location c++. In Papyrus can I use static DoorMarker? check if near door.

Import UIExtensions
Import UIListMenu

Sound Property AccessibilityCNDLockPickFail Auto
Sound Property AccessibilityCNDLockPickSuccess Auto

MiscObject Property Lockpick Auto
MiscObject Property SkeletonKey Auto

Event OnInit()
    Debug.Notification("Accessibility Activate Menu Loaded")
    RegisterForKey(47) ;V key
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowActivateMenu()
	EndIf
EndEvent

Function ShowActivateMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[7]
    SubMenus[0] = "Take Item"
    SubMenus[1] = "Loot Containers"
    SubMenus[2] = "Loot NPC"
    SubMenus[3] = "Talk to/Pickpocket NPC"
    SubMenus[4] = "Open/Close Door"
    SubMenus[5] = "Activators"
    Int SubMenusIndex = 0
    While SubMenusIndex < SubMenus.Length
        ActivateMenu.AddEntryItem(SubMenus[SubMenusIndex])
        SubMenusIndex += 1	
    EndWhile
    ActivateMenu.OpenMenu()
    Int Selection = ActivateMenu.GetResultInt()
    If Selection == 0
        ShowTakeItemSubMenu()
    ElseIf Selection == 1
        ShowLootContainersSubMenu()
    ElseIf Selection == 2
        ShowLootNPCSubMenu()
    ElseIf Selection == 3
        ShowTalkToNPCSubMenu()
    ElseIf Selection == 4
        ShowOpenCloseDoorSubMenu()
    ElseIf Selection == 5
        ShowActivatorsSubMenu()
    EndIf
EndFunction

Function ShowLockpickMenu()
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] LockpickMode = new String[2]
    LockpickMode[0] = "Manual Lockpick"
    LockpickMode[1] = "Attempt Autolockpick"
    Int LockpickModeIndex = 0
    While LockpickModeIndex < LockpickMode.Length
        ShowLockpickMenu.AddEntryItem(LockpickMode[LockpickModeIndex])
        LockpickModeIndex += 1
    EndWhile
    ShowLockpickMenu.OpenMenu()
EndFunction

Function ShowTakeItemSubMenu()
    UIListMenu ShowTakeItemSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] IngestiblesArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 700.0)
    ObjectReference[] WeaponsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 700.0)
    ObjectReference[] AmmoArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 700.0)
    ObjectReference[] ArmorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 700.0)
    ObjectReference[] BooksArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 700.0)
    ObjectReference[] KeysArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 700.0)
    ObjectReference[] SoulGemsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 700.0)
    ObjectReference[] IngredientsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 700.0)
    ObjectReference[] ScrollsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 700.0)
    ObjectReference[] MiscArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 700.0)


    int TotalItems = 0

    ; IngestiblesArray
    If IngestiblesArray.Length > 0
        Int IngestiblesIndex = 0
        While IngestiblesIndex < IngestiblesArray.Length
            String Name = (IngestiblesArray[IngestiblesIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(IngestiblesArray[IngestiblesIndex]) As Int))
            If IngestiblesArray[IngestiblesIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            IngestiblesIndex += 1
        EndWhile
        TotalItems += IngestiblesArray.Length
    EndIf

    ; WeaponsArray
    If WeaponsArray.Length > 0
        Int WeaponsIndex = 0
        While WeaponsIndex < WeaponsArray.Length
            String Name = (WeaponsArray[WeaponsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(WeaponsArray[WeaponsIndex]) As Int))
            If WeaponsArray[WeaponsIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            WeaponsIndex += 1
        EndWhile
        TotalItems += WeaponsArray.Length
    EndIf

    ; AmmoArray
    If AmmoArray.Length > 0
        Int AmmoIndex = 0
        While AmmoIndex < AmmoArray.Length
            String Name = (AmmoArray[AmmoIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(AmmoArray[AmmoIndex]) As Int))
            If AmmoArray[AmmoIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            AmmoIndex += 1
        EndWhile
        TotalItems += AmmoArray.Length
    EndIf

    ; ArmorsArray
    If ArmorsArray.Length > 0
        Int ArmorsIndex = 0
        While ArmorsIndex < ArmorsArray.Length
            String Name = (ArmorsArray[ArmorsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ArmorsArray[ArmorsIndex]) As Int))
            If ArmorsArray[ArmorsIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            ArmorsIndex += 1
        EndWhile
        TotalItems += ArmorsArray.Length
    EndIf

    ; BooksArray
    If BooksArray.Length > 0
        Int BooksIndex = 0
        While BooksIndex < BooksArray.Length
            String Name = (BooksArray[BooksIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(BooksArray[BooksIndex]) As Int))
            If BooksArray[BooksIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            BooksIndex += 1
        EndWhile
        TotalItems += BooksArray.Length
    EndIf

    ; KeysArray
    If KeysArray.Length > 0
        Int KeysIndex = 0
        While KeysIndex < KeysArray.Length
            String Name = (KeysArray[KeysIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(KeysArray[KeysIndex]) As Int))
            If KeysArray[KeysIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            KeysIndex += 1
        EndWhile
        TotalItems += KeysArray.Length
    EndIf

    ; SoulGemsArray
    If SoulGemsArray.Length > 0
    Int SoulGemsIndex = 0
        While SoulGemsIndex < SoulGemsArray.Length
            String Name = (SoulGemsArray[SoulGemsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(SoulGemsArray[SoulGemsIndex]) As Int))
            If SoulGemsArray[SoulGemsIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            SoulGemsIndex += 1
        EndWhile
        TotalItems += SoulGemsArray.Length
    EndIf

    ; IngredientsArray
    If IngredientsArray.Length > 0
        Int IngredientsIndex = 0
        While IngredientsIndex < IngredientsArray.Length
            String Name = (IngredientsArray[IngredientsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(IngredientsArray[IngredientsIndex]) As Int))
            If IngredientsArray[IngredientsIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            IngredientsIndex += 1
        EndWhile
        TotalItems += IngredientsArray.Length
    EndIf

    ; ScrollsArray
    If ScrollsArray.Length > 0
        Int ScrollsIndex = 0
        While ScrollsIndex < ScrollsArray.Length
            String Name = (ScrollsArray[ScrollsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ScrollsArray[ScrollsIndex]) As Int))
            If ScrollsArray[ScrollsIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            ScrollsIndex += 1
        EndWhile
        TotalItems += ScrollsArray.Length
    EndIf

    ; MiscArray
    If MiscArray.Length > 0
        Int MiscIndex = 0
        While MiscIndex < MiscArray.Length
            String Name = (MiscArray[MiscIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(MiscArray[MiscIndex]) As Int))
            If MiscArray[MiscIndex].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ShowTakeItemSubMenu.AddEntryItem(Name)
            MiscIndex += 1
        EndWhile
        TotalItems += MiscArray.Length
    EndIf

    If TotalItems > 0
        ShowTakeItemSubMenu.OpenMenu()
        Int Selection = ShowTakeItemSubMenu.GetResultInt()

        ; Define cumulative offsets for each array
        Int offset1 = IngestiblesArray.Length
        Int offset2 = offset1 + WeaponsArray.Length
        Int offset3 = offset2 + AmmoArray.Length
        Int offset4 = offset3 + ArmorsArray.Length
        Int offset5 = offset4 + BooksArray.Length
        Int offset6 = offset5 + KeysArray.Length
        Int offset7 = offset6 + SoulGemsArray.Length
        Int offset8 = offset7 + IngredientsArray.Length
        Int offset9 = offset8 + ScrollsArray.Length
        Int offset10 = offset9 + MiscArray.Length

        If Selection >= 0 && Selection < offset1
            IngestiblesArray[Selection].Activate(Game.GetPlayer())
        ElseIf Selection < offset2
            WeaponsArray[Selection - offset1].Activate(Game.GetPlayer())
        ElseIf Selection < offset3
            AmmoArray[Selection - offset2].Activate(Game.GetPlayer())
        ElseIf Selection < offset4
            ArmorsArray[Selection - offset3].Activate(Game.GetPlayer())
        ElseIf Selection < offset5
            BooksArray[Selection - offset4].Activate(Game.GetPlayer())
        ElseIf Selection < offset6
            KeysArray[Selection - offset5].Activate(Game.GetPlayer())
        ElseIf Selection < offset7
            SoulGemsArray[Selection - offset6].Activate(Game.GetPlayer())
        ElseIf Selection < offset8
            IngredientsArray[Selection - offset7].Activate(Game.GetPlayer())
        ElseIf Selection < offset9
            ScrollsArray[Selection - offset8].Activate(Game.GetPlayer())
        ElseIf Selection < offset10
            MiscArray[Selection - offset9].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowLootContainersSubMenu()
    UIListMenu ShowLootContainersSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 700.0)
    If ContainerArray.Length > 0
        Int ContainerIndex = 0
        While ContainerIndex < ContainerArray.Length
            String Name = (ContainerArray[ContainerIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ContainerArray[ContainerIndex]) As Int)) 
            If ContainerArray[ContainerIndex].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            If ContainerArray[ContainerIndex].IsLocked() == 1
                If ContainerArray[ContainerIndex].GetLockLevel() < 255
                    Name = "(Locked) " + Name
                ElseIf ContainerArray[ContainerIndex].GetLockLevel() == 255
                    Name = "(Key Required) " + Name
                EndIf
            EndIf
            ShowLootContainersSubMenu.AddEntryItem(Name)
            ContainerIndex += 1
        EndWhile
        ShowLootContainersSubMenu.OpenMenu()
        Int Selection = ShowLootContainersSubMenu.GetResultInt()
        If (Selection >= 0 && ContainerArray[Selection].IsLocked() == 0)
            ContainerArray[Selection].Activate(Game.GetPlayer())
        ElseIf (Selection >= 0 && ContainerArray[Selection].IsLocked() == 1 && ContainerArray[Selection].GetLockLevel() < 255)
            ShowLockpickMenu()
            Int SelectionLockpickMode = ShowLockpickMenu.GetResultInt()
            If SelectionLockpickMode == 0
                ContainerArray[Selection].Activate(Game.GetPlayer())
            ElseIf SelectionLockpickMode == 1
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (ContainerArray[Selection].Lock(false))
                    (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                Else
                    If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                        If (Utility.RandomInt(0, 3) == 0)
                            (ContainerArray[Selection].Lock(false))
                            (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 2.0))
                        Else
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 1.0))
                            (AccessibilityCNDLockPickFail.Play(Game.GetPlayer()))
                        EndIf
                    Else
                        Debug.Notification("Not enough Lockpicks")
                    EndIf
                EndIf
            EndIf
        ElseIf (Selection >= 0 && ContainerArray[Selection].IsLocked() == 1 && ContainerArray[Selection].GetLockLevel() == 255)
            ContainerArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowOpenCloseDoorSubMenu()
    UIListMenu ShowOpenCloseDoorSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] OpenCloseDoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    If OpenCloseDoorArray.Length > 0
        Int OpenCloseDoorIndex = 0
        While OpenCloseDoorIndex < OpenCloseDoorArray.Length
            String Name = (OpenCloseDoorArray[OpenCloseDoorIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(OpenCloseDoorArray[OpenCloseDoorIndex]) As Int))
            If OpenCloseDoorArray[OpenCloseDoorIndex].IsLocked() == 1
                If OpenCloseDoorArray[OpenCloseDoorIndex].GetLockLevel() < 255
                    Name = "(Locked) " + Name
                ElseIf OpenCloseDoorArray[OpenCloseDoorIndex].GetLockLevel() == 255
                    Name = "(Key Required) " + Name
                EndIf
            EndIf
            ShowOpenCloseDoorSubMenu.AddEntryItem(Name)
            OpenCloseDoorIndex += 1
        EndWhile
        ShowOpenCloseDoorSubMenu.OpenMenu()
        Int Selection = ShowOpenCloseDoorSubMenu.GetResultInt()
        If (Selection >= 0 && OpenCloseDoorArray[Selection].IsLocked() == 0)
            OpenCloseDoorArray[Selection].Activate(Game.GetPlayer())
        ElseIf (Selection >= 0 && OpenCloseDoorArray[Selection].IsLocked() == 1 && OpenCloseDoorArray[Selection].GetLockLevel() < 255)
            ShowLockpickMenu()
            Int SelectionLockpickMode = ShowLockpickMenu.GetResultInt()
            If SelectionLockpickMode == 0
                OpenCloseDoorArray[Selection].Activate(Game.GetPlayer())
            ElseIf SelectionLockpickMode == 1
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (OpenCloseDoorArray[Selection].Lock(false))
                    (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                Else
                    If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                        If (Utility.RandomInt(0, 3) == 0)
                            (OpenCloseDoorArray[Selection].Lock(false))
                            (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 2.0))
                        Else
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 1.0))
                            (AccessibilityCNDLockPickFail.Play(Game.GetPlayer()))
                        EndIf
                    Else
                        Debug.Notification("Not enough Lockpicks")
                    EndIf
                EndIf
            EndIf
        ElseIf (Selection >= 0 && OpenCloseDoorArray[Selection].IsLocked() == 1 && OpenCloseDoorArray[Selection].GetLockLevel() == 255)
            OpenCloseDoorArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowLootNPCSubMenu()
    UIListMenu ShowLootNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int DeadNPCIndex = 0
        ObjectReference[] DeadNPCArray = new ObjectReference[128]
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If CurrentNPC.IsDead() && (DeadNPCIndex < DeadNPCArray.Length)
                DeadNPCArray[DeadNPCIndex] = TotalNPCArray[TotalNPCIndex]
                DeadNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        Int MenuEntryIndex = 0
        While MenuEntryIndex < DeadNPCIndex
            String Name = (DeadNPCArray[MenuEntryIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(DeadNPCArray[MenuEntryIndex]) As Int)) 
            If DeadNPCArray[MenuEntryIndex].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            ShowLootNPCSubMenu.AddEntryItem(Name)
            MenuEntryIndex += 1
        EndWhile
        If MenuEntryIndex > 0
            ShowLootNPCSubMenu.OpenMenu()
        EndIf
        Int Selection = ShowLootNPCSubMenu.GetResultInt()
        If Selection >= 0
            DeadNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowTalkToNPCSubMenu()
    UIListMenu ShowTalkToNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int AliveNPCIndex = 0
        ObjectReference[] AliveNPCArray = new ObjectReference[128]
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If !CurrentNPC.IsDead() && (AliveNPCIndex < AliveNPCArray.Length)
                AliveNPCArray[AliveNPCIndex] = TotalNPCArray[TotalNPCIndex]
                AliveNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        Int MenuEntryIndex = 0
        While MenuEntryIndex < AliveNPCIndex
            String Name = (AliveNPCArray[MenuEntryIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(AliveNPCArray[MenuEntryIndex]) As Int))
            Actor CurrentNPC = AliveNPCArray[MenuEntryIndex] As Actor
            If CurrentNPC.IsHostileToActor(Game.GetPlayer())
                Name = "(Hostile) " + Name
            EndIf
            If (Game.GetPlayer().GetCombatState() == 0) && (Game.GetPlayer().IsSneaking())
                Name = "(Pickpocket) " + Name
            EndIf
            ShowTalkToNPCSubMenu.AddEntryItem(Name)
            MenuEntryIndex += 1
        EndWhile
        ShowTalkToNPCSubMenu.OpenMenu()
        Int Selection = ShowTalkToNPCSubMenu.GetResultInt()
        If Selection >= 0
            AliveNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowActivatorsSubMenu()
    UIListMenu ShowActivatorsSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] ActivatorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    If ActivatorsArray.Length > 0
        Int ActivatorsIndex = 0
        While ActivatorsIndex < ActivatorsArray.Length
            String Name = (ActivatorsArray[ActivatorsIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ActivatorsArray[ActivatorsIndex]) As Int))
            ShowActivatorsSubMenu.AddEntryItem(Name)
            ActivatorsIndex += 1
        EndWhile
        ShowActivatorsSubMenu.OpenMenu()
        Int Selection = ShowActivatorsSubMenu.GetResultInt()
        If Selection >= 0
            ActivatorsArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction



