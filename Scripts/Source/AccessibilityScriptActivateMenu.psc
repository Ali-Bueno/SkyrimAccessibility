Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

Import UIExtensions
Import UIListMenu

Message Property AccessibilityMSGItemSearch Auto
Message Property AccessibilityMSGContainerSearch Auto
Message Property AccessibilityMSGDoorSearch Auto
Message Property AccessibilityMSGNPCSearch Auto
Message Property AccessibilityMSGTrapSearch Auto

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

        String[] Test = new String[2]

        Test[0] = "Test 1"
        Test[1] = "Test 2"

        Int Index = 0
			
        While Index < Test.length
            ActivateMenu.AddEntryItem(Test[Index])
            Index += 1	
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
