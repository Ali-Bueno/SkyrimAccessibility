Scriptname AccessibilityScriptRadar extends ReferenceAlias

Sound RadarDoor = None
Sound RadarExit = None
Sound RadarInteractable = None
Sound RadarWall = None

Float Property ScanRadius = 1000.0 Auto
Float Property ScanInterval = 0.5 Auto
Float Property MountScanInterval = 0.3 Auto
Float Property RadarVolume = 0.8 Auto

; Detection types: 0=None, 1=Wall, 2=Interactable, 3=Door, 4=Exit
Int DetectedForward = 0
Int DetectedLeft = 0
Int DetectedRight = 0
ObjectReference RefForward = None
ObjectReference RefLeft = None
ObjectReference RefRight = None

; Panning references (nearest static in each direction, used as sound source)
ObjectReference PanRefForward = None
ObjectReference PanRefLeft = None
ObjectReference PanRefRight = None

Int LastForward = 0
Int LastLeft = 0
Int LastRight = 0

Int SoundInstanceForward = 0
Int SoundInstanceLeft = 0
Int SoundInstanceRight = 0

Bool IsMounted = False

Event OnInit()
    LoadSounds()
    RegisterPlayerFootsteps()
    RegisterForSingleUpdate(0.1)
EndEvent

Event OnPlayerLoadGame()
    LoadSounds()
    RegisterPlayerFootsteps()
    RegisterForSingleUpdate(0.1)
EndEvent

Function LoadSounds()
    RadarDoor = Game.GetFormFromFile(0x0613A6C1, "accessibility.esp") as Sound
    RadarExit = Game.GetFormFromFile(0x0613A6C2, "accessibility.esp") as Sound
    RadarInteractable = Game.GetFormFromFile(0x0613A6C3, "accessibility.esp") as Sound
    RadarWall = Game.GetFormFromFile(0x0613A6C4, "accessibility.esp") as Sound
EndFunction

Function RegisterPlayerFootsteps()
    Actor Player = Game.GetPlayer()
    RegisterForAnimationEvent(Player, "FootLeft")
    RegisterForAnimationEvent(Player, "FootRight")
EndFunction

Event OnUpdate()
    Actor Player = Game.GetPlayer()
    Bool CurrentlyMounted = Player.IsOnMount()

    If CurrentlyMounted && !IsMounted
        IsMounted = True
    ElseIf !CurrentlyMounted && IsMounted
        IsMounted = False
        RegisterPlayerFootsteps()
    EndIf

    ScanAll(Player)

    If IsMounted
        NotifyChanges()
    EndIf

    If IsMounted
        RegisterForSingleUpdate(MountScanInterval)
    Else
        RegisterForSingleUpdate(ScanInterval)
    EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
    NotifyChanges()
    RegisterPlayerFootsteps()
EndEvent

; ===== SCANNING =====

Function ScanAll(Actor Player)
    DetectedForward = 0
    DetectedLeft = 0
    DetectedRight = 0
    RefForward = None
    RefLeft = None
    RefRight = None
    PanRefForward = None
    PanRefLeft = None
    PanRefRight = None

    ; Find nearby statics for panning (sound source references)
    FindPanReferences(Player)

    ; Raycast: fills all directions with wall or exit
    ApplyRaycast()

    ; Doors override wall/exit
    ScanDoors(Player)

    ; Interactables only fill empty slots
    ScanFormType(Player, 24)
    ScanFormType(Player, 28)
EndFunction

Function FindPanReferences(Actor Player)
    ObjectReference[] Statics = PO3_SKSEFunctions.FindAllReferencesOfFormType(Player, 34, 500.0)
    Float DistF = 500.0
    Float DistL = 500.0
    Float DistR = 500.0
    Int Index = 0
    While Index < Statics.Length
        If Statics[Index] != None
            Float Angle = Player.GetHeadingAngle(Statics[Index])
            Float Dist = Player.GetDistance(Statics[Index])
            Int Dir = GetDirection(Angle)
            If Dir == 0 && Dist < DistF
                PanRefForward = Statics[Index]
                DistF = Dist
            ElseIf Dir == 1 && Dist < DistL
                PanRefLeft = Statics[Index]
                DistL = Dist
            ElseIf Dir == 2 && Dist < DistR
                PanRefRight = Statics[Index]
                DistR = Dist
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction

Function ApplyRaycast()
    Float[] Hits = AccessibilityRadarNative.RadarRayCast(ScanRadius)
    If Hits.Length < 3
        Return
    EndIf

    If Hits[0] >= 0.0
        DetectedForward = 1
    Else
        DetectedForward = 4
    EndIf

    If Hits[1] >= 0.0
        DetectedLeft = 1
    Else
        DetectedLeft = 4
    EndIf

    If Hits[2] >= 0.0
        DetectedRight = 1
    Else
        DetectedRight = 4
    EndIf
EndFunction

Function ScanDoors(Actor Player)
    ObjectReference[] Doors = PO3_SKSEFunctions.FindAllReferencesOfFormType(Player, 29, ScanRadius)
    Int Index = 0
    While Index < Doors.Length
        If Doors[Index] != None
            Float Angle = Player.GetHeadingAngle(Doors[Index])
            Int Dir = GetDirection(Angle)
            If Dir >= 0
                Int DetectType = 3
                If PO3_SKSEFunctions.IsLoadDoor(Doors[Index])
                    DetectType = 4
                EndIf
                ForceDirection(Dir, DetectType, Doors[Index])
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction

Function ScanFormType(Actor Player, Int TypeID)
    ObjectReference[] Refs = PO3_SKSEFunctions.FindAllReferencesOfFormType(Player, TypeID, ScanRadius)
    Int Index = 0
    While Index < Refs.Length
        If Refs[Index] != None
            Float Angle = Player.GetHeadingAngle(Refs[Index])
            Int Dir = GetDirection(Angle)
            If Dir >= 0
                FillEmptyDirection(Dir, 2, Refs[Index])
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction

; ===== DIRECTION =====

Int Function GetDirection(Float Angle)
    If Angle >= -45.0 && Angle <= 45.0
        Return 0
    ElseIf Angle < -45.0 && Angle >= -135.0
        Return 1
    ElseIf Angle > 45.0 && Angle <= 135.0
        Return 2
    EndIf
    Return -1
EndFunction

Function ForceDirection(Int Dir, Int DetectType, ObjectReference Ref)
    If Dir == 0
        DetectedForward = DetectType
        RefForward = Ref
    ElseIf Dir == 1
        DetectedLeft = DetectType
        RefLeft = Ref
    ElseIf Dir == 2
        DetectedRight = DetectType
        RefRight = Ref
    EndIf
EndFunction

Function FillEmptyDirection(Int Dir, Int DetectType, ObjectReference Ref)
    If Dir == 0 && DetectedForward == 0
        DetectedForward = DetectType
        RefForward = Ref
    ElseIf Dir == 1 && DetectedLeft == 0
        DetectedLeft = DetectType
        RefLeft = Ref
    ElseIf Dir == 2 && DetectedRight == 0
        DetectedRight = DetectType
        RefRight = Ref
    EndIf
EndFunction

; ===== NOTIFICATION =====

Function NotifyChanges()
    If DetectedForward != LastForward
        PlayRadarDirection(0, DetectedForward, RefForward)
        LastForward = DetectedForward
    EndIf
    If DetectedLeft != LastLeft
        PlayRadarDirection(1, DetectedLeft, RefLeft)
        LastLeft = DetectedLeft
    EndIf
    If DetectedRight != LastRight
        PlayRadarDirection(2, DetectedRight, RefRight)
        LastRight = DetectedRight
    EndIf
EndFunction

Function PlayRadarDirection(Int Dir, Int DetectType, ObjectReference Ref)
    If Dir == 0 && SoundInstanceForward != 0
        Sound.StopInstance(SoundInstanceForward)
        SoundInstanceForward = 0
    ElseIf Dir == 1 && SoundInstanceLeft != 0
        Sound.StopInstance(SoundInstanceLeft)
        SoundInstanceLeft = 0
    ElseIf Dir == 2 && SoundInstanceRight != 0
        Sound.StopInstance(SoundInstanceRight)
        SoundInstanceRight = 0
    EndIf

    Sound PlaySound = GetSoundForType(DetectType)
    If PlaySound == None
        Return
    EndIf

    ; Get the best reference for 3D panning
    ObjectReference PlayRef = Ref
    If PlayRef == None
        ; Wall/Exit: use nearest static in that direction for panning
        If Dir == 0
            PlayRef = PanRefForward
        ElseIf Dir == 1
            PlayRef = PanRefLeft
        ElseIf Dir == 2
            PlayRef = PanRefRight
        EndIf
    EndIf
    If PlayRef == None
        PlayRef = Game.GetPlayer() as ObjectReference
    EndIf

    Int Instance = PlaySound.Play(PlayRef)
    Sound.SetInstanceVolume(Instance, RadarVolume)

    If Dir == 0
        SoundInstanceForward = Instance
    ElseIf Dir == 1
        SoundInstanceLeft = Instance
    ElseIf Dir == 2
        SoundInstanceRight = Instance
    EndIf
EndFunction

Sound Function GetSoundForType(Int DetectType)
    If DetectType == 1
        Return RadarWall
    ElseIf DetectType == 2
        Return RadarInteractable
    ElseIf DetectType == 3
        Return RadarDoor
    ElseIf DetectType == 4
        Return RadarExit
    EndIf
    Return None
EndFunction
