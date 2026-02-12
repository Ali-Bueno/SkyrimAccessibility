Scriptname AccessibilityScriptInitialisation extends ObjectReference

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto
Quest Property AccessibilityMQ101 Auto

Event OnInit()
    If AccessibilityMQ101.GetCurrentStageID() <= 150
        Debug.Notification("<150")
        RegisterForSingleUpdate(3.0)
    EndIf
    Game.ForceFirstPerson()
    AccessibilityClairvoyance = Game.GetFormFromFile(0x06023F0E, "accessibility.esp") As Spell
    AccessibilityMQ101 = Game.GetFormFromFile(0x0003372B, "Skyrim.esm") As Quest
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
EndEvent


Event OnUpdate()
    ;/Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
    Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
    Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
    Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())/;
    If AccessibilityMQ101.GetCurrentStageID() >= 160
        Debug.Notification("160")
        UnregisterForUpdate()
    Else
        Debug.Notification("!IsNot160")
        RegisterForSingleUpdate(3.0)
    EndIf
EndEvent