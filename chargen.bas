Randomize (Timer, 3)
DIM DICE(4)

Main:
  Cls
  GoSub Roll4d6
  STRENGTH = TOTAL
  GoSub Roll4d6
  INTELLIGENCE = TOTAL
  GoSub Roll4d6
  WISDOM = TOTAL
  GoSub Roll4d6
  DEXTERITY = TOTAL
  GoSub Roll4d6
  CONSTITUTION = TOTAL
  GoSub Roll4d6
  CHARISMA = TOTAL

  GoSub ShowStat

  Print: Print "Keep Character?"
  GoSub YesNo
  If YN = 2 GoTo Main

  Print "Choose your Race:"
  Print " 1 Dwarf"
  Print " 2 Elf"
  Print " 3 Halfling"
  Print " 4 Human"
  Input CHOICER
    If CHOICER = 1 Then RACE$ = "Dwarf"
    If CHOICER = 2 Then RACE$ = "Elf"
    If CHOICER = 3 Then RACE$ = "Halfling"
    If CHOICER = 4 Then RACE$ = "Human"
    If CHOICER = 1 Then STRENGTH = STRENGTH + 1
    If CHOICER = 1 Then CHARISMA = CHARISMA - 1
    If CHOICER = 2 Then DEXTERITY = DEXTERITY + 1
    If CHOICER = 2 Then CONSTITUTION = CONSTITUTION - 1
    If CHOICER = 3 Then DEXTERITY = DEXTERITY + 1
    If CHOICER = 3 Then STRENGTH = STRENGTH - 1

  GoSub ShowStat

  Print "Choose your Class:"
  Print " 1 Cleric"
  Print " 2 Fighter"
  Print " 3 Magic-User"
  Print " 4 Thief"
  Input CHOICEC
    If CHOICEC = 1 Then CLASS$ = "Cleric"
    If CHOICEC = 2 Then CLASS$ = "Fighter"
    If CHOICEC = 3 Then CLASS$ = "Magic-User"
    If CHOICEC = 4 Then CLASS$ = "Theif"
    If CHOICEC = 1 Then HITPOINTS = 8
    If CHOICEC = 2 Then HITPOINTS = 10
    If CHOICEC = 3 Then HITPOINTS = 4
    If CHOICEC = 4 Then HITPOINTS = 6

  DICE1 = Int(Rnd * 4) + 1
  DICE2 = Int(Rnd * 4) + 1
  DICE3 = Int(Rnd * 4) + 1
  DICE4 = Int(Rnd * 4) + 1
  DICE5 = Int(Rnd * 4) + 1
  GOLD = (DICE1 + DICE2 + DICE3 + DICE4 + DICE5) * 10

  GoSub CheckCon

  Print: Print "What is your Name"
  Input NAME$
  Print
  Print "D&D Character Sheet 1.0"
  Print "------------------------------": Print
  Print "Character Name: "; NAME$
  Print "Character Race: "; RACE$
  Print "Character Class: "; CLASS$
  Print "------------------------------"
  Print
  Print "STR: "; STRENGTH
  Print "INT: "; INTELLIGENCE
  Print "WIS: "; WISDOM
  Print "DEX: "; DEXTERITY
  Print "CON: "; CONSTITUTION
  Print "CHR: "; CHARISMA
  Print
  Print "Hit Points: "; HITPOINTS
  Print
  Print "Gold: "; GOLD
  Print "------------------------------"

  Print: Print "Save Character?"
  GoSub YesNo
  If YN = 2 GoTo FinishUp

  Open NAME$ + ".txt" For OUTPUT As #1
  Print #1,
  Print #1, "D&D Character Sheet 1.0"
  Print #1, "------------------------------": Print #1,
  Print #1, "Character Name: "; NAME$
  Print #1, "Character Race: "; RACE$
  Print #1, "Character Class: "; CLASS$
  Print #1, "------------------------------"
  Print #1,
  Print #1, "STR: "; STRENGTH
  Print #1, "INT: "; INTELLIGENCE
  Print #1, "WIS: "; WISDOM
  Print #1, "DEX: "; DEXTERITY
  Print #1, "CON: "; CONSTITUTION
  Print #1, "CHR: "; CHARISMA
  Print #1,
  Print #1, "Hit Points: "; HITPOINTS
  Print #1,
  Print #1, "Gold: "; GOLD
  Print #1, "------------------------------": Print #1,
  Print #1, "EQUIPMENT:"
  Close #1
  GoTo FinishUp

Roll4d6:
  DICE(1) = Int(Rnd * 6) + 1
  DICE(2) = Int(Rnd * 6) + 1
  DICE(3) = Int(Rnd * 6) + 1
  DICE(4) = Int(Rnd * 6) + 1

  Flips = 1
  Do
    Flips = 0
    For Count = 1 to 3
      If DICE(Count) > DICE(Count+1) Then
        Swap DICE(Count),DICE(Count+1)
        Flips = 1
      ENDIF
    Next
  Loop While Flips = 1
  TOTAL = DICE(2) + DICE(3) + DICE(4)
  Return

CheckCon:
  If CONSTITUTION = 15 Then HITPOINTS = HITPOINTS+1
  If CONSTITUTION = 16 Then HITPOINTS = HITPOINTS+2
  If CONSTITUTION = 17 Then HITPOINTS = HITPOINTS+2
  If CONSTITUTION = 18 Then HITPOINTS = HITPOINTS+2
  GoSub CheckFighter
  Return

CheckFighter:
  If CHOICEC <> 2 Then Return
  If CONSTITUTION = 17 Then HITPOINTS = HITPOINTS+1
  If CONSTITUTION = 18 Then HITPOINTS = HITPOINTS+2
  Return

ShowStat:
  Print "STR: "; STRENGTH
  Print "INT: "; INTELLIGENCE
  Print "WIS: "; WISDOM
  Print "DEX: "; DEXTERITY
  Print "CON: "; CONSTITUTION
  Print "CHR: "; CHARISMA
  Print
  Return

YesNo:
  Print "1 Yes"
  Print "2 No"
  Input YN
  Return

FinishUp:
End
