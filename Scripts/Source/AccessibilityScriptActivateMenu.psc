Scriptname AccessibilityScriptActivateMenu extends ObjectReference

;ToDo Should I keep this script? I will remake UI is there any use now?

Message Property AccessibilityMSGActivateMenu Auto
Message Property AccessibilityMSGItemSearch Auto
Message Property AccessibilityMSGContainerSearch Auto
Message Property AccessibilityMSGDoorSearch Auto
Message Property AccessibilityMSGNPCSearch Auto
Message Property AccessibilityMSGTrapSearch Auto

Event OnInit()
    Debug.Notification("Accessibility Activate Menu Loaded")
    RegisterForKey(33)
EndEvent

;/
Event OnKeyDown(Int KeyCode)
    If KeyCode == 33 && !Utility.IsInMenuMode()
		Game.ForceFirstPerson()
        Utility.Wait(0.1)
        Game.ForceFirstPerson()
        Menu()
        Game.ForceFirstPerson()
	EndIf
EndEvent
/;

Function Menu(Bool abMenu = True, Int aiButton = 0)
    While abMenu
        If aiButton != -1
            aiButton = AccessibilityMSGActivateMenu.Show()
            abMenu = False
            If aiButton == 0
                aiButton = AccessibilityMSGItemSearch.Show()
                If aiButton == 0
                EndIf
            ElseIf aiButton == 1
                aiButton = AccessibilityMSGContainerSearch.Show()
                If aiButton == 0
                EndIf
            ElseIf aiButton == 2
                aiButton = AccessibilityMSGDoorSearch.Show()
                If aiButton == 0
                EndIf
            ElseIf aiButton == 3
                aiButton = AccessibilityMSGNPCSearch.Show()
                If aiButton == 0
                EndIf
            ElseIf aiButton == 4
                aiButton = AccessibilityMSGTrapSearch.Show()
                If aiButton == 0
                EndIf
            EndIf
        EndIf
    EndWhile
EndFunction