Scriptname AccessibilityScriptInitialisation extends ObjectReference

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto

Event OnInit()
    RegisterForSingleUpdate(3.0)
    Game.ForceFirstPerson()
    AccessibilityClairvoyance = Game.GetFormFromFile(0x06023F0E, "accessibility.esp") As Spell
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
    Utility.Wait(3.0)
    Game.GetPlayer().SetPosition(15584.351563, -81423.515625, 8203.262695)
EndEvent


Event OnUpdate()
    Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
    Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
    Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
    Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
    RegisterForSingleUpdate(3.0)
EndEvent