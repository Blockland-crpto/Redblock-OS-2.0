'=======================================
' .bin/.com to MikeBASIC POKE converter
' compile with QuickBasic 4.5
' Paulo Valongo 26 September 2011
'=======================================

DIM FileData AS STRING * 1

INPUT "Enter file name and path to open "; InFile$
INPUT "Enter file name and path to create the POKE statements in "; OutFile$
INPUT "Enter the start address in decimal "; PokeAddr

'=============================
AskFileType:
'=============================

INPUT "Enter 1 for CRLFs in text file (WIN/DOS) or 2 for LFs only (LINUX) or 3 to exit"; FileType

IF FileType = 3 THEN GOTO finish
OrigPokeAddr = PokeAddr

OPEN InFile$ FOR BINARY AS #1
OPEN OutFile$ FOR OUTPUT AS #2

IF FileType = 1 THEN GOTO CRLF
IF FileType = 2 THEN GOTO LF
GOTO UserError

'===============================
CRLF:
'===============================

FOR x = 1 TO LOF(1)
GET #1, x, FileData
DecValue$ = STR$(ASC(FileData))
PRINT #2, "poke"; DecValue$; PokeAddr
PokeAddr = PokeAddr + 1
NEXT x

PRINT #2, "call"; OrigPokeAddr

CLOSE #1
CLOSE #2

'================================
finish:
'================================

END

'================================
UserError:
'================================

PRINT " "
PRINT "Invalid option entered"
PRINT " "
GOTO AskFileType

'================================
LF:
'================================

FOR x = 1 TO LOF(1)
GET #1, x, FileData
DecValue$ = STR$(ASC(FileData))
PRINT #2, "poke"; DecValue$; PokeAddr; CHR$(10);
PokeAddr = PokeAddr + 1
NEXT x

PRINT #2, "call"; OrigPokeAddr

CLOSE #1
CLOSE #2

GOTO finish

