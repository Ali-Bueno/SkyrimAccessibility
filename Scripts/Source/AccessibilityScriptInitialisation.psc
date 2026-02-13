Scriptname AccessibilityScriptInitialisation extends ObjectReference

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto
Quest Property AccessibilityMQ101 Auto
Static Property AccessibilityXMarkerHeading Auto

Event OnInit()
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
		Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
	EndIf
EndEvent


Event OnUpdate()
    If AccessibilityMQ101.IsObjectiveDisplayed(30)
        Debug.Notification("Objective is 30")
        Utility.Wait(1.0)
        ObjectReference AccessibilityReferenceXMarkerHeading = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeading)
        AccessibilityReferenceXMarkerHeading.SetPosition(14768.87, -83012.77, 8297.52)
        Utility.Wait(1.0)
        Game.GetPlayer().MoveTo(AccessibilityReferenceXMarkerHeading)
        UnregisterForUpdate()
    Else
        RegisterForSingleUpdate(3.0)
    EndIf
EndEvent

;/
Pos0 5 Sec
Pos1 15 Sec
x14768.87
y-83012.77
z8297.52

Pos2 5 Sec
x15092.56
y-83016.23
z9065.50

Pos3 3 Sec
x15607.18
y-83660.95
z8712.43

Pos4 20 Sec
x17363.14
y-82853.16
z8378.24

Pos5 5 Sec
x17927.80
y-79966.93
z8251.88

Pos6 5 Sec
x19482.38
y-79063.49
z8448.38

Pos7
x15927.17
y-79342.80
z8188.85
/;