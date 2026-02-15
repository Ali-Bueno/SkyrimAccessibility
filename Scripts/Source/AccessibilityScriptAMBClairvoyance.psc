Scriptname AccessibilityScriptAMBClairvoyance extends ReferenceAlias

Spell Property AccessibilityClairvoyance Auto
Bool Property IsAutoCastEnabled Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
    RegisterForKey(24)
EndEvent

Event OnUpdate()
    If IsAutoCastEnabled == True
        AccessibilityClairvoyance.Cast(Game.GetPlayer())
    EndIf
    RegisterForSingleUpdate(5.0) 
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 24 && !Utility.IsInMenuMode()
        IsAutoCastEnabled = !IsAutoCastEnabled
    EndIf
EndEvent