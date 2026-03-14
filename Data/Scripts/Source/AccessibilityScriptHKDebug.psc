Scriptname AccessibilityScriptHKDebug extends ReferenceAlias

Event OnInit()
    RegisterForKey(38) ;L Key
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 38 && !Utility.IsInMenuMode()
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
        Utility.Wait(3.0)
        Int ScreenshotKey = Input.GetMappedKey("Screenshot")
        Input.TapKey(ScreenshotKey)
	EndIf
EndEvent