Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

;ToDo Real time no pause?
;ToDo Focused target. Will spam message about distance and status to object.
;ToDo Realtime update of array.
;ToDo Add quest objectives menu

Import UIExtensions
Import UIListMenu

Event OnInit()
    Debug.Notification("Accessibility Activate Menu Loaded")
    RegisterForKey(47)
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
    SubMenus[3] = "Talk to NPC"
    SubMenus[4] = "Open/Close Door"
    SubMenus[5] = "Trap Search"
    SubMenus[6] = "Misc. Activators"
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
        ShowTrapSearchSubMenu()
    ElseIf Selection == 6
        ShowMiscActivatorsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemSubMenu()

EndFunction

Function ShowLootContainersSubMenu()
    UIListMenu ShowLootContainersSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 700.0)
    If ContainerArray.Length > 0
        Int ContainerIndex = 0
        While ContainerIndex < ContainerArray.Length
            String Name = (ContainerArray[ContainerIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ContainerArray[ContainerIndex]) As Int)) 
            If ContainerArray[ContainerIndex].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            If ContainerArray[ContainerIndex].IsLocked() == 1
                Name = "(Locked) " + Name
            EndIf
            ShowLootContainersSubMenu.AddEntryItem(Name)
            ContainerIndex += 1
        EndWhile
        ShowLootContainersSubMenu.OpenMenu()
        Int Selection = ShowLootContainersSubMenu.GetResultInt()
        If Selection >= 0
            ContainerArray[Selection].Activate(Game.GetPlayer())
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
            If CurrentNPC.IsDead()
                DeadNPCArray[DeadNPCIndex] = TotalNPCArray[TotalNPCIndex]
                DeadNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        While DeadNPCIndex < DeadNPCArray.Length
            String Name = (DeadNPCArray[DeadNPCIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(DeadNPCArray[DeadNPCIndex]) As Int)) 
            If DeadNPCArray[DeadNPCIndex].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            ShowLootNPCSubMenu.AddEntryItem(Name)
            DeadNPCIndex += 1
        EndWhile
        ShowLootNPCSubMenu.OpenMenu()
        Int Selection = ShowLootNPCSubMenu.GetResultInt()
        If Selection >= 0
            DeadNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowTalkToNPCSubMenu()
    ;ToDo write if NPC is hostile.
    UIListMenu ShowTalkToNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int AliveNPCIndex = 0
        ObjectReference[] AliveNPCArray = new ObjectReference[128]
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If !CurrentNPC.IsDead()
                AliveNPCArray[AliveNPCIndex] = TotalNPCArray[TotalNPCIndex]
                AliveNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        While AliveNPCIndex < AliveNPCArray.Length
            String Name = (AliveNPCArray[AliveNPCIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(AliveNPCArray[AliveNPCIndex]) As Int))
            ShowTalkToNPCSubMenu.AddEntryItem(Name)
            AliveNPCIndex += 1
        EndWhile
        ShowTalkToNPCSubMenu.OpenMenu()
        Int Selection = ShowTalkToNPCSubMenu.GetResultInt()
        If Selection >= 0
            AliveNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowOpenCloseDoorSubMenu()
    UIListMenu ShowOpenCloseDoorSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] OpenCloseDoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    If OpenCloseDoorArray.Length > 0
        Int OpenCloseDoorIndex = 0
        While OpenCloseDoorIndex < OpenCloseDoorArray.Length
            String Name = (OpenCloseDoorArray[OpenCloseDoorIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(OpenCloseDoorArray[OpenCloseDoorIndex]) As Int)) 
            If OpenCloseDoorArray[OpenCloseDoorIndex].IsLocked() == 1
                Name = "(Locked) " + Name
            EndIf
            ShowOpenCloseDoorSubMenu.AddEntryItem(Name)
            OpenCloseDoorIndex += 1
        EndWhile
        ShowOpenCloseDoorSubMenu.OpenMenu()
        Int Selection = ShowOpenCloseDoorSubMenu.GetResultInt()
        If Selection >= 0
            OpenCloseDoorArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowTrapSearchSubMenu()

EndFunction

Function ShowMiscActivatorsSubMenu()

EndFunction