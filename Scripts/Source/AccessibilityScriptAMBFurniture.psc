Scriptname AccessibilityScriptAMBFurniture extends ObjectReference

;ToDo Add differen souns for Doors and Containers.
;ToDo Add different sounds for Locked and Unlocked.

Sound Property AccessibilityAMBFurnitureContainer Auto


Event OnInit()
    Debug.Notification("Accessibility Ambiance Furniture Loaded")
    RegisterForSingleUpdate(5.0)
    AccessibilityAMBFurnitureContainer = Game.GetFormFromFile(0x0609D72E, "accessibility.esp") As Sound
EndEvent

Event OnUpdate()
    ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 3000.0)
    Int ContainerIndex = 0
    While ContainerIndex < ContainerArray.Length
        If ContainerArray[ContainerIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureContainer.Play(ContainerArray[ContainerIndex])
        EndIf
        ContainerIndex += 1
    EndWhile

    ObjectReference[] DoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 3000.0)
    Int DoorIndex = 0
    While DoorIndex < DoorArray.Length
        If DoorArray[DoorIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureContainer.Play(DoorArray[DoorIndex])
        EndIf
        DoorIndex += 1
    EndWhile


    RegisterForSingleUpdate(5.0)
EndEvent



