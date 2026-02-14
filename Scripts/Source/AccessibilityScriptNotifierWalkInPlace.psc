Scriptname AccessibilityScriptNotifierWalkInPlace extends ReferenceAlias

Static Property AccessibilityXMarkerHeadingWalkInPlace Auto
ObjectReference Property FormerPosition Auto
Sound Property AccessibilityCNDWalkInPlace Auto

Event OnInit()
    RegisterForSingleUpdate(3.0)
    FormerPosition = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeadingWalkInPlace) As ObjectReference
EndEvent

Event OnUpdate()
    Int ForwardKey = Input.GetMappedKey("Forward")
    Int BackwardKey = Input.GetMappedKey("Back")
    Int LeftwardKey = Input.GetMappedKey("Strafe Left")
    Int RightwardKey = Input.GetMappedKey("Strafe Right")
    FormerPosition.MoveTo(Game.GetPlayer())
    If Input.IsKeyPressed(ForwardKey) || Input.IsKeyPressed(BackwardKey) || Input.IsKeyPressed(LeftwardKey) || Input.IsKeyPressed(RightwardKey)
        Utility.Wait(3.0)
        If FormerPosition.GetDistance(Game.GetPlayer()) < 100
            Debug.Notification("You are walking in Place!")
            AccessibilityCNDWalkInPlace.Play(Game.GetPlayer())
        EndIf
    EndIf
    RegisterForSingleUpdate(3.0)
EndEvent