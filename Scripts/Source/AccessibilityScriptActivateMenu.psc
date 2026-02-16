Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

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
            String ContainerName = (ContainerArray[ContainerIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(ContainerArray[ContainerIndex]) As Int)) 
            If ContainerArray[ContainerIndex].GetNumItems() == 0
                ContainerName = "(Empty) " + ContainerName
            EndIf
            If ContainerArray[ContainerIndex].IsLocked() == 1
                ContainerName = "(Locked) " + ContainerName
            EndIf
            ShowLootContainersSubMenu.AddEntryItem(ContainerName)
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
    ObjectReference[] LootNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If LootNPCArray.Length > 0
        Int LootNPCIndex = 0
        While LootNPCIndex < LootNPCArray.Length
            String ContainerName = (LootNPCArray[LootNPCIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(LootNPCArray[LootNPCIndex]) As Int)) 
            If LootNPCArray[LootNPCIndex].GetNumItems() == 0
                ContainerName = "(Empty) " + ContainerName
            EndIf
            Actor CurrentNPC = LootNPCArray[LootNPCIndex] As Actor
            If CurrentNPC.IsDead()
                ShowLootNPCSubMenu.AddEntryItem(ContainerName)
            EndIf
            LootNPCIndex += 1
        EndWhile
        ShowLootNPCSubMenu.OpenMenu()
        Int Selection = ShowLootNPCSubMenu.GetResultInt()
        If Selection >= 0
            LootNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowTalkToNPCSubMenu()
    ;ToDo write if NPC is hostile.
    UIListMenu ShowTalkToNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TalkToNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TalkToNPCArray.Length > 0
        Int TalkToNPCIndex = 0
        While TalkToNPCIndex < TalkToNPCArray.Length
            String ContainerName = (TalkToNPCArray[TalkToNPCIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(TalkToNPCArray[TalkToNPCIndex]) As Int))
            Actor CurrentNPC = TalkToNPCArray[TalkToNPCIndex] As Actor
            If !CurrentNPC.IsDead()
                ShowTalkToNPCSubMenu.AddEntryItem(ContainerName)
            EndIf
            TalkToNPCIndex += 1
        EndWhile
        ShowTalkToNPCSubMenu.OpenMenu()
        Int Selection = ShowTalkToNPCSubMenu.GetResultInt()
        If Selection >= 0
            TalkToNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowOpenCloseDoorSubMenu()
    UIListMenu ShowOpenCloseDoorSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] OpenCloseDoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    If OpenCloseDoorArray.Length > 0
        Int OpenCloseDoorIndex = 0
        While OpenCloseDoorIndex < OpenCloseDoorArray.Length
            String ContainerName = (OpenCloseDoorArray[OpenCloseDoorIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(OpenCloseDoorArray[OpenCloseDoorIndex]) As Int)) 
            If OpenCloseDoorArray[OpenCloseDoorIndex].IsLocked() == 1
                ContainerName = "(Locked) " + ContainerName
            EndIf
            ShowOpenCloseDoorSubMenu.AddEntryItem(ContainerName)
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