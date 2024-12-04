; Rough disassembly of SwordQuest Earthworld (NTSC)
; By Omegamatrix
;
;
;
; This game has a mystery! The final clue was labeled "21   1" in the data tables which
; means you should be able go to page 21 of the comic and look at panel 1. There is nothing
; there though, and the real last clue appears on page 47 panel 5. The rom corrects itself
; in a different spot so that the "47   5" clue does appear and not the "21   1". Was the
; the original clue meant to appear on page 21, panel 1?
;
;
;
; useful link for the NTSC solution:
; http://yosemite-sam.net/Solutions/Swordquest/Earth.htm
;
;
;---------------------------------------------------------------------------------------------------
;
;                          TOURNAMENT CART SOLUTION
;
; Useful links to the Earthworld tournament cart solution. A copy of this have never resurfaced,
; and the rom might be lost forever.
;
; http://www.digitpress.com/library/interviews/interview_john-michael_battaglia.html
; http://www.galileoii.com/portfolio_samples/video_game_manuals/earthworld_playoff/earthworld_answers.html
;
; In case the link above ever becomes invalid, the solution to the Eartworld Tournamnet is below:
;
;
;
; Level 1
; -------
; Walk into the Leo room
;
; Level 2
; -------
; Leather Armor in Cancer room
;
; Level 3
; -------
; Grappling Hook in Virgo room
;
; Level 4
; -------
; Ring in Sagittarius room
;
; Level 5
; -------
; Lamp in Capricorn room
;
; Level 6
; -------
; Amulet in Gemini room
;
; Level 7
; -------
; Talisman of Passage in Leo room
;
; Level 8
; -------
; Key in Aries room
; Necklace in Aries room
;
; Level 9
; -------
; Short Sword in Virgo room
; Shoes of Stealth in Gemini room
; Dagger in Sagittarius room
;
; Level 10
; --------
; Cloak of Invisibilty in Aquarius room
; Rope in Aquarius room
; Water in Aquarius room
; Shoes of Stealth in Aquarius room
;
; Level 11
; --------
; Warrior's Sword in Pisces room
;
;--------------------------------------------------------------------------------------------------
;
;                          PAL SOLUTION
;
; Below is what I believe to be the solution to the PAL version of Swordquest Earthworld. I used my
; NTSC disassembly to figure this out, but I have never tried the solution to see if it actually works...
;
; This solution is very similar to the tournament cart, and is mostly likely built starting with the
; torunament cart code.
;
;
;
; Level 1
; -------
; Walk into the Scorpio room
;
; Level 2
; -------
; Leather Armor in Saggitarius room
;
; Level 3
; -------
; Grappling Hook in Aries room
;
; Level 4
; -------
; Ring in Scorpio room
; Necklace in Scorpio room
;
; Level 5
; -------
; Lamp in Aquarius room
; Water in Capricorn room
;
; Level 6
; -------
; Amulet in Cancer room
; Necklace in Cancer room
;
; Level 7
; -------
; Talisman of Passage in Leo room
; Food in Cancer room
;
; Level 8
; -------
; Key in Taurus room
; Leather Armor in Taurus room
;
; Level 9
; -------
; Short Sword in Gemini room
; Shoes of Stealth in Virgo room
; Dagger in Sagittarius room
;
; Level 10
; --------
; Cloak of Invisibilty in Libra room
; Rope in Libra room
; Water in Libra room
; Shoes of Stealth in Libra room
;
; Level 11
; --------
; Warrior's Sword in Pisces room
;
;
;--------------------------------------------------------------------------------------------------
; SwordQuest Earthworld (NTSC) configuration files for Distella:
;
; SQ1.cfg contents:
;
;      ORG D000
;      CODE D000 D319
;      GFX D31A D32D
;      CODE D32E D5B7
;      GFX D5B8 D5EE
;      CODE D5EF D7BA
;      GFX D7BB D7C6
;      CODE D7C7 D833
;      GFX D834 DDB0
;      CODE DDB1 DDFB
;      GFX DDFC DFC4
;      CODE DFC5 DFE7
;      GFX DFE8 DFE9
;      CODE DFEA DFF7
;      GFX DFF8 DFFF
;
; SQ2.cfg contents:
;
;      ORG F000
;      CODE F000 F269
;      GFX F26A F3DD
;      CODE F3DE F55F
;      GFX F560 F5D6
;      CODE F5D7 F766
;      GFX F767 F77E
;      CODE F77F F88F
;      GFX F890 F8CB
;      CODE F8CC FA57
;      GFX FA58 FAB7
;      CODE FAB8 FABA
;      GFX FABB FADB
;      CODE FADC FBC8
;      GFX FBC9 FCC9
;      CODE FCCA FD15
;      GFX FD16 FFE9
;      CODE FFEA FFF7
;      GFX FFF8 FFFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
NUSIZ0  =  $04
NUSIZ1  =  $05
COLUP0  =  $06
COLUP1  =  $07
COLUPF  =  $08
COLUBK  =  $09
CTRLPF  =  $0A
REFP0   =  $0B
REFP1   =  $0C
PF0     =  $0D
PF1     =  $0E
PF2     =  $0F
RESP0   =  $10
RESP1   =  $11
AUDC0   =  $15
AUDC1   =  $16
AUDF0   =  $17
AUDF1   =  $18
AUDV0   =  $19
AUDV1   =  $1A
GRP0    =  $1B
GRP1    =  $1C
ENAM0   =  $1D
ENAM1   =  $1E
ENABL   =  $1F
HMP0    =  $20
HMP1    =  $21
VDELP0  =  $25
VDELP1  =  $26
HMOVE   =  $2A
HMCLR   =  $2B
CXCLR   =  $2C
CXP0FB  =  $32
CXPPMM  =  $37
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      USER CONSTANTS
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BANK_0      =  $FFF8
BANK_1      =  $FFF9

;music
KILL_VOL_TONE = $00
KILL_FREQ     = $00
FREE_BYTE     = $00
STOP_MUSIC    = $FF

;colors
BLACK       = $00
BLUE        = $8B
BROWN       = $2A
FLESH       = $3C
GREEN       = $C4
GREENB      = $DA
GREY        = $04
OCHRE       = $F8
ORANGE      = $34
PURPLE      = $66
RED         = $46
YELLOW      = $1A

;room numbers
VIRGO             = 0
LEO               = 1
CANCER            = 2
GEMINI            = 3
TAURUS            = 4
ARIES             = 5
PISCES            = 6
AQUARIUS          = 7
CAPRICORN         = 8
SAGITTARIUS       = 9
SCORPIO           = 10
LIBRA             = 11
OBJ_CARRIED       = 15

;firebutton actions
SAGITTARIUS_SPEARS  = 7
LEO_WATERFALL       = 8
TAURUS_HORNS        = 9
AQUARIAN_RAPIDS     = 6
ZODIAC_CHAMBER      = 2

;items                    ;reversed, as stored in ram...
KEY               = $00   ;$0F
ROPE              = $01   ;$0E
AMULET            = $02   ;$0D
LAMP              = $03   ;$0C
CLOAK             = $04   ;$0B
SHOES             = $05   ;$0A
DAGGER            = $06   ;$09
LEATHER_ARMOR     = $07   ;$08
WATER             = $08   ;$07
TALISMAN          = $09   ;$06
RING              = $0A   ;$05
NECKLACE          = $0B   ;$04
WARRIORS_SWORD    = $0C   ;$03
SHORT_SWORD       = $0D   ;$02
GRAPPLING_HOOK    = $0E   ;$01
FOOD              = $0F   ;$00
NOTHING_HELD      = $10

;clues
CLUE1___16_4   = 0 ;  "SPIRE" (hidden in the cliff wall)
CLUE2____8_4   = 1 ;  "SEARCH" (hidden in the pillar)
CLUE3___25_6   = 2 ;  "THE" (hidden in the cliff wall)
CLUE4___13_3   = 3 ;  "QUEST" (hidden in the vase)
CLUE5___f__d   = 4 ;  - Food, Dagger... (supposedly this is a clue for FireWorld)
CLUE6___17_3   = 5 ;  "TOWER" (hidden in the cliff wall)
CLUE7___37_5   = 6 ;  "TALISMAN" (hidden in the caption bubble)
CLUE8___15_4   = 7 ;  "GOLD" (hidden in Torr's hair)
CLUE9____5_3   = 8 ;  "IN" (hidden in the floor)
CLUE10__27_2   = 9 ;  "ESPIED" (written in the grass)
CLUE11__21_1   = 10;  - there is nothing in the comic on this page. The final word is
                   ;  "FOUND" which appears on page 47, panel 5 hidden in the column.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      RIOT RAM
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG.U RIOT_RAM
       ORG $80

ram_80             ds 1  ; x6
ram_81             ds 1  ; x24
ram_82             ds 1  ; x20
ram_83             ds 1  ; x16
roomNum            ds 1  ; x16  $84
itemsCarried       ds 6  ; x13  $85-$8A
itemsZodiacChamber ds 8  ; x14  $8B-$92
frameCounter       ds 1  ; x11  $93
ram_94             ds 1  ; x7
ram_95             ds 1  ; x4
ram_96             ds 1  ; x3
ram_97             ds 1  ; x10
ram_98             ds 1  ; x1
ram_99             ds 1  ; x4
ram_9A             ds 1  ; x1
ram_9B             ds 1  ; x4
ram_9C             ds 1  ; x1
ram_9D             ds 1  ; x4
ram_9E             ds 1  ; x1
ram_9F             ds 1  ; x5
ram_A0             ds 1  ; x2
ram_A1             ds 1  ; x4
ram_A2             ds 1  ; x1
ram_A3             ds 1  ; x16
ram_A4             ds 1  ; x5
ram_A5             ds 1  ; x2
saveP0Joy          ds 1  ; x4
ram_A7             ds 1  ; x6
ram_A8             ds 1  ; x5
ram_A9             ds 1  ; x5
ram_AA             ds 1  ; x6
ram_AB             ds 1  ; x3
ram_AC             ds 1  ; x6
ram_AD             ds 1  ; x15
ram_AE             ds 1  ; x38
ram_AF             ds 1  ; x31
ram_B0             ds 1  ; x27
ram_B1             ds 1  ; x26
ram_B2             ds 1  ; x13
ram_B3             ds 1  ; x19
ram_B4             ds 1  ; x4
ram_B5             ds 1  ; x7
ram_B6             ds 1  ; x12
ram_B7             ds 1  ; x3
ram_B8             ds 1  ; x6
ram_B9             ds 1  ; x3
ram_BA             ds 1  ; x5
ram_BB             ds 5  ; x5
ram_C0             ds 1  ; x5
ram_C1             ds 1  ; x2
ram_C2             ds 1  ; x3
ram_C3             ds 1  ; x5
ram_C4             ds 1  ; x8
ram_C5             ds 1  ; x11
ram_C6             ds 1  ; x6
ram_C7             ds 2  ; x3
ram_C9             ds 7  ; x5
ram_D0             ds 1  ; x2
ram_D1             ds 13 ; x3
ram_DE             ds 1  ; x13
ram_DF             ds 12 ; x2
ram_EB             ds 1  ; x7
ram_EC             ds 1  ; x3
joyDebouncer       ds 1  ; x2   $ED
raftLevel          ds 1  ; x10  $EE
ram_EF             ds 1  ; x5
ram_F0             ds 1  ; x3
ram_F1             ds 1  ; x4
saveJoy            ds 1  ; x3   $F2
ram_F3             ds 1  ; x2
ram_F4             ds 3  ; x3
ram_F7             ds 3  ; x2
ram_FA             ds 6  ; x9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 0
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       SEG CODE

       ORG $0000,0
      RORG $D000

START_0:
    lda    #<START_1             ; 2
    sta    ram_81                ; 3
    lda    #>START_1             ; 2
    sta    ram_82                ; 3
    jmp    LDFF2                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquarian Rapids
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VB_AquaRapids:  ; indirect jump
    lda    #<LD181               ; 2
    sta    ram_EF                ; 3
    lda    #>LD181               ; 2
    sta    ram_F0                ; 3
    lda    joyDebouncer          ; 3
    cmp    #$FF                  ; 2   has joystick been released?
    bne    LD027                 ; 2³  - no
    lda    SWCHA                 ; 4   check joystick,
    cmp    #$FF                  ; 2   has it been pressed?
    beq    LD027                 ; 2³  - no
    sta    saveJoy               ; 3   - yes
    lda    #$01                  ; 2
    jmp    LD02C                 ; 3

LD027:
    ldx    ram_F1                ; 3
    lda    ChooseNextSeqManGfx,X ; 4
LD02C:
    sta    ram_F1                ; 3
    cmp    #$08                  ; 2
    bne    LD053                 ; 2³
    ldy    raftLevel             ; 3
    iny                          ; 2
    sty    AUDF0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDC0                 ; 3
    lda    #$0C                  ; 2
    sta    AUDV0                 ; 3
    lda    saveJoy               ; 3
    and    #$20                  ; 2   Down pressed?
    bne    LD04B                 ; 2³  - no
    dec    raftLevel             ; 5   - yes
    bpl    LD04B                 ; 2³
    inc    raftLevel             ; 5
LD04B:
    lda    saveJoy               ; 3
    and    #$10                  ; 2   UP pressed?
    bne    LD053                 ; 2³  - no
    inc    raftLevel             ; 5   - yes
LD053:
    lda    SWCHA                 ; 4
    sta    joyDebouncer          ; 3
    ldx    raftLevel             ; 3
    lda    ManVposOnRafts,X      ; 4
    sta    ram_B0                ; 3
    clc                          ; 2
    adc    #$1D                  ; 2
    sta    ram_AF                ; 3
LD064:
    lda    frameCounter          ; 3
    and    #$7F                  ; 2
    bne    LD07C                 ; 2³
    lda    #$08                  ; 2
    sta    ram_AB                ; 3
    lda    #$0B                  ; 2
    sta    ram_C2                ; 3
    jsr    LDFC5                 ; 6
    tax                          ; 2
    lda    ram_AA                ; 3
    ora    #$10                  ; 2
    sta    ram_D1,X              ; 4
LD07C:
    ldx    #$0C                  ; 2
LD07E:
    lda    ram_B3,X              ; 4
    adc    ram_D0,X              ; 4
    sta    ram_B3,X              ; 4
    bcc    LD09A                 ; 2³
    dec    ram_C4,X              ; 6
    cpx    raftLevel             ; 3
    bne    LD08E                 ; 2³
    dec    ram_AE                ; 5
LD08E:
    lda    ram_C4,X              ; 4
    bne    LD09A                 ; 2³
    lda    #$0F                  ; 2
    sta    ram_AC                ; 3
    lda    #$9F                  ; 2
    sta    ram_C4,X              ; 4
LD09A:
    dex                          ; 2
    lda    ram_B3,X              ; 4
    adc    ram_D0,X              ; 4
    sta    ram_B3,X              ; 4
    bcc    LD0B9                 ; 2³
    inc    ram_C4,X              ; 6
    cpx    raftLevel             ; 3
    bne    LD0AB                 ; 2³
    inc    ram_AE                ; 5
LD0AB:
    lda    ram_C4,X              ; 4
    cmp    #$A0                  ; 2
    bne    LD0B9                 ; 2³
    lda    #$0F                  ; 2
    sta    ram_AC                ; 3
    lda    #$00                  ; 2
    sta    ram_C4,X              ; 4
LD0B9:
    dex                          ; 2
    bne    LD07E                 ; 2³
    ldx    #$0B                  ; 2
LD0BE:
    lda    ram_C5,X              ; 4
    jsr    LDDB1                 ; 6
    sty    ram_C0                ; 3
    ora    ram_C0                ; 3
    sta    ram_DF,X              ; 4
    dex                          ; 2
    bpl    LD0BE                 ; 2³
    lda    ram_EF                ; 3
    cmp    #<LD181               ; 2
    bne    LD0E3                 ; 2³
    ldx    ram_F1                ; 3
    lda    ManGfxPtrsAquaRapids,X; 4
    sta    ram_AD                ; 3
    lda    ram_AE                ; 3
    ldx    #$00                  ; 2
    jsr    LDDB1                 ; 6
    jsr    LDDEE                 ; 6
LD0E3:
    lda    #$0B                  ; 2
    sta    ram_FA                ; 3
    lda    #$8C                  ; 2
    sta    COLUP1                ; 3
    lda    #$50                  ; 2
    ldx    #$01                  ; 2
    jsr    LDDB1                 ; 6
    jsr    LDDEE                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    lda    #$00                  ; 2
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    jmp    LD2BB                 ; 3

DR_AquaRapids:  ; indirect jump
    ldx    roomNum               ; 3
    lda    ColRoomTab,X          ; 4
    sta    ram_DE                ; 3
    ldx    ram_AD                ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    ldy    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
LD122:
    lda    #$FF                  ; 2
    jsr    LDDCD                 ; 6
    cpy    #$1E                  ; 2
    bcc    LD122                 ; 2³
    lda    #$00                  ; 2
    jmp    LD138                 ; 3

LD130:
    lda    RaftColTab+7          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+7             ; 4
LD138:
    jsr    LDDCD                 ; 6
    lda    ManGfxOne,X           ; 4
    sta    ram_F7                ; 3
    stx    ram_C3                ; 3
    ldx    ram_FA                ; 3
    lda    ram_DF,X              ; 4
    sta    HMP1                  ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    lda    ram_F7                ; 3
    sta    GRP0                  ; 3
LD155:
    dex                          ; 2
    bpl    LD155                 ; 2³
    sta    RESP1                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    ldx    ram_C3                ; 3
    lda    ManGfxOne+1,X         ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne+1,X      ; 4
    sta    COLUP0                ; 3
    iny                          ; 2
    ldx    ram_FA                ; 3
    lda    ram_D1,X              ; 4
    sta    NUSIZ1                ; 3
    ldx    ram_C3                ; 3
    cpy    ram_AF                ; 3
    bcs    LD17D                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LD17D                 ; 2³
    inx                          ; 2
    inx                          ; 2
LD17D:
    iny                          ; 2
    jmp.ind (ram_EF)             ; 5

LD181:  ; indirect jump
    lda    #BROWN+6              ; 2   top ledge of raft
    sta    ram_DE                ; 3
    lda    RaftGfx               ; 4
    jsr    LDDCD                 ; 6
    sta    CXCLR                 ; 3
    lda    RaftColTab+1          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+1             ; 4
    jsr    LDDCD                 ; 6
    lda    RaftColTab+2          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+2             ; 4
    jsr    LDDCD                 ; 6
    lda    RaftColTab+3          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+3             ; 4
    jsr    LDDCD                 ; 6
    lda    RaftColTab+4          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+4             ; 4
    jsr    LDDCD                 ; 6
    lda    RaftColTab+5          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+5             ; 4
    dec    ram_FA                ; 5
    jsr    LDDCD                 ; 6
    lda    RaftColTab+6          ; 4
    sta    ram_DE                ; 3
    lda    ram_FA                ; 3
    bmi    LD1D8                 ; 2³
    lda    RaftGfx+6             ; 4
    jsr    LDDCD                 ; 6
    jmp    LD130                 ; 3

LD1D8:
    lda    RaftGfx+6             ; 4
    jsr    LDDCD                 ; 6
    lda    RaftColTab+7          ; 4
    sta    ram_DE                ; 3
    lda    RaftGfx+7             ; 4
    jsr    LDDCD                 ; 6
    lda    #0                    ; 2
    jsr    LDDCD                 ; 6
    lda    #0                    ; 2
    jsr    LDDCD                 ; 6
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    cpy    ram_AF                ; 3
    bcs    LD20C                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LD20C                 ; 2³
    inx                          ; 2
LD20C:
    iny                          ; 2
LD20D:
    lda    #0                    ; 2
    jsr    LDDCD                 ; 6
    cpy    #$A6                  ; 2
    bcc    LD20D                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #BLACK                ; 2
    sta    COLUBK                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jmp    LD2B0                 ; 3

LD223:  ; indirect jump
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$2C                  ; 2
    sta    ram_DE                ; 3
    lda    #$FF                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    dec    ram_FA                ; 5
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    ram_FA                ; 3
    bmi    LD250                 ; 2³
    lda    #$00                  ; 2
    jmp    LD138                 ; 3

LD250:
    lda    #$00                  ; 2
    jmp    LD20D                 ; 3

OV_AquaRapids:  ; indirect jump
    lda    ram_AB                ; 3
    bne    LD260                 ; 2³
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    jmp    LD26E                 ; 3

LD260:
    lda    ram_A9                ; 3
    sta    AUDC1                 ; 3
    lda    ram_AA                ; 3
    sta    AUDF1                 ; 3
    lda    #$0C                  ; 2
    sta    AUDV1                 ; 3
    dec    ram_AB                ; 5
LD26E:
    lda    ram_AE                ; 3
    beq    LD282                 ; 2³
    cmp    #$96                  ; 2
    beq    LD282                 ; 2³
    lda    raftLevel             ; 3
    beq    LD285                 ; 2³
    lda    ram_C4                ; 3
    bmi    LD285                 ; 2³
    dec    ram_EC                ; 5
    bpl    LD29E                 ; 2³
LD282:
    jmp    LD303                 ; 3

LD285:
    lda    #0                    ; kill volume
    sta    AUDV0                 ;
    lda    raftLevel             ;
    cmp    #13                   ; top level (at the door?)
    bne    LD29A                 ; 2³
    dec    ram_EC                ; 5
    bpl    LD29E                 ; 2³
    lda    #$02                  ; 2
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

LD29A:
    lda    #$04                  ; 2
    sta    ram_EC                ; 3
LD29E:
    lda    ram_EB                ; 3
    bmi    LD2A6                 ; 2³
    dec    ram_EB                ; 5
    bpl    LD2AD                 ; 2³
LD2A6:
    lda    INPT4                 ; 3
    bmi    LD2AD                 ; 2³
    jmp    LD2D1                 ; 3

LD2AD:
    jmp    LD2C6                 ; 3

LD2B0:
    lda    #<LF194               ; 2
    sta    ram_81                ; 3
    lda    #>LF194               ; 2
    sta    ram_82                ; 3
    jmp    LDFF2                 ; 3

LD2BB:
    lda    #<FinishVblank        ; 2
    sta    ram_81                ; 3
    lda    #>FinishVblank        ; 2
    sta    ram_82                ; 3
    jmp    LDFF2                 ; 3

LD2C6:
    lda    #<FinishOverscan      ; 2
    sta    ram_81                ; 3
    lda    #>FinishOverscan      ; 2
    sta    ram_82                ; 3
    jmp    LDFF2                 ; 3

LD2D1:
    lda    #<LFCFB               ; 2
    sta    ram_81                ; 3
    lda    #>LFCFB               ; 2
    sta    ram_82                ; 3
    jmp    LDFF2                 ; 3

LD2DC:
    ldx    #<LFD02               ; 2
    stx    ram_81                ; 3
    ldx    #>LFD02               ; 2
    stx    ram_82                ; 3
    jmp    LDFF2                 ; 3

IN_AquaRapids:  ; indirect jump also
    lda    #$1F                  ; 2
    sta    ram_EB                ; 3
    ldx    #$0B                  ; 2
    lda    #$00                  ; 2
    sta    ram_F1                ; 3
    sta    ram_C1                ; 3
    lda    #$96                  ; 2
    sta    ram_C2                ; 3
LD2F7:
    jsr    LDFC5                 ; 6
    sta    ram_C5,X              ; 4
    ora    #$80                  ; 2
    sta    ram_D1,X              ; 4
    dex                          ; 2
    bpl    LD2F7                 ; 2³+1
LD303:
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
    lda    #$10                  ; 2
    sta    AUDF0                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV0                 ; 3
    lda    #0                    ; 2
    sta    raftLevel             ; 3   start at the bottom
    lda    #$50                  ; 2
    sta    ram_AE                ; 3
    jmp    LD2C6                 ; 3

ChooseNextSeqManGfx:
    .byte 0,2,3,4,5,6,7,8,9,0   ;indexes the pointers below!
ManGfxPtrsAquaRapids:
    .byte <ManGfxOne    ;0 $D324
    .byte <ManGfxTwo    ;1 $D325
    .byte <ManGfxTwo    ;2 $D326
    .byte <ManGfxFour   ;3 $D327
    .byte <ManGfxFour   ;4 $D328
    .byte <ManGfxFive   ;5 $D329
    .byte <ManGfxFive   ;6 $D32A
    .byte <ManGfxTwo    ;7 $D32B
    .byte <ManGfxTwo    ;8 $D32C
    .byte <ManGfxTwo    ;9 $D32D

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sagittarius Spears
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IN_SagitSpears:  ; indirect jump
    lda    #$0F                  ; 2
    sta    AUDC1                 ; 3
LD332:
    lda    #$04                  ; 2
    jsr    LD63B                 ; 6
    bne    LD340                 ; 2³
    lda    #$02                  ; 2
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

LD340:
    lda    #$88                  ; 2
    sta    ram_B0                ; 3
    lda    #$A5                  ; 2
    sta    ram_AF                ; 3
    lda    #$50                  ; 2
    sta    ram_AE                ; 3
    lda    #$00                  ; 2
    sta    ram_AC                ; 3
    sta    ram_B1                ; 3
    sta    ram_B3                ; 3
    sta    ram_AD                ; 3
    jsr    LD421                 ; 6
    jmp    IN_AquaRapids         ; 3

VB_SagitSpears:  ; indirect jump
    lda    #<LD223               ; 2
    sta    ram_EF                ; 3
    lda    #>LD223               ; 2
    sta    ram_F0                ; 3
    jmp    LD064                 ; 3

DR_SagitSpears:  ; indirect jump also
    ldx    roomNum               ; 3
    lda    ColRoomTab,X          ; 4
    sta    COLUBK                ; 3
    ldx    ram_AD                ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    ldy    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    VBLANK                ; 3
LD37B:
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    cpy    #$1C                  ; 2
    bcc    LD37B                 ; 2³
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$02                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    COLUBK                ; 3
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    cpy    ram_AF                ; 3
    bcs    LD3A2                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LD3A2                 ; 2³
    inx                          ; 2
LD3A2:
    iny                          ; 2
    lda    #$00                  ; 2
    jmp    LD138                 ; 3

OV_SagitSpears:  ; indirect jump also
    lda    frameCounter          ; 3
    and    #$01                  ; 2
    bne    LD3BC                 ; 2³
    lda    ram_AC                ; 3
    sta    AUDF1                 ; 3
    and    #$07                  ; 2
    sta    AUDV1                 ; 3
    lda    ram_AC                ; 3
    beq    LD3BC                 ; 2³
    dec    ram_AC                ; 5
LD3BC:
    lda    CXPPMM                ; 3
    bpl    LD3D3                 ; 2³
    lda    #$07                  ; 2
    jsr    LD63B                 ; 6
    beq    LD3D3                 ; 2³
    lda    #$88                  ; 2
    sta    ram_B0                ; 3
    lda    #$A5                  ; 2
    sta    ram_AF                ; 3
    lda    #$09                  ; 2
    sta    ram_B1                ; 3
LD3D3:
    lda    ram_B0                ; 3
    cmp    #$03                  ; 2
    bcs    LD3E0                 ; 2³
    lda    #$02                  ; 2
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

LD3E0:
    jsr    LD421                 ; 6
    jmp    LD29E                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Leo Waterfall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IN_Waterfall:  ; indirect jump
    lda    #$09                  ; 2
    jsr    LD63B                 ; 6
    bne    LD3F4                 ; 2³
    lda    #$02                  ; 2
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

LD3F4:
    lda    #$08                  ; 2
    sta    AUDC1                 ; 3
    lda    #$1F                  ; 2
    sta    ram_EB                ; 3
    lda    #$50                  ; 2
    sta    ram_B0                ; 3
    lda    #$6D                  ; 2
    sta    ram_AF                ; 3
    ldx    #$00                  ; 2
    stx    ram_B1                ; 3
    stx    ram_B6                ; 3
    lda    #$50                  ; 2
    sta    ram_B0                ; 3
    lda    #$6D                  ; 2
    sta    ram_AF                ; 3
LD412:
    ldx    #$00                  ; 2
    stx    ram_B5                ; 3
    inx                          ; 2
    stx    ram_AE                ; 3
    lda    HposVB_Waterfall      ; 4
    sta    ram_B8                ; 3
    jmp    LD2C6                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LD421 x4

LD421 SUBROUTINE
    lda    SWCHA                 ; 4
    and    #$F0                  ; 2
    cmp    #$F0                  ; 2   anything pressed P0?
    bne    LD435                 ; 2³  - yes
    lda    ram_B1                ; 3   - no
    cmp    #$05                  ; 2
    bne    LD494                 ; 2³
    inc    ram_B1                ; 5
    jmp    LD4A8                 ; 3

LD435:
    lda    ram_B1                ; 3
    bne    LD43B                 ; 2³
    inc    ram_B1                ; 5
LD43B:
    lda    #$DA                  ; 2
    ldx    ram_F4                ; 3
    beq    LD443                 ; 2³
    lda    #$C0                  ; 2
LD443:
    clc                          ; 2
    adc    ram_B2                ; 3
    sta    ram_B2                ; 3
    bcc    LD494                 ; 2³
    bit    SWCHA                 ; 4   RIGHT pressed?
    bmi    LD455                 ; 2³  - no
    inc    ram_AE                ; 5   - yes
    ldx    #$00                  ; 2
    stx    ram_B3                ; 3
LD455:
    bit    SWCHA                 ; 4   LEFT pressed?
    bvs    LD460                 ; 2³  - no
    dec    ram_AE                ; 5   - yes
    ldx    #$FF                  ; 2
    stx    ram_B3                ; 3
LD460:
    lda    ram_AE                ; 3
    bne    LD468                 ; 2³
    lda    #$01                  ; 2
    sta    ram_AE                ; 3
LD468:
    lda    ram_AE                ; 3
    cmp    #$96                  ; 2
    bcc    LD472                 ; 2³
    lda    #$95                  ; 2
    sta    ram_AE                ; 3
LD472:
    lda    SWCHA                 ; 4
    and    #$20                  ; 2   DOWN pressed?
    bne    LD47B                 ; 2³  - no
    inc    ram_B0                ; 5   - yes
LD47B:
    lda    SWCHA                 ; 4
    and    #$10                  ; 2   UP pressed?
    bne    LD484                 ; 2³  - no
    dec    ram_B0                ; 5   - yes
LD484:
    lda    ram_B0                ; 3
    bne    LD48C                 ; 2³
    lda    #$01                  ; 2
    sta    ram_B0                ; 3
LD48C:
    cmp    #$88                  ; 2
    bcc    LD494                 ; 2³
    lda    #$88                  ; 2
    sta    ram_B0                ; 3
LD494:
    lda    ram_B0                ; 3
    clc                          ; 2
    adc    #$1D                  ; 2
    sta    ram_AF                ; 3
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LD4A8                 ; 2³
    ldx    ram_B1                ; 3
    lda    ChooseNextSequence,X  ; 4
    sta    ram_B1                ; 3
LD4A8:
    ldx    ram_B1                ; 3
    lda    ToneManWalk,X         ; 4
    sta    AUDC0                 ; 3
    lda    FreqManWalk,X         ; 4
    sta    AUDF0                 ; 3
    lda    VolManWalk,X          ; 4
    and    ram_F4                ; 3
    sta    AUDV0                 ; 3
    lda    ManWalkPattern,X      ; 4
    tax                          ; 2
    lda    ManWalkPtrs,X         ; 4
    sta    ram_AD                ; 3
    lda    ram_B3                ; 3
    sta    REFP0                 ; 3
    lda    ram_AE                ; 3
    jsr    LDDB1                 ; 6
    ldx    #$00                  ; 2
    jsr    LDDEE                 ; 6
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VB_Waterfall:  ; indirect jump
    jsr    LD421                 ; 6
    lda    ram_B8                ; 3
    jsr    LDDB1                 ; 6
    ldx    #$01                  ; 2
    jsr    LDDEE                 ; 6
    ldx    ram_B5                ; 3
    lda    WaterfallSpeedTab,X   ; 4
    adc    ram_B4                ; 3
    sta    ram_B4                ; 3
    bcc    LD4FD                 ; 2³
    lda    ram_B5                ; 3
    and    #$01                  ; 2
    bne    LD4F9                 ; 2³
    dec    ram_B6                ; 5
    dec    ram_B6                ; 5
    dec    ram_B6                ; 5
    dec    ram_B6                ; 5
LD4F9:
    inc    ram_B6                ; 5
    inc    ram_B6                ; 5
LD4FD:
    lda    ram_B6                ; 3
    bne    LD503                 ; 2³
    dec    ram_B8                ; 5
LD503:
    sta    ram_BA                ; 3
    clc                          ; 2
    adc    WaterfallPassHeight,X ; 4
    sta    ram_B7                ; 3
    lda    ram_B6                ; 3
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    sta    AUDF1                 ; 3
    lda    WaterfallGfx,X        ; 4
    sta    ram_B9                ; 3
    lda    WaterfallVol,X        ; 4
    sta    AUDV1                 ; 3
    lda    #$00                  ; 2
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LD2BB                 ; 3

DR_Waterfall:  ; indirect jump
    sta    HMCLR                 ; 3
    sta    CXCLR                 ; 3
    ldx    ram_AD                ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    ldy    #$00                  ; 2
    lda    #$7C                  ; 2
    sta    COLUP1                ; 3
    tya                          ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    lda    #$3C                  ; 2
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    COLUBK                ; 3
LD54F:
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    lda    ram_BA                ; 3
    sta    COLUP1                ; 3
    inc    ram_BA                ; 5
    cpy    ram_AF                ; 3
    bcs    LD56C                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LD56C                 ; 2³
    inx                          ; 2
LD56C:
    iny                          ; 2
    lda    ram_B9                ; 3
    cpy    ram_B7                ; 3
    bcs    LD579                 ; 2³
    cpy    ram_B6                ; 3
    bcc    LD579                 ; 2³
    lda    #$00                  ; 2
LD579:
    cpy    #$A4                  ; 2
    bcc    LD54F                 ; 2³
    lda    #$00                  ; 2
    sta    GRP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$3C                  ; 2
    stx    COLUBK                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    jmp    LD2B0                 ; 3

OV_Waterfall:  ; indirect jump
    lda    CXPPMM                ; 3
    bpl    LD599                 ; 2³
    lda    #$09                  ; 2
    sta    ram_B1                ; 3
    jmp    LD412                 ; 3

LD599:
    ldx    ram_B5                ; 3
    lda    ram_AE                ; 3
    cmp    ManHposNext_WF_Start,X; 4
    bcc    LD5AE                 ; 2³
    inc    ram_B5                ; 5
    inx                          ; 2
    cpx    #$05                  ; 2
    beq    LD5B1                 ; 2³
    lda    HposVB_Waterfall,X    ; 4
    sta    ram_B8                ; 3
LD5AE:
    jmp    LD29E                 ; 3

LD5B1:
    lda    #$02                  ; 2
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

ChooseNextSequence:
    .byte 0,2,3,4,5,2,7,8,0,10,0      ; indexes all the tables below!

;           0   1   2   3   4   5   6   7   8   9  10
ManWalkPattern:
    .byte $00,$01,$02,$03,$04,$05,$02,$01,$01,$00,$00
VolManWalk:
    .byte $00,$00,$0F,$00,$00,$00,$0F,$00,$00,$0F,$0F
FreqManWalk:
    .byte $0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$10,$10
ToneManWalk:
    .byte $02,$02,$02,$02,$02,$02,$02,$02,$02,$08,$08

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Charging Taurus Horns
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IN_TaurusHorns:  ; indirect jump
    lda    #$02                  ; 2
    sta    AUDC1                 ; 3
    jmp    LD332                 ; 3

VB_TaurusHorns:  ; indirect jump
    lda    #<LD607               ; 2
    sta    ram_EF                ; 3
    lda    #>LD607               ; 2
    sta    ram_F0                ; 3
    jmp    LD064                 ; 3

DR_TaurusHorns:  ; indirect jump
    jmp    DR_SagitSpears        ; 3

OV_TaurusHorns:  ; indirect jump
    jmp    OV_SagitSpears        ; 3

LD607:  ; indirect jump
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$36                  ; 2
    and    ram_F3                ; 3
    sta    ram_DE                ; 3
    lda    #$01                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$01                  ; 2
    jsr    LDDCD                 ; 6
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    dec    ram_FA                ; 5
    lda    #$00                  ; 2
    jsr    LDDCD                 ; 6
    lda    ram_FA                ; 3
    bmi    LD636                 ; 2³
    lda    #$00                  ; 2
    jmp    LD138                 ; 3

LD636:
    lda    #$00                  ; 2
    jmp    LD20D                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LD63B x9

LD63B SUBROUTINE
    lsr                          ; 2
    eor    #$FF                  ; 2
    and    #$07                  ; 2
    tay                          ; 2
    bcc    LD64B                 ; 2³
    lda    #$F0                  ; 2
    and.wy itemsZodiacChamber,Y  ; 4
    cmp    #$F0                  ; 2
    rts                          ; 6

LD64B:
    lda    #$0F                  ; 2
    and.wy itemsZodiacChamber,Y  ; 4
    cmp    #$0F                  ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Room
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VB_Room:  ; indirect jump
    lda    CXP0FB                ; 3
    bpl    LD667                 ; 2³
    lda    saveP0Joy             ; 3
    sta    ram_B0                ; 3
    clc                          ; 2
    adc    #$1D                  ; 2
    sta    ram_AF                ; 3
    lda    ram_A5                ; 3
    sta    ram_AE                ; 3
    jmp    LD66F                 ; 3

LD667:
    lda    ram_B0                ; 3
    sta    saveP0Joy             ; 3
    lda    ram_AE                ; 3
    sta    ram_A5                ; 3
LD66F:
    jsr    LD421                 ; 6
    lda    #$02                  ; 2
    sta    COLUPF                ; 3
    lda    #$00                  ; 2
    sta    NUSIZ1                ; 3
    sta    NUSIZ0                ; 3
    sta    COLUP1                ; 3
    sta    COLUP0                ; 3
    sta    VDELP1                ; 3
    sta    VDELP0                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    lda    RoomPatPF0            ; 4
    sta    PF0                   ; 3
    lda    RoomPatPF1            ; 4
    sta    PF1                   ; 3
    lda    RoomPatPF2            ; 4
    sta    PF2                   ; 3
    ldx    roomNum               ; 3
    lda    ColRoomTab,X          ; 4
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    jmp    LD2BB                 ; 3

OV_Room:  ; indirect jump
    lda    ram_EB                ; 3
    bmi    LD6AD                 ; 2³
    dec    ram_EB                ; 5
    bpl    LD6BB                 ; 2³
LD6AD:
    lda    INPT4                 ; 3
    bmi    LD6BB                 ; 2³
    ldx    roomNum               ; 3
    lda    FirebuttonAction,X    ; 4
    sta    ram_83                ; 3
    jmp    LD2DC                 ; 3

LD6BB:
    ldx    #$00                  ; 2
    lda    ram_B0                ; 3
    cmp    #$02                  ; 2
    beq    LD6EE                 ; 2³
    inx                          ; 2
    cmp    #$86                  ; 2
    beq    LD6EE                 ; 2³
    inx                          ; 2
    lda    ram_AE                ; 3
    cmp    #$02                  ; 2
    bne    LD6E2                 ; 2³
LD6CF:
    lda    #$00                  ; 2
    jsr    LD63B                 ; 6
    beq    LD6EE                 ; 2³
    lda    #$09                  ; 2
    jsr    LD63B                 ; 6
    beq    LD6EE                 ; 2³
    inc    ram_AE                ; 5
    jmp    LD727                 ; 3

LD6E2:
    inx                          ; 2
    cmp    #$91                  ; 2
    bne    LD727                 ; 2³+1
    dec    ram_AE                ; 5
    dec    ram_AE                ; 5
    jmp    LD6CF                 ; 3

LD6EE:
    clc                          ; 2
    lda    roomNum               ; 3
    sta    ram_C9                ; 3
    adc    ChooseNextRoomTab,X   ; 4
    bpl    LD6FE                 ; 2³
    clc                          ; 2
    adc    #$0C                  ; 2
    jmp    LD705                 ; 3

LD6FE:
    cmp    #$0C                  ; 2
    bmi    LD705                 ; 2³
    sec                          ; 2
    sbc    #$0C                  ; 2
LD705:
    sta    roomNum               ; 3
    lda    #$0B                  ; 2
    jsr    LD63B                 ; 6
    beq    LD724                 ; 2³
    lda    #$02                  ; 2
    jsr    LD63B                 ; 6
    bne    LD724                 ; 2³
    lda    ram_A9                ; 3
    eor    frameCounter          ; 3
    and    #$0F                  ; 2
    sta    roomNum               ; 3
    cmp    #$0C                  ; 2
    bcc    LD724                 ; 2³
    lsr                          ; 2
    sta    roomNum               ; 3
LD724:
    jmp    LD2D1                 ; 3

LD727:
    jmp    LD2C6                 ; 3

IN_Room:  ; indirect jump
    lda    #$05                  ; 2
    ldx    #$00                  ; 2
    jsr    LD63B                 ; 6
    beq    LD735                 ; 2³
    ldx    #$FF                  ; 2
LD735:
    stx    ram_F4                ; 3
    lda    #$03                  ; 2
    ldx    #$FF                  ; 2
    jsr    LD63B                 ; 6
    beq    LD742                 ; 2³
    ldx    #$02                  ; 2
LD742:
    stx    ram_F3                ; 3
    sta    CXCLR                 ; 3
    lda    #$47                  ; 2
    sta    ram_B0                ; 3
    lda    #$64                  ; 2
    sta    ram_AF                ; 3
    lda    #$49                  ; 2
    sta    ram_AE                ; 3
    lda    #$1F                  ; 2
    sta    ram_EB                ; 3
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    ram_B5                ; 3
    sta    ram_B1                ; 3
    jmp    LD2C6                 ; 3

DR_Room:  ; indirect jump
    sta    CXCLR                 ; 3
    lda    #$00                  ; 2
    sta    ram_BB                ; 3
    sta    ram_A4                ; 3  begin at zero
    ldx    ram_AD                ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    ++++++++++   ++++++++++
;    ++++++++++   ++++++++++  <-- section 0, line 0-33
;    ++++               ++++  <-- section 1, line 34-67
;              ROOM           <-- section 2, line 68,101
;    ++++               ++++  <-- section 3, line 102-135
;    ++++++++++   ++++++++++  <-- section 4, line 136-169
;    ++++++++++   ++++++++++

LD771:
    ldy    ram_A4                ; 3  get index for room sections,
    lda    ram_BB                ; 3  and current line...
    cmp    RoomSectionLineIndex,Y; 4  is it time to draw a new piece?
    bne    LD78B                 ; 2³ - no
    inc    ram_A4                ; 5  - yes, increase the index
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    jmp    LD7A6                 ; 3

LD78B:
    lda    RoomPatPF0,Y          ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    lda    RoomPatPF1,Y          ; 4
    sta    PF1                   ; 3
    lda    RoomPatPF2,Y          ; 4
    sta    PF2                   ; 3
LD7A6:
    ldy    ram_BB                ; 3
    cpy    ram_AF                ; 3
    bcs    LD7B1                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LD7B1                 ; 2³
    inx                          ; 2
LD7B1:
    iny                          ; 2
    sty    ram_BB                ; 3
    cpy    #$A6                  ; 2
    bcc    LD771                 ; 2³
    jmp    LD2B0                 ; 3

FirebuttonAction:
    .byte ZODIAC_CHAMBER     ; $D7BB  Virgo
    .byte LEO_WATERFALL      ; $D7BC  Leo
    .byte ZODIAC_CHAMBER     ; $D7BD  Cancer
    .byte ZODIAC_CHAMBER     ; $D7BE  Gemini
    .byte TAURUS_HORNS       ; $D7BF  Taurus
    .byte ZODIAC_CHAMBER     ; $D7C0  Aries
    .byte ZODIAC_CHAMBER     ; $D7C1  Pisces
    .byte AQUARIAN_RAPIDS    ; $D7C2  Aquarius
    .byte ZODIAC_CHAMBER     ; $D7C3  Capricorn
    .byte SAGITTARIUS_SPEARS ; $D7C4  Sagittarius
    .byte ZODIAC_CHAMBER     ; $D7C5  Scorpio
    .byte ZODIAC_CHAMBER     ; $D7C6  Libra

LD7C7:  ; indirect jump
    lda    MusicCountTab,X       ; 4
    sta    ram_B2                ; 3
    lda    #$00                  ; 2
    sta    ram_B0                ; 3
    sta    ram_B1                ; 3
    lda    #$01                  ; 2
    sta    ram_B3                ; 3
    lda    VolToneLoPtrsCH0,X    ; 4
    sta    ram_B4                ; 3
    lda    VolToneHiPtrsCH0,X    ; 4
    sta    ram_B5                ; 3
    lda    FreqLoPtrsCH0,X       ; 4
    sta    ram_B8                ; 3
    lda    FreqHiPtrsCH0,X       ; 4
    sta    ram_B9                ; 3
    lda    VolToneLoPtrsCH1,X    ; 4
    sta    ram_B6                ; 3
    lda    VolToneHiPtrsCH1,X    ; 4
    sta    ram_B7                ; 3
    lda    FreqLoPtrsCH1,X       ; 4
    sta    ram_BA                ; 3
    lda    FreqHiPtrsCH1,X       ; 4
    sta    ram_BB                ; 3
    jmp    LD2C6                 ; 3

LD801:  ; indirect jump
    dec    ram_B3                ; 5
    bne    LD831                 ; 2³
    lda    ram_B2                ; 3
    sta    ram_B3                ; 3
    ldy    ram_B0                ; 3
    lda    (ram_B8),Y            ; 5
    bmi    LD81D                 ; 2³
    sta    AUDF0                 ; 3
    lda    (ram_B4),Y            ; 5
    sta    AUDV0                 ; 3
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    sta    AUDC0                 ; 3
    inc    ram_B0                ; 5
LD81D:
    ldy    ram_B1                ; 3
    lda    (ram_BA),Y            ; 5
    bmi    LD831                 ; 2³
    sta    AUDF1                 ; 3
    lda    (ram_B6),Y            ; 5
    sta    AUDV1                 ; 3
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    ror                          ; 2
    sta    AUDC1                 ; 3
    inc    ram_B1                ; 5
LD831:
    jmp    LD2BB                 ; 3

VolToneLoPtrsCH0:
    .byte <VTch0_16_4    ; $D834
    .byte <VTch0__8_4    ; $D835
    .byte <VTch0_25_6    ; $D836
    .byte <VTch0_13_3    ; $D837
    .byte <VTch0_f__d    ; $D838
    .byte <VTch0_17_3    ; $D839
    .byte <VTch0_37_5    ; $D83A
    .byte <VTch0_15_4    ; $D83B
    .byte <VTch0__5_3    ; $D83C
    .byte <VTch0_27_2    ; $D83D
    .byte <VTch0_21_1    ; $D83E
VolToneHiPtrsCH0:
    .byte >VTch0_16_4    ; $D83F
    .byte >VTch0__8_4    ; $D840
    .byte >VTch0_25_6    ; $D841
    .byte >VTch0_13_3    ; $D842
    .byte >VTch0_f__d    ; $D843
    .byte >VTch0_17_3    ; $D844
    .byte >VTch0_37_5    ; $D845
    .byte >VTch0_15_4    ; $D846
    .byte >VTch0__5_3    ; $D847
    .byte >VTch0_27_2    ; $D848
    .byte >VTch0_21_1    ; $D849
FreqLoPtrsCH0:
    .byte <FRch0_16_4    ; $D84A
    .byte <FRch0__8_4    ; $D84B
    .byte <FRch0_25_6    ; $D84C
    .byte <FRch0_13_3    ; $D84D
    .byte <FRch0_f__d    ; $D84E
    .byte <FRch0_17_3    ; $D84F
    .byte <FRch0_37_5    ; $D850
    .byte <FRch0_15_4    ; $D851
    .byte <FRch0__5_3    ; $D852
    .byte <FRch0_27_2    ; $D853
    .byte <FRch0_21_1    ; $D854
FreqHiPtrsCH0:
    .byte >FRch0_16_4    ; $D855
    .byte >FRch0__8_4    ; $D856
    .byte >FRch0_25_6    ; $D857
    .byte >FRch0_13_3    ; $D858
    .byte >FRch0_f__d    ; $D859
    .byte >FRch0_17_3    ; $D85A
    .byte >FRch0_37_5    ; $D85B
    .byte >FRch0_15_4    ; $D85C
    .byte >FRch0__5_3    ; $D85D
    .byte >FRch0_27_2    ; $D85E
    .byte >FRch0_21_1    ; $D85F
VolToneLoPtrsCH1:
    .byte <VTch1_16_4    ; $D860
    .byte <VTch1__8_4    ; $D861
    .byte <VTch1_25_6    ; $D862
    .byte <VTch1_13_3    ; $D863
    .byte <VTch1_f__d    ; $D864
    .byte <VTch1_17_3    ; $D865
    .byte <VTch1_37_5    ; $D866
    .byte <VTch1_15_4    ; $D867
    .byte <VTch1__5_3    ; $D868
    .byte <VTch1_27_2    ; $D869
    .byte <VTch1_21_1    ; $D86A
VolToneHiPtrsCH1:
    .byte >VTch1_16_4    ; $D86B
    .byte >VTch1__8_4    ; $D86C
    .byte >VTch1_25_6    ; $D86D
    .byte >VTch1_13_3    ; $D86E
    .byte >VTch1_f__d    ; $D86F
    .byte >VTch1_17_3    ; $D870
    .byte >VTch1_37_5    ; $D871
    .byte >VTch1_15_4    ; $D872
    .byte >VTch1__5_3    ; $D873
    .byte >VTch1_27_2    ; $D874
    .byte >VTch1_21_1    ; $D875
FreqLoPtrsCH1:
    .byte <FRch1_16_4    ; $D876
    .byte <FRch1__8_4    ; $D877
    .byte <FRch1_25_6    ; $D878
    .byte <FRch1_13_3    ; $D879
    .byte <FRch1_f__d    ; $D87A
    .byte <FRch1_17_3    ; $D87B
    .byte <FRch1_37_5    ; $D87C
    .byte <FRch1_15_4    ; $D87D
    .byte <FRch1__5_3    ; $D87E
    .byte <FRch1_27_2    ; $D87F
    .byte <FRch1_21_1    ; $D880
FreqHiPtrsCH1:
    .byte >FRch1_16_4    ; $D881
    .byte >FRch1__8_4    ; $D882
    .byte >FRch1_25_6    ; $D883
    .byte >FRch1_13_3    ; $D884
    .byte >FRch1_f__d    ; $D885
    .byte >FRch1_17_3    ; $D886
    .byte >FRch1_37_5    ; $D887
    .byte >FRch1_15_4    ; $D888
    .byte >FRch1__5_3    ; $D889
    .byte >FRch1_27_2    ; $D88A
    .byte >FRch1_21_1    ; $D88B

MusicCountTab:
    .byte  2 ; 16-4      ; $D88C
    .byte  2 ;  8-4      ; $D88D
    .byte  5 ; 25-6      ; $D88E
    .byte 10 ; 13-3      ; $D88F
    .byte  5 ;food,dagger; $D890
    .byte  5 ; 17-3      ; $D891
    .byte  2 ; 37-5      ; $D892
    .byte  2 ; 15-4      ; $D893
    .byte 11 ;  5-3      ; $D894

FRch0_16_4:
    .byte  3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3,22,20  ; first 3 bytes are shared with table abover for 5-3, 27-2, and 21-1 clues (I presume, this is untested!)
    .byte 17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,15
    .byte 15,15,15,15,15,15,15,15,15,15,15,15, KILL_FREQ, STOP_MUSIC
VTch0_16_4:
    .byte $7B,$7A,$79,$78,$77,$76,$75,$74,$73,$72,$71,$70,$70,$70,$70,$70             ; (Tone<<4) | Vol
    .byte $70,$7B,$7A,$79,$78,$77,$76,$75,$74,$73,$72,$71,$70,$70,$70,$70
    .byte $70,$7B,$7A,$79,$78,$77,$76,$75,$74,$73,$72,$71, KILL_VOL_TONE, FREE_BYTE
FRch1_16_4:
    .byte 24,24,24,24,24,24,24,24,24,24,24,24,24,24,30,30
    .byte 30,24,24,24,24,20,20,20,10,10,10,10,10,10,10,30
    .byte 30,30,30,30,30,30,30,30, KILL_FREQ, STOP_MUSIC
VTch1_16_4:
    .byte $5F,$5D,$5D,$58,$56,$54,$52,$50,$50,$50,$50,$50,$50,$50,$5F,$58
    .byte $56,$5F,$58,$56,$54,$5F,$58,$56,$CF,$CD,$CD,$C8,$C6,$C4,$C2,$50
    .byte $50,$5F,$5D,$5D,$58,$56,$54,$52, KILL_VOL_TONE, FREE_BYTE


FRch0__8_4:
FRch0_27_2:
    .byte KILL_FREQ, STOP_MUSIC
VTch0__8_4:
VTch0_27_2:
    .byte KILL_VOL_TONE
FRch1__8_4:
FRch1_27_2:
    .byte 30,30,30,30,30,30,30,30,30,30,30,13,13,13,13,13
    .byte 13,13,10,10,10,10,10,10,10,30,30,30,30,30,30,30
    .byte KILL_FREQ, STOP_MUSIC
VTch1__8_4:
VTch1_27_2:
    .byte $5D,$5D,$57,$55,$53,$5F,$57,$5F,$57,$5F,$57,$CF,$CD,$CD,$C7,$C5
    .byte $C3,$C1,$CF,$CD,$CD,$C7,$C5,$C3,$C1,$5F,$5D,$5D,$57,$55,$53,$51
    .byte KILL_VOL_TONE


FRch0_25_6:
FRch0_21_1:
    .byte 21,21,21,21,21,21,21,21,21,21,21,21,27,27,27,27
    .byte 27,27,27,27,13,13,13,13,10,10,10,10,10,10,10,10
    .byte 21,21,21,21,21,21,21,21,21,21,21, KILL_FREQ, STOP_MUSIC
VTch0_25_6:
VTch0_21_1:
    .byte $44,$44,$44,$43,$43,$43,$42,$42,$42,$41,$41,$41,$43,$43,$43,$42
    .byte $42,$42,$41,$41,$44,$44,$44,$43,$43,$43,$42,$42,$42,$41,$41,$41
    .byte $44,$44,$44,$43,$43,$43,$42,$42,$42,$41,$41, KILL_VOL_TONE, FREE_BYTE
FRch1_25_6:
FRch1_21_1:
    .byte 13,13,13,13,13,13,13,13,13,13,13,13,21,21,21,21
    .byte 20,20,20,20,27,27,27,27,20,20,20,20,20,20,20,20
    .byte 13,13,13,13,13,13,13,13,13,13,13, KILL_FREQ, STOP_MUSIC
VTch1_25_6:
VTch1_21_1:
    .byte $4C,$49,$46,$45,$44,$43,$43,$42,$42,$41,$41,$41,$4C,$49,$46,$45
    .byte $4C,$49,$46,$45,$4C,$49,$46,$45,$4C,$49,$46,$45,$44,$43,$43,$42
    .byte $4C,$48,$46,$45,$44,$43,$43,$42,$42,$41,$41, KILL_VOL_TONE, FREE_BYTE


FRch0_13_3:
    .byte 28,28,28,28,28,28,28,28,29,29,29,29,29,29,29,29
    .byte 28,28,28,28,28,28,28,28,25,25,25,25,25,25,25,25
    .byte KILL_FREQ, STOP_MUSIC
VTch0_13_3:
    .byte $CC,$CC,$C6,$C3,$C2,$C1,$C1,$C1,$CC,$CC,$C7,$C3,$C2,$C1,$C1,$C1
    .byte $CC,$CC,$C7,$C3,$C2,$C1,$C1,$C1,$CC,$CC,$C7,$C3,$C2,$C1,$C1,$C1
    .byte KILL_VOL_TONE, FREE_BYTE
FRch1_13_3:
    .byte 25,25,22,22,21,21,16,16,18,18,18,18,25,25,25,25
    .byte 21,21,22,22,25,25,28,28,25,25,25,25,25,25,25,25
     .byte KILL_FREQ, STOP_MUSIC
VTch1_13_3:
    .byte $C9,$C4,$C9,$C4,$C9,$C4,$C9,$C4,$C9,$C4,$C3,$C1,$C9,$C6,$C3,$C2
    .byte $C9,$C4,$C9,$C4,$C9,$C4,$C9,$C7,$C5,$C4,$C3,$C2,$C2,$C1,$C1,$C0
    .byte KILL_VOL_TONE, FREE_BYTE


FRch0_f__d:
    .byte 31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31
    .byte 26,26,26,26,26,26,26,26,26,26,26,26,26,26, KILL_FREQ, STOP_MUSIC
VTch0_f__d:
    .byte $DC,$DD,$DD,$DD,$DB,$D8,$D6,$D5,$D4,$D3,$D3,$D2,$D2,$D1,$D1,$D1
    .byte $DC,$DD,$DD,$DD,$DB,$D8,$D6,$D5,$D4,$D3,$D3,$D2,$D2,$D1, KILL_VOL_TONE, FREE_BYTE
FRch1_f__d:
    .byte 26,26,26,26,26,26,26,26,17,17,17,17,17,17,20,20
    .byte 19,19,19,19,17,17,17,17,17,17,17,17,17,17, KILL_FREQ, STOP_MUSIC
VTch1_f__d:
    .byte $DF,$DF,$DA,$D7,$D3,$D2,$D1,$D1,$DF,$DF,$DA,$D7,$D3,$D2,$DF,$DF
    .byte $DF,$DF,$DA,$D7,$DF,$DF,$DA,$D7,$D3,$D2,$D1,$D1,$D1,$D1, KILL_VOL_TONE, FREE_BYTE


FRch0_17_3:
    .byte 14,14,14,14,14,14,14,19,19,19,19,14,14,14,14,19
    .byte 14,14,14,14,14,14,14,14,14,14, KILL_FREQ, STOP_MUSIC
VTch0_17_3:
    .byte $D7,$D4,$D3,$D2,$D1,$D1,$D0,$D7,$D4,$D3,$D2,$D7,$D4,$D3,$D2,$D1
    .byte $D7,$D4,$D3,$D1,$D7,$D4,$D3,$D2,$D1,$D1, KILL_VOL_TONE, FREE_BYTE
FRch1_17_3:
    .byte 24,24,24,24,24,24,24,25,25,25,25,21,21,21,21,25
    .byte 19,19,19,19,19,19,19,19,19,19, KILL_FREQ, STOP_MUSIC
VTch1_17_3:
    .byte $DC,$D9,$D8,$D5,$D3,$D1,$D0,$DC,$D9,$D8,$D5,$DC,$D9,$D8,$D5,$DC
    .byte $DC,$D9,$D8,$D5,$DC,$D9,$D8,$D5,$D3,$D1, KILL_VOL_TONE, FREE_BYTE


FRch0_37_5:
    .byte STOP_MUSIC
VTch0_37_5:
    .byte KILL_VOL_TONE
FRch1_37_5:
    .byte 11,11,11,11,11,11, 8, 8, 8, 8, 8, 8, 8, 6, 6, 6
    .byte  6, 6, 6, 6, 3, 3, 3, 3, 3, 5, 5, 5, 5, 5, 5, 5
    .byte  7, 7, 7, 7, 7, 7, 7,10,10,10,10,10,10,10,10,14
    .byte 14,14,14,14,14,14,14, KILL_FREQ, STOP_MUSIC
VTch1_37_5:
    .byte $FF,$FF,$FA,$F7,$F4,$F2,$FF,$FF,$FA,$F7,$F4,$F2,$F1,$FF,$FF,$FA
    .byte $F7,$F4,$F2,$F1,$F0,$FF,$FF,$FA,$F7,$FF,$FF,$FA,$F7,$F4,$F2,$F1
    .byte $FF,$FF,$FA,$F7,$F4,$F2,$F1,$FF,$FF,$FA,$F7,$F4,$F2,$F1,$F0,$FF
    .byte $FF,$FA,$F7,$F4,$F2,$F1,$F1, KILL_VOL_TONE, FREE_BYTE


FRch0_15_4:
    .byte 19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19
    .byte 19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19
    .byte 26,26,26,26,26,26,26,26,20,20,20,20,20,20,20,20
    .byte 19,19,19,19,19,19,19,19,19,19, KILL_FREQ, STOP_MUSIC
VTch0_15_4:
    .byte $CC,$CC,$CC,$C9,$C7,$C5,$C4,$C3,$C3,$C2,$C2,$C1,$C1,$C0,$C0,$C0
    .byte $CC,$CC,$CC,$C9,$C7,$C5,$C4,$C3,$C3,$C2,$C2,$C1,$CC,$CC,$CC,$C9
    .byte $CC,$CC,$CC,$C9,$CC,$CC,$C4,$C3,$CC,$CC,$CC,$C9,$C7,$C5,$C4,$C3
    .byte $CC,$CC,$CC,$C9,$C7,$C5,$C4,$C3,$C2,$C1, KILL_VOL_TONE, FREE_BYTE
FRch1_15_4:
    .byte  9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, 9, KILL_FREQ, KILL_FREQ, KILL_FREQ
    .byte 14,14,14,14,14,14,14,14,14,14,14,14, KILL_FREQ, KILL_FREQ, KILL_FREQ, KILL_FREQ
    .byte 10,10,10,10,11,11,11,11,15,15,15,15,15,15,15,15
    .byte 14,14,14,14,14,14,14,14,14,14,14,14,14, KILL_FREQ, STOP_MUSIC
VTch1_15_4:
    .byte $5F,$5F,$5C,$59,$57,$55,$54,$53,$53,$52,$52,$51,$51, KILL_VOL_TONE, KILL_VOL_TONE, KILL_VOL_TONE
    .byte $5F,$5F,$5C,$59,$57,$55,$54,$53,$53,$52,$52,$51,$51, KILL_VOL_TONE, KILL_VOL_TONE, KILL_VOL_TONE
    .byte $5F,$5F,$5C,$59,$5F,$5F,$5C,$59,$5F,$5F,$5C,$59,$57,$55,$54,$53
    .byte $5F,$5F,$5C,$59,$57,$55,$54,$53,$53,$52,$51,$51,$51, KILL_VOL_TONE, FREE_BYTE


FRch0__5_3:
    .byte 31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31
    .byte 31,31,31,31,31,31,31,31,31,31,31,31,31,31,31,31
    .byte 31,31,31, KILL_FREQ, STOP_MUSIC
VTch0__5_3:
    .byte $F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0
    .byte $F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0,$F6,$F0,$F2,$F0
    .byte $F6,$F0,$F2, KILL_VOL_TONE
FRch1__5_3:
    .byte 19,17,16,14,13,13,13,13,13,13,14,14,14,14,16,14
    .byte 14,14,14,16,14,14, 9, 9, 9, 9, 9, 9, 9,19,19,19
    .byte KILL_FREQ, STOP_MUSIC
VTch1__5_3:
    .byte $DB,$DB,$DB,$DB,$DB,$D6,$D4,$D2,$00,$00,$DB,$D6,$D4,$D2,$DB,$DB
    .byte $D6,$D4,$D2,$DB,$DB,$D6,$DB,$D6,$DB,$D6,$DB,$D6,$DB,$D6,$D4,$D2
    .byte KILL_VOL_TONE


ChooseNextRoomTab:
    .byte  1  ; top door
    .byte -1  ; bottom door
    .byte  4  ; left door
    .byte -4  ; right door

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LDDB1 x5

LDDB1 SUBROUTINE
    ldy    #$00                  ; 2
    clc                          ; 2
    adc    #$01                  ; 2
    cmp    #$2D                  ; 2
    bcc    LDDBE                 ; 2³
    ldy    #$03                  ; 2
    sbc    #$2D                  ; 2
LDDBE:
    sec                          ; 2
LDDBF:
    iny                          ; 2
    sbc    #$0F                  ; 2
    bcs    LDDBF                 ; 2³
    eor    #$FF                  ; 2
    sbc    #$06                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LDDCD x28

LDDCD SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    GRP1                  ; 3
    lda    ManGfxOne,X           ; 4
    sta    GRP0                  ; 3
    lda    ColManGfxOne,X        ; 4
    sta    COLUP0                ; 3
    lda    ram_DE                ; 3
    sta    COLUP1                ; 3
    cpy    ram_AF                ; 3
    bcs    LDDEC                 ; 2³
    cpy    ram_B0                ; 3
    bcc    LDDEC                 ; 2³
    inx                          ; 2
    lda    CXPPMM                ; 3
    sta    ram_C4                ; 3
LDDEC:
    iny                          ; 2
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LDDEE x4

LDDEE SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    nop                          ; 2
    nop                          ; 2
    sta    HMP0,X                ; 4
    lda    HMP0                  ; 3
LDDF6:
    dey                          ; 2
    bpl    LDDF6                 ; 2³
    sta    RESP0,X               ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $DDFC  free bytes
    .byte $00 ; |        | $DDFD
    .byte $00 ; |        | $DDFE
    .byte $00 ; |        | $DDFF

       ORG $0E00,0
      RORG $DE00

ManGfxOne:
    .byte $00 ; |        | $DE00
    .byte $00 ; |        | $DE01
    .byte $00 ; |        | $DE02
    .byte $00 ; |        | $DE03
    .byte $08 ; |    X   | $DE04
    .byte $1C ; |   XXX  | $DE05
    .byte $1C ; |   XXX  | $DE06
    .byte $1C ; |   XXX  | $DE07
    .byte $08 ; |    X   | $DE08
    .byte $1C ; |   XXX  | $DE09
    .byte $3E ; |  XXXXX | $DE0A
    .byte $3E ; |  XXXXX | $DE0B
    .byte $3E ; |  XXXXX | $DE0C
    .byte $3E ; |  XXXXX | $DE0D
    .byte $3E ; |  XXXXX | $DE0E
    .byte $3E ; |  XXXXX | $DE0F
    .byte $3E ; |  XXXXX | $DE10
    .byte $3E ; |  XXXXX | $DE11
    .byte $1C ; |   XXX  | $DE12
    .byte $1C ; |   XXX  | $DE13
    .byte $14 ; |   X X  | $DE14
    .byte $14 ; |   X X  | $DE15
    .byte $14 ; |   X X  | $DE16
    .byte $14 ; |   X X  | $DE17
    .byte $14 ; |   X X  | $DE18
    .byte $14 ; |   X X  | $DE19
    .byte $14 ; |   X X  | $DE1A
    .byte $36 ; |  XX XX | $DE1B
    .byte $00 ; |        | $DE1C
ManGfxTwo:
    .byte $00 ; |        | $DE1D
    .byte $00 ; |        | $DE1E
    .byte $00 ; |        | $DE1F
    .byte $00 ; |        | $DE20
    .byte $08 ; |    X   | $DE21
    .byte $1C ; |   XXX  | $DE22
    .byte $1C ; |   XXX  | $DE23
    .byte $1C ; |   XXX  | $DE24
    .byte $08 ; |    X   | $DE25
    .byte $1C ; |   XXX  | $DE26
    .byte $3C ; |  XXXX  | $DE27
    .byte $3C ; |  XXXX  | $DE28
    .byte $3C ; |  XXXX  | $DE29
    .byte $1C ; |   XXX  | $DE2A
    .byte $0E ; |    XXX | $DE2B
    .byte $14 ; |   X X  | $DE2C
    .byte $1C ; |   XXX  | $DE2D
    .byte $1C ; |   XXX  | $DE2E
    .byte $1C ; |   XXX  | $DE2F
    .byte $14 ; |   X X  | $DE30
    .byte $14 ; |   X X  | $DE31
    .byte $14 ; |   X X  | $DE32
    .byte $14 ; |   X X  | $DE33
    .byte $14 ; |   X X  | $DE34
    .byte $14 ; |   X X  | $DE35
    .byte $14 ; |   X X  | $DE36
    .byte $14 ; |   X X  | $DE37
    .byte $16 ; |   X XX | $DE38
    .byte $00 ; |        | $DE39
ManGfxThree:
    .byte $00 ; |        | $DE3A
    .byte $00 ; |        | $DE3B
    .byte $00 ; |        | $DE3C
    .byte $00 ; |        | $DE3D
    .byte $02 ; |      X | $DE3E
    .byte $07 ; |     XXX| $DE3F
    .byte $07 ; |     XXX| $DE40
    .byte $07 ; |     XXX| $DE41
    .byte $03 ; |      XX| $DE42
    .byte $0C ; |    XX  | $DE43
    .byte $1E ; |   XXXX | $DE44
    .byte $1E ; |   XXXX | $DE45
    .byte $1E ; |   XXXX | $DE46
    .byte $02 ; |      X | $DE47
    .byte $0E ; |    XXX | $DE48
    .byte $1C ; |   XXX  | $DE49
    .byte $18 ; |   XX   | $DE4A
    .byte $18 ; |   XX   | $DE4B
    .byte $0C ; |    XX  | $DE4C
    .byte $0E ; |    XXX | $DE4D
    .byte $0E ; |    XXX | $DE4E
    .byte $0C ; |    XX  | $DE4F
    .byte $0C ; |    XX  | $DE50
    .byte $18 ; |   XX   | $DE51
    .byte $08 ; |    X   | $DE52
    .byte $08 ; |    X   | $DE53
    .byte $08 ; |    X   | $DE54
    .byte $0C ; |    XX  | $DE55
    .byte $00 ; |        | $DE56
ManGfxFour:
    .byte $00 ; |        | $DE57
    .byte $00 ; |        | $DE58
    .byte $00 ; |        | $DE59
    .byte $04 ; |     X  | $DE5A
    .byte $0E ; |    XXX | $DE5B
    .byte $0E ; |    XXX | $DE5C
    .byte $0E ; |    XXX | $DE5D
    .byte $06 ; |     XX | $DE5E
    .byte $0C ; |    XX  | $DE5F
    .byte $1C ; |   XXX  | $DE60
    .byte $0C ; |    XX  | $DE61
    .byte $04 ; |     X  | $DE62
    .byte $0A ; |    X X | $DE63
    .byte $0C ; |    XX  | $DE64
    .byte $1C ; |   XXX  | $DE65
    .byte $18 ; |   XX   | $DE66
    .byte $1C ; |   XXX  | $DE67
    .byte $0C ; |    XX  | $DE68
    .byte $0E ; |    XXX | $DE69
    .byte $0A ; |    X X | $DE6A
    .byte $1A ; |   XX X | $DE6B
    .byte $24 ; |  X  X  | $DE6C
    .byte $64 ; | XX  X  | $DE6D
    .byte $42 ; | X    X | $DE6E
    .byte $40 ; | X      | $DE6F
    .byte $00 ; |        | $DE70
    .byte $00 ; |        | $DE71
    .byte $00 ; |        | $DE72
    .byte $00 ; |        | $DE73
ManGfxFive:
    .byte $00 ; |        | $DE74
    .byte $00 ; |        | $DE75
    .byte $00 ; |        | $DE76
    .byte $04 ; |     X  | $DE77
    .byte $0E ; |    XXX | $DE78
    .byte $0E ; |    XXX | $DE79
    .byte $0E ; |    XXX | $DE7A
    .byte $06 ; |     XX | $DE7B
    .byte $0C ; |    XX  | $DE7C
    .byte $1C ; |   XXX  | $DE7D
    .byte $1C ; |   XXX  | $DE7E
    .byte $0C ; |    XX  | $DE7F
    .byte $04 ; |     X  | $DE80
    .byte $08 ; |    X   | $DE81
    .byte $1E ; |   XXXX | $DE82
    .byte $18 ; |   XX   | $DE83
    .byte $1C ; |   XXX  | $DE84
    .byte $1C ; |   XXX  | $DE85
    .byte $16 ; |   X XX | $DE86
    .byte $12 ; |   X  X | $DE87
    .byte $12 ; |   X  X | $DE88
    .byte $32 ; |  XX  X | $DE89
    .byte $62 ; | XX   X | $DE8A
    .byte $C3 ; |XX    XX| $DE8B
    .byte $80 ; |X       | $DE8C
    .byte $80 ; |X       | $DE8D
    .byte $00 ; |        | $DE8E
    .byte $00 ; |        | $DE8F
    .byte $00 ; |        | $DE90
ManGfxSix:
    .byte $00 ; |        | $DE91
    .byte $00 ; |        | $DE92
    .byte $00 ; |        | $DE93
    .byte $00 ; |        | $DE94
    .byte $02 ; |      X | $DE95
    .byte $07 ; |     XXX| $DE96
    .byte $07 ; |     XXX| $DE97
    .byte $07 ; |     XXX| $DE98
    .byte $03 ; |      XX| $DE99
    .byte $0C ; |    XX  | $DE9A
    .byte $1E ; |   XXXX | $DE9B
    .byte $3E ; |  XXXXX | $DE9C
    .byte $2E ; |  X XXX | $DE9D
    .byte $1E ; |   XXXX | $DE9E
    .byte $07 ; |     XXX| $DE9F
    .byte $1C ; |   XXX  | $DEA0
    .byte $18 ; |   XX   | $DEA1
    .byte $18 ; |   XX   | $DEA2
    .byte $0C ; |    XX  | $DEA3
    .byte $06 ; |     XX | $DEA4
    .byte $0E ; |    XXX | $DEA5
    .byte $3C ; |  XXXX  | $DEA6
    .byte $24 ; |  X  X  | $DEA7
    .byte $24 ; |  X  X  | $DEA8
    .byte $04 ; |     X  | $DEA9
    .byte $04 ; |     X  | $DEAA
    .byte $04 ; |     X  | $DEAB
    .byte $02 ; |      X | $DEAC
    .byte $00 ; |        | $DEAD

    .byte $00 ; |        | $DEAE
    .byte $00 ; |        | $DEAF
    .byte $00 ; |        | $DEB0

ColRoomTab:
    .byte RED            ; $DEB1  Virgo   duplicate table to ColRoofFloorTab in other bank!
    .byte GREEN          ; $DEB2  Leo
    .byte BROWN          ; $DEB3  Cancer
    .byte PURPLE+2       ; $DEB4  Gemini
    .byte ORANGE+2       ; $DEB5  Taurus
    .byte YELLOW         ; $DEB6  Aries
    .byte BLUE+1         ; $DEB7  Pisces
    .byte PURPLE         ; $DEB8  Aquarius
    .byte GREENB         ; $DEB9  Capricorn
    .byte YELLOW+2       ; $DEBA  Sagittarius
    .byte ORANGE         ; $DEBB  Scorpio
    .byte OCHRE          ; $DEBC  Libra
ManVposOnRafts:
    .byte 130            ; $DEBD  bottom ledge,
    .byte 120            ; $DEBE  1st raft,
    .byte 110            ; $DEBF  2nd,
    .byte 100            ; $DEC0  3rd...
    .byte  90            ; $DEC1
    .byte  80            ; $DEC2
    .byte  70            ; $DEC3
    .byte  60            ; $DEC4
    .byte  50            ; $DEC5
    .byte  40            ; $DEC6
    .byte  30            ; $DEC7
    .byte  20            ; $DEC8
    .byte  10            ; $DEC9
    .byte   0            ; $DECA   door height!
RaftGfx:
    .byte $7F ; | XXXXXXX| $DECB
    .byte $FE ; |XXXXXXX | $DECC
    .byte $FE ; |XXXXXXX | $DECD
    .byte $FE ; |XXXXXXX | $DECE
    .byte $FE ; |XXXXXXX | $DECF
    .byte $FE ; |XXXXXXX | $DED0
    .byte $FE ; |XXXXXXX | $DED1
    .byte $7F ; | XXXXXXX| $DED2
RaftColTab:
    .byte RED-6          ; $DED3  <-- this byte is never used!
    .byte RED-2          ; $DED4
    .byte RED+2          ; $DED5
    .byte RED+6          ; $DED6
    .byte RED+6          ; $DED7
    .byte RED+2          ; $DED8
    .byte RED-2          ; $DED9
    .byte RED-6          ; $DEDA
ManWalkPtrs:
    .byte <ManGfxOne     ; $DEDB
    .byte <ManGfxTwo     ; $DEDC
    .byte <ManGfxThree   ; $DEDD
    .byte <ManGfxFour    ; $DEDE
    .byte <ManGfxFive    ; $DEDF
    .byte <ManGfxSix     ; $DEE0
HposVB_Waterfall:
    .byte  20            ; $DEE1  first waterfall
    .byte  40            ; $DEE2
    .byte  60            ; $DEE3
    .byte  80            ; $DEE4
    .byte 100            ; $DEE5  final waterfall (far right)
WaterfallSpeedTab:
    .byte 185            ; $DEE6  1st waterfall (slow)
    .byte 185+7          ; $DEE7
    .byte 185+7+9        ; $DEE8
    .byte 185+7+9+7      ; $DEE9
    .byte 185+7+9+7+9    ; $DEEA  last waterfall (fastest)
WaterfallPassHeight:
    .byte 55             ; $DEEB  1st waterfall, largest passage...
    .byte 50             ; $DEEC
    .byte 45             ; $DEED
    .byte 40             ; $DEEE
    .byte 38             ; $DEEF  last waterfall, smallest passage!
WaterfallGfx:
    .byte $01 ; |       X| $DEF0  narrowest
    .byte $03 ; |      XX| $DEF1
    .byte $07 ; |     XXX| $DEF2
    .byte $0F ; |    XXXX| $DEF3
    .byte $1F ; |   XXXXX| $DEF4  widest (last)
ManHposNext_WF_Start:
    .byte  29            ; $DEF5  horiz boundary the man must cross, then next waterfall will appear!
    .byte  49            ; $DEF6
    .byte  69            ; $DEF7
    .byte  89            ; $DEF8
    .byte 109            ; $DEF9
WaterfallVol:
    .byte $06            ; $DEFA  AUDV1
    .byte $08            ; $DEFB
    .byte $0A            ; $DEFC
    .byte $0C            ; $DEFD
    .byte $0F            ; $DEFE  full volume!

    .byte $00 ; |        | $DEFF  free byte

       ORG $0F00,0
      RORG $DF00

ColManGfxOne:
    .byte  0,0,0
    .byte  FLESH       ; |        | $DF03
    .byte  FLESH       ; |    X   | $DF04
    .byte  FLESH       ; |   XXX  | $DF05
    .byte  FLESH       ; |   XXX  | $DF06
    .byte  FLESH       ; |   XXX  | $DF07
    .byte  FLESH       ; |    X   | $DF08
    .byte  FLESH       ; |   XXX  | $DF09
    .byte  BLUE        ; |  XXXXX | $DF0A
    .byte  BLUE        ; |  XXXXX | $DF0B
    .byte  BLUE        ; |  XXXXX | $DF0C
    .byte  BLUE        ; |  XXXXX | $DF0D
    .byte  BLUE        ; |  XXXXX | $DF0E
    .byte  BLUE        ; |  XXXXX | $DF0F
    .byte  BLUE        ; |  XXXXX | $DF10
    .byte  FLESH       ; |  XXXXX | $DF11
    .byte  GREENB+5    ; |   XXX  | $DF12
    .byte  GREENB+5    ; |   XXX  | $DF13
    .byte  GREENB+5    ; |   X X  | $DF14
    .byte  GREENB+5    ; |   X X  | $DF15
    .byte  GREENB+5    ; |   X X  | $DF16
    .byte  GREENB+5    ; |   X X  | $DF17
    .byte  GREENB+5    ; |   X X  | $DF18
    .byte  GREENB+5    ; |   X X  | $DF19
    .byte  GREENB+5    ; |   X X  | $DF1A
    .byte  GREY        ; |  XX XX | $DF1B
    .byte  0
ColManGfxTwo:
    .byte  0,0,0
    .byte  FLESH       ; |        | $DF20
    .byte  FLESH       ; |    X   | $DF21
    .byte  FLESH       ; |   XXX  | $DF22
    .byte  FLESH       ; |   XXX  | $DF23
    .byte  FLESH       ; |   XXX  | $DF24
    .byte  FLESH       ; |    X   | $DF25
    .byte  FLESH       ; |   XXX  | $DF26
    .byte  BLUE        ; |  XXXX  | $DF27
    .byte  BLUE        ; |  XXXX  | $DF28
    .byte  BLUE        ; |  XXXX  | $DF29
    .byte  BLUE        ; |   XXX  | $DF2A
    .byte  BLUE        ; |    XXX | $DF2B
    .byte  BLUE        ; |   X X  | $DF2C
    .byte  BLUE        ; |   XXX  | $DF2D
    .byte  GREENB+5    ; |   XXX  | $DF2E
    .byte  GREENB+5    ; |   XXX  | $DF2F
    .byte  GREENB+5    ; |   X X  | $DF30
    .byte  GREENB+5    ; |   X X  | $DF31
    .byte  GREENB+5    ; |   X X  | $DF32
    .byte  GREENB+5    ; |   X X  | $DF33
    .byte  GREENB+5    ; |   X X  | $DF34
    .byte  GREENB+5    ; |   X X  | $DF35
    .byte  GREENB+5    ; |   X X  | $DF36
    .byte  GREENB+5    ; |   X X  | $DF37
    .byte  GREY        ; |   X XX | $DF38
    .byte  0
ColManGfxThree:
    .byte  0,0,0
    .byte  FLESH       ; |        | $DF3D
    .byte  FLESH       ; |      X | $DF3E
    .byte  FLESH       ; |     XXX| $DF3F
    .byte  FLESH       ; |     XXX| $DF40
    .byte  FLESH       ; |     XXX| $DF41
    .byte  FLESH       ; |      XX| $DF42
    .byte  BLUE        ; |    XX  | $DF43
    .byte  BLUE        ; |   XXXX | $DF44
    .byte  BLUE        ; |   XXXX | $DF45
    .byte  BLUE        ; |   XXXX | $DF46
    .byte  BLUE        ; |      X | $DF47
    .byte  BLUE        ; |    XXX | $DF48
    .byte  BLUE        ; |   XXX  | $DF49
    .byte  BLUE        ; |   XX   | $DF4A
    .byte  GREENB+5    ; |   XX   | $DF4B
    .byte  GREENB+5    ; |    XX  | $DF4C
    .byte  GREENB+5    ; |    XXX | $DF4D
    .byte  GREENB+5    ; |    XXX | $DF4E
    .byte  GREENB+5    ; |    XX  | $DF4F
    .byte  GREENB+5    ; |    XX  | $DF50
    .byte  GREENB+5    ; |   XX   | $DF51
    .byte  GREENB+5    ; |    X   | $DF52
    .byte  GREENB+5    ; |    X   | $DF53
    .byte  GREENB+5    ; |    X   | $DF54
    .byte  GREY        ; |    XX  | $DF55
    .byte  0
ColManGfxFour:
    .byte  0,0,0
    .byte  FLESH       ; |     X  | $DF5A
    .byte  FLESH       ; |    XXX | $DF5B
    .byte  FLESH       ; |    XXX | $DF5C
    .byte  FLESH       ; |    XXX | $DF5D
    .byte  FLESH       ; |     XX | $DF5E
    .byte  FLESH       ; |    XX  | $DF5F
    .byte  BLUE        ; |   XXX  | $DF60
    .byte  BLUE        ; |    XX  | $DF61
    .byte  BLUE        ; |     X  | $DF62
    .byte  BLUE        ; |    X X | $DF63
    .byte  BLUE        ; |    XX  | $DF64
    .byte  BLUE        ; |   XXX  | $DF65
    .byte  BLUE        ; |   XX   | $DF66
    .byte  BLUE        ; |   XXX  | $DF67
    .byte  GREENB+5    ; |    XX  | $DF68
    .byte  GREENB+5    ; |    XXX | $DF69
    .byte  GREENB+5    ; |    X X | $DF6A
    .byte  GREENB+5    ; |   XX X | $DF6B
    .byte  GREENB+5    ; |  X  X  | $DF6C
    .byte  GREENB+5    ; | XX  X  | $DF6D
    .byte  GREY        ; | X    X | $DF6E
    .byte  GREY        ; | X      | $DF6F
    .byte  GREY        ; |        | $DF70
    .byte  GREY        ; |        | $DF71
    .byte  GREY        ; |        | $DF72
    .byte  0
ColManGfxFive:
    .byte  0,0,0
    .byte  FLESH       ; |     X  | $DF77
    .byte  FLESH       ; |    XXX | $DF78
    .byte  FLESH       ; |    XXX | $DF79
    .byte  FLESH       ; |    XXX | $DF7A
    .byte  FLESH       ; |     XX | $DF7B
    .byte  BLUE        ; |    XX  | $DF7C
    .byte  BLUE        ; |   XXX  | $DF7D
    .byte  BLUE        ; |   XXX  | $DF7E
    .byte  BLUE        ; |    XX  | $DF7F
    .byte  BLUE        ; |     X  | $DF80
    .byte  BLUE        ; |    X   | $DF81
    .byte  BLUE        ; |   XXXX | $DF82
    .byte  BLUE        ; |   XX   | $DF83
    .byte  BLUE        ; |   XXX  | $DF84
    .byte  GREENB+5    ; |   XXX  | $DF85
    .byte  GREENB+5    ; |   X XX | $DF86
    .byte  GREENB+5    ; |   X  X | $DF87
    .byte  GREENB+5    ; |   X  X | $DF88
    .byte  GREENB+5    ; |  XX  X | $DF89
    .byte  GREENB+5    ; | XX   X | $DF8A
    .byte  GREY        ; |XX    XX| $DF8B
    .byte  GREY        ; |X       | $DF8C
    .byte  GREY        ; |X       | $DF8D
    .byte  GREY        ; |        | $DF8E
    .byte  GREY        ; |        | $DF8F
    .byte  0
ColManGfxSix:
    .byte  0,0,0
    .byte  FLESH       ; |        | $DF94
    .byte  FLESH       ; |      X | $DF95
    .byte  FLESH       ; |     XXX| $DF96
    .byte  FLESH       ; |     XXX| $DF97
    .byte  FLESH       ; |     XXX| $DF98
    .byte  FLESH       ; |      XX| $DF99
    .byte  BLUE        ; |    XX  | $DF9A
    .byte  BLUE        ; |   XXXX | $DF9B
    .byte  BLUE        ; |  XXXXX | $DF9C
    .byte  BLUE        ; |  X XXX | $DF9D
    .byte  BLUE        ; |   XXXX | $DF9E
    .byte  BLUE        ; |     XXX| $DF9F
    .byte  BLUE        ; |   XXX  | $DFA0
    .byte  BLUE        ; |   XX   | $DFA1
    .byte  GREENB+5    ; |   XX   | $DFA2
    .byte  GREENB+5    ; |    XX  | $DFA3
    .byte  GREENB+5    ; |     XX | $DFA4
    .byte  GREENB+5    ; |    XXX | $DFA5
    .byte  GREENB+5    ; |  XXXX  | $DFA6
    .byte  GREENB+5    ; |  X  X  | $DFA7
    .byte  GREENB+5    ; |  X  X  | $DFA8
    .byte  GREENB+5    ; |     X  | $DFA9
    .byte  GREENB+5    ; |     X  | $DFAA
    .byte  GREENB+5    ; |     X  | $DFAB
    .byte  GREY        ; |      X | $DFAC
    .byte  0,0,0,0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;    ++++++++++   ++++++++++
;    ++++++++++   ++++++++++  <-- section 0, line 0-33
;    ++++               ++++  <-- section 1, line 34-67
;              ROOM           <-- section 2, line 68,101
;    ++++               ++++  <-- section 3, line 102-135
;    ++++++++++   ++++++++++  <-- section 4, line 136-169
;    ++++++++++   ++++++++++

RoomSectionLineIndex:
    .byte  34            ; $DFB1  section 0,
    .byte  68            ; $DFB2  1
    .byte 102            ; $DFB3  2
    .byte 136            ; $DFB4  3
    .byte 170            ; $DFB5  4
RoomPatPF0:
    .byte $FF ; |XXXXXXXX| $DFB6  PF0
    .byte $FF ; |XXXXXXXX| $DFB7
    .byte $00 ; |        | $DFB8
    .byte $FF ; |XXXXXXXX| $DFB9
    .byte $FF ; |XXXXXXXX| $DFBA
RoomPatPF1:
    .byte $FF ; |XXXXXXXX| $DFBB  PF1
    .byte $00 ; |        | $DFBC
    .byte $00 ; |        | $DFBD
    .byte $00 ; |        | $DFBE
    .byte $FF ; |XXXXXXXX| $DFBF
RoomPatPF2:
    .byte $0F ; |    XXXX| $DFC0  PF2
    .byte $00 ; |        | $DFC1
    .byte $00 ; |        | $DFC2
    .byte $00 ; |        | $DFC3
    .byte $0F ; |    XXXX| $DFC4

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LDFC5 x2

LDFC5 SUBROUTINE
    lda    ram_AA                ; 3
    asl                          ; 2
    eor    ram_AA                ; 3
    asl                          ; 2
    asl                          ; 2
    rol    ram_A9                ; 5
    rol    ram_AA                ; 5
    lda    ram_A9                ; 3
    and    #$7F                  ; 2
    sta    ram_C0                ; 3
LDFD6:
    clc                          ; 2
    adc    ram_C1                ; 3
    sec                          ; 2
    cmp    ram_C2                ; 3
    bcc    LDFE7                 ; 2³
    beq    LDFE7                 ; 2³
    lsr    ram_C0                ; 5
    lda    ram_C0                ; 3
    jmp    LDFD6                 ; 3

LDFE7:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    .byte $00 ; |        | $DFE8
    .byte $00 ; |        | $DFE9

       ORG $0FEA,0
      RORG $DFEA

    lda    ram_82                ; 3
    and    #$F0                  ; 2
    cmp    #$D0                  ; 2
    bne    LDFF5                 ; 2³
LDFF2:
    sta    BANK_1                ; 4
LDFF5:
    jmp.ind (ram_81)             ; 5

    .byte $00 ; |        | $DFF8
    .byte $FF ; |XXXXXXXX| $DFF9

    .word (START_0 + $2000)
    .word (START_0 + $2000)
    .word (START_0 + $2000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;      BANK 1
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

       ORG $1000,0
      RORG $F000

START_1:
    cld                          ;
    sei                          ;
    ldx    #$FF                  ;
    txs                          ;
    inx                          ;
    txa                          ;
.loopClear:
    sta    0,X                   ;
    inx                          ;
    bne    .loopClear            ;
    jmp    Initialization        ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SixByteDisplay x4

SixByteDisplay SUBROUTINE
    sty    ram_A3                ; 3
LF011:
    ldy    ram_A3                ; 3
    lda    (ram_A1),Y            ; 5
    sta    GRP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_9F),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9D),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_9B),Y            ; 5
    sta    ram_A4                ; 3
    lda    (ram_99),Y            ; 5
    tax                          ; 2
    lda    (ram_97),Y            ; 5
    tay                          ; 2
    lda    ram_A4                ; 3
    sta    GRP1                  ; 3
    stx    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    dec    ram_A3                ; 5
    bpl    LF011                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF044 x4

LF044 SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$03                  ; 2
    ldy    #0                    ; 2
    sty    REFP1                 ; 3
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    VDELP0                ; 3
    sta    VDELP1                ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    GRP0                  ; 3
    sty    GRP1                  ; 3
    sty    HMP1                  ; 3
    nop                          ; 2
    sta    RESP0                 ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2   right 1
    sta    HMP0                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF06C x2

LF06C SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$06                  ; 2
    sta    NUSIZ0                ; 3
    sta    NUSIZ1                ; 3
    sta    REFP0                 ; 3
    sta    REFP1                 ; 3
    ldx    #0                    ; 2
    stx    GRP0                  ; 3
    stx    GRP1                  ; 3
    stx    GRP0                  ; 3
    inx                          ; 2
    stx    VDELP0                ; 3
    sta    RESP0                 ; 3
    stx    VDELP1                ; 3
    sta    RESP1                 ; 3
    lda    #$F0                  ; 2   right 1
    sta    HMP0                  ; 3
    lda    #$10                  ; 2   left 1
    sta    HMP1                  ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF096 x1, also jumped to from LF613 subroutine

LF096 SUBROUTINE
    sty    ram_A3                ; 3
LF098:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    (ram_A1),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_9F),Y            ; 5
    sta    GRP1                  ; 3
    lda    (ram_9D),Y            ; 5
    sta.w  GRP0                  ; 4
    lda    (ram_9B),Y            ; 5
    dec    ram_A3                ; 5
    sta    GRP1                  ; 3
    lda    (ram_99),Y            ; 5
    sta    GRP0                  ; 3
    lda    (ram_97),Y            ; 5
    sta    GRP1                  ; 3
    nop                          ; 2
    sta    GRP0                  ; 3
    ldy    ram_A3                ; 3
    bpl    LF098                 ; 2³
    lda    #0                    ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Positioning x1
;LF0C9 x2
;LF0CC x1

Positioning SUBROUTINE
    lda    ram_AE,X              ; 4   ram_AE, ram_AF
LF0C9 SUBROUTINE
    jsr    CalcPosition          ; 6
LF0CC SUBROUTINE
    sta    HMP0,X                ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
LF0D0:
    dey                          ; 2
    bpl    LF0D0                 ; 2³
    sta    RESP0,X               ; 4
    sta    WSYNC                 ; 3
;---------------------------------------
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;CalcPosition x1

CalcPosition SUBROUTINE
    clc                          ; 2
    adc    #$2E                  ; 2
    tay                          ; 2
    and    #$0F                  ; 2
    sta    ram_A3                ; 3
    tya                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tay                          ; 2
    clc                          ; 2
    adc    ram_A3                ; 3
    cmp    #$0F                  ; 2
    bcc    LF0F0                 ; 2³
    sbc    #$0F                  ; 2
    iny                          ; 2
LF0F0:
    eor    #$07                  ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    and    #$F0                  ; 2
    sty    ram_A3                ; 3
    ora    ram_A3                ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Initialization:
    lda    #$F7                  ; 2
    sta    ram_80                ; 3
LF101:
    lda    #$F2                  ; 2
    sta    ram_AA                ; 3
    lda    #$A5                  ; 2
    sta    ram_A9                ; 3
    ldx    #$05                  ; 2
LF10B:
    lda    InitialItemsCarried,X ; 4
    sta    itemsCarried,X        ; 4
    dex                          ; 2
    bpl    LF10B                 ; 2³
    ldx    #$07                  ; 2
LF115:
    lda    InitialItemsInRoom,X  ; 4
    sta    itemsZodiacChamber,X  ; 4
    dex                          ; 2
    bpl    LF115                 ; 2³
    lda    #$00                  ; 2
    sta    ram_83                ; 3
    jmp    LFD02                 ; 3

DoVsync:
    lda    #$03                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldx    #$00                  ; 2
    stx    VSYNC                 ; 3
    lda    #$2C                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    ror                          ; 2
    ror                          ; 2
    bcs    LF15A                 ; 2³
    lda    ram_95                ; 3
    bne    LF150                 ; 2³
LF144:
    inc    ram_96                ; 5
    lda    ram_96                ; 3
    cmp    #$11                  ; 2
    bne    LF14E                 ; 2³
    lda    #$00                  ; 2
LF14E:
    sta    ram_96                ; 3
LF150:
    inc    ram_95                ; 5
    lda    ram_95                ; 3
    and    #$1F                  ; 2
    bne    LF15E                 ; 2³
    beq    LF144                 ; 3   always branch

LF15A:
    ldy    #$00                  ; 2
    sty    ram_95                ; 3
LF15E:
    inc    frameCounter          ; 5
    bne    LF164                 ; 2³
    inc    ram_94                ; 5
LF164:
    lda    ram_83                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    VblankLoPtrs,X        ; 4
    sta    ram_81                ; 3
    lda    VblankHiPtrs,X        ; 4
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

FinishVblank:  ; indirect jump also
    lda    INTIM                 ; 4
    bne    FinishVblank          ; 2³
    lda    #$CA                  ; 2
    sta    TIM64T                ; 4
    sta    CXCLR                 ; 3
    lda    ram_83                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    DrawScreenLoPtrs,X    ; 4
    sta    ram_81                ; 3
    lda    DrawScreenHiPtrs,X    ; 4
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

LF194:  ; indirect jump also
    lda    INTIM                 ; 4
    bne    LF194                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    COLUBK                ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    #$FE                  ; 2
    sta    ram_98                ; 3
    sta    ram_9A                ; 3
    sta    ram_9C                ; 3
    sta    ram_9E                ; 3
    sta    ram_A0                ; 3
    sta    ram_A2                ; 3
    lda    itemsCarried+5        ; 3   leftmost item
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_A1                ; 3
    lda    itemsCarried+4        ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_9F                ; 3
    lda    itemsCarried+3        ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_9D                ; 3
    lda    itemsCarried+2        ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_9B                ; 3
    lda    itemsCarried+1        ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_99                ; 3
    lda    itemsCarried          ; 3
    and    #$1F                  ; 2
    tay                          ; 2
    lda    ItemLoPtrsTab,Y       ; 4
    sta    ram_97                ; 3
    jsr    LF06C                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$C8                  ; 2
    sta    COLUBK                ; 3
    ldy    #$0B                  ; 2
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF096                 ; 6
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
LF209:
    sta    WSYNC                 ; 3
    lda    #$02                  ; 2
    sta    VBLANK                ; 3
    lda    #$23                  ; 2
    sta    TIM64T                ; 4
    lda    SWCHB                 ; 4
    ror                          ; 2
    bcs    LF22C                 ; 2³
    ldx    #$AF                  ; 2
    lda    #$00                  ; 2
LF21E:
    sta    0,X                   ; 4
    dex                          ; 2
    cpx    #$81                  ; 2
    bcs    LF21E                 ; 2³
    ldx    #$FF                  ; 2
    stx    ram_80                ; 3
    jmp    LF101                 ; 3

LF22C:
    lda    SWCHA                 ; 4
    eor    #$FF                  ; 2   anything pressed?
    beq    LF239                 ; 2³  - no
    lda    #$00                  ; 2   - yes
    sta    ram_94                ; 3
    beq    LF250                 ; 3   always branch

LF239:
    lda    ram_94                ; 3
    cmp    #$FF                  ; 2
    bne    LF250                 ; 2³
    lda    ram_83                ; 3
    beq    LF250                 ; 2³
    lda    #$F7                  ; 2
    sta    ram_80                ; 3
    lda    #$00                  ; 2
    sta    ram_94                ; 3
    sta    ram_83                ; 3
    jmp    LFD02                 ; 3

LF250:
    lda    ram_83                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    OverscanLoPtrs,X      ; 4
    sta    ram_81                ; 3
    lda    OverscanHiPtrs,X      ; 4
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

FinishOverscan:  ; indirect jump also
    lda    INTIM                 ; 4
    bne    FinishOverscan        ; 2³
    jmp    DoVsync               ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
;            XXXXX XXX
;           XXXXXXX  XX
;          XXXXXXXXX  XX
;         XXX  XXXXXX  X
;        XXX  X XXXXX XXX
;       XXX  XXX XXXX X X
;       XXX XXX   XXX XXX
;       XXX XX     XXX X
;       XXX XX      XXX X                          X
;       XXX XX       XXX                          XXX
;       XXX XX        X                           XXX
;       XXX XX                                    XXX
;        XXX XX                                    X
;         XXX XX                                   X
;          XXX  XX     X  X   X     X    X   X     X
;           XXXX  X   XXX XX XXX   XXX  XXX XXX XX X
;            XXXXX XX X X  X XXX   XXX  XXX XXX XX X
;             XXXXX  X  X  X XXX  XX XX XXX XX XXXXX
;              XXXXXX  XX X   X   XX XX  XX X  X XXX
;               XXXXXX XX XX  XX  X   XX  XXX X   XXX
;                XXXXX X  XX  XX  X   XX  XX  X   XXX
;            XX  XXXX XX XXX XXX XX  XXX XX  XX   XXX
;          XX XX  XXX XX XXX XXX XX  XXX XXX XX   XXX
;         XXXX XX XXX XX XXX XXX XX  XXX XXX XX   XXX
;        XXXXXX XX XX XX XXX XXX XX  XXX XXX XX   XXX
;       XXX  XXX X XX XX XXX XXX XX  XXX XXX XX   XXX
;      XXX  X XX X XX XX XXX XXX XX  XXX XXX XX   XXX
;      XXX XXX X   XXX XX XX  XX  X   XX  XX  X    XX
;      XXX XX      XXX XX XXX X   XX XX   X   XX  XX
;      XXX XX      XXXX XXX XXXX  XXXXX  XXX  XXXXXXX
;      XXX XX      XXXX XXX  XXX   XXX   XXX   XXX XX
;      XXX XXXX    XXXX XXX  XXX   XXX   XXX   XXX XX
;      XXX  X  X  XXXXXX X    X     X     X     X  X
;      XXXX  X  X XXXXXXX  X
;       XXXX  X  XXXXXXXXX X                      X
;        XXXX  X XXXXXXXXX X                     XXX
;         XXXX  XXXXXXXXXX X                     XXX
;        X XXXXXXXXXXXXXX                        XXX
;       XXX XXXXXXXXXXXX X   X   X   X     X      X
;       XXX  XXXXXXXXXX XXX XXX XXX XXX   XXX   X X X
;      XXX  X XXXXXXXX  X X XXX XXXXXXX  XX XX XXXXXXX
;      XXX XX          X  X XXX XXX  XX XX   XX X X X
;      XXX XX      XXX X X   X   X    X XX   XX   X
;      XXX XX      XXX  XX   XX  XX     XXX       XX
;      XXX XX      XXX  XX   XX  XX  X  XXXX      XX
;      XXX XX      XXX XX   XXX XXX XXX  XXXXX   XXX
;      XXX XX      XXX XX   XXX XXXXXXXX   XXXX  XXX
;      XXX XX      XXX XX   XXX XXX XXX    XXXXX  XX
;      XXX XX      XXX XX   XXX XXX X       XXXX XXX
;      XXX XX      XXX XX   XXX XXX      X   XXX XXX
;      XXX XX  X   XXX XX   XXX XXX     XXX  XXX XXX
;      XXX XX   X  XXX  XX   XX  XX   X XXX  XXX  XX
;       XX  X  X X XX X  XX XX   X    X XXX  XX   X
;       XXX X  XX XXX X XXXXXXX XXX  XX  X  XXX  XXX
;        XX  X XXXXX X  XXXXXXX XXXXXXX  XXXXX   XXX
;        XXX X  XXXXX   XXX XXX XXX XXX   XXX    XXX
;         XX  X  XXX X   X   X   X   X     X      X
;         XXX   XXXXX X    X
;          XXX XXX XXX X  XXX
;          XXXXXXX XXXX XXX X
;           XXXXX X  XXX XXXX
;            XXX X    XXX  X
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LogoOne:
    .byte $03 ; |      XX| $F26A
    .byte $07 ; |     XXX| $F26B
    .byte $0F ; |    XXXX| $F26C
    .byte $0E ; |    XXX | $F26D
    .byte $1C ; |   XXX  | $F26E
    .byte $19 ; |   XX  X| $F26F
    .byte $3A ; |  XXX X | $F270
    .byte $32 ; |  XX  X | $F271
    .byte $74 ; | XXX X  | $F272
    .byte $64 ; | XX  X  | $F273
    .byte $EC ; |XXX XX  | $F274
    .byte $EC ; |XXX XX  | $F275
    .byte $EC ; |XXX XX  | $F276
    .byte $EC ; |XXX XX  | $F277
    .byte $EC ; |XXX XX  | $F278
    .byte $EC ; |XXX XX  | $F279
    .byte $EC ; |XXX XX  | $F27A
    .byte $EC ; |XXX XX  | $F27B
    .byte $EC ; |XXX XX  | $F27C
    .byte $EC ; |XXX XX  | $F27D
    .byte $EC ; |XXX XX  | $F27E
    .byte $E5 ; |XXX  X X| $F27F
    .byte $73 ; | XXX  XX| $F280
    .byte $77 ; | XXX XXX| $F281
    .byte $2F ; |  X XXXX| $F282
    .byte $1E ; |   XXXX | $F283
    .byte $3C ; |  XXXX  | $F284
    .byte $79 ; | XXXX  X| $F285
    .byte $F2 ; |XXXX  X | $F286
    .byte $E4 ; |XXX  X  | $F287
    .byte $EF ; |XXX XXXX| $F288
    .byte $EC ; |XXX XX  | $F289
    .byte $EC ; |XXX XX  | $F28A
    .byte $EC ; |XXX XX  | $F28B
    .byte $EE ; |XXX XXX | $F28C
    .byte $E5 ; |XXX  X X| $F28D
    .byte $73 ; | XXX  XX| $F28E
    .byte $3F ; |  XXXXXX| $F28F
    .byte $1E ; |   XXXX | $F290
    .byte $0D ; |    XX X| $F291
    .byte $03 ; |      XX| $F292
    .byte $00 ; |        | $F293
    .byte $00 ; |        | $F294
    .byte $00 ; |        | $F295
    .byte $01 ; |       X| $F296
    .byte $03 ; |      XX| $F297
    .byte $07 ; |     XXX| $F298
    .byte $0E ; |    XXX | $F299
    .byte $1D ; |   XXX X| $F29A
    .byte $3B ; |  XXX XX| $F29B
    .byte $76 ; | XXX XX | $F29C
    .byte $76 ; | XXX XX | $F29D
    .byte $76 ; | XXX XX | $F29E
    .byte $76 ; | XXX XX | $F29F
    .byte $76 ; | XXX XX | $F2A0
    .byte $77 ; | XXX XXX| $F2A1
    .byte $73 ; | XXX  XX| $F2A2
    .byte $39 ; |  XXX  X| $F2A3
    .byte $1C ; |   XXX  | $F2A4
    .byte $0F ; |    XXXX| $F2A5
    .byte $07 ; |     XXX| $F2A6
    .byte $03 ; |      XX| $F2A7
LogoTwo:
    .byte $A1 ; |X X    X| $F2A8
    .byte $D3 ; |XX X  XX| $F2A9
    .byte $EF ; |XXX XXXX| $F2AA
    .byte $EE ; |XXX XXX | $F2AB
    .byte $7D ; | XXXXX X| $F2AC
    .byte $3A ; |  XXX X | $F2AD
    .byte $7C ; | XXXXX  | $F2AE
    .byte $FA ; |XXXXX X | $F2AF
    .byte $DD ; |XX XXX X| $F2B0
    .byte $AD ; |X X XX X| $F2B1
    .byte $4E ; | X  XXX | $F2B2
    .byte $8E ; |X   XXX | $F2B3
    .byte $0E ; |    XXX | $F2B4
    .byte $0E ; |    XXX | $F2B5
    .byte $0E ; |    XXX | $F2B6
    .byte $0E ; |    XXX | $F2B7
    .byte $0E ; |    XXX | $F2B8
    .byte $0E ; |    XXX | $F2B9
    .byte $0E ; |    XXX | $F2BA
    .byte $0E ; |    XXX | $F2BB
    .byte $00 ; |        | $F2BC
    .byte $FE ; |XXXXXXX | $F2BD
    .byte $FF ; |XXXXXXXX| $F2BE
    .byte $FF ; |XXXXXXXX| $F2BF
    .byte $FF ; |XXXXXXXX| $F2C0
    .byte $7F ; | XXXXXXX| $F2C1
    .byte $BF ; |X XXXXXX| $F2C2
    .byte $3F ; |  XXXXXX| $F2C3
    .byte $5F ; | X XXXXX| $F2C4
    .byte $9F ; |X  XXXXX| $F2C5
    .byte $0F ; |    XXXX| $F2C6
    .byte $0F ; |    XXXX| $F2C7
    .byte $0F ; |    XXXX| $F2C8
    .byte $0E ; |    XXX | $F2C9
    .byte $8E ; |X   XXX | $F2CA
    .byte $AD ; |X X XX X| $F2CB
    .byte $AD ; |X X XX X| $F2CC
    .byte $6D ; | XX XX X| $F2CD
    .byte $DD ; |XX XXX X| $F2CE
    .byte $9D ; |X  XXX X| $F2CF
    .byte $3D ; |  XXXX X| $F2D0
    .byte $3E ; |  XXXXX | $F2D1
    .byte $7E ; | XXXXXX | $F2D2
    .byte $FC ; |XXXXXX  | $F2D3
    .byte $F2 ; |XXXX  X | $F2D4
    .byte $ED ; |XXX XX X| $F2D5
    .byte $91 ; |X  X   X| $F2D6
    .byte $60 ; | XX     | $F2D7
    .byte $80 ; |X       | $F2D8
    .byte $00 ; |        | $F2D9
    .byte $00 ; |        | $F2DA
    .byte $01 ; |       X| $F2DB
    .byte $03 ; |      XX| $F2DC
    .byte $07 ; |     XXX| $F2DD
    .byte $0E ; |    XXX | $F2DE
    .byte $1D ; |   XXX X| $F2DF
    .byte $BD ; |X XXXX X| $F2E0
    .byte $7D ; | XXXXX X| $F2E1
    .byte $FC ; |XXXXXX  | $F2E2
    .byte $F9 ; |XXXXX  X| $F2E3
    .byte $F3 ; |XXXX  XX| $F2E4
    .byte $EE ; |XXX XXX | $F2E5
LogoThree:
    .byte $C8 ; |XX  X   | $F2E6
    .byte $BC ; |X XXXX  | $F2E7
    .byte $74 ; | XXX X  | $F2E8
    .byte $9C ; |X  XXX  | $F2E9
    .byte $08 ; |    X   | $F2EA
    .byte $22 ; |  X   X | $F2EB
    .byte $77 ; | XXX XXX| $F2EC
    .byte $7F ; | XXXXXXX| $F2ED
    .byte $7F ; | XXXXXXX| $F2EE
    .byte $36 ; |  XX XX | $F2EF
    .byte $63 ; | XX   XX| $F2F0
    .byte $C7 ; |XX   XXX| $F2F1
    .byte $C7 ; |XX   XXX| $F2F2
    .byte $C7 ; |XX   XXX| $F2F3
    .byte $C7 ; |XX   XXX| $F2F4
    .byte $C7 ; |XX   XXX| $F2F5
    .byte $C7 ; |XX   XXX| $F2F6
    .byte $63 ; | XX   XX| $F2F7
    .byte $63 ; | XX   XX| $F2F8
    .byte $A2 ; |X X   X | $F2F9
    .byte $97 ; |X  X XXX| $F2FA
    .byte $57 ; | X X XXX| $F2FB
    .byte $77 ; | XXX XXX| $F2FC
    .byte $A2 ; |X X   X | $F2FD
    .byte $C0 ; |XX      | $F2FE
    .byte $E8 ; |XXX X   | $F2FF
    .byte $E8 ; |XXX X   | $F300
    .byte $E8 ; |XXX X   | $F301
    .byte $C8 ; |XX  X   | $F302
    .byte $A1 ; |X X    X| $F303
    .byte $73 ; | XXX  XX| $F304
    .byte $73 ; | XXX  XX| $F305
    .byte $77 ; | XXX XXX| $F306
    .byte $DD ; |XX XXX X| $F307
    .byte $D9 ; |XX XX  X| $F308
    .byte $BB ; |X XXX XX| $F309
    .byte $BB ; |X XXX XX| $F30A
    .byte $BB ; |X XXX XX| $F30B
    .byte $BB ; |X XXX XX| $F30C
    .byte $BB ; |X XXX XX| $F30D
    .byte $BB ; |X XXX XX| $F30E
    .byte $99 ; |X  XX  X| $F30F
    .byte $D9 ; |XX XX  X| $F310
    .byte $D1 ; |XX X   X| $F311
    .byte $4B ; | X  X XX| $F312
    .byte $4B ; | X  X XX| $F313
    .byte $DB ; |XX XX XX| $F314
    .byte $91 ; |X  X   X| $F315
    .byte $00 ; |        | $F316
    .byte $00 ; |        | $F317
    .byte $00 ; |        | $F318
    .byte $00 ; |        | $F319
    .byte $80 ; |X       | $F31A
    .byte $40 ; | X      | $F31B
    .byte $80 ; |X       | $F31C
    .byte $C0 ; |XX      | $F31D
    .byte $40 ; | X      | $F31E
    .byte $C0 ; |XX      | $F31F
    .byte $80 ; |X       | $F320
    .byte $80 ; |X       | $F321
    .byte $00 ; |        | $F322
    .byte $00 ; |        | $F323
LogoFour:
    .byte $00 ; |        | $F324
    .byte $00 ; |        | $F325
    .byte $00 ; |        | $F326
    .byte $00 ; |        | $F327
    .byte $00 ; |        | $F328
    .byte $22 ; |  X   X | $F329
    .byte $77 ; | XXX XXX| $F32A
    .byte $7F ; | XXXXXXX| $F32B
    .byte $73 ; | XXX  XX| $F32C
    .byte $21 ; |  X    X| $F32D
    .byte $31 ; |  XX   X| $F32E
    .byte $70 ; | XXX    | $F32F
    .byte $70 ; | XXX    | $F330
    .byte $74 ; | XXX X  | $F331
    .byte $77 ; | XXX XXX| $F332
    .byte $7F ; | XXXXXXX| $F333
    .byte $77 ; | XXX XXX| $F334
    .byte $32 ; |  XX  X | $F335
    .byte $30 ; |  XX    | $F336
    .byte $21 ; |  X    X| $F337
    .byte $73 ; | XXX  XX| $F338
    .byte $7F ; | XXXXXXX| $F339
    .byte $77 ; | XXX XXX| $F33A
    .byte $22 ; |  X   X | $F33B
    .byte $00 ; |        | $F33C
    .byte $00 ; |        | $F33D
    .byte $00 ; |        | $F33E
    .byte $00 ; |        | $F33F
    .byte $00 ; |        | $F340
    .byte $04 ; |     X  | $F341
    .byte $8E ; |X   XXX | $F342
    .byte $8E ; |X   XXX | $F343
    .byte $9F ; |X  XXXXX| $F344
    .byte $1B ; |   XX XX| $F345
    .byte $91 ; |X  X   X| $F346
    .byte $B3 ; |X XX  XX| $F347
    .byte $B3 ; |X XX  XX| $F348
    .byte $B3 ; |X XX  XX| $F349
    .byte $B3 ; |X XX  XX| $F34A
    .byte $B3 ; |X XX  XX| $F34B
    .byte $B3 ; |X XX  XX| $F34C
    .byte $91 ; |X  X   X| $F34D
    .byte $91 ; |X  X   X| $F34E
    .byte $1B ; |   XX XX| $F34F
    .byte $9B ; |X  XX XX| $F350
    .byte $8E ; |X   XXX | $F351
    .byte $8E ; |X   XXX | $F352
    .byte $04 ; |     X  | $F353
    .byte $00 ; |        | $F354
    .byte $00 ; |        | $F355
    .byte $00 ; |        | $F356
    .byte $00 ; |        | $F357
    .byte $00 ; |        | $F358
    .byte $00 ; |        | $F359
    .byte $00 ; |        | $F35A
    .byte $00 ; |        | $F35B
    .byte $00 ; |        | $F35C
    .byte $00 ; |        | $F35D
    .byte $00 ; |        | $F35E
    .byte $00 ; |        | $F35F
    .byte $00 ; |        | $F360
    .byte $00 ; |        | $F361
LogoFive:
    .byte $00 ; |        | $F362
    .byte $00 ; |        | $F363
    .byte $00 ; |        | $F364
    .byte $00 ; |        | $F365
    .byte $00 ; |        | $F366
    .byte $08 ; |    X   | $F367
    .byte $1C ; |   XXX  | $F368
    .byte $3E ; |  XXXXX | $F369
    .byte $27 ; |  X  XXX| $F36A
    .byte $73 ; | XXX  XX| $F36B
    .byte $73 ; | XXX  XX| $F36C
    .byte $73 ; | XXX  XX| $F36D
    .byte $23 ; |  X   XX| $F36E
    .byte $07 ; |     XXX| $F36F
    .byte $0F ; |    XXXX| $F370
    .byte $8F ; |X   XXXX| $F371
    .byte $3E ; |  XXXXX | $F372
    .byte $78 ; | XXXX   | $F373
    .byte $70 ; | XXX    | $F374
    .byte $63 ; | XX   XX| $F375
    .byte $63 ; | XX   XX| $F376
    .byte $36 ; |  XX XX | $F377
    .byte $1C ; |   XXX  | $F378
    .byte $08 ; |    X   | $F379
    .byte $00 ; |        | $F37A
    .byte $00 ; |        | $F37B
    .byte $00 ; |        | $F37C
    .byte $00 ; |        | $F37D
    .byte $00 ; |        | $F37E
    .byte $10 ; |   X    | $F37F
    .byte $38 ; |  XXX   | $F380
    .byte $38 ; |  XXX   | $F381
    .byte $39 ; |  XXX  X| $F382
    .byte $11 ; |   X   X| $F383
    .byte $99 ; |X  XX  X| $F384
    .byte $BB ; |X XXX XX| $F385
    .byte $BB ; |X XXX XX| $F386
    .byte $BB ; |X XXX XX| $F387
    .byte $BB ; |X XXX XX| $F388
    .byte $BB ; |X XXX XX| $F389
    .byte $B3 ; |X XX  XX| $F38A
    .byte $99 ; |X  XX  X| $F38B
    .byte $9D ; |X  XXX X| $F38C
    .byte $34 ; |  XX X  | $F38D
    .byte $76 ; | XXX XX | $F38E
    .byte $77 ; | XXX XXX| $F38F
    .byte $77 ; | XXX XXX| $F390
    .byte $22 ; |  X   X | $F391
    .byte $00 ; |        | $F392
    .byte $00 ; |        | $F393
    .byte $00 ; |        | $F394
    .byte $00 ; |        | $F395
    .byte $00 ; |        | $F396
    .byte $00 ; |        | $F397
    .byte $00 ; |        | $F398
    .byte $00 ; |        | $F399
    .byte $00 ; |        | $F39A
    .byte $00 ; |        | $F39B
    .byte $00 ; |        | $F39C
    .byte $00 ; |        | $F39D
    .byte $00 ; |        | $F39E
    .byte $00 ; |        | $F39F
LogoSix:
    .byte $00 ; |        | $F3A0
    .byte $00 ; |        | $F3A1
    .byte $00 ; |        | $F3A2
    .byte $00 ; |        | $F3A3
    .byte $00 ; |        | $F3A4
    .byte $10 ; |   X    | $F3A5
    .byte $38 ; |  XXX   | $F3A6
    .byte $38 ; |  XXX   | $F3A7
    .byte $38 ; |  XXX   | $F3A8
    .byte $10 ; |   X    | $F3A9
    .byte $98 ; |X  XX   | $F3AA
    .byte $B8 ; |X XXX   | $F3AB
    .byte $B8 ; |X XXX   | $F3AC
    .byte $B8 ; |X XXX   | $F3AD
    .byte $98 ; |X  XX   | $F3AE
    .byte $38 ; |  XXX   | $F3AF
    .byte $38 ; |  XXX   | $F3B0
    .byte $18 ; |   XX   | $F3B1
    .byte $18 ; |   XX   | $F3B2
    .byte $10 ; |   X    | $F3B3
    .byte $54 ; | X X X  | $F3B4
    .byte $FE ; |XXXXXXX | $F3B5
    .byte $54 ; | X X X  | $F3B6
    .byte $10 ; |   X    | $F3B7
    .byte $38 ; |  XXX   | $F3B8
    .byte $38 ; |  XXX   | $F3B9
    .byte $38 ; |  XXX   | $F3BA
    .byte $10 ; |   X    | $F3BB
    .byte $00 ; |        | $F3BC
    .byte $48 ; | X  X   | $F3BD
    .byte $EC ; |XXX XX  | $F3BE
    .byte $EC ; |XXX XX  | $F3BF
    .byte $FC ; |XXXXXX  | $F3C0
    .byte $98 ; |X  XX   | $F3C1
    .byte $0C ; |    XX  | $F3C2
    .byte $1C ; |   XXX  | $F3C3
    .byte $1C ; |   XXX  | $F3C4
    .byte $1C ; |   XXX  | $F3C5
    .byte $1C ; |   XXX  | $F3C6
    .byte $1C ; |   XXX  | $F3C7
    .byte $1C ; |   XXX  | $F3C8
    .byte $1C ; |   XXX  | $F3C9
    .byte $1C ; |   XXX  | $F3CA
    .byte $B8 ; |X XXX   | $F3CB
    .byte $F8 ; |XXXXX   | $F3CC
    .byte $68 ; | XX X   | $F3CD
    .byte $68 ; | XX X   | $F3CE
    .byte $08 ; |    X   | $F3CF
    .byte $08 ; |    X   | $F3D0
    .byte $08 ; |    X   | $F3D1
    .byte $1C ; |   XXX  | $F3D2
    .byte $1C ; |   XXX  | $F3D3
    .byte $1C ; |   XXX  | $F3D4
    .byte $08 ; |    X   | $F3D5
    .byte $00 ; |        | $F3D6
    .byte $00 ; |        | $F3D7
    .byte $00 ; |        | $F3D8
    .byte $00 ; |        | $F3D9
    .byte $00 ; |        | $F3DA
    .byte $00 ; |        | $F3DB
    .byte $00 ; |        | $F3DC
    .byte $00 ; |        | $F3DD

IN_TitleScreen:  ; indirect jump also
    ldy    #0                    ; 2
    lda    #$20                  ; 2  left 2
    ldx    #2                    ; 2
    jsr    LF0CC                 ; 6
    inx                          ; 2
    lda    #$0F                  ; 2
    jsr    LF0C9                 ; 6
    inx                          ; 2
    lda    #$0C                  ; 2
    jsr    LF0C9                 ; 6
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMOVE                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    HMCLR                 ; 3
    jmp    FinishOverscan        ; 3

OV_TitleScreen:  ; indirect jump also
    lda    INPT4                 ; 3
    bmi    LF405                 ; 2³
    jmp    LFCFB                 ; 3

LF405:
    jsr    LF044                 ; 6
    lda    ram_94                ; 3
    eor    #$1C                  ; 2
    bne    LF410                 ; 2³
    lda    #$02                  ; 2
LF410:
    and    ram_80                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #$0B                  ; 2
LF418:
    lda    LogoPtrTab,X          ; 4
    sta    ram_97,X              ; 4
    dex                          ; 2
    bpl    LF418                 ; 2³
    jmp    FinishOverscan        ; 3

VB_TitleScreen:  ; indirect jump
    jmp    FinishVblank          ; 3

DR_TitleScreen:  ; indirect jump also
    lda    #0                    ;
    sta    WSYNC                 ;
;---------------------------------------
    sta    VBLANK                ; vBlank ends...
    sta    COLUBK                ; black
    sta    COLUPF                ;
    sta    WSYNC                 ;
;---------------------------------------
    ldy    #61                   ; logo height
    jsr    SixByteDisplay        ; draw "SwordQuest Earthworld"
    sta    WSYNC                 ;
;---------------------------------------
    lda    #0                    ;
    sta    VDELP0                ; no delay
    sta    VDELP1                ;
    sta    CTRLPF                ;
    lda    #$30                  ; missiles 8 clocks wide, 1 copy each
    sta    NUSIZ0                ;
    sta    NUSIZ1                ;
    lda    #24                   ; GRP0 positon for logo
    sta    ram_AE                ;
    lda    #32                   ; GRP1 position for logo
    sta    ram_AF                ;
    ldx    #1                    ;
.loopLogoPos:
    jsr    Positioning           ;
    dex                          ;
    bpl    .loopLogoPos          ;
    sta    WSYNC                 ;
;---------------------------------------
    sta    HMOVE                 ;
    ldx    #0                    ;
    ldy    frameCounter          ; for colors
.loopSwordTop:
    sta    WSYNC                 ;
;---------------------------------------
    lda    SwordHandleGfxOne,X   ; draw top handle of sword
    sta    GRP0                  ;
    sty    COLUP0                ;
    sty    COLUP1                ;
    lda    SwordHandleGfxTwo,X   ;
    sta    GRP1                  ;
    dey                          ; decrease color
    dey                          ;
    inx                          ;
    cpx    #24                   ;
    bcc    .loopSwordTop         ;

    ldx    #0                    ; 2
    lda    ram_94                ; 3
    eor    #$72                  ; 2
    bne    LF480                 ; 2³
    lda    #$02                  ; 2
LF480:
    and    ram_80                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    lda    #$FF                  ; enable
    sta    ENAM0                 ;
    sta    ENAM1                 ;
    sta    ENABL                 ;
LF48E:
    sta    WSYNC                 ;
;---------------------------------------
    lda    SwordGfxOne,X         ; 4
    sta    PF0                   ; 3
    sty    COLUPF                ; 3
    lda    SwordGfxTwo,X         ; 4
    sta    PF1                   ; 3
    lda    SwordGfxThree,X       ; 4
    sta    PF2                   ; 3
    lda    SwordGfxFour,X        ; 4
    sta    PF0                   ; 3
    lda    SwordGfxFive,X        ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF1                   ; 3
    lda    SwordGfxSix,X         ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    iny                          ; 2
    iny                          ; 2
    inx                          ; 2
    cpx    #$09                  ; 2
    bne    LF48E                 ; 2³
    dex                          ; 2
    dex                          ; 2
    dey                          ; 2
    dey                          ; 2
LF4BF:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    SwordGfxOne,X         ; 4
    sta    PF0                   ; 3
    sty    COLUPF                ; 3
    lda    SwordGfxTwo,X         ; 4
    sta    PF1                   ; 3
    lda    SwordGfxThree,X       ; 4
    sta    PF2                   ; 3
    lda    SwordGfxFour,X        ; 4
    sta    PF0                   ; 3
    lda    SwordGfxFive,X        ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF1                   ; 3
    lda    SwordGfxSix,X         ; 4
    nop                          ; 2
    nop                          ; 2
    sta    PF2                   ; 3
    dey                          ; 2
    dey                          ; 2
    dex                          ; 2
    bpl    LF4BF                 ; 2³
    lda    #0                    ; 2
    sta    ENAM0                 ; 3
    sta    ENAM1                 ; 3
    sta    ENABL                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    ldx    #$17                  ; 2
    lda    SwordHandleGfxOne,X   ; 4
    sta    GRP0                  ; 3
    sty    COLUP0                ; 3
    lda    SwordHandleGfxTwo,X   ; 4
    sta    GRP1                  ; 3
    sty    COLUP1                ; 3
    iny                          ; 2
    iny                          ; 2
    dex                          ; 2
LF50B:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    SwordHandleGfxOne,X   ; 4
    sta    GRP0                  ; 3
    sty    COLUP0                ; 3
    sty    COLUP1                ; 3
    lda    SwordHandleGfxTwo,X   ; 4
    sta    GRP1                  ; 3
    iny                          ; 2
    iny                          ; 2
    dex                          ; 2
    bpl    LF50B                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    GRP0                  ; 3
    sta    GRP1                  ; 3
LF528:
    lda    INTIM                 ; 4
    bne    LF528                 ; 2³
    lda    ram_83                ; 3
    cmp    #$0A                  ; draw final clue?
    bne    LF536                 ; - no
    jmp    LFBA7                 ; - yes

LF536:
    ldx    #10                   ; 2
LF538:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF538                 ; 2³
    lda    ram_94                ; 3
    eor    #$5D                  ; 2
    bne    LF545                 ; 2³
    lda    #$02                  ; 2
LF545:
    and    ram_80                ; 3
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #11                   ; 2
LF54D:
    lda    CopyrightPtrTab,X     ; 4
    sta    ram_97,X              ; 4
    dex                          ; 2
    bpl    LF54D                 ; 2³
    jsr    LF044                 ; 6
    ldy    #6                    ; 2
    jsr    SixByteDisplay        ; 6  draw "(c)1982 ATARI"
    jmp    LF209                 ; 3

LogoPtrTab:
    .word LogoSix        ; $F560
    .word LogoFive       ; $F562
    .word LogoFour       ; $F564
    .word LogoThree      ; $F566
    .word LogoTwo        ; $F568
    .word LogoOne        ; $F56A
SwordGfxOne:
    .byte $00 ; |        | $F56C   PF0
    .byte $00 ; |        | $F56D
    .byte $FF ; |XXXXXXXX| $F56E
    .byte $FF ; |XXXXXXXX| $F56F
    .byte $FF ; |XXXXXXXX| $F570
    .byte $FF ; |XXXXXXXX| $F571
    .byte $FF ; |XXXXXXXX| $F572
    .byte $FF ; |XXXXXXXX| $F573
    .byte $FF ; |XXXXXXXX| $F574
    .byte $FF ; |XXXXXXXX| $F575
SwordGfxTwo:
    .byte $FF ; |XXXXXXXX| $F576   PF1
    .byte $FF ; |XXXXXXXX| $F577
    .byte $00 ; |        | $F578
    .byte $00 ; |        | $F579
    .byte $FF ; |XXXXXXXX| $F57A
    .byte $FF ; |XXXXXXXX| $F57B
    .byte $FF ; |XXXXXXXX| $F57C
    .byte $FF ; |XXXXXXXX| $F57D
    .byte $FF ; |XXXXXXXX| $F57E
    .byte $FF ; |XXXXXXXX| $F57F
SwordGfxThree:
    .byte $FF ; |XXXXXXXX| $F580   PF2
    .byte $FF ; |XXXXXXXX| $F581
    .byte $00 ; |        | $F582
    .byte $00 ; |        | $F583
    .byte $FF ; |XXXXXXXX| $F584
    .byte $FF ; |XXXXXXXX| $F585
    .byte $FF ; |XXXXXXXX| $F586
    .byte $FF ; |XXXXXXXX| $F587
    .byte $FF ; |XXXXXXXX| $F588
    .byte $FF ; |XXXXXXXX| $F589
SwordGfxFour:
    .byte $FF ; |XXXXXXXX| $F58A   PF0  (right side)
    .byte $FF ; |XXXXXXXX| $F58B
    .byte $00 ; |        | $F58C
    .byte $00 ; |        | $F58D
    .byte $FF ; |XXXXXXXX| $F58E
    .byte $FF ; |XXXXXXXX| $F58F
    .byte $FF ; |XXXXXXXX| $F590
    .byte $FF ; |XXXXXXXX| $F591
    .byte $FF ; |XXXXXXXX| $F592
    .byte $FF ; |XXXXXXXX| $F593
SwordGfxFive:
    .byte $E0 ; |XXX     | $F594   PF1  (right side)
    .byte $F8 ; |XXXXX   | $F595
    .byte $7E ; | XXXXXX | $F596
    .byte $7F ; | XXXXXXX| $F597
    .byte $FF ; |XXXXXXXX| $F598
    .byte $FF ; |XXXXXXXX| $F599
    .byte $FF ; |XXXXXXXX| $F59A
    .byte $FF ; |XXXXXXXX| $F59B
    .byte $FF ; |XXXXXXXX| $F59C
    .byte $FF ; |XXXXXXXX| $F59D
SwordGfxSix:
    .byte $00 ; |        | $F59E   PF2  (right side)
    .byte $00 ; |        | $F59F
    .byte $00 ; |        | $F5A0
    .byte $01 ; |       X| $F5A1
    .byte $07 ; |     XXX| $F5A2
    .byte $1F ; |   XXXXX| $F5A3
    .byte $3F ; |  XXXXXX| $F5A4
    .byte $7F ; | XXXXXXX| $F5A5
    .byte $FF ; |XXXXXXXX| $F5A6
SwordHandleGfxOne:
    .byte $0F ; |    XXXX| $F5A7   GRP0
    .byte $1F ; |   XXXXX| $F5A8
    .byte $3E ; |  XXXXX | $F5A9
    .byte $7C ; | XXXXX  | $F5AA
    .byte $EE ; |XXX XXX | $F5AB
    .byte $C6 ; |XX   XX | $F5AC
    .byte $EE ; |XXX XXX | $F5AD
    .byte $7C ; | XXXXX  | $F5AE
    .byte $38 ; |  XXX   | $F5AF
    .byte $10 ; |   X    | $F5B0
    .byte $01 ; |       X| $F5B1
    .byte $01 ; |       X| $F5B2
    .byte $01 ; |       X| $F5B3
    .byte $19 ; |   XX  X| $F5B4
    .byte $3D ; |  XXXX X| $F5B5
    .byte $6F ; | XX XXXX| $F5B6
    .byte $C5 ; |XX   X X| $F5B7
    .byte $69 ; | XX X  X| $F5B8
    .byte $3C ; |  XXXX  | $F5B9
    .byte $0E ; |    XXX | $F5BA
    .byte $0F ; |    XXXX| $F5BB
    .byte $3F ; |  XXXXXX| $F5BC
    .byte $7F ; | XXXXXXX| $F5BD
    .byte $FF ; |XXXXXXXX| $F5BE
SwordHandleGfxTwo:
    .byte $C0 ; |XX      | $F5BF   GRP1
    .byte $F0 ; |XXXX    | $F5C0
    .byte $7C ; | XXXXX  | $F5C1
    .byte $7E ; | XXXXXX | $F5C2
    .byte $5F ; | X XXXXX| $F5C3
    .byte $5B ; | X XX XX| $F5C4
    .byte $51 ; | X X   X| $F5C5
    .byte $7B ; | XXXX XX| $F5C6
    .byte $6F ; | XX XXXX| $F5C7
    .byte $C6 ; |XX   XX | $F5C8
    .byte $EC ; |XXX XX  | $F5C9
    .byte $78 ; | XXXX   | $F5CA
    .byte $70 ; | XXX    | $F5CB
    .byte $60 ; | XX     | $F5CC
    .byte $60 ; | XX     | $F5CD
    .byte $60 ; | XX     | $F5CE
    .byte $70 ; | XXX    | $F5CF
    .byte $B8 ; |X XXX   | $F5D0
    .byte $D8 ; |XX XX   | $F5D1
    .byte $EC ; |XXX XX  | $F5D2
    .byte $F4 ; |XXXX X  | $F5D3
    .byte $EE ; |XXX XXX | $F5D4
    .byte $DF ; |XX XXXXX| $F5D5
    .byte $BF ; |X XXXXXX| $F5D6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Zodiac Room
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VB_ZodiacRoom:  ; indirect jump
    lda    ram_B1                ; 3
    bne    LF5EF                 ; 2³
    ldx    ram_B2                ; 3
    lda    frameCounter          ; 3
    and    #$04                  ; 2
    bne    LF5E8                 ; 2³
    lda    ram_AF                ; 3
    jmp    LF5EA                 ; 3

LF5E8:
    lda    #$11                  ; 2
LF5EA:
    sta    itemsCarried,X        ; 4
    jmp    LF600                 ; 3

LF5EF:
    ldx    ram_AE                ; 3
    lda    frameCounter          ; 3
    and    #$04                  ; 2
    bne    LF5FC                 ; 2³
    lda    ram_AF                ; 3
    jmp    LF5FE                 ; 3

LF5FC:
    lda    #$C0                  ; 2
LF5FE:
    sta    ram_B3,X              ; 4
LF600:
    ldx    roomNum               ; 3
    lda    ColRoofFloorTab,X     ; 4
    sta    COLUBK                ; 3
    jsr    LF06C                 ; 6
    jmp    FinishVblank          ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF60D x1

LF60D SUBROUTINE
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LF60D                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF613 x3

LF613 SUBROUTINE
    ldx    #$1D                  ; 2
    jsr    LF60D                 ; 6
    ldx    #$0A                  ; 2
    lda    #$05                  ; 2
    sta    ram_A3                ; 3
LF61E:
    lda.wy ram_B3,Y              ; 4
    sta    ram_97,X              ; 4
    dey                          ; 2
    dex                          ; 2
    dex                          ; 2
    dec    ram_A3                ; 5
    bpl    LF61E                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #$0B                  ; 2
    jmp    LF096                 ; 3   jump into another subroutine to finish

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DR_ZodiacRoom:  ; indirect jump
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    VBLANK                ; 3
    ldy    #$05                  ; 2
    jsr    LF613                 ; 6
    ldy    #$0B                  ; 2
    jsr    LF613                 ; 6
    lda    #$FE                  ; 2
    ldx    ram_C3                ; 3
    cpx    #$C0                  ; 2
    beq    LF64B                 ; 2³
    lda    #$FD                  ; 2
LF64B:
    sta    ram_A0                ; 3
    ldy    #$11                  ; 2
    jsr    LF613                 ; 6
    jmp    LF194                 ; 3

OV_ZodiacRoom:  ; indirect jump
    lda    #$00                  ; 2
    sta    AUDV1                 ; 3
    lda    ram_AD                ; 3
    bmi    LF661                 ; 2³
    dec    ram_AD                ; 5
    bpl    LF665                 ; 2³
LF661:
    lda    INPT4                 ; 3
    bpl    LF668                 ; 2³
LF665:
    jmp    LF6E9                 ; 3

LF668:
    ldy    ram_AE                ; 3
    cpy    #$10                  ; 2
    bne    LF671                 ; 2³
    jmp    LF6BA                 ; 3

LF671:
    cpy    #$11                  ; 2
    bne    LF678                 ; 2³
    jmp    LFCFB                 ; 3

LF678:
    lda    ram_AF                ; 3
    cmp    #$CC                  ; 2
    bne    LF681                 ; 2³
    jmp    LF6E9                 ; 3

LF681:
    lda    ram_B1                ; 3
    beq    LF6BD                 ; 2³
    ldx    ram_AE                ; 3
    lda    ItemSelectFreqTab,X   ; 4   choosing an item in the Zodiac chamber,
    sta    AUDF1                 ; 3   i.e. pressing fire while hovering over an item
    lda    ItemSelectToneTab,X   ; 4
    sta    AUDC1                 ; 3
    ldx    #$05                  ; 2
LF693:
    lda    itemsCarried,X        ; 4
    cmp    #$10                  ; 2
    beq    LF69F                 ; 2³
    dex                          ; 2
    bpl    LF693                 ; 2³
    jmp    LF6E9                 ; 3

LF69F:
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    sty    itemsCarried,X        ; 4
    tya                          ; 2
    lsr                          ; 2
    eor    #$FF                  ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$0F                  ; 2
    bcc    LF6B2                 ; 2³
    lda    #$F0                  ; 2
LF6B2:
    ora    itemsZodiacChamber,X  ; 4
    sta    itemsZodiacChamber,X  ; 4
    lda    #$CC                  ; 2
    sta    ram_AF                ; 3
LF6BA:
    jmp    FinishOverscan        ; 3

LF6BD:
    lda    ram_AF                ; 3
    cmp    #$10                  ; 2
    beq    LF6E6                 ; 2³
    ldx    ram_AE                ; 3
    lda    #$10                  ; 2
    sta    itemsCarried,X        ; 4
    ldx    ram_AF                ; 3
    sta    ram_AF                ; 3
    lda    ItemSelectFreqTab,X   ; 4
    sta    AUDF1                 ; 3
    lda    ItemSelectToneTab,X   ; 4
    sta    AUDC1                 ; 3
    lda    #$0F                  ; 2
    sta    AUDV1                 ; 3
    lda    ItemLoPtrsTab,X       ; 4
    sta    ram_B3,X              ; 4
    txa                          ; 2
    ldy    roomNum               ; 3
    jsr    LFCCA                 ; 6
LF6E6:
    jmp    FinishOverscan        ; 3

LF6E9:
    lda    ram_B1                ; 3
    sta    ram_A3                ; 3
    lda    SWCHA                 ; 4
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    sta    saveP0Joy             ; 3   keep P0 only
    dec    ram_B0                ; 5
    bne    LF764                 ; 2³+1
    lda    #$14                  ; 2
    sta    ram_B0                ; 3
    lda    saveP0Joy             ; 3
    lsr                          ; 2   UP pressed?
    bcs    LF708                 ; 2³  - no
    inc    ram_B1                ; 5   - yes
    jmp    LF70D                 ; 3

LF708:
    lsr                          ; 2   DOWN pressed?
    bcs    LF716                 ; 2³  - no
    dec    ram_B1                ; 5   - yes
LF70D:
    lda    ram_B1                ; 3
    and    #$03                  ; 2
    sta    ram_B1                ; 3
    jmp    LF733                 ; 3

LF716:
    lsr                          ; 2   LEFT pressed?
    bcs    LF728                 ; 2³  - no
    inc    ram_B2                ; 5   - yes
    lda    ram_B2                ; 3
    cmp    #$06                  ; 2
    bne    LF733                 ; 2³
    lda    #$00                  ; 2
    sta    ram_B2                ; 3
    jmp    LF733                 ; 3

LF728:
    lsr                          ; 2   RIGHT pressed?
    bcs    LF764                 ; 2³  - no
    dec    ram_B2                ; 5   - yes
    bpl    LF733                 ; 2³
    lda    #$05                  ; 2
    sta    ram_B2                ; 3
LF733:
    lda    ram_A3                ; 3
    bne    LF740                 ; 2³
    ldx    ram_AE                ; 3
    lda    ram_AF                ; 3
    sta    itemsCarried,X        ; 4
    jmp    LF746                 ; 3

LF740:
    ldx    ram_AE                ; 3
    lda    ram_AF                ; 3
    sta    ram_B3,X              ; 4
LF746:
    lda    ram_B1                ; 3
    bne    LF753                 ; 2³
    ldx    ram_B2                ; 3
    stx    ram_AE                ; 3
    lda    itemsCarried,X        ; 4
    jmp    LF762                 ; 3

LF753:
    lda    ram_B2                ; 3
    asl                          ; 2
    asl                          ; 2
    ora    ram_B1                ; 3
    tax                          ; 2
    lda    CursorMovementTab,X   ; 4
    sta    ram_AE                ; 3
    tax                          ; 2
    lda    ram_B3,X              ; 4
LF762:
    sta    ram_AF                ; 3
LF764:
    jmp    FinishOverscan        ; 3

CursorMovementTab:
    .byte $00,$0C,$06,$00
    .byte $00,$0D,$07,$01
    .byte $00,$0E,$08,$02
    .byte $00,$0F,$09,$03
    .byte $00,$10,$0A,$04
    .byte $00,$11,$0B,$05

IN_ZodiacRoom:  ; indirect jump
    lda    #$1F                  ; 2
    sta    ram_AD                ; 3
    lda    #$01                  ; 2
    sta    ram_B1                ; 3
    lda    #$05                  ; 2
    sta    ram_B2                ; 3
    lda    #$11                  ; 2
    sta    ram_AE                ; 3
    ldx    #$0F                  ; 2
    lda    #$CC                  ; 2
LF793:
    sta    ram_B3,X              ; 4
    dex                          ; 2
    bpl    LF793                 ; 2³
    ldx    roomNum               ; 3
    lda    LFD16,X               ; 4
    sta    ram_C3                ; 3
    lda    #<DoorGfx             ; 2
    sta    ram_AF                ; 3
    ldx    #$07                  ; 2
    ldy    #$00                  ; 2
    sty    COLUP0                ; 3
    sty    COLUP1                ; 3
LF7AB:
    lda    itemsZodiacChamber,X  ; 4
    and    #$0F                  ; 2
    cmp    roomNum               ; 3
    bne    LF7B9                 ; 2³
    lda    ItemLoPtrsTab,Y       ; 4
    sta.wy ram_B3,Y              ; 5
LF7B9:
    lda    itemsZodiacChamber,X  ; 4
    iny                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    cmp    roomNum               ; 3
    bne    LF7CA                 ; 2³
    lda    ItemLoPtrsTab,Y       ; 4
    sta.wy ram_B3,Y              ; 5
LF7CA:
    iny                          ; 2
    dex                          ; 2
    bpl    LF7AB                 ; 2³
    jmp    FinishOverscan        ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Corridor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

VB_Corridor:  ; indirect jump
    lda    frameCounter          ; 3
    and    #$03                  ; 2
    bne    LF7EE                 ; 2³
    lda    ram_C5                ; 3
    cmp    #$08                  ; 2
    bcc    LF7EE                 ; 2³
    inc    ram_C7                ; 5
    inc    ram_C6                ; 5
    inc    ram_C6                ; 5
    inc    ram_C6                ; 5
    inc    ram_C6                ; 5
    sec                          ; 2
    lda    ram_C5                ; 3
    sbc    #$06                  ; 2
    sta    ram_C5                ; 3
LF7EE:
    jmp    FinishVblank          ; 3

DR_Corridor:  ; indirect jump
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    sta    COLUPF                ; 3
    lda    #$02                  ; 2
    sta    COLUBK                ; 3
    lda    #$01                  ; 2
    sta    CTRLPF                ; 3
    ldx    ram_C7                ; 3
    ldy    #$00                  ; 2
LF805:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    ram_C9                ; 3
    sta    COLUPF                ; 3
    jsr    LF880                 ; 6
    inx                          ; 2
    iny                          ; 2
    cpy    ram_C5                ; 3
    bcs    LF829                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_C5                ; 3
    bcs    LF829                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_C5                ; 3
    bcs    LF829                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    iny                          ; 2
    cpy    ram_C5                ; 3
    bcc    LF805                 ; 2³
LF829:
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    stx    ram_A3                ; 3
    ldx    roomNum               ; 3
    lda    ColRoofFloorTab,X     ; 4
    sta    COLUPF                ; 3
    ldx    ram_A3                ; 3
    dex                          ; 2
    iny                          ; 2
LF840:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF880                 ; 6
    iny                          ; 2
    cpy    ram_C6                ; 3
    bcc    LF840                 ; 2³
    sta    WSYNC                 ; 3
;---------------------------------------
    lda    #$00                  ; 2
    sta    PF0                   ; 3
    sta    PF1                   ; 3
    sta    PF2                   ; 3
    lda    ram_C9                ; 3
    sta    COLUPF                ; 3
    iny                          ; 2
    dex                          ; 2
LF85A:
    sta    WSYNC                 ; 3
;---------------------------------------
    jsr    LF880                 ; 6
    cpx    #$00                  ; 2
    beq    LF864                 ; 2³
    dex                          ; 2
LF864:
    iny                          ; 2
    cpy    #$A0                  ; 2
    bcc    LF85A                 ; 2³
    jmp    LF194                 ; 3

OV_Corridor:  ; indirect jump
    lda    ram_C5                ; 3
    sta    AUDF0                 ; 3
    cmp    #$08                  ; 2
    bcs    LF87D                 ; 2³
    lda    frameCounter          ; 3
    and    #$0F                  ; 2
    bne    LF87D                 ; 2³
    jmp    LFCFB                 ; 3

LF87D:
    jmp    FinishOverscan        ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LF880 x3

LF880:
    lda    CorridorOne,X         ; 4
    sta    PF0                   ; 3
    lda    CorridorTwo,X         ; 4
    sta    PF1                   ; 3
    lda    CorridorThree,X       ; 4
    sta    PF2                   ; 3
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

CorridorOne:
    .byte $F0 ; |XXXX    | $F890   PF0
    .byte $E0 ; |XXX     | $F891
    .byte $C0 ; |XX      | $F892
    .byte $80 ; |X       | $F893
    .byte $00 ; |        | $F894
    .byte $00 ; |        | $F895
    .byte $00 ; |        | $F896
    .byte $00 ; |        | $F897
    .byte $00 ; |        | $F898
    .byte $00 ; |        | $F899
    .byte $00 ; |        | $F89A
    .byte $00 ; |        | $F89B
    .byte $00 ; |        | $F89C
    .byte $00 ; |        | $F89D
    .byte $00 ; |        | $F89E
    .byte $00 ; |        | $F89F
    .byte $00 ; |        | $F8A0
    .byte $00 ; |        | $F8A1
    .byte $00 ; |        | $F8A2
    .byte $00 ; |        | $F8A3
CorridorTwo:
    .byte $FF ; |XXXXXXXX| $F8A4   PF1
    .byte $FF ; |XXXXXXXX| $F8A5
    .byte $FF ; |XXXXXXXX| $F8A6
    .byte $FF ; |XXXXXXXX| $F8A7
    .byte $FF ; |XXXXXXXX| $F8A8
    .byte $7F ; | XXXXXXX| $F8A9
    .byte $3F ; |  XXXXXX| $F8AA
    .byte $1F ; |   XXXXX| $F8AB
    .byte $0F ; |    XXXX| $F8AC
    .byte $07 ; |     XXX| $F8AD
    .byte $03 ; |      XX| $F8AE
    .byte $01 ; |       X| $F8AF
    .byte $00 ; |        | $F8B0
    .byte $00 ; |        | $F8B1
    .byte $00 ; |        | $F8B2
    .byte $00 ; |        | $F8B3
    .byte $00 ; |        | $F8B4
    .byte $00 ; |        | $F8B5
    .byte $00 ; |        | $F8B6
    .byte $00 ; |        | $F8B7
CorridorThree:
    .byte $FF ; |XXXXXXXX| $F8B8   PF2
    .byte $FF ; |XXXXXXXX| $F8B9
    .byte $FF ; |XXXXXXXX| $F8BA
    .byte $FF ; |XXXXXXXX| $F8BB
    .byte $FF ; |XXXXXXXX| $F8BC
    .byte $FF ; |XXXXXXXX| $F8BD
    .byte $FF ; |XXXXXXXX| $F8BE
    .byte $FF ; |XXXXXXXX| $F8BF
    .byte $FF ; |XXXXXXXX| $F8C0
    .byte $FF ; |XXXXXXXX| $F8C1
    .byte $FF ; |XXXXXXXX| $F8C2
    .byte $FF ; |XXXXXXXX| $F8C3
    .byte $FF ; |XXXXXXXX| $F8C4
    .byte $FE ; |XXXXXXX | $F8C5
    .byte $FC ; |XXXXXX  | $F8C6
    .byte $F8 ; |XXXXX   | $F8C7
    .byte $F0 ; |XXXX    | $F8C8
    .byte $E0 ; |XXX     | $F8C9
    .byte $C0 ; |XX      | $F8CA
    .byte $80 ; |X       | $F8CB

IN_Corridor:  ; indirect jump
    ldx    ram_C9                ; 3
    lda    ColRoofFloorTab,X     ; 4
    sta    ram_C9                ; 3
    lda    #$50                  ; 2
    sta    ram_C5                ; 3
    sta    AUDF0                 ; 3
    lda    #$6E                  ; 2
    sta    ram_C6                ; 3
    lda    #0                    ; 2
    sta    ram_C7                ; 3
    lda    #$08                  ; 2
    sta    AUDC0                 ; 3
    lda    #$09                  ; 2
    sta    AUDV0                 ; 3
    jmp    FinishOverscan        ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Room Entry
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IN_RoomEntry:  ; indirect jump
    lda    #$00                  ; 2
    sta    ram_AE                ; 3
    jmp    FinishOverscan        ; 3

OV_RoomEntry:  ; indirect jump
    lda    ram_AE                ; 3
    beq    LF907                 ; 2³+1
    lda    ram_AD                ; 3
    ldx    #$05                  ; 2
    cmp    #$0A                  ; 2
    bcc    LF901                 ; 2³+1
    ldx    #$0A                  ; 2   final clue!!
LF901:
    txa                          ; 2
    sta    ram_83                ; 3
    jmp    LFD02                 ; 3

LF907:
    jmp    LFCFB                 ; 3

VB_RoomEntry:  ; indirect jump
    lda    #>(LF922-1)           ; 2
    pha                          ; 3
    lda    #<LF922-1             ; 2
    pha                          ; 3
    lda    ram_A7                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFC02,X               ; 4
    sta    ram_82                ; 3
    lda    LFC11,X               ; 4
    sta    ram_81                ; 3
    jmp.ind (ram_81)             ; 5

LF922:  ; indirect jump
    lda    #>(LF93E-1)           ; 2
    pha                          ; 3
    lda    #<LF93E-1             ; 2
    pha                          ; 3
    lda    ram_A7                ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFC09,X               ; 4
    sta    ram_82                ; 3
    lda    LFC18,X               ; 4
    sta    ram_81                ; 3
    jmp.ind (ram_81)             ; 5

LF93E:  ; indirect jump
    lda    #>(LF956-1)           ; 2
    pha                          ; 3
    lda    #<LF956-1             ; 2
    pha                          ; 3
    lda    ram_A8                ; 3
    and    #$0F                  ; 2
    tax                          ; 2
    lda    LFC0C,X               ; 4
    sta    ram_82                ; 3
    lda    LFC1B,X               ; 4
    sta    ram_81                ; 3
    jmp.ind (ram_81)             ; 5

LF956:  ; indirect jump
    lda    #>(FinishVblank-1)    ; 2
    pha                          ; 3
    lda    #<FinishVblank-1      ; 2
    pha                          ; 3
    lda    ram_A8                ; 3
    and    #$F0                  ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    tax                          ; 2
    lda    LFC0E,X               ; 4
    sta    ram_82                ; 3
    lda    LFC1D,X               ; 4
    sta    ram_81                ; 3
    jmp.ind (ram_81)             ; 5

LF972:
    inc    ram_A7                ; 5
    jmp    LF98D                 ; 3

LF977:
    lda    ram_A7                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_A7                ; 3
    jmp    LF98D                 ; 3

LF981:
    inc    ram_A8                ; 5
    jmp    LF98D                 ; 3

LF986:
    lda    ram_A8                ; 3
    clc                          ; 2
    adc    #$10                  ; 2
    sta    ram_A8                ; 3
LF98D:
    pla                          ; 4
    pla                          ; 4
    stx    ram_AD                ; 3
    inc    ram_AE                ; 5
    jmp    FinishVblank          ; 3

;---------------------------------------

CheckClue1:  ; indirect jump
    lda    roomNum               ;
    cmp    #ARIES                ;
    beq    .showClue1            ;
    rts                          ;

.showClue1:
    ldx    #CLUE1___16_4         ; X=0
    jmp    LF972                 ;

;---------------------------------------

CheckClue2:  ; indirect jump
    lda    #$06                  ;
    jsr    LFCE6                 ;
    cmp    #$03                  ;
    beq    .showClue2            ;
    rts                          ;

.showClue2:
    ldx    #CLUE2____8_4         ; X=1
    jmp    LF972                 ;

;---------------------------------------

CheckClue3:  ; indirect jump
    lda    #2                    ;  2 objects: grappling hook in Cancer room, rope in Leo room
    ldy    #0                    ;
    jsr    LFA44                 ;
    beq    .showClue3            ;
    rts                          ;

.showClue3:
    ldx    #CLUE3___25_6         ; X=2
    jmp    LF972                 ;

;---------------------------------------

CheckClue4:  ; indirect jump
    lda    #3                    ;  check 3 objects...
    ldy    #2                    ;  index increase by 2, compensates for 2 objects in previous check
    jsr    LFA44                 ;
    beq    .showClue4            ;
    rts                          ;

.showClue4:
    ldx    #CLUE4___13_3         ; X=3
    jmp    LF972                 ;

;---------------------------------------

CheckClue5:  ; indirect jump
    lda    #4                    ;
    ldy    #5                    ; 2 obj + 3 obj = start at 5 objects
    jsr    LFA44                 ;
    beq    .showClue5            ;
    rts                          ;

.showClue5:
    ldx    #CLUE5___f__d         ; X=4   Food, Dagger... this is supposedly a clue for FireWorld
    jmp    LF972                 ;

;---------------------------------------

CheckClue6:  ; indirect jump
    lda    #5                    ;
    ldy    #9                    ;
    jsr    LFA44                 ;
    beq    .showClue6            ;
    rts                          ;

.showClue6:
    ldx    #CLUE6___17_3         ; X=5
    jmp    LF972                 ;

;---------------------------------------

Return1:  ; indirect jump
    rts                          ;

;---------------------------------------

CheckClue7:  ; indirect jump
    lda    #6                    ;
    ldy    #14                   ;
    jsr    LFA44                 ;
    beq    .showClue7            ;
    rts                          ;

.showClue7:
    ldx    #CLUE7___37_5         ; X=6
    jmp    LF977                 ;

;---------------------------------------

CheckClue8:  ; indirect jump
    lda    #7                    ;
    ldy    #20                   ;
    jsr    LFA44                 ;
    beq    .showClue8            ;
    rts                          ;

.showClue8:
    ldx    #CLUE8___15_4         ; X=7
    jmp    LF977                 ;

;---------------------------------------

    rts                          ; is this ever reached?

;---------------------------------------

Return2:  ; indirect jump
    rts                          ;

;---------------------------------------
;this clue makes no sense as page 21, panel 1, but the
;result is checked elsewhere and corrected...

CheckClue11:  ; indirect jump
    lda    ram_A7                ;
    cmp    #$26                  ;
    beq    .checkClue11          ;
    rts                          ;

.checkClue11:
    lda    #15                   ;
    ldy    #27                   ;
    jsr    LFA44                 ;
    beq    .showClue11           ;
    rts                          ;

.showClue11:
    ldx    #CLUE11__21_1         ; X=10
    jmp    LF981                 ;

;---------------------------------------

Return3:  ; indirect jump
    rts                          ;

;---------------------------------------

CheckClue9:  ; indirect jump
    lda    #3                    ;
    ldy    #42                   ;
    jsr    LFA44                 ;
    beq    .showClue9            ;
    rts                          ;

.showClue9:
    ldx    #CLUE9____5_3         ; X=8
    jmp    LF986                 ;

;---------------------------------------

CheckClue10:  ; indirect jump
    lda    #3                    ;
    ldy    #45                   ;
    jsr    LFA44                 ;
    beq    .showClue10           ;
    rts                          ;

.showClue10:
    ldx    #CLUE10__27_2         ; X=9
    jmp    LF986                 ;

;---------------------------------------

Return4:  ; indirect jump
    rts                          ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFA44 x9

LFA44 SUBROUTINE
    sta    ram_AF                ; 3
LFA46:
    lda    LFA58,Y               ; 4
    jsr    LFCE6                 ; 6
    cmp    LFA88,Y               ; 4
    beq    LFA52                 ; 2³
    rts                          ; 6

LFA52:
    iny                          ; 2
    dec    ram_AF                ; 5
    bne    LFA46                 ; 2³
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFA58:
;25-6
    .byte ROPE           ;00  $FAF8
    .byte GRAPPLING_HOOK ;01  $FA59
;13-3
    .byte NECKLACE       ;02  $FA5A
    .byte RING           ;03  $FA5B
    .byte KEY            ;04  $FA5C
;FireWorld
    .byte FOOD           ;05  $FA5D
    .byte WATER          ;06  $FA5E
    .byte AMULET         ;07  $FA5F
    .byte LEATHER_ARMOR  ;08  $FA60
;17-3
    .byte CLOAK          ;09  $FA61
    .byte RING           ;10  $FA62
    .byte TALISMAN       ;11  $FA63
    .byte SHORT_SWORD    ;12  $FA64
    .byte LAMP           ;13  $FA65
;37-5
    .byte ROPE           ;14  $FA66
    .byte LAMP           ;15  $FA67
    .byte SHOES          ;16  $FA68
    .byte LEATHER_ARMOR  ;17  $FA69
    .byte TALISMAN       ;18  $FA6A
    .byte NECKLACE       ;19  $FA6B
;15-4
    .byte SHORT_SWORD    ;20  $FA6C
    .byte FOOD           ;21  $FA6D
    .byte KEY            ;22  $FA6E
    .byte AMULET         ;23  $FA6F
    .byte CLOAK          ;24  $FA70
    .byte GRAPPLING_HOOK ;25  $FA71
    .byte RING           ;26  $FA72
;47-5
    .byte KEY            ;27  $FA73
    .byte ROPE           ;28  $FA74
    .byte AMULET         ;29  $FA75
    .byte LAMP           ;30  $FA76
    .byte CLOAK          ;31  $FA77
    .byte SHOES          ;32  $FA78
    .byte DAGGER         ;33  $FA79
    .byte LEATHER_ARMOR  ;34  $FA7A
    .byte WATER          ;35  $FA7B
    .byte TALISMAN       ;36  $FA7C
    .byte RING           ;37  $FA7D
    .byte NECKLACE       ;38  $FA7E
    .byte SHORT_SWORD    ;39  $FA7F
    .byte GRAPPLING_HOOK ;40  $FA80
    .byte FOOD           ;41  $FA81
;5-3
    .byte FOOD           ;42  $FA82
    .byte GRAPPLING_HOOK ;43  $FA83
    .byte SHORT_SWORD    ;44  $FA84
;27-2
    .byte WATER          ;45  $FA85
    .byte SHOES          ;46  $FA86
    .byte DAGGER         ;47  $FA87

LFA88:
;25-6
    .byte LEO            ;00  $FA88
    .byte CANCER         ;01  $FA89
;13-3
    .byte GEMINI         ;02  $FA8A
    .byte AQUARIUS       ;03  $FA8B
    .byte SCORPIO        ;04  $FA8C
;FireWorld
    .byte TAURUS         ;05  $FA8D
    .byte PISCES         ;06  $FA8E
    .byte GEMINI         ;07  $FA8F
    .byte AQUARIUS       ;08  $FA90
;17-3
    .byte CAPRICORN      ;09  $FA91
    .byte VIRGO          ;10  $FA92
    .byte CANCER         ;11  $FA93
    .byte LEO            ;12  $FA94
    .byte LIBRA          ;13  $FA95
;37-5
    .byte VIRGO          ;14  $FA96
    .byte CANCER         ;15  $FA97
    .byte VIRGO          ;16  $FA98
    .byte AQUARIUS       ;17  $FA99
    .byte SAGITTARIUS    ;18  $FA9A
    .byte LIBRA          ;19  $FA9B
;15-4
    .byte GEMINI         ;20  $FA9C
    .byte VIRGO          ;21  $FA9D
    .byte ARIES          ;22  $FA9E
    .byte SCORPIO        ;23  $FA9F
    .byte AQUARIUS       ;24  $FAA0
    .byte SCORPIO        ;25  $FAA1
    .byte TAURUS         ;26  $FAA2
;47-5
    .byte TAURUS         ;27  $FAA3
    .byte SCORPIO        ;28  $FAA4
    .byte CANCER         ;29  $FAA5
    .byte CANCER         ;30  $FAA6
    .byte ARIES          ;31  $FAA7
    .byte AQUARIUS       ;32  $FAA8
    .byte TAURUS         ;33  $FAA9
    .byte LIBRA          ;34  $FAAA
    .byte GEMINI         ;35  $FAAB
    .byte SAGITTARIUS    ;36  $FAAC
    .byte LIBRA          ;37  $FAAD
    .byte GEMINI         ;38  $FAAE
    .byte CAPRICORN      ;39  $FAAF
    .byte LIBRA          ;40  $FAB0
    .byte SCORPIO        ;41  $FAB1
;5-3
    .byte SCORPIO        ;42  $FAB2
    .byte LIBRA          ;43  $FAB3
    .byte VIRGO          ;44  $FAB4
;27-2
    .byte ARIES          ;45  $FAB5
    .byte ARIES          ;46  $FAB6
    .byte TAURUS         ;47  $FAB7

DR_RoomEntry:  ; indirect jump
    jmp    LF194                 ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                    CLUES
;
; These clues flash on the screen in the game. They contain the page number of
; the comic, and the panel the clue is hidden in.
;
; At the beginning of the comic is a poem with "prime" and "number"
; colored purple. This tells you to only use the clues on pages that
; have prime numbers, i.e. pages (13,5,17,37,47). The correct solution is:
;
;  QUEST  IN  TOWER  TALISMAN  FOUND
;
;       page  panel   word
; X=0:   16    4     "SPIRE" (hidden in the cliff wall)
; X=1:    8    4     "SEARCH" (hidden in the pillar)
; X=2:   25    6     "THE" (hidden in the cliff wall)
; X=3:   13    3   * "QUEST" (hidden in the vase)
; X=4:   f     d      food, dagger (supposedly this is a clue for FireWorld)
; X=5:   17    3   * "TOWER" (hidden in the cliff wall)
; X=6:   37    5   * "TALISMAN" (hidden in the caption bubble)
; X=7:   15    4     "GOLD" (hidden in Torr's hair)
; X=8:    5    3   * "IN" (hidden in the floor)
; X=9:   27    2     "ESPIED" (written in the grass)
; X=10:  21    1     this clue makes no sense. The final clue is "FOUND" on 47-5 (hidden in the column)

CluePageLo:
    .byte $06,$08,$05,$03,$0A,$07,$07,$05,$05,$07,$01
CluePanelNum:
    .byte $04,$04,$06,$03,$0C,$03,$05,$04,$03,$02,$01
CluePageHi:
    .byte $01,$0A,$02,$01,$0B,$01,$03,$01,$0A,$02,$02

IN_16_4_Clue:  ; indirect jump
    lda    #$7F                  ; 2
    sta    ram_AF                ; 3
    ldx    ram_AD                ; 3
    lda    #<LD7C7               ; 2
    sta    ram_81                ; 3
    lda    #>LD7C7               ; 2
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

OV_16_4_Clue:  ; indirect jump
    lda    ram_AF                ; 3
    bmi    LFAF5                 ; 2³
    dec    ram_AF                ; 5
    bpl    LFAFC                 ; 2³
LFAF5:
    lda    INPT4                 ; 3
    bmi    LFAFC                 ; 2³
    jmp    LFCFB                 ; 3

LFAFC:
    jmp    FinishOverscan        ; 3

VB_16_4_Clue:  ; indirect jump
    jsr    LF044                 ; 6
    ldx    ram_AD                ; 3
    ldy    #$0B                  ; 2
    lda    #$FC                  ; 2
LFB08:
    sta.wy ram_97,Y              ; 5
    dey                          ; 2
    bpl    LFB08                 ; 2³
    lda    #<BlankDigit          ; 2
    sta    ram_97                ; 3
    sta    ram_99                ; 3
    sta    ram_9B                ; 3   If the clue flashed is "16   4", then goto
    sta    ram_9D                ; 3   page sixteen of the comic, and look in panel
    sta    ram_9F                ; 3   four to find a word hidden in the artwork.
    ldy    CluePageHi,X          ; 4
    lda    NumPtrTab,Y           ; 4
    sta    ram_A1                ; 3  10's digit of comic book page number
    ldy    CluePageLo,X          ; 4
    lda    NumPtrTab,Y           ; 4
    sta    ram_9F                ; 3   1's digit of comic book page number
    ldy    CluePanelNum,X        ; 4
    lda    NumPtrTab,Y           ; 4
    sta    ram_97                ; 3   panel number word is hidden in...
    lda    #<LD801               ; 2
    sta    ram_81                ; 3
    lda    #>LD801               ; 2
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

DR_16_4_Clue:  ; indirect jump
    ldy    frameCounter          ; 3
    sty    COLUPF                ; 3
    sty    COLUBK                ; 3
    lda    #$00                  ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    sta    VBLANK                ; 3
    iny                          ; 2
    ldx    #$4A                  ; 2
LFB4C:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUPF                ; 3
    sty    COLUBK                ; 3
    iny                          ; 2
    dex                          ; 2
    bne    LFB4C                 ; 2³
    sty    ram_AE                ; 3
    tya                          ; 2
    sta    WSYNC                 ; 3
;---------------------------------------
    and    #$F7                  ; 2
    sta    COLUPF                ; 3
    sta    COLUBK                ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    #11                   ; 2
    jsr    SixByteDisplay        ; 6   draw clue
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
    sta    WSYNC                 ; 3
;---------------------------------------
    ldy    ram_AE                ; 3
    ldx    #$4A                  ; 2
LFB74:
    sta    WSYNC                 ; 3
;---------------------------------------
    sty    COLUPF                ; 3
    sty    COLUBK                ; 3
    dey                          ; 2
    dex                          ; 2
    bne    LFB74                 ; 2³
    jmp    LF194                 ; 3

IN_WarriorSwrd:  ; indirect jump
    lda    roomNum               ; 3
    ora    #$F0                  ; 2
    and    itemsZodiacChamber+1  ; 3   ram $8C =  SHORT_SWORD | WARRIORS_SWORD
    sta    itemsZodiacChamber+1  ; 3
    ldx    ram_AD                ; 3
    lda    #<LD7C7               ; 2
    sta    ram_81                ; 3
    lda    #>LD7C7               ; 2
    sta    ram_82                ; 3
    jmp    IN_TitleScreen        ; 3

OV_WarriorSwrd:  ; indirect jump
    jmp    OV_TitleScreen        ; 3

VB_WarriorSwrd:  ; indirect jump
    lda    #<LD801               ; 2
    sta    ram_81                ; 3
    lda    #>LD801               ; 2
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

DR_WarriorSwrd:  ; indirect jump
    jmp    DR_TitleScreen        ; 3

LFBA7:
    lda    #$3C                  ; 2
    sta    COLUP0                ; 3
    sta    COLUP1                ; 3
    ldx    #4                    ; 2
LFBAF:
    sta    WSYNC                 ; 3
;---------------------------------------
    dex                          ; 2
    bpl    LFBAF                 ; 2³
    ldx    #11                   ; 2
LFBB6:
    lda    FinalCluePtrs,X       ; 4
    sta    ram_97,X              ; 4
    dex                          ; 2
    bpl    LFBB6                 ; 2³
    jsr    LF044                 ; 6
    ldy    #11                   ; 2
    jsr    SixByteDisplay        ; 6  draw "47   5" clue
    jmp    LF209                 ; 3

FinalCluePtrs:
    .word Five           ; $FBC9
    .word BlankDigit     ; $FBCB   final clue for "FOUND", page 47, panel 5
    .word BlankDigit     ; $FBCD
    .word BlankDigit     ; $FBCF
    .word Seven          ; $FBD1
    .word Four           ; $FBD3

    .byte $00 ; |        | $FBD5   free bytes
    .byte $00 ; |        | $FBD6
    .byte $00 ; |        | $FBD7
    .byte $00 ; |        | $FBD8
    .byte $00 ; |        | $FBD9
    .byte $00 ; |        | $FBDA
    .byte $00 ; |        | $FBDB
    .byte $00 ; |        | $FBDC
    .byte $00 ; |        | $FBDD
    .byte $00 ; |        | $FBDE
    .byte $00 ; |        | $FBDF
    .byte $00 ; |        | $FBE0
    .byte $00 ; |        | $FBE1
    .byte $00 ; |        | $FBE2
    .byte $00 ; |        | $FBE3
    .byte $00 ; |        | $FBE4
    .byte $00 ; |        | $FBE5
    .byte $00 ; |        | $FBE6
    .byte $00 ; |        | $FBE7
    .byte $00 ; |        | $FBE8
    .byte $00 ; |        | $FBE9
    .byte $00 ; |        | $FBEA
    .byte $00 ; |        | $FBEB
    .byte $00 ; |        | $FBEC
    .byte $00 ; |        | $FBED
    .byte $00 ; |        | $FBEE
    .byte $00 ; |        | $FBEF
    .byte $00 ; |        | $FBF0
    .byte $00 ; |        | $FBF1
    .byte $00 ; |        | $FBF2
    .byte $00 ; |        | $FBF3
    .byte $00 ; |        | $FBF4
    .byte $00 ; |        | $FBF5
    .byte $00 ; |        | $FBF6
    .byte $00 ; |        | $FBF7
    .byte $00 ; |        | $FBF8
    .byte $00 ; |        | $FBF9
    .byte $00 ; |        | $FBFA
    .byte $00 ; |        | $FBFB
    .byte $00 ; |        | $FBFC
    .byte $00 ; |        | $FBFD
    .byte $00 ; |        | $FBFE
    .byte $00 ; |        | $FBFF
    .byte $00 ; |        | $FC00
    .byte $00 ; |        | $FC01

LFC02:
    .byte >CheckClue1    ; $FC02
    .byte >CheckClue2    ; $FC03
    .byte >CheckClue3    ; $FC04
    .byte >CheckClue4    ; $FC05
    .byte >CheckClue5    ; $FC06
    .byte >CheckClue6    ; $FC07
    .byte >Return1       ; $FC08
LFC09:
    .byte >CheckClue7    ; $FC09
    .byte >CheckClue8    ; $FC0A
    .byte >Return2       ; $FC0B
LFC0C:
    .byte >CheckClue11   ; $FC0C
    .byte >Return3       ; $FC0D
LFC0E:
    .byte >CheckClue9    ; $FC0E
    .byte >CheckClue10   ; $FC0F
    .byte >Return4       ; $FC10

LFC11:
    .byte <CheckClue1    ; $FC11
    .byte <CheckClue2    ; $FC12
    .byte <CheckClue3    ; $FC13
    .byte <CheckClue4    ; $FC14
    .byte <CheckClue5    ; $FC15
    .byte <CheckClue6    ; $FC16
    .byte <Return1       ; $FC17
LFC18:
    .byte <CheckClue7    ; $FC18
    .byte <CheckClue8    ; $FC19
    .byte <Return2       ; $FC1A
LFC1B:
    .byte <CheckClue11   ; $FC1B
    .byte <Return3       ; $FC1C
LFC1D:
    .byte <CheckClue9    ; $FC1D
    .byte <CheckClue10   ; $FC1E
    .byte <Return4       ; $FC1F

Zero:
    .byte $3C ; |  XXXX  | $FC20
    .byte $66 ; | XX  XX | $FC21
    .byte $66 ; | XX  XX | $FC22
    .byte $66 ; | XX  XX | $FC23
    .byte $66 ; | XX  XX | $FC24
    .byte $66 ; | XX  XX | $FC25
    .byte $3C ; |  XXXX  | $FC26
    .byte $00 ; |        | $FC27
    .byte $00 ; |        | $FC28
    .byte $00 ; |        | $FC29
    .byte $00 ; |        | $FC2A
    .byte $00 ; |        | $FC2B
One:
    .byte $7E ; | XXXXXX | $FC2C
    .byte $18 ; |   XX   | $FC2D
    .byte $18 ; |   XX   | $FC2E
    .byte $18 ; |   XX   | $FC2F
    .byte $18 ; |   XX   | $FC30
    .byte $78 ; | XXXX   | $FC31
    .byte $38 ; |  XXX   | $FC32
    .byte $00 ; |        | $FC33
    .byte $00 ; |        | $FC34
    .byte $00 ; |        | $FC35
    .byte $00 ; |        | $FC36
    .byte $00 ; |        | $FC37
Two:
    .byte $7E ; | XXXXXX | $FC38
    .byte $60 ; | XX     | $FC39
    .byte $60 ; | XX     | $FC3A
    .byte $3C ; |  XXXX  | $FC3B
    .byte $06 ; |     XX | $FC3C
    .byte $46 ; | X   XX | $FC3D
    .byte $7C ; | XXXXX  | $FC3E
    .byte $00 ; |        | $FC3F
    .byte $00 ; |        | $FC40
    .byte $00 ; |        | $FC41
    .byte $00 ; |        | $FC42
    .byte $00 ; |        | $FC43
Three:
    .byte $3C ; |  XXXX  | $FC44
    .byte $46 ; | X   XX | $FC45
    .byte $06 ; |     XX | $FC46
    .byte $0C ; |    XX  | $FC47
    .byte $06 ; |     XX | $FC48
    .byte $46 ; | X   XX | $FC49
    .byte $3C ; |  XXXX  | $FC4A
    .byte $00 ; |        | $FC4B
    .byte $00 ; |        | $FC4C
    .byte $00 ; |        | $FC4D
    .byte $00 ; |        | $FC4E
    .byte $00 ; |        | $FC4F
Four:
    .byte $0C ; |    XX  | $FC50
    .byte $0C ; |    XX  | $FC51
    .byte $7E ; | XXXXXX | $FC52
    .byte $4C ; | X  XX  | $FC53
    .byte $2C ; |  X XX  | $FC54
    .byte $1C ; |   XXX  | $FC55
    .byte $0C ; |    XX  | $FC56
    .byte $00 ; |        | $FC57
    .byte $00 ; |        | $FC58
    .byte $00 ; |        | $FC59
    .byte $00 ; |        | $FC5A
    .byte $00 ; |        | $FC5B
Five:
    .byte $7C ; | XXXXX  | $FC5C
    .byte $46 ; | X   XX | $FC5D
    .byte $06 ; |     XX | $FC5E
    .byte $7C ; | XXXXX  | $FC5F
    .byte $60 ; | XX     | $FC60
    .byte $60 ; | XX     | $FC61
    .byte $7E ; | XXXXXX | $FC62
    .byte $00 ; |        | $FC63
    .byte $00 ; |        | $FC64
    .byte $00 ; |        | $FC65
    .byte $00 ; |        | $FC66
    .byte $00 ; |        | $FC67
Six:
    .byte $3C ; |  XXXX  | $FC68
    .byte $66 ; | XX  XX | $FC69
    .byte $66 ; | XX  XX | $FC6A
    .byte $7C ; | XXXXX  | $FC6B
    .byte $60 ; | XX     | $FC6C
    .byte $62 ; | XX   X | $FC6D
    .byte $3C ; |  XXXX  | $FC6E
    .byte $00 ; |        | $FC6F
    .byte $00 ; |        | $FC70
    .byte $00 ; |        | $FC71
    .byte $00 ; |        | $FC72
    .byte $00 ; |        | $FC73
Seven:
    .byte $18 ; |   XX   | $FC74
    .byte $18 ; |   XX   | $FC75
    .byte $08 ; |    X   | $FC76
    .byte $04 ; |     X  | $FC77
    .byte $02 ; |      X | $FC78
    .byte $62 ; | XX   X | $FC79
    .byte $7E ; | XXXXXX | $FC7A
    .byte $00 ; |        | $FC7B
    .byte $00 ; |        | $FC7C
    .byte $00 ; |        | $FC7D
    .byte $00 ; |        | $FC7E
    .byte $00 ; |        | $FC7F
Eight:
    .byte $3C ; |  XXXX  | $FC80
    .byte $66 ; | XX  XX | $FC81
    .byte $66 ; | XX  XX | $FC82
    .byte $3C ; |  XXXX  | $FC83
    .byte $66 ; | XX  XX | $FC84
    .byte $66 ; | XX  XX | $FC85
    .byte $3C ; |  XXXX  | $FC86
    .byte $00 ; |        | $FC87
    .byte $00 ; |        | $FC88
    .byte $00 ; |        | $FC89
    .byte $00 ; |        | $FC8A
    .byte $00 ; |        | $FC8B
Nine:
    .byte $3C ; |  XXXX  | $FC8C
    .byte $46 ; | X   XX | $FC8D
    .byte $06 ; |     XX | $FC8E
    .byte $3E ; |  XXXXX | $FC8F
    .byte $66 ; | XX  XX | $FC90
    .byte $66 ; | XX  XX | $FC91
    .byte $3C ; |  XXXX  | $FC92
    .byte $00 ; |        | $FC93
    .byte $00 ; |        | $FC94
    .byte $00 ; |        | $FC95
    .byte $00 ; |        | $FC96
    .byte $00 ; |        | $FC97
BlankDigit:
    .byte $00 ; |        | $FC98
    .byte $00 ; |        | $FC99
    .byte $00 ; |        | $FC9A
    .byte $00 ; |        | $FC9B
    .byte $00 ; |        | $FC9C
    .byte $00 ; |        | $FC9D
    .byte $00 ; |        | $FC9E
    .byte $00 ; |        | $FC9F
    .byte $00 ; |        | $FCA0
    .byte $00 ; |        | $FCA1
    .byte $00 ; |        | $FCA2
    .byte $00 ; |        | $FCA3
    .byte $00 ; |        | $FCA4
FoodDigit:
    .byte $57 ; | X X XXX| $FCA5
    .byte $A7 ; |X X  XXX| $FCA6
    .byte $55 ; | X X X X| $FCA7
    .byte $25 ; |  X  X X| $FCA8
    .byte $05 ; |     X X| $FCA9
    .byte $05 ; |     X X| $FCAA
    .byte $07 ; |     XXX| $FCAB
    .byte $02 ; |      X | $FCAC
    .byte $02 ; |      X | $FCAD
    .byte $00 ; |        | $FCAE
    .byte $02 ; |      X | $FCAF
    .byte $00 ; |        | $FCB0
DaggerDigit:
    .byte $00 ; |        | $FCB1
    .byte $00 ; |        | $FCB2
    .byte $00 ; |        | $FCB3
    .byte $00 ; |        | $FCB4
    .byte $00 ; |        | $FCB5
    .byte $40 ; | X      | $FCB6
    .byte $F8 ; |XXXXX   | $FCB7
    .byte $40 ; | X      | $FCB8
    .byte $00 ; |        | $FCB9
    .byte $00 ; |        | $FCBA
    .byte $00 ; |        | $FCBB
    .byte $00 ; |        | $FCBC
NumPtrTab:
    .byte <Zero          ; $FCBD
    .byte <One           ; $FCBE
    .byte <Two           ; $FCBF
    .byte <Three         ; $FCC0
    .byte <Four          ; $FCC1
    .byte <Five          ; $FCC2
    .byte <Six           ; $FCC3
    .byte <Seven         ; $FCC4
    .byte <Eight         ; $FCC5
    .byte <Nine          ; $FCC6
    .byte <BlankDigit    ; $FCC7
    .byte <FoodDigit     ; $FCC8
    .byte <DaggerDigit   ; $FCC9

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFCCA x1

LFCCA SUBROUTINE
    lsr                          ; 2
    eor    #$FF                  ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$0F                  ; 2
    bcs    LFCD6                 ; 2³
    lda    #$F0                  ; 2
LFCD6:
    and    itemsZodiacChamber,X  ; 4
    sta    itemsZodiacChamber,X  ; 4
    tya                          ; 2
    bcc    LFCE1                 ; 2³
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
    asl                          ; 2
LFCE1:
    ora    itemsZodiacChamber,X  ; 4
    sta    itemsZodiacChamber,X  ; 4
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LFCE6 x2

LFCE6 SUBROUTINE
    lsr                          ; 2
    eor    #$FF                  ; 2
    and    #$07                  ; 2
    tax                          ; 2
    lda    #$0F                  ; 2
    bcc    LFCF2                 ; 2³
    lda    #$F0                  ; 2
LFCF2:
    and    itemsZodiacChamber,X  ; 4
    bcc    LFCFA                 ; 2³
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
    lsr                          ; 2
LFCFA:
    rts                          ; 6

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

LFCFB:  ; indirect jump also
    ldx    ram_83                ; 3
    lda    SequenceEventsTab,X   ; 4
    sta    ram_83                ; 3
LFD02:  ; indirect jump also
    tax                          ; 2
    lda    #0                    ; 2
    sta    AUDV0                 ; 3
    sta    AUDV1                 ; 3
    lda    InitializationLoPtrs,X; 4
    sta    ram_81                ; 3
    lda    InitializationHiPtrs,X; 4
    sta    ram_82                ; 3
    jmp    DoIndirectJump1       ; 3

LFD16:
    .byte <VirgoSign      ; $FD16
    .byte <LeoSign        ; $FD17
    .byte <CancerSign     ; $FD18
    .byte <GeminiSign     ; $FD19
    .byte <TaurusSign     ; $FD1A
    .byte <AriesSign      ; $FD1B
    .byte <PiscesSign     ; $FD1C
    .byte <AquariusSign   ; $FD1D
    .byte <CapricornSign  ; $FD1E
    .byte <SagittariusSign; $FD1F
    .byte <ScorpioSign    ; $FD20
    .byte <LibraSign      ; $FD21

SagittariusSign:
    .byte $16 ; |   X XX | $FD22
    .byte $12 ; |   X  X | $FD23
    .byte $54 ; | X X X  | $FD24
    .byte $56 ; | X X XX | $FD25
    .byte $3E ; |  XXXXX | $FD26
    .byte $3E ; |  XXXXX | $FD27
    .byte $B1 ; |X XX   X| $FD28
    .byte $B0 ; |X XX    | $FD29
    .byte $FC ; |XXXXXX  | $FD2A
    .byte $90 ; |X  X    | $FD2B
    .byte $B8 ; |X XXX   | $FD2C
    .byte $10 ; |   X    | $FD2D
TaurusSign:
    .byte $55 ; | X X X X| $FD2E
    .byte $55 ; | X X X X| $FD2F
    .byte $7F ; | XXXXXXX| $FD30
    .byte $4E ; | X  XXX | $FD31
    .byte $37 ; |  XX XXX| $FD32
    .byte $30 ; |  XX    | $FD33
    .byte $78 ; | XXXX   | $FD34
    .byte $48 ; | X  X   | $FD35
    .byte $FC ; |XXXXXX  | $FD36
    .byte $B4 ; |X XX X  | $FD37
    .byte $84 ; |X    X  | $FD38
    .byte $48 ; | X  X   | $FD39
CancerSign:
    .byte $BA ; |X XXX X | $FD3A
    .byte $7C ; | XXXXX  | $FD3B
    .byte $BA ; |X XXX X | $FD3C
    .byte $7C ; | XXXXX  | $FD3D
    .byte $BA ; |X XXX X | $FD3E
    .byte $38 ; |  XXX   | $FD3F
    .byte $54 ; | X X X  | $FD40
    .byte $BA ; |X XXX X | $FD41
    .byte $92 ; |X  X  X | $FD42
    .byte $C6 ; |XX   XX | $FD43
    .byte $EE ; |XXX XXX | $FD44
    .byte $44 ; | X   X  | $FD45
LeoSign:
    .byte $24 ; |  X  X  | $FD46
    .byte $92 ; |X  X  X | $FD47
    .byte $56 ; | X X XX | $FD48
    .byte $3F ; |  XXXXXX| $FD49
    .byte $7F ; | XXXXXXX| $FD4A
    .byte $DC ; |XX XXX  | $FD4B
    .byte $D9 ; |XX XX  X| $FD4C
    .byte $D9 ; |XX XX  X| $FD4D
    .byte $8A ; |X   X X | $FD4E
    .byte $F8 ; |XXXXX   | $FD4F
    .byte $A8 ; |X X X   | $FD50
    .byte $70 ; | XXX    | $FD51
ScorpioSign:
    .byte $2C ; |  X XX  | $FD52
    .byte $44 ; | X   X  | $FD53
    .byte $1C ; |   XXX  | $FD54
    .byte $6F ; | XX XXXX| $FD55
    .byte $5C ; | X XXX  | $FD56
    .byte $1F ; |   XXXXX| $FD57
    .byte $F9 ; |XXXXX  X| $FD58
    .byte $BE ; |X XXXXX | $FD59
    .byte $32 ; |  XX  X | $FD5A
    .byte $6A ; | XX X X | $FD5B
    .byte $28 ; |  X X   | $FD5C
    .byte $18 ; |   XX   | $FD5D
CapricornSign:
    .byte $00 ; |        | $FD5E
    .byte $29 ; |  X X  X| $FD5F
    .byte $29 ; |  X X  X| $FD60
    .byte $1A ; |   XX X | $FD61
    .byte $1F ; |   XXXXX| $FD62
    .byte $BF ; |X XXXXXX| $FD63
    .byte $3E ; |  XXXXX | $FD64
    .byte $F9 ; |XXXXX  X| $FD65
    .byte $B0 ; |X XX    | $FD66
    .byte $70 ; | XXX    | $FD67
    .byte $20 ; |  X     | $FD68
    .byte $18 ; |   XX   | $FD69
GeminiSign:
    .byte $A5 ; |X X  X X| $FD6A
    .byte $A5 ; |X X  X X| $FD6B
    .byte $E7 ; |XXX  XXX| $FD6C
    .byte $E7 ; |XXX  XXX| $FD6D
    .byte $DB ; |XX XX XX| $FD6E
    .byte $BD ; |X XXXX X| $FD6F
    .byte $66 ; | XX  XX | $FD70
    .byte $E7 ; |XXX  XXX| $FD71
    .byte $42 ; | X    X | $FD72
    .byte $A5 ; |X X  X X| $FD73
    .byte $A5 ; |X X  X X| $FD74
    .byte $42 ; | X    X | $FD75
AriesSign:
    .byte $94 ; |X  X X  | $FD76
    .byte $94 ; |X  X X  | $FD77
    .byte $78 ; | XXXX   | $FD78
    .byte $FC ; |XXXXXX  | $FD79
    .byte $E0 ; |XXX     | $FD7A
    .byte $DC ; |XX XXX  | $FD7B
    .byte $32 ; |  XX  X | $FD7C
    .byte $2F ; |  X XXXX| $FD7D
    .byte $2D ; |  X XX X| $FD7E
    .byte $26 ; |  X  XX | $FD7F
    .byte $36 ; |  XX XX | $FD80
    .byte $1C ; |   XXX  | $FD81
PiscesSign:
    .byte $1C ; |   XXX  | $FD82
    .byte $2E ; |  X XXX | $FD83
    .byte $2E ; |  X XXX | $FD84
    .byte $5F ; | X XXXXX| $FD85
    .byte $47 ; | X   XXX| $FD86
    .byte $C1 ; |XX     X| $FD87
    .byte $43 ; | X    XX| $FD88
    .byte $71 ; | XXX   X| $FD89
    .byte $7D ; | XXXXX X| $FD8A
    .byte $3A ; |  XXX X | $FD8B
    .byte $3A ; |  XXX X | $FD8C
    .byte $1C ; |   XXX  | $FD8D
VirgoSign:
    .byte $93 ; |X  X  XX| $FD8E
    .byte $BA ; |X XXX X | $FD8F
    .byte $FE ; |XXXXXXX | $FD90
    .byte $DE ; |XX XXXX | $FD91
    .byte $CE ; |XX  XXX | $FD92
    .byte $1A ; |   XX X | $FD93
    .byte $0E ; |    XXX | $FD94
    .byte $04 ; |     X  | $FD95
    .byte $0E ; |    XXX | $FD96
    .byte $0A ; |    X X | $FD97
    .byte $0E ; |    XXX | $FD98
    .byte $04 ; |     X  | $FD99
LibraSign:
    .byte $FF ; |XXXXXXXX| $FD9A
    .byte $18 ; |   XX   | $FD9B
    .byte $5A ; | X XX X | $FD9C
    .byte $E7 ; |XXX  XXX| $FD9D
    .byte $18 ; |   XX   | $FD9E
    .byte $5A ; | X XX X | $FD9F
    .byte $5A ; | X XX X | $FDA0
    .byte $5A ; | X XX X | $FDA1
    .byte $5A ; | X XX X | $FDA2
    .byte $99 ; |X  XX  X| $FDA3
    .byte $66 ; | XX  XX | $FDA4
    .byte $18 ; |   XX   | $FDA5
AquariusSign:
    .byte $00 ; |        | $FDA6
    .byte $28 ; |  X X   | $FDA7
    .byte $54 ; | X X X  | $FDA8
    .byte $28 ; |  X X   | $FDA9
    .byte $00 ; |        | $FDAA
    .byte $08 ; |    X   | $FDAB
    .byte $00 ; |        | $FDAC
    .byte $30 ; |  XX    | $FDAD
    .byte $68 ; | XX X   | $FDAE
    .byte $F8 ; |XXXXX   | $FDAF
    .byte $F0 ; |XXXX    | $FDB0
    .byte $E0 ; |XXX     | $FDB1

ItemSelectFreqTab:
    .byte $02   ; $FDB2   KEY
    .byte $0C   ; $FDB3   ROPE
    .byte $10   ; $FDB4   AMULET
    .byte $07   ; $FDB5   LAMP
    .byte $08   ; $FDB6   CLOAK
    .byte $04   ; $FDB7   SHOES
    .byte $05   ; $FDB8   DAGGER
    .byte $07   ; $FDB9   LEATHER_ARMOR
    .byte $0C   ; $FDBA   WATER
    .byte $0D   ; $FDBB   TALISMAN
    .byte $03   ; $FDBC   RING
    .byte $08   ; $FDBD   NECKLACE
    .byte $1D   ; $FDBE   WARRIORS_SWORD
    .byte $0B   ; $FDBF   SHORT_SWORD
    .byte $0F   ; $FDC0   GRAPPLING_HOOK
    .byte $09   ; $FDC1   FOOD
ItemSelectToneTab:
    .byte $01   ; $FDC2   KEY
    .byte $03   ; $FDC3   ROPE
    .byte $05   ; $FDC4   AMULET
    .byte $07   ; $FDC5   LAMP
    .byte $09   ; $FDC6   CLOAK
    .byte $0A   ; $FDC7   SHOES
    .byte $0C   ; $FDC8   DAGGER
    .byte $09   ; $FDC9   LEATHER_ARMOR
    .byte $0C   ; $FDCA   WATER
    .byte $04   ; $FDCB   TALISMAN
    .byte $0C   ; $FDCC   RING
    .byte $08   ; $FDCD   NECKLACE
    .byte $0A   ; $FDCE   WARRIORS_SWORD
    .byte $09   ; $FDCF   SHORT_SWORD
    .byte $0B   ; $FDD0   GRAPPLING_HOOK
    .byte $0D   ; $FDD1   FOOD

VblankLoPtrs:
    .byte <VB_TitleScreen; $FDD2
    .byte <VB_Room       ; $FDD3
    .byte <VB_ZodiacRoom ; $FDD4
    .byte <VB_Corridor   ; $FDD5
    .byte <VB_RoomEntry  ; $FDD6
    .byte <VB_16_4_Clue  ; $FDD7
    .byte <VB_AquaRapids ; $FDD8
    .byte <VB_SagitSpears; $FDD9
    .byte <VB_Waterfall  ; $FDDA
    .byte <VB_TaurusHorns; $FDDB
    .byte <VB_WarriorSwrd; $FDDC
    .byte <FinishVblank  ; $FDDD
VblankHiPtrs:
    .byte >VB_TitleScreen; $FDDE
    .byte >VB_Room       ; $FDDF
    .byte >VB_ZodiacRoom ; $FDE0
    .byte >VB_Corridor   ; $FDE1
    .byte >VB_RoomEntry  ; $FDE2
    .byte >VB_16_4_Clue  ; $FDE3
    .byte >VB_AquaRapids ; $FDE4
    .byte >VB_SagitSpears; $FDE5
    .byte >VB_Waterfall  ; $FDE6
    .byte >VB_TaurusHorns; $FDE7
    .byte >VB_WarriorSwrd; $FDE8
    .byte >FinishVblank  ; $FDE9
DrawScreenLoPtrs:
    .byte <DR_TitleScreen; $FDEA
    .byte <DR_Room       ; $FDEB
    .byte <DR_ZodiacRoom ; $FDEC
    .byte <DR_Corridor   ; $FDED
    .byte <DR_RoomEntry  ; $FDEE
    .byte <DR_16_4_Clue  ; $FDEF
    .byte <DR_AquaRapids ; $FDF0
    .byte <DR_SagitSpears; $FDF1
    .byte <DR_Waterfall  ; $FDF2
    .byte <DR_TaurusHorns; $FDF3
    .byte <DR_WarriorSwrd; $FDF4
DrawScreenHiPtrs:
    .byte >DR_TitleScreen; $FDF5
    .byte >DR_Room       ; $FDF6
    .byte >DR_ZodiacRoom ; $FDF7
    .byte >DR_Corridor   ; $FDF8
    .byte >DR_RoomEntry  ; $FDF9
    .byte >DR_16_4_Clue  ; $FDFA
    .byte >DR_AquaRapids ; $FDFB
    .byte >DR_SagitSpears; $FDFC
    .byte >DR_Waterfall  ; $FDFD
    .byte >DR_TaurusHorns; $FDFE
    .byte >DR_WarriorSwrd; $FDFF
Rope:
    .byte $FF ; |XXXXXXXX| $FE00
    .byte $7E ; | XXXXXX | $FE01
    .byte $FF ; |XXXXXXXX| $FE02
    .byte $7E ; | XXXXXX | $FE03
    .byte $0C ; |    XX  | $FE04
    .byte $10 ; |   X    | $FE05
    .byte $20 ; |  X     | $FE06
    .byte $10 ; |   X    | $FE07
    .byte $0C ; |    XX  | $FE08
    .byte $00 ; |        | $FE09
    .byte $00 ; |        | $FE0A
    .byte $00 ; |        | $FE0B
GrapplingHook:
    .byte $00 ; |        | $FE0C
    .byte $00 ; |        | $FE0D
    .byte $00 ; |        | $FE0E
    .byte $03 ; |      XX| $FE0F
    .byte $45 ; | X   X X| $FE10
    .byte $8E ; |X   XXX | $FE11
    .byte $9C ; |X  XXX  | $FE12
    .byte $B8 ; |X XXX   | $FE13
    .byte $70 ; | XXX    | $FE14
    .byte $20 ; |  X     | $FE15
    .byte $24 ; |  X  X  | $FE16
    .byte $18 ; |   XX   | $FE17
Necklace:
    .byte $20 ; |  X     | $FE18
    .byte $70 ; | XXX    | $FE19
    .byte $20 ; |  X     | $FE1A
    .byte $20 ; |  X     | $FE1B
    .byte $50 ; | X X    | $FE1C
    .byte $00 ; |        | $FE1D
    .byte $88 ; |X   X   | $FE1E
    .byte $00 ; |        | $FE1F
    .byte $88 ; |X   X   | $FE20
    .byte $50 ; | X X    | $FE21
    .byte $20 ; |  X     | $FE22
    .byte $00 ; |        | $FE23
Water:
    .byte $18 ; |   XX   | $FE24
    .byte $3C ; |  XXXX  | $FE25
    .byte $7E ; | XXXXXX | $FE26
    .byte $7E ; | XXXXXX | $FE27
    .byte $7E ; | XXXXXX | $FE28
    .byte $3E ; |  XXXXX | $FE29
    .byte $19 ; |   XX  X| $FE2A
    .byte $19 ; |   XX  X| $FE2B
    .byte $27 ; |  X  XXX| $FE2C
    .byte $24 ; |  X  X  | $FE2D
    .byte $18 ; |   XX   | $FE2E
    .byte $00 ; |        | $FE2F
Lamp:
    .byte $70 ; | XXX    | $FE30
    .byte $FC ; |XXXXXX  | $FE31
    .byte $5A ; | X XX X | $FE32
    .byte $2A ; |  X X X | $FE33
    .byte $24 ; |  X  X  | $FE34
    .byte $20 ; |  X     | $FE35
    .byte $20 ; |  X     | $FE36
    .byte $20 ; |  X     | $FE37
    .byte $20 ; |  X     | $FE38
    .byte $00 ; |        | $FE39
    .byte $20 ; |  X     | $FE3A
    .byte $20 ; |  X     | $FE3B
Key:
    .byte $00 ; |        | $FE3C
    .byte $00 ; |        | $FE3D
    .byte $00 ; |        | $FE3E
    .byte $40 ; | X      | $FE3F
    .byte $A0 ; |X X     | $FE40
    .byte $FF ; |XXXXXXXX| $FE41
    .byte $A2 ; |X X   X | $FE42
    .byte $45 ; | X   X X| $FE43
    .byte $00 ; |        | $FE44
    .byte $00 ; |        | $FE45
    .byte $00 ; |        | $FE46
    .byte $00 ; |        | $FE47
ShoesOfStealth:
    .byte $1D ; |   XXX X| $FE48
    .byte $1F ; |   XXXXX| $FE49
    .byte $0F ; |    XXXX| $FE4A
    .byte $07 ; |     XXX| $FE4B
    .byte $05 ; |     X X| $FE4C
    .byte $02 ; |      X | $FE4D
    .byte $E8 ; |XXX X   | $FE4E
    .byte $F8 ; |XXXXX   | $FE4F
    .byte $78 ; | XXXX   | $FE50
    .byte $38 ; |  XXX   | $FE51
    .byte $28 ; |  X X   | $FE52
    .byte $10 ; |   X    | $FE53
Food:
    .byte $57 ; | X X XXX| $FE54
    .byte $A7 ; |X X  XXX| $FE55
    .byte $55 ; | X X X X| $FE56
    .byte $25 ; |  X  X X| $FE57
    .byte $05 ; |     X X| $FE58
    .byte $05 ; |     X X| $FE59
    .byte $07 ; |     XXX| $FE5A
    .byte $02 ; |      X | $FE5B
    .byte $02 ; |      X | $FE5C
    .byte $00 ; |        | $FE5D
    .byte $02 ; |      X | $FE5E
    .byte $00 ; |        | $FE5F
Amulet:
    .byte $00 ; |        | $FE60
    .byte $20 ; |  X     | $FE61
    .byte $70 ; | XXX    | $FE62
    .byte $20 ; |  X     | $FE63
    .byte $D8 ; |XX XX   | $FE64
    .byte $A8 ; |X X X   | $FE65
    .byte $A8 ; |X X X   | $FE66
    .byte $D8 ; |XX XX   | $FE67
    .byte $20 ; |  X     | $FE68
    .byte $70 ; | XXX    | $FE69
    .byte $20 ; |  X     | $FE6A
    .byte $00 ; |        | $FE6B
Ring:
    .byte $00 ; |        | $FE6C
    .byte $00 ; |        | $FE6D
    .byte $00 ; |        | $FE6E
    .byte $00 ; |        | $FE6F
    .byte $20 ; |  X     | $FE70
    .byte $50 ; | X X    | $FE71
    .byte $50 ; | X X    | $FE72
    .byte $20 ; |  X     | $FE73
    .byte $00 ; |        | $FE74
    .byte $00 ; |        | $FE75
    .byte $00 ; |        | $FE76
    .byte $00 ; |        | $FE77
Dagger:
    .byte $00 ; |        | $FE78
    .byte $00 ; |        | $FE79
    .byte $00 ; |        | $FE7A
    .byte $00 ; |        | $FE7B
    .byte $00 ; |        | $FE7C
    .byte $40 ; | X      | $FE7D
    .byte $F8 ; |XXXXX   | $FE7E
    .byte $40 ; | X      | $FE7F
    .byte $00 ; |        | $FE80
    .byte $00 ; |        | $FE81
    .byte $00 ; |        | $FE82
    .byte $00 ; |        | $FE83
WarriorsSword:
    .byte $10 ; |   X    | $FE84
    .byte $10 ; |   X    | $FE85
    .byte $7C ; | XXXXX  | $FE86
    .byte $38 ; |  XXX   | $FE87
    .byte $10 ; |   X    | $FE88
    .byte $10 ; |   X    | $FE89
    .byte $10 ; |   X    | $FE8A
    .byte $10 ; |   X    | $FE8B
    .byte $10 ; |   X    | $FE8C
    .byte $10 ; |   X    | $FE8D
    .byte $10 ; |   X    | $FE8E
    .byte $10 ; |   X    | $FE8F
ShortSword:
    .byte $00 ; |        | $FE90
    .byte $00 ; |        | $FE91
    .byte $00 ; |        | $FE92
    .byte $00 ; |        | $FE93
    .byte $40 ; | X      | $FE94
    .byte $20 ; |  X     | $FE95
    .byte $FF ; |XXXXXXXX| $FE96
    .byte $20 ; |  X     | $FE97
    .byte $40 ; | X      | $FE98
    .byte $00 ; |        | $FE99
    .byte $00 ; |        | $FE9A
    .byte $00 ; |        | $FE9B
TalismanOfPass:
    .byte $D8 ; |XX XX   | $FE9C
    .byte $70 ; | XXX    | $FE9D
    .byte $70 ; | XXX    | $FE9E
    .byte $F0 ; |XXXX    | $FE9F
    .byte $F0 ; |XXXX    | $FEA0
    .byte $F8 ; |XXXXX   | $FEA1
    .byte $FC ; |XXXXXX  | $FEA2
    .byte $74 ; | XXX X  | $FEA3
    .byte $74 ; | XXX X  | $FEA4
    .byte $54 ; | X X X  | $FEA5
    .byte $70 ; | XXX    | $FEA6
    .byte $20 ; |  X     | $FEA7
CloakOfInvis:
    .byte $38 ; |  XXX   | $FEA8
    .byte $44 ; | X   X  | $FEA9
    .byte $82 ; |X     X | $FEAA
    .byte $82 ; |X     X | $FEAB
    .byte $C6 ; |XX   XX | $FEAC
    .byte $C6 ; |XX   XX | $FEAD
    .byte $EE ; |XXX XXX | $FEAE
    .byte $FE ; |XXXXXXX | $FEAF
    .byte $6E ; | XX XXX | $FEB0
    .byte $44 ; | X   X  | $FEB1
    .byte $38 ; |  XXX   | $FEB2
    .byte $00 ; |        | $FEB3
LeatherArmor:
    .byte $10 ; |   X    | $FEB4
    .byte $38 ; |  XXX   | $FEB5
    .byte $6C ; | XX XX  | $FEB6
    .byte $7C ; | XXXXX  | $FEB7
    .byte $D6 ; |XX X XX | $FEB8
    .byte $EE ; |XXX XXX | $FEB9
    .byte $D6 ; |XX X XX | $FEBA
    .byte $BA ; |X XXX X | $FEBB
    .byte $D6 ; |XX X XX | $FEBC
    .byte $7C ; | XXXXX  | $FEBD
    .byte $38 ; |  XXX   | $FEBE
    .byte $00 ; |        | $FEBF
CursorOn:
    .byte $FF ; |XXXXXXXX| $FEC0
    .byte $FF ; |XXXXXXXX| $FEC1
    .byte $FF ; |XXXXXXXX| $FEC2
    .byte $FF ; |XXXXXXXX| $FEC3
    .byte $FF ; |XXXXXXXX| $FEC4
    .byte $FF ; |XXXXXXXX| $FEC5
    .byte $FF ; |XXXXXXXX| $FEC6
    .byte $FF ; |XXXXXXXX| $FEC7
    .byte $FF ; |XXXXXXXX| $FEC8
    .byte $FF ; |XXXXXXXX| $FEC9
    .byte $FF ; |XXXXXXXX| $FECA
    .byte $FF ; |XXXXXXXX| $FECB
CursorOff:
    .byte $00 ; |        | $FECC
    .byte $00 ; |        | $FECD
    .byte $00 ; |        | $FECE
    .byte $00 ; |        | $FECF
    .byte $00 ; |        | $FED0
    .byte $00 ; |        | $FED1
    .byte $00 ; |        | $FED2
    .byte $00 ; |        | $FED3
    .byte $00 ; |        | $FED4
    .byte $00 ; |        | $FED5
    .byte $00 ; |        | $FED6
    .byte $00 ; |        | $FED7
DoorGfx:
    .byte $20 ; |  X     | $FED8
    .byte $78 ; | XXXX   | $FED9
    .byte $E8 ; |XXX X   | $FEDA
    .byte $E8 ; |XXX X   | $FEDB
    .byte $E8 ; |XXX X   | $FEDC
    .byte $D8 ; |XX XX   | $FEDD
    .byte $E8 ; |XXX X   | $FEDE
    .byte $E8 ; |XXX X   | $FEDF
    .byte $E8 ; |XXX X   | $FEE0
    .byte $C8 ; |XX  X   | $FEE1
    .byte $88 ; |X   X   | $FEE2
    .byte $F8 ; |XXXXX   | $FEE3
CopyrightOne:
    .byte $79 ; | XXXX  X| $FEE4
    .byte $85 ; |X    X X| $FEE5
    .byte $B5 ; |X XX X X| $FEE6
    .byte $A5 ; |X X  X X| $FEE7
    .byte $B5 ; |X XX X X| $FEE8
    .byte $85 ; |X    X X| $FEE9
    .byte $79 ; | XXXX  X| $FEEA
CopyrightTwo:
    .byte $17 ; |   X XXX| $FEEB
    .byte $15 ; |   X X X| $FEEC
    .byte $15 ; |   X X X| $FEED
    .byte $77 ; | XXX XXX| $FEEE
    .byte $55 ; | X X X X| $FEEF
    .byte $55 ; | X X X X| $FEF0
    .byte $77 ; | XXX XXX| $FEF1
CopyrightThree:
    .byte $71 ; | XXX   X| $FEF2
    .byte $41 ; | X     X| $FEF3
    .byte $41 ; | X     X| $FEF4
    .byte $71 ; | XXX   X| $FEF5
    .byte $11 ; |   X   X| $FEF6
    .byte $51 ; | X X   X| $FEF7
    .byte $70 ; | XXX    | $FEF8
CopyrightFour:
    .byte $49 ; | X  X  X| $FEF9
    .byte $49 ; | X  X  X| $FEFA
    .byte $49 ; | X  X  X| $FEFB
    .byte $C9 ; |XX  X  X| $FEFC
    .byte $49 ; | X  X  X| $FEFD
    .byte $49 ; | X  X  X| $FEFE
    .byte $BE ; |X XXXXX | $FEFF
CopyrightFive:
    .byte $55 ; | X X X X| $FF00
    .byte $55 ; | X X X X| $FF01
    .byte $55 ; | X X X X| $FF02
    .byte $D9 ; |XX XX  X| $FF03
    .byte $55 ; | X X X X| $FF04
    .byte $55 ; | X X X X| $FF05
    .byte $99 ; |X  XX  X| $FF06
CopyrightPtrTab:
    .word CopyrightFive  ; $FF07
    .word CopyrightFour  ; $FF09
    .word CopyrightThree ; $FF0B
    .word CopyrightTwo   ; $FF0D
    .word CopyrightOne   ; $FF0F
    .word CursorOff      ; $FF11  blank space...

InitialItemsCarried:
    .byte NOTHING_HELD   ; $FF13  rightmost item
    .byte NOTHING_HELD   ; $FF14
    .byte NOTHING_HELD   ; $FF15
    .byte ROPE           ; $FF16
    .byte GRAPPLING_HOOK ; $FF17
    .byte DAGGER         ; $FF18  leftmost item

                                           ;    ram | high nibble   | low nibble
InitialItemsInRoom:                        ;    ------------------------------------
    .byte         (LEO<<4) | OBJ_CARRIED   ;    $8B | FOOD          | GRAPPLING_HOOK
    .byte      (GEMINI<<4) | OBJ_CARRIED   ;    $8C | SHORT_SWORD   | WARRIORS_SWORD  <--- the warriors sword is hidden though!
    .byte       (VIRGO<<4) | CANCER        ;    $8D | NECKLACE      | RING
    .byte    (AQUARIUS<<4) | AQUARIUS      ;    $8E | TALISMAN      | WATER
    .byte   (CAPRICORN<<4) | OBJ_CARRIED   ;    $8F | LEATHER_ARMOR | DAGGER
    .byte      (TAURUS<<4) | SAGITTARIUS   ;    $90 | SHOES         | CLOAK
    .byte      (GEMINI<<4) | SCORPIO       ;    $91 | LAMP          | AMULET
    .byte (OBJ_CARRIED<<4) | TAURUS        ;    $92 | ROPE          | KEY

ItemLoPtrsTab:
    .byte <Key           ; $FF21
    .byte <Rope          ; $FF22
    .byte <Amulet        ; $FF23
    .byte <Lamp          ; $FF24
    .byte <CloakOfInvis  ; $FF25
    .byte <ShoesOfStealth; $FF26
    .byte <Dagger        ; $FF27
    .byte <LeatherArmor  ; $FF28
    .byte <Water         ; $FF29
    .byte <TalismanOfPass; $FF2A
    .byte <Ring          ; $FF2B
    .byte <Necklace      ; $FF2C
    .byte <WarriorsSword ; $FF2D
    .byte <ShortSword    ; $FF2E
    .byte <GrapplingHook ; $FF2F
    .byte <Food          ; $FF30
    .byte <CursorOff     ; $FF31
    .byte <CursorOn      ; $FF32

OverscanLoPtrs:
    .byte <OV_TitleScreen; $FF33
    .byte <OV_Room       ; $FF34
    .byte <OV_ZodiacRoom ; $FF35
    .byte <OV_Corridor   ; $FF36
    .byte <OV_RoomEntry  ; $FF37
    .byte <OV_16_4_Clue  ; $FF38
    .byte <OV_AquaRapids ; $FF39
    .byte <OV_SagitSpears; $FF3A
    .byte <OV_Waterfall  ; $FF3B
    .byte <OV_TaurusHorns; $FF3C
    .byte <OV_WarriorSwrd; $FF3D
    .byte <FinishOverscan; $FF3E
OverscanHiPtrs:
    .byte >OV_TitleScreen; $FF3F
    .byte >OV_Room       ; $FF40
    .byte >OV_ZodiacRoom ; $FF41
    .byte >OV_Corridor   ; $FF42
    .byte >OV_RoomEntry  ; $FF43
    .byte >OV_16_4_Clue  ; $FF44
    .byte >OV_AquaRapids ; $FF45
    .byte >OV_SagitSpears; $FF46
    .byte >OV_Waterfall  ; $FF47
    .byte >OV_TaurusHorns; $FF48
    .byte >OV_WarriorSwrd; $FF49
    .byte >FinishOverscan; $FF4A

InitializationLoPtrs:
    .byte <IN_TitleScreen; $FF4B
    .byte <IN_Room       ; $FF4C
    .byte <IN_ZodiacRoom ; $FF4D
    .byte <IN_Corridor   ; $FF4E
    .byte <IN_RoomEntry  ; $FF4F
    .byte <IN_16_4_Clue  ; $FF50
    .byte <IN_AquaRapids ; $FF51
    .byte <IN_SagitSpears; $FF52
    .byte <IN_Waterfall  ; $FF53
    .byte <IN_TaurusHorns; $FF54
    .byte <IN_WarriorSwrd; $FF55
InitializationHiPtrs:
    .byte >IN_TitleScreen; $FF56
    .byte >IN_Room       ; $FF57
    .byte >IN_ZodiacRoom ; $FF58
    .byte >IN_Corridor   ; $FF59
    .byte >IN_RoomEntry  ; $FF5A
    .byte >IN_16_4_Clue  ; $FF5B
    .byte >IN_AquaRapids ; $FF5C
    .byte >IN_SagitSpears; $FF5D
    .byte >IN_Waterfall  ; $FF5E
    .byte >IN_TaurusHorns; $FF5F
    .byte >IN_WarriorSwrd; $FF60

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;1 Room
;2 Menu screen
;3 Corridor
;4 Prep for a new room (upon entry)
;5 16-4 clue
;6 Rafts in Aquarian Rapids
;7 Sagittarius Spears
;8 Leo Waterfall
;9 Charging Taurus Horns
;10 Menu screen with Warrior's Sword

SequenceEventsTab:
    .byte 1              ; $FF61
    .byte 3              ; $FF62  room, then corridor
    .byte 1              ; $FF63
    .byte 4              ; $FF64  corridor, then prep for a new room
    .byte 1              ; $FF65  new room, then room
    .byte 4              ; $FF66  16-4 clue, then prep for a new room
    .byte 1              ; $FF67
    .byte 1              ; $FF68
    .byte 1              ; $FF69
    .byte 1              ; $FF6A
    .byte 2              ; $FF6B  warriors sword menu screen, then menu screen

ColRoofFloorTab:
    .byte RED            ; $FF6C  Virgo   duplicate table to ColRoomTab in other bank!
    .byte GREEN          ; $FF6D  Leo
    .byte BROWN          ; $FF6E  Cancer
    .byte PURPLE+2       ; $FF6F  Gemini
    .byte ORANGE+2       ; $FF70  Taurus
    .byte YELLOW         ; $FF71  Aries
    .byte BLUE+1         ; $FF72  Pisces
    .byte PURPLE         ; $FF73  Aquarius
    .byte GREENB         ; $FF74  Capricorn
    .byte YELLOW+2       ; $FF75  Sagittarius
    .byte ORANGE         ; $FF76  Scorpio
    .byte OCHRE          ; $FF77  Libra

  IF SPACE1
   ECHO "",([$FFEA-*]d), "free bytes  ",*,"- $ffea"
  ENDIF
SPACE1 = 1

       ORG $1FEA,0
      RORG $FFEA

DoIndirectJump1:
    lda    ram_82                ;
    and    #$F0                  ;
    cmp    #$D0                  ; switch banks?
    bne    LFFF5                 ; - yes
    sta    BANK_0                ; - no

LFFF5:
    jmp.ind (ram_81)             ;

    .byte $FF ; |XXXXXXXX| $FFF8
    .byte $00 ; |        | $FFF9

    .word START_1
    .word START_1
    .word START_1

