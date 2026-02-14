Scriptname AccessibilityScriptAMBItem extends ObjectReference

;ToDo Sounds, Sounds, and Sounds....
;ToDo Add more Items

Sound Property AccessibilityAMBItemPotion Auto
Sound Property AccessibilityAMBItemSword Auto

Keyword Property VendorItemPotion Auto
Keyword Property VendorItemPoison Auto
Keyword Property WeapTypeDagger Auto
Keyword Property WeapTypeSword Auto
Keyword Property WeapTypeGreatSword Auto
Keyword Property WeapTypeWarAxe Auto
Keyword Property WeapTypeBattleAxe Auto
Keyword Property WeapTypeMace Auto
Keyword Property WeapTypeWarHammer Auto
Keyword Property WeapTypeBow Auto
Keyword Property WeapTypeStaff Auto

Event OnInit()
    Debug.Notification("Accessibility Ambiance Item Loaded")
    RegisterForSingleUpdate(5.0)
    AccessibilityAMBItemPotion = Game.GetFormFromFile(0x0609862C, "accessibility.esp") As Sound
    AccessibilityAMBItemSword = Game.GetFormFromFile(0x060DA337, "accessibility.esp") As Sound
    VendorItemPotion = Game.GetFormFromFile(0x0008CDEC, "Skyrim.esm") As Keyword
    WeapTypeDagger = Game.GetFormFromFile(0x0001E713, "Skyrim.esm") As Keyword
    WeapTypeSword = Game.GetFormFromFile(0x0001E711, "Skyrim.esm") As Keyword
    WeapTypeGreatSword = Game.GetFormFromFile(0x0006D931, "Skyrim.esm") As Keyword
    WeapTypeWarAxe = Game.GetFormFromFile(0x0001E712, "Skyrim.esm") As Keyword
    WeapTypeBattleAxe = Game.GetFormFromFile(0x0006D932, "Skyrim.esm") As Keyword
    WeapTypeMace = Game.GetFormFromFile(0x0001E714, "Skyrim.esm") As Keyword
    WeapTypeWarHammer = Game.GetFormFromFile(0x0006D930, "Skyrim.esm") As Keyword
    WeapTypeBow = Game.GetFormFromFile(0x0001E715, "Skyrim.esm") As Keyword
    WeapTypeStaff = Game.GetFormFromFile(0x0001E716, "Skyrim.esm") As Keyword
EndEvent

Event OnUpdate()
    ObjectReference[] PotionArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), VendorItemPotion, 3000.0, false)
    Int PotionIndex = 0
    While PotionIndex < PotionArray.Length
        If PotionArray[PotionIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemPotion.Play(PotionArray[PotionIndex])
        EndIf
        PotionIndex += 1
    EndWhile

    ObjectReference[] DaggerArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeDagger, 3000.0, false)
    Int DaggerIndex = 0
    While DaggerIndex < DaggerArray.Length
        If DaggerArray[DaggerIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(DaggerArray[DaggerIndex])
        EndIf
        DaggerIndex += 1
    EndWhile

    ObjectReference[] SwordArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeSword, 3000.0, false)
    Int SwordIndex = 0
    While SwordIndex < SwordArray.Length
        If SwordArray[SwordIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(SwordArray[SwordIndex])
        EndIf
        SwordIndex += 1
    EndWhile

    ObjectReference[] GreatSwordArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeGreatSword, 3000.0, false)
    Int GreatSwordIndex = 0
    While GreatSwordIndex < GreatSwordArray.Length
        If GreatSwordArray[GreatSwordIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(GreatSwordArray[GreatSwordIndex])
        EndIf
        GreatSwordIndex += 1
    EndWhile

    ObjectReference[] WarAxeArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeWarAxe, 3000.0, false)
    Int WarAxeIndex = 0
    While WarAxeIndex < WarAxeArray.Length
        If WarAxeArray[WarAxeIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(WarAxeArray[WarAxeIndex])
        EndIf
        WarAxeIndex += 1
    EndWhile

    ObjectReference[] BattleAxeArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeBattleAxe, 3000.0, false)
    Int BattleAxeIndex = 0
    While BattleAxeIndex < BattleAxeArray.Length
        If BattleAxeArray[BattleAxeIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(BattleAxeArray[BattleAxeIndex])
        EndIf
        BattleAxeIndex += 1
    EndWhile

    ObjectReference[] MaceArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeMace, 3000.0, false)
    Int MaceIndex = 0
    While MaceIndex < MaceArray.Length
        If MaceArray[MaceIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(MaceArray[MaceIndex])
        EndIf
        MaceIndex += 1
    EndWhile

    ObjectReference[] WarHammerArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeWarHammer, 3000.0, false)
    Int WarHammerIndex = 0
    While WarHammerIndex < WarHammerArray.Length
        If WarHammerArray[WarHammerIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(WarHammerArray[WarHammerIndex])
        EndIf
        WarHammerIndex += 1
    EndWhile

    ObjectReference[] BowArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeBow, 3000.0, false)
    Int BowIndex = 0
    While BowIndex < BowArray.Length
        If BowArray[BowIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(BowArray[BowIndex])
        EndIf
        BowIndex += 1
    EndWhile

    ObjectReference[] StaffArray = PO3_SKSEFunctions.FindAllReferencesWithKeyword(Game.GetPlayer(), WeapTypeStaff, 3000.0, false)
    Int StaffIndex = 0
    While StaffIndex < StaffArray.Length
        If StaffArray[StaffIndex] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSword.Play(StaffArray[StaffIndex])
        EndIf
        StaffIndex += 1
    EndWhile


    RegisterForSingleUpdate(5.0)
EndEvent



