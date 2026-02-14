Scriptname AccessibilityScriptAMBClairvoyance extends ReferenceAlias

Spell Property AccessibilityClairvoyance Auto

Event OnInit()
    RegisterForSingleUpdate(8.0)
EndEvent

Event OnUpdate()
    AccessibilityClairvoyance.Cast(Game.GetPlayer())
    RegisterForSingleUpdate(8.0)
EndEvent