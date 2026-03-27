Scriptname AccessibilityScriptAMBFurniture extends ReferenceAlias

;ToDo Add levers and chains

Sound Property AccessibilityAMBFurnitureContainer Auto
Sound Property AccessibilityAMBFurnitureDoor Auto

Float Property ScanRadius = 1000.0 Auto
Float Property ScanInterval = 0.5 Auto
Float Property MountScanInterval = 0.3 Auto
Float Property MinVolume = 0.3 Auto
Float Property MaxVolume = 1.0 Auto

ObjectReference CachedRefForward = None
ObjectReference CachedRefBack = None
ObjectReference CachedRefLeft = None
ObjectReference CachedRefRight = None
Sound CachedSoundForward = None
Sound CachedSoundBack = None
Sound CachedSoundLeft = None
Sound CachedSoundRight = None
Float CachedDistForward = 0.0
Float CachedDistBack = 0.0
Float CachedDistLeft = 0.0
Float CachedDistRight = 0.0

Int LastSoundInstance = 0
Bool IsMounted = False

Event OnInit()
    RegisterPlayerFootsteps()
    RegisterForSingleUpdate(0.1)
EndEvent

Event OnPlayerLoadGame()
    RegisterPlayerFootsteps()
    RegisterForSingleUpdate(0.1)
EndEvent

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
        Int MoveDir = GetMovementDirection()
        If MoveDir != -1
            PlayCached(MoveDir)
        EndIf
        RegisterForSingleUpdate(MountScanInterval)
    Else
        RegisterForSingleUpdate(ScanInterval)
    EndIf
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
    Int MoveDir = GetMovementDirection()
    PlayCached(MoveDir)
    RegisterPlayerFootsteps()
EndEvent

Function ScanAll(Actor Player)
    CachedRefForward = None
    CachedRefBack = None
    CachedRefLeft = None
    CachedRefRight = None
    CachedDistForward = ScanRadius
    CachedDistBack = ScanRadius
    CachedDistLeft = ScanRadius
    CachedDistRight = ScanRadius

    ScanType(Player, 28, AccessibilityAMBFurnitureContainer)
    ScanType(Player, 29, AccessibilityAMBFurnitureDoor)
EndFunction

Function ScanType(Actor Player, Int TypeID, Sound TypeSound)
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Player, TypeID, ScanRadius)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Float Dist = Player.GetDistance(Array[Index])
            Float Angle = Player.GetHeadingAngle(Array[Index])

            If Angle >= -90.0 && Angle <= 90.0
                If Dist < CachedDistForward
                    CachedDistForward = Dist
                    CachedRefForward = Array[Index]
                    CachedSoundForward = TypeSound
                EndIf
            EndIf

            If Angle < -90.0 || Angle > 90.0
                If Dist < CachedDistBack
                    CachedDistBack = Dist
                    CachedRefBack = Array[Index]
                    CachedSoundBack = TypeSound
                EndIf
            EndIf

            If Angle < 0.0
                If Dist < CachedDistLeft
                    CachedDistLeft = Dist
                    CachedRefLeft = Array[Index]
                    CachedSoundLeft = TypeSound
                EndIf
            EndIf

            If Angle > 0.0
                If Dist < CachedDistRight
                    CachedDistRight = Dist
                    CachedRefRight = Array[Index]
                    CachedSoundRight = TypeSound
                EndIf
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction

Function PlayCached(Int MoveDir)
    ObjectReference PlayRef = None
    Sound PlaySound = None
    Float PlayDist = ScanRadius

    If MoveDir == 0
        PlayRef = CachedRefForward
        PlaySound = CachedSoundForward
        PlayDist = CachedDistForward
    ElseIf MoveDir == 1
        PlayRef = CachedRefBack
        PlaySound = CachedSoundBack
        PlayDist = CachedDistBack
    ElseIf MoveDir == 2
        PlayRef = CachedRefLeft
        PlaySound = CachedSoundLeft
        PlayDist = CachedDistLeft
    ElseIf MoveDir == 3
        PlayRef = CachedRefRight
        PlaySound = CachedSoundRight
        PlayDist = CachedDistRight
    EndIf

    If LastSoundInstance != 0
        Sound.StopInstance(LastSoundInstance)
    EndIf

    If PlayRef != None
        LastSoundInstance = PlaySound.Play(PlayRef)
        Sound.SetInstanceVolume(LastSoundInstance, GetVolumeByDistance(PlayDist))
    Else
        LastSoundInstance = 0
    EndIf
EndFunction

Float Function GetVolumeByDistance(Float Distance)
    Float Ratio = Distance / ScanRadius
    Return MaxVolume - (Ratio * (MaxVolume - MinVolume))
EndFunction

Int Function GetMovementDirection()
    Bool Forward = Input.IsKeyPressed(Input.GetMappedKey("Forward"))
    Bool Back = Input.IsKeyPressed(Input.GetMappedKey("Back"))
    Bool Left = Input.IsKeyPressed(Input.GetMappedKey("Strafe Left"))
    Bool Right = Input.IsKeyPressed(Input.GetMappedKey("Strafe Right"))

    If Forward
        Return 0
    ElseIf Back
        Return 1
    ElseIf Left
        Return 2
    ElseIf Right
        Return 3
    EndIf
    Return -1
EndFunction
