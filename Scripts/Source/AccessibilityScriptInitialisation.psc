Scriptname AccessibilityScriptInitialisation extends ObjectReference

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto

Event OnInit()
    RegisterForKey(49)
    Game.ForceFirstPerson()
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
EndEvent


Event OnKeyDown(Int KeyCode)
    If KeyCode == 49 && !Utility.IsInMenuMode();N Key Shows Debug Info
        Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
    EndIf
EndEvent