Scriptname AccessibilityScriptNotifierWalkInPlace extends ReferenceAlias

Static Property AccessibilityXMarkerHeading_WalkInPlace Auto

Event OnInit()
    AccessibilityXMarkerHeading_WalkInPlace = Game.GetFormFromFile(0x060C0E33, "accessibility.esp") As Static
    ;RegisterForSingleUpdate(3.0)
EndEvent

Event OnUpdate()
    Int ForwardKey = Input.GetMappedKey("Forward")
    Int BackwardKey = Input.GetMappedKey("Back")
    Int LeftwardKey = Input.GetMappedKey("Strafe Left")
    Int RightwardKey = Input.GetMappedKey("Strafe Right")
    ObjectReference FormerPosition = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeading_WalkInPlace)
    If Input.IsKeyPressed(ForwardKey) || Input.IsKeyPressed(BackwardKey) || Input.IsKeyPressed(LeftwardKey) || Input.IsKeyPressed(RightwardKey)
        If FormerPosition.GetDistance(Game.GetPlayer()) < 100
            Debug.Notification("You are walking in Place!")
        EndIf
    EndIf
    RegisterForSingleUpdate(3.0)
EndEvent