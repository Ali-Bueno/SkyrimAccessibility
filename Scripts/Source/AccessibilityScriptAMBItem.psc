Scriptname AccessibilityScriptAMBItem extends ReferenceAlias

;ToDo Sounds, Sounds, and Sounds....
;ToDo Add more Items
;ToDo Add keyword specific sounds later.


Sound Property AccessibilityAMBItemPotion Auto
Sound Property AccessibilityAMBItemWeapon Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    FindAllIngestible()
    FindAllWeapons()
    FindAllAmmo()
    FindAllArmors()
    FindAllBooks()
    FindAllKeys()
    FindAllSoulGems()
    FindAllIngredients()
    FindAllScrolls()
    FindAllMisc()
    RegisterForSingleUpdate(5.0)
EndEvent

Function FindAllIngestible()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemPotion.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllWeapons()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllAmmo()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllArmors()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllBooks()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllKeys()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllSoulGems()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllIngredients()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllScrolls()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllMisc()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction