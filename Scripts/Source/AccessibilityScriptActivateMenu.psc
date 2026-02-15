Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

Import UIExtensions
Import UIListMenu

;Message Property AccessibilityMSGItemSearch Auto
;Message Property AccessibilityMSGContainerSearch Auto
;Message Property AccessibilityMSGDoorSearch Auto
;Message Property AccessibilityMSGNPCSearch Auto
;Message Property AccessibilityMSGTrapSearch Auto

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
        UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu

        String[] SubMenus = new String[6]

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
			Debug.Notification("Test 1")
		ElseIf Selection == 1
            Debug.Notification("Test 2")
        EndIf
	EndIf
EndEvent
