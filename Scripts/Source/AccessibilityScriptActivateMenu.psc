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
        ShowLootContainersSubMenu()
    ElseIf Selection == 3
        ShowLootContainersSubMenu()
    ElseIf Selection == 4
        ShowLootContainersSubMenu()
    ElseIf Selection == 5
        ShowLootContainersSubMenu()
    ElseIf Selection == 6
        ShowLootContainersSubMenu()
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
            IsLocked()
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

EndFunction

Function ShowTalkToNPCSubMenu()

EndFunction

Function ShowOpenCloseDoorSubMenu()

EndFunction

Function ShowTrapSearchSubMenu()

EndFunction

Function ShowMiscActivatorsSubMenu()

EndFunction