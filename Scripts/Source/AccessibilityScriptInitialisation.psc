Scriptname AccessibilityScriptInitialisation extends ReferenceAlias

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto
Quest Property AccessibilityMQ101 Auto
Static Property AccessibilityXMarkerHeading Auto

Event OnInit()
    Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
    RegisterForSingleUpdate(3.0)
    Game.ForceFirstPerson()
    AccessibilityClairvoyance = Game.GetFormFromFile(0x06023F0E, "accessibility.esp") As Spell
    AccessibilityXMarkerHeading = Game.GetFormFromFile(0x060C0E33, "accessibility.esp") As Static
    AccessibilityMQ101 = Game.GetFormFromFile(0x0003372B, "Skyrim.esm") As Quest
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
    RegisterForKey(49)
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 49
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
        Utility.Wait(3.0)
        Int ScreenshotKey = Input.GetMappedKey("Screenshot")
        Input.TapKey(ScreenshotKey)
	EndIf
EndEvent


Event OnUpdate()
    If AccessibilityMQ101.IsObjectiveDisplayed(30)
        Debug.Notification("Objective is 30")
        Utility.Wait(1.0)
        ObjectReference AccessibilityReferenceXMarkerHeading = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeading)
        Utility.Wait(3.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15018.0, -82548.0, 8247.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(3.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(14768.0, -83012.0, 8297.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(18.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(14786.0, -83521.0, 8894.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(23.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15831.0, -83710.0, 8712.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(3.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(17363.0, -82853.0, 8378.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(20.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(17927.0, -79966.0, 8251.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(19482.0, -79063.0, 8448.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15927.0, -79342.0, 8188.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)

        UnregisterForUpdate()
    Else
        RegisterForSingleUpdate(3.0)
    EndIf
EndEvent