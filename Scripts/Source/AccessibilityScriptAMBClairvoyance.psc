Scriptname AccessibilityScriptAMBClairvoyance extends ReferenceAlias

Spell Property AccessibilityClairvoyance Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    AccessibilityClairvoyance.Cast(Game.GetPlayer())
    RegisterForSingleUpdate(5.0)
EndEvent