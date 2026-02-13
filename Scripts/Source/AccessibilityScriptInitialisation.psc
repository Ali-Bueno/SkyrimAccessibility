Scriptname AccessibilityScriptInitialisation extends ReferenceAlias

;ToDo Cast AccessibilityClairvoyance on its own hotkey, to save slot for other spells.

Spell Property AccessibilityClairvoyance Auto


Event OnInit()
    Debug.Notification("Beta Test: Accessibility Mod Mk3 By Dio Kyrie Loaded")
    Game.ForceFirstPerson()
    AccessibilityClairvoyance = Game.GetFormFromFile(0x06023F0E, "accessibility.esp") As Spell
    Game.GetPlayer().EquipSpell(AccessibilityClairvoyance, 2)
    RegisterForKey(48)

EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 48
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
        Utility.Wait(3.0)
        Int ScreenshotKey = Input.GetMappedKey("Screenshot")
        Input.TapKey(ScreenshotKey)
	EndIf
EndEvent