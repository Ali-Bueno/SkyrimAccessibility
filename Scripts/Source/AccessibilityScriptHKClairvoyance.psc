Scriptname AccessibilityScriptHKClairvoyance extends ReferenceAlias

Spell Property AccessibilityClairvoyance Auto

Event OnInit()
    RegisterForKey(45) ;X Key
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 45
        AccessibilityClairvoyance.Cast(Game.GetPlayer())
	EndIf
EndEvent