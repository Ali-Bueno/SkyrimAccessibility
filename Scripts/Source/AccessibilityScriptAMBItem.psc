Scriptname AccessibilityScriptAMBItem extends ReferenceAlias

;ToDo Sounds, Sounds, and Sounds....
;ToDo Add more Items
;ToDo Add keyword specific sounds laters.
; int Property kArmor = 26 AutoReadOnly
; int Property kBook = 27 AutoReadOnly
; int Property kIngredient = 30 AutoReadOnly
; int Property kAmmo = 42 AutoReadOnly
; int Property kKey = 45 AutoReadOnly
; int Property kNote = 48 AutoReadOnly
; int Property kSoulGem = 52 AutoReadOnly
; int Property kArrow = 64 AutoReadOnly

Sound Property AccessibilityAMBItemPotion Auto
Sound Property AccessibilityAMBItemWeapon Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    FindAllPotions()
    FindAllWeapon()
    RegisterForSingleUpdate(5.0)
EndEvent

Function FindAllPotions()
    ObjectReference[] PotionArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 3000.0)
    Int PotionIndex = 0
    While PotionIndex < PotionArray.Length
        If PotionArray[PotionIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemPotion.Play(PotionArray[PotionIndex])
        EndIf
        PotionIndex += 1
    EndWhile
EndFunction

Function FindAllWeapon()
    ObjectReference[] WeaponArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 3000.0)
    Int WeaponIndex = 0
    While WeaponIndex < WeaponArray.Length
        If WeaponArray[WeaponIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(WeaponArray[WeaponIndex])
        EndIf
        WeaponIndex += 1
    EndWhile
EndFunction