Scriptname AccessibilityScriptQuestsMQ101 extends ReferenceAlias

Quest Property AccessibilityQuests Auto
Quest Property AccessibilityQuestMQ101 Auto
Static Property AccessibilityXMarkerHeadingMQ101 Auto
ObjectReference Property AccessibilityReferenceXMarkerHeading Auto

Event OnInit()
    RegisterForSingleUpdate(1.0)
    AccessibilityReferenceXMarkerHeading = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeadingMQ101) As ObjectReference
EndEvent

Event OnUpdate()
    If AccessibilityQuestMQ101.IsObjectiveDisplayed(30)
        Utility.Wait(1.0)
        AccessibilityReferenceXMarkerHeading.MoveTo(Game.GetPlayer())
        Utility.Wait(3.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15018.0, -82548.0, 8247.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(14768.0, -83012.0, 8297.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(18.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(14442.0, -83341.0, 8681.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(3.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(14786.0, -83521.0, 8894.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(16.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15025.0, -83126.0, 9071.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(8.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15831.0, -83710.0, 8712.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(17363.0, -82853.0, 8378.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(30.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(17927.0, -79966.0, 8251.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(20.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(18580.0, -79945.0, 8415.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(19482.0, -79063.0, 8448.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(10.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(18908.0, -78033.0, 8453.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        Utility.Wait(5.0)
        AccessibilityReferenceXMarkerHeading.SetPosition(15927.0, -79342.0, 8188.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeading, 300)
        UnregisterForUpdate()
    ElseIf AccessibilityQuestMQ101.IsObjectiveDisplayed(60)
        AccessibilityQuests.SetCurrentStageID(1)
        UnregisterForUpdate()
    ElseIf (AccessibilityQuestMQ101.IsObjectiveCompleted(60) || AccessibilityQuestMQ101.IsObjectiveFailed(60))
        AccessibilityQuests.SetCurrentStageID(2)
        UnregisterForUpdate()
    Else
        RegisterForSingleUpdate(5.0)
    EndIf
EndEvent