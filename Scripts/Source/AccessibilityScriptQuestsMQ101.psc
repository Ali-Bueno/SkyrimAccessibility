Scriptname AccessibilityScriptQuestsMQ101 extends ReferenceAlias

Quest Property AccessibilityQuestMQ101 Auto
Static Property AccessibilityXMarkerHeadingMQ101 Auto
Message Property AccessibilityMSGMQ101StartSelectMenu Auto
ObjectReference Property AccessibilityReferenceXMarkerHeading Auto

Event OnInit()
    Utility.Wait(2.0)
    RegisterForSingleUpdate(1.0)
EndEvent

Event OnUpdate()
    If AccessibilityQuestMQ101.IsObjectiveDisplayed(30)
        AccessibilityReferenceXMarkerHeading = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeadingMQ101) As ObjectReference
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
        Utility.Wait(3.0)
        MQ101StartSelect()
        UnregisterForUpdate()
    Else
        RegisterForSingleUpdate(5.0)
    EndIf
EndEvent

Function MQ101StartSelect(Bool abMenu = True, Int aiButton = 0)
    While abMenu
        If aiButton != -1
            aiButton = AccessibilityMSGMQ101StartSelectMenu.Show()
            abMenu = False
            If aiButton == 0

            ElseIf aiButton == 1

            EndIf
        EndIf
    EndWhile
EndFunction