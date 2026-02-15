Scriptname AccessibilityScriptNotifierWalkInPlace extends ReferenceAlias

Static Property AccessibilityXMarkerHeadingWalkInPlace Auto
ObjectReference Property FormerPosition Auto
Sound Property AccessibilityCNDWalkInPlace Auto
Int ForwardKey
Int BackwardKey 
Int LeftwardKey 
Int RightwardKey

Event OnInit()
    RegisterForSingleUpdate(5.0)
    FormerPosition = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeadingWalkInPlace) As ObjectReference
    ForwardKey = Input.GetMappedKey("Forward")
    BackwardKey = Input.GetMappedKey("Back")
    LeftwardKey = Input.GetMappedKey("Strafe Left")
    RightwardKey = Input.GetMappedKey("Strafe Right")
EndEvent

Event OnUpdate()
    If Input.IsKeyPressed(ForwardKey) || Input.IsKeyPressed(BackwardKey) || Input.IsKeyPressed(LeftwardKey) || Input.IsKeyPressed(RightwardKey)
        FormerPosition.MoveTo(Game.GetPlayer())
        Utility.Wait(3.0)
        If FormerPosition.GetDistance(Game.GetPlayer()) < 45
            Debug.Notification("You are walking in Place!")
            AccessibilityCNDWalkInPlace.Play(Game.GetPlayer())
        EndIf
        FormerPosition.DisableNoWait()
        FormerPosition.Delete()
        RegisterForSingleUpdate(5.0)
    EndIf
EndEvent