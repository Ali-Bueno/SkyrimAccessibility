Scriptname AccessibilityScriptHKDebug extends ReferenceAlias

Int ScreenshotKey

Event OnInit()
    RegisterForKey(38) ;L Key
    ScreenshotKey = Input.GetMappedKey("Screenshot")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 38
        Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
        Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
        Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
        Utility.Wait(3.0)
        Input.TapKey(ScreenshotKey)
	EndIf
EndEvent