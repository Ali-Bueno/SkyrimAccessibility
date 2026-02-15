Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

Import UIExtensions
Import UIListMenu

Event OnInit()
    Debug.Notification("Accessibility Activate Menu Loaded")
    RegisterForKey(33)
EndEvent

Event OnKeyDown(Int KeyCode)
    Debug.Notification("Key Down")
    If KeyCode == 33 && !Utility.IsInMenuMode()
        Debug.Notification("Key F")
        UnregisterForControl("Toggle POV")
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
        Debug.Notification("Take Item Menu")
    ElseIf Selection == 1
        Debug.Notification("Loot Containers Menu")
        ShowLootContainersSubMenu()
    EndIf
EndFunction

Function ShowTakeItemSubMenu()

EndFunction

Function ShowLootContainersSubMenu()
    UIListMenu ShowLootContainersSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 1000.0)
    Int ContainerIndex = 0
    While ContainerIndex < ContainerArray.Length
        If ContainerArray[ContainerIndex] != None
            ShowLootContainersSubMenu.AddEntryItem(ContainerArray[ContainerIndex].GetDisplayName())
        EndIf
        ContainerIndex += 1
    EndWhile
    If ContainerArray.Length > 0
        ShowLootContainersSubMenu.OpenMenu()
    EndIf
    Int Selection = ShowLootContainersSubMenu.GetResultInt()
    If Selection == 0
        Debug.Notification("Take Item Menu")
        ShowLootContainersSubMenu()
    ElseIf Selection == 1
        Debug.Notification("Loot Containers Menu")
    EndIf
EndFunction