Scriptname AccessibilityScriptInitialisation extends ObjectReference

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto
Quest Property AccessibilityMQ101 Auto

Event OnInit()
    RegisterForSingleUpdate(3.0)
    Game.ForceFirstPerson()
    AccessibilityClairvoyance = Game.GetFormFromFile(0x06023F0E, "accessibility.esp") As Spell
    AccessibilityMQ101 = Game.GetFormFromFile(0x0003372B, "Skyrim.esm") As Quest
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
    RegisterForKey(49)
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 49 && !Utility.IsInMenuMode()
		Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
	EndIf
EndEvent


Event OnUpdate()
    If AccessibilityMQ101.IsObjectiveDisplayed(30)
        Debug.Notification("Objective is 30")
        UnregisterForUpdate()
    Else
        RegisterForSingleUpdate(3.0)
    EndIf
EndEvent