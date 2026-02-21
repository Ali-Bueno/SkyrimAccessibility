Scriptname AccessibilityScriptAMBFurniture extends ReferenceAlias

;ToDo Add levers and chains

Sound Property AccessibilityAMBFurnitureContainer Auto
Sound Property AccessibilityAMBFurnitureDoor Auto


Event OnInit()
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    FindAllContainers()
    FindAllDoors()
    RegisterForSingleUpdate(5.0)
EndEvent

Function FindAllContainers()
    ObjectReference[] ContainerArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 3000.0)
    Int ContainerIndex = 0
    While ContainerIndex < ContainerArray.Length
        If ContainerArray[ContainerIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureContainer.Play(ContainerArray[ContainerIndex])
        EndIf
        ContainerIndex += 1
    EndWhile
EndFunction

Function FindAllDoors()
    ObjectReference[] DoorArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 3000.0)
    Int DoorIndex = 0
    While DoorIndex < DoorArray.Length
        If DoorArray[DoorIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureDoor.Play(DoorArray[DoorIndex])
        EndIf
        DoorIndex += 1
    EndWhile
EndFunction
