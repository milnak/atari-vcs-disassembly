; ------------------------------------------------------------------------------
;
;   Bowling for Atari by Larry Kaplan, 1979
;
;   Disassembly by Dennis Munsie, 2021
;
; ------------------------------------------------------------------------------

  .processor 6502
  
TIA_BASE_READ_ADDRESS = $30
  .include vcs.h

; ------------------------------------------------------------------------------
;   Versions
;
;   We can build the following versions of Bowling by specifying the VERSION on
;   dasm's command line.  Default is the NTSC version.
;     
;     0: Bowling (1979) (Atari)
;     1: Bowling (32 in 1) (1988) (Atari) (PAL)
; ------------------------------------------------------------------------------
NTSC_VERSION = 0
PAL_VERSION = 1

; Default to building for NTSC
  .ifnconst VERSION
VERSION = NTSC_VERSION
  .endif
  
  .if VERSION > PAL_VERSION
    .err "Unknown VERSION specified - ", VERSION
  .endif
  
; ------------------------------------------------------------------------------
;   RAM
; ------------------------------------------------------------------------------
  seg.u RAM
  .org $80
Frame_Count       ds 1            ; incremented once every frame
ram_81            ds 1              
ram_82            ds 1              
ram_83            ds 1              
ram_84            ds 1              
ram_85            ds 1              
P1_Col_3_Offset   ds 1            ; Offset into Digits or Marks for P1 col 3  
P2_Col_3_Offset   ds 1            ; Offset into Digits or Marks for P2 col 3
P1_Col_2_Offset   ds 1            ; Offset into Digits or Marks for P1 col 2
P2_Col_2_Offset   ds 1            ; Offset into Digits or Marks for P2 col 2
P1_Col_1_Offset   ds 1            ; Offset into Digits or Marks for P1 col 1  
P2_Col_1_Offset   ds 1            ; Offset into Digits or Marks for P2 col 1 
ram_8C            ds 1              
ram_8D            ds 1              
ram_8E            ds 1              
Player_Val        ds 1            ; current player number (0 is P1, 1 is P2)
ram_90            ds 1              
ram_91            ds 1              
ram_92            ds 1              
Marks_Array       ds 8            ; array of the marks for both P1 and P2.  Each row is two
                                  ; bytes, P1 than P2.
ram_9B            ds 1              
ram_9C            ds 1              
ram_9D            ds 1              
Ball_X_Pos        ds 1            ; x-position of where the ball should be drawn
ram_9F            ds 1              
ram_A0            ds 1              
Score_Lo_P1       ds 1            ; lower 2 digits of the score for P1 (BCD)
Score_Lo_P2       ds 1            ; lower 2 digits of the score for P1 (BCD)
Score_Lo_Frame    ds 1            ; lower 2 digits of the score for current frame (BCD)
Frame_Val         ds 1            ; frame/variation value (BCD)
ram_A5            ds 1              
Score_Hi_P1       ds 1            ; third digit of the score for P1
Score_Hi_P2       ds 1            ; third digit of the score for P2
ram_A8            ds 1
ram_A9            ds 1
ram_AA            ds 1
ram_AB            ds 1
ram_AC            ds 1
ram_AD            ds 1
ram_AE            ds 1
ram_AF            ds 1
ram_B0            ds 1
ram_B1            ds 1
ram_B2            ds 1
ram_B3            ds 1
ram_B4            ds 1
ram_B5            ds 1
ram_B6            ds 1
ram_B7            ds 1
ram_B8            ds 1
ram_B9            ds 1
ram_BA            ds 1
ram_BB            ds 1
ram_BC            ds 1
ram_BD            ds 1
ram_BE            ds 1
ram_BF            ds 1
ram_C0            ds 1
ram_C1            ds 1
ram_C2            ds 1
ram_C3            ds 1
ram_C4            ds 1
ram_C5            ds 1
ram_C6            ds 1
ram_C7            ds 1
ram_C8            ds 1
ram_C9            ds 1
ram_CA            ds 1
ram_CB            ds 1
ram_CC            ds 1
ram_CD            ds 1
ram_CE            ds 1
ram_CF            ds 1
ram_D0            ds 1
ram_D1            ds 1
ram_D2            ds 1
ram_D3            ds 1
ram_D4            ds 1
ram_D5            ds 1
ram_D6            ds 1
ram_D7            ds 1
ram_D8            ds 1
Temp              ds 1
ram_DA            ds 1

; ------------------------------------------------------------------------------
;   Start of ROM
; ------------------------------------------------------------------------------
  .seg Code
  .org $f000
Entry .subroutine
          SEI                     ; disable interrupts
          CLD                     ; clear decimal mode
                                  
          LDA #$00                ; reset all TIA registers and RAM
          TAX                     
.loop     STA $00,X               
          INX                     
          BNE .loop               
                                  
          LDX #$FF                ; put the stack at the top of RAM
          TXS                     
                                  
          STX TIM8T               
          JMP LF2A7                                            
                                  
Main_Loop .subroutine              
          LDA #$42                ; start v-blank 
          STA WSYNC               
          STA VBLANK              
          STA WSYNC               
          STA WSYNC               
          STA WSYNC               
                                  
          STA VSYNC               ; start the 3 lines of v-sync
          STA WSYNC               ; first line
          STA WSYNC               ; second line
          LDA #$00                ; get ready to turn it off
          STA WSYNC               ; third line
          STA VSYNC               ; done with v-sync
  .if VERSION = NTSC_VERSION
          LDA #$2D                ; start the overscan timer
  .endif
  .if VERSION = PAL_VERSION
          LDA #$4C                ; start the overscan timer
  .endif
          STA TIM64T              
                                  
          INC Frame_Count         
          JSR Game_Logic          ; run the game logic
                                  
; Overscan                        
.loop     LDA INTIM               ; wait for the overscan timer to finish
          BNE .loop

; ------------------------------------------------------------------------------
;   Kernel Code
; ------------------------------------------------------------------------------

; Scan Line 38
          STA WSYNC               ; (3 = 0) wait for the beginning of the first line
          STA VBLANK              ; (3 = 3) make sure V-Blank has been turned off
          STA CXCLR               ; (3 = 6) clear the collision latches
          STA REFP0               ; (3 = 9) turn off reflection for P0
          LDA #$FF                ; (2 = 11) use the Temp ZP value for state
          STA Temp                ; (3 = 14) start off on the initial state
          
; This portion is used to reset the registers and to advance the state
; Temp in ZP is used as a mini state machine with the following possible values:
;     $FF - initial value
;     $00 - show frame/variation (2 digits) and player values (1 digit), Scan Lines 39 - 50
;     $01 - show scores (3 digits each), Scan Lines 52 - 68
;     $02 - first row of marks, Scan Lines
;     $03 - second row of marks, Scan Lines
;     $04 - third row of marks, Scan Lines
;     $05 - fourth row of marks, Scan Lines
;     $06 - final value, draws rest of the screen
Kernel_Next_State .subroutine
          LDA #$00                ; (2 = 16) clear out our playfield shadows
          STA ram_D5              ; (3 = 19)
          STA ram_D6              ; (3 = 22)
          STA ram_D7              ; (3 = 25)
          STA ram_D8              ; (3 = 28)
          STA PF1                 ; (3 = 31) clear out the actual playfield values
          STA PF2                 ; (3 = 34)
          STA CTRLPF              ; (3 = 37) 
          INC Temp                ; (5 = 42) move to the next state in Temp
          LDA Temp                ; (3 = 45) check to see if we are in the second state
          BNE Kernel_Init_Score   ; (2 = 47) yes, go to the score drawing portion
          
; Scan Lines 39 - 50
;
; Draws the frame/variation and player values portion of the display.
          LDX #$00                ; (2 = 49) use X as the current line in the digit
Kernel_Top_Digits .subroutine  
; Odd scan line
          STA WSYNC               ; (3 = 0) wait for the new line
          LDA ram_D5              ; (3 = 3) load our left side PF1 shadow value
          STA PF1                 ; (3 = 6) into PF1
                                  
          LDY #$04                ; (2 = 8) burn 28 cycles
          NOP                     ; (2 = 10)
.loop     DEY                     ; (2 = 12/17/22/27/32)
          BPL .loop               ; (3/2 = 15/20/25/30/34)
                                  
          LDA ram_D6              ; (3 = 37) load our right side PF1 shadow value
          STA PF1                 ; (3 = 40) into PF1
          STX ram_D7              ; (3 = 43) stash the current line in RAM so we can add it to our offset
          
; now that the playfield has been setup for this line, we need to figure out
; what the next PF1 value will be for the left side when we get to the next odd scan line
          LDA Frame_Val           ; (3 = 47) get the value we are displaying on the left side (frame/variation)
          CMP #$10                ; (2 = 49) are we showing a 1 digit in the 10s place?
          BCC .skip               ; (2 = 51) no, skip loading the 1 digit value
          LDA Digits,X            ; (4 = 55) get the 0 digit PF value
          ORA #$20                ; (2 = 57) set the pixel for the 1 digit
          BNE .even               ; (3 = 60) skip to the next scan line
                                  
.skip     ASL                     ; (2 = 54) multiply A by 5 to get the offset into the Digits table
          ASL                     ; (2 = 56)
          ADC Frame_Val           ; (3 = 59)
          ADC ram_D7              ; (3 = 62) add in the current line offset
          TAY                     ; (2 = 64) move the new index into Y
          LDA Digits,Y            ; (4 = 68) and get the playfield value into A
          AND #$0F                ; (2 = 70) mask off the top 4 bits
          
; Even scan line
.even     STA WSYNC               ; (3 = 0) wait for the new line
          LDY ram_D5              ; (3 = 3) load our left side PF1 shadow value
          STY PF1                 ; (3 = 6) into PF1
          STA ram_D5              ; (3 = 9) now we can safely store the new value into our shadow
                                  
          LDA Player_Val          ; (3 = 12) get the player number
          ASL                     ; (2 = 14) multiply by 5 to get the offset
          ASL                     ; (2 = 16)
          ADC Player_Val          ; (3 = 19)
          ADC #$05                ; (2 = 21) player is stored 0 based, add 5 to get to the next digit
          ADC ram_D7              ; (3 = 24) add in the current line offset
          TAY                     ; (2 = 26) move the new index into Y
          LDA Digits,Y            ; (4 = 30) and get the playfield value into A
          AND #$0F                ; (2 = 32) mask off the top 4 bits
          LDY ram_D6              ; (3 = 35) load our right side PF1 shadow value
          STA ram_D6              ; (3 = 38) store our new value we just calulated into the shadow
          STY PF1                 ; (3 = 41) now we can update the PF1 register with the old value
          
          INX                     ; (2 = 43) move to the next line
          CPX #$06                ; (2 = 45) did we draw 6 lines yet?
          BCC Kernel_Top_Digits   ; (3 = 48) no, do this all over again
          
Kernel_Next_State_B
          JMP Kernel_Next_State   ; (3 = 51) move to the next state

; Scan Line 51
Kernel_Init_Score .subroutine
          LDY #$02                ; (2 = 50) set the playfield colors to be in score mode
          STY CTRLPF              ; (3 = 53)
          LDX #$06                ; (2 = 55) we're going to do six sets of lines
          CMP #$01                ; (2 = 57) are we drawing the score or marks?
          BEQ Kernel_Draw_Score   ; (2 = 58) draw the score 
          JMP Kernel_Init_Marks   ; (3 = 61) draw the marks
          
; Scan Lines 52 - 68
;
; The score area is 5 sets of 3 scan lines, plus an additional 1 and a half scan lines for the
; last set.  There are no WSYNCS within each set of 3 lines.
;
; The code interweaves updating PF1 and PF2 at the right time with generating the values that
; will be used in PF1 and PF2 the next time through.

Kernel_Draw_Score .subroutine
; Sub-Scan Line 1 -- uses the column 1 and 2 offsets to generate the PF1 values that will
; be used to draw the score
          STA WSYNC               ; (3 = 0) wait for the new line
          LDA ram_D7              ; (3 = 3) load our left side PF1 shadow value
          STA PF1                 ; (3 = 6) into PF1
          LDA ram_D5              ; (3 = 9) and our left side PF2 shadow value
          STA PF2                 ; (3 = 12) into PF2
          
          LDY P1_Col_1_Offset     ; (3 = 15) load the offset to the P1 hundreths digit
          LDA Digits,Y            ; (4 = 19) and get the pixels
          AND #$F0                ; (2 = 21) mask off the bottom 4 bits
          STA ram_D7              ; (3 = 24) store it into our left side PF1 shadow
          
          LDY P1_Col_2_Offset     ; (3 = 27) load the offset to the P1 tens digit
          LDA Digits,Y            ; (4 = 31) and get the pixels
          AND #$0F                ; (2 = 33) mask off the top 4 bits
          ORA ram_D7              ; (3 = 36) combine it with the value we just stored
          STA ram_D7              ; (3 = 39) in the left side PF1 shadow
          
          LDA ram_D8              ; (3 = 42) load our right side PF1 shadow value
          STA PF1                 ; (3 = 45) into PF1
          LDA ram_D6              ; (3 = 48) and our right side PF2 shadow value
          STA PF2                 ; (3 = 51) into PF2
          
          LDY P2_Col_1_Offset     ; (3 = 54) load the offset to the P2 hundreths digit
          LDA Digits,Y            ; (4 = 58) and get the pixels
          AND #$F0                ; (2 = 60) mask off the bottom 4 bits
          STA ram_D8              ; (3 = 63) store it into our right side PF1 shadow
          
          LDY P2_Col_2_Offset     ; (3 = 66) load the offset to the P2 tens digit
          LDA Digits,Y            ; (4 = 70) and get the pixels
          AND #$0F                ; (2 = 72) mask off the top 4 bits
          ORA ram_D8              ; (3 = 75) combine it with the value we just stored
        
; Sub-Scan Line 2 -- uses the column 3 offsets to generate the PF2 values that will be used
; to draw the score
          STA ram_D8              ; (3 = 2) store it into our right side PF1 shadow
          
          DEX                     ; (2 = 4) decrement our line count
          BEQ Kernel_Next_State_B ; (2 = 6) move to the next state if we have no more lines
          
          LDA ram_D7              ; (3 = 9) load our left side PF1 shadow value
          STA PF1                 ; (3 = 12) into PF1
          
          LDY P1_Col_3_Offset     ; (3 = 15) load the offset to the P1 ones digit         
          LDA Digits,Y            ; (4 = 19) and get the pixels
          AND #$0F                ; (2 = 21) mask off the top 4 bits
          LSR                     ; (2 = 23) shift right one bit so that we can use this
          TAY                     ; (2 = 25) as an index
          LDA Mirror_LUT,Y        ; (4 = 29) into the mirror LUT
          STA ram_D5              ; (3 = 31) store it into our left side PF2 shadow value
          STA PF2                 ; (3 = 34) and also into PF2
          
          LDY P2_Col_3_Offset     ; (3 = 37) load the offset to the P2 ones digit
          
          LDA ram_D8              ; (3 = 40) load our right side PF1 shadow value
          STA PF1                 ; (3 = 43) into PF1
          
          LDA Digits,Y            ; (4 = 47) get the pixels for the P2 ones digit
          AND #$0F                ; (2 = 49) mask off the top 4 bits
          LSR                     ; (2 = 51) shift right one bit so that we can use this
          TAY                     ; (2 = 53) as an index
          LDA Mirror_LUT,Y        ; (4 = 57) into the mirror LUT
          STA PF2                 ; (3 = 60) store it into our right side PF2 shadow value
          STA ram_D6              ; (3 = 63) and also into PF2
          
          INC P1_Col_3_Offset     ; (5 = 68) increment each of our offsets
          INC P1_Col_1_Offset     ; (5 = 73)
; Sub-Scan Line 3 -- primarily updating the offsets so that the next row will display the
; correct line in the digits    
          INC P2_Col_3_Offset     ; (5 = 2)
          INC P2_Col_1_Offset     ; (5 = 7)
          
          LDA ram_D7              ; (3 = 10) load our left side PF1 shadow value
          STA PF1                 ; (3 = 12) into PF1
          LDA ram_D5              ; (3 = 15) and our left side PF2 shadow value
          STA PF2                 ; (3 = 18) into PF2
          
          PHA                     ; (3 = 21) burn some cycles
          PLA                     ; (4 = 25)
          
          INC P1_Col_2_Offset     ; (5 = 30) increment the remaining offsets
          INC P2_Col_2_Offset     ; (5 = 35)
          
          LDA ram_D8              ; (3 = 38) load our right side PF1 shadow value
          STA PF1                 ; (3 = 41) into PF1
          LDA ram_D6              ; (3 = 44) and our right side PF2 shadow value
          STA PF2                 ; (3 = 47) into PF2
     
          JMP Kernel_Draw_Score   ; (3 = 50) do it again
 
; Scan Lines 68 - 70, 79 - 81, 90 - 92, 101 - 103, 112    
Kernel_Init_Marks .subroutine
          CMP #$06                ; (2 = 63) are we done with drawing marks?
          BCC .skip               ; (2 = 65) nope, setup for the next row
          JMP LF1D1               ; (3 = 68) yes, move onto the next section
          
; calculate the offset into the Marks_Lo and Marks_Hi tables for both players
;
; in this section of the kernel, the columns are opposite of what they were for the score.
; columm 3 is on the left and column 1 is on the right.
.skip     SBC #$01                ; calculate the offset for the row
          ASL                     ; into the Marks_Array
          TAY                     ; 
          INY                     ; start with P2
          LDX #$01
          
.loop     LDA Marks_Array,Y       ; get the marks value
          AND #$03                ; get the bottom two bits
          ASL                     ; and multiply by 4
          ASL
          STA P1_Col_3_Offset,X   ; store it into the column 3 offset
          
          LDA Marks_Array,Y       ; get the marks value again
          AND #$0C                ; get the 2nd two bits
          STA P1_Col_2_Offset,X   ; and store it into the column 2 offset
          
          LDA Marks_Array,Y       ; get the marks value one more time
          AND #$30                ; get the 3rd set of two bits
          LSR                     ; and divide by 4
          LSR
          CMP #$08                ; check to see if we have a spare?
          BNE .skipFlip           ; not a spare -- skip over flipping it
          ASL                     ; multiply by 2 to get to the flipped spare
.skipFlip STA P1_Col_1_Offset,X   ; store into the column 1 offset

          DEY                     ; move to the next index for Marks_Array
          DEX                     ; move to the next player
          BPL .loop               ; update again for P1
          
; Scan Lines - 71 - 78, 82 - 89, 93 - 100, 104 - 111
Kernel_Draw_Marks .subroutine
; Sub-Scan Line 1
          STA WSYNC               ; (3 = 0) wait for the new line
          
          LDY P1_Col_3_Offset     ; (3 = 3) get the offset for column 3, P1
          LDA Marks_Hi,Y          ; (4 = 7) and load the row from the Marks_Hi table
          STA ram_D5              ; (3 = 10) store it off temporarily
          LDY P1_Col_2_Offset     ; (3 = 13) get the offset for column 2, P1
          LDA Marks_Lo,Y          ; (4 = 17) and load the row from the Marks_Lo table
          ORA ram_D5              ; (3 = 20) combine it with the high
          STA PF1                 ; (3 = 23) put it into PF1
          STA ram_D5              ; (3 = 26) and save it for later use
          
          LDY P1_Col_1_Offset     ; (3 = 29) get the offset for column 1, P1
          LDA Marks_Lo,Y          ; (4 = 33) and load the row from the Marks_Lo table
          STA PF2                 ; (3 = 36) put it into PF2
          STA ram_D6              ; (3 = 39) and save it for later use as well
          
          LDA ram_D7              ; (3 = 42) get the value for the column 3 and 2 for P2
          STA PF1                 ; (3 = 45) put it into PF1
          
          LDY P2_Col_1_Offset     ; (3 = 48) get the offset for column 1, P2
          LDA Marks_Lo,Y          ; (4 = 52) and load the row from the Marks_Lo table
          STA PF2                 ; (3 = 55) put it into PF2
          STA ram_D8              ; (3 = 58) and save it for later use as well
          
          LDY P2_Col_3_Offset     ; (3 = 61) get the offset for column 3, P2
          LDA Marks_Hi,Y          ; (4 = 65) and load the row from the Marks_Hi table
          STA ram_D7              ; (3 = 68) store it off temporarily
          LDY P2_Col_2_Offset     ; (3 = 71) get the offset for column 2, P2
          LDA Marks_Lo,Y          ; (4 = 75) and load the row from the Marks_Lo table
          
; Sub-Scan Line 2 
          ORA ram_D7              ; (3 = 2) combine it with the high          
          STA ram_D7              ; (3 = 5) save it for later use
          
          LDA ram_D5              ; (3 = 8) get the value for P1 PF1 we calculated earlier
          STA PF1                 ; (3 = 11) store it in PF1
          LDA ram_D6              ; (3 = 14) get the value for P1 PF2
          STA PF2                 ; (3 = 17) store it in PF2
          
          INC P1_Col_3_Offset     ; (5 = 22) increment each of our offsets
          INC P2_Col_3_Offset     ; (5 = 27)
          INC P1_Col_2_Offset     ; (5 = 32)
          INC P2_Col_2_Offset     ; (5 = 37)
          INC P2_Col_1_Offset     ; (5 = 42)
          INC P1_Col_1_Offset     ; (5 = 47)
          
          LDA ram_D7              ; (3 = 50) get the value for P2 PF1 we calculated earlier
          STA PF1                 ; (3 = 53) store it in PF1
          LDA ram_D8              ; (3 = 56) get the value for P1 PF2
          STA PF2                 ; (3 = 59) store it in PF2
          
          LDA P1_Col_3_Offset     ; (3 = 62) get the offset for column 3, P1
          AND #$03                ; (2 = 64) mask just the bottom 2 bits
          BNE Kernel_Draw_Marks   ; (2 = 66) if it's not zero, we still have rows to draw
          JMP Kernel_Next_State   ; (3 = 69) move to the next state
          
; Scan Line 113
LF1D1 .subroutine
          STA WSYNC
          LDA #$10
          STA CTRLPF
          LDX Player_Val
          LDA ram_CD,X
          STA ram_D8
          SBC #$02
          AND #$F7
          STA Temp
          LDA ram_D1
          STA COLUP1
          LDA ram_CF
          STA COLUP0
          LDA #$25
          STA NUSIZ0
          LDX #$2D

; Scan Line 114   
LF1F1     STA WSYNC
          LDA ram_D0
          CPX #$22
          BNE LF1FB
          LDA ram_CF
LF1FB     STA COLUBK
          TXA
          SEC
          SBC ram_A9
          LDY #$05
          CMP #$05
          BCS LF208
          TAY
LF208     STY ram_D5
          TXA
          SEC
          SBC ram_A8
          TAY
          AND #$F0
          BEQ LF217
          LDA #$00
          BEQ LF233
LF217     LDA (ram_AA),Y
          CPY #$00
          BNE LF222
          LDY ram_D2
          JMP LF231
LF222     CPY #$0C
          BCS LF233
          CPY #$06
          BCC LF22F
          LDY ram_D8
          JMP LF231
LF22F     LDY Temp
LF231     STY COLUP1

LF233     STA WSYNC
          STA GRP1
          LDY ram_D5
          LDA Ball_Flags,Y
          STA ENABL
          ASL
          STA ENAM0
          CPX #$22
          BCS LF249
          LDA ram_DA,X
          STA GRP0
LF249     DEX
          BPL LF1F1
          
          STA WSYNC
          LDA ram_CF
          STA COLUBK
          LDA #$00
          STA GRP0
          STA WSYNC
          STA WSYNC
          
          LDA ram_D0
          STA COLUBK
  .if VERSION = NTSC_VERSION
          LDA #$39
  .endif
  .if VERSION = PAL_VERSION
          LDA #$58
  .endif
          STA TIM64T
          LDA SWCHB
          ROR
          BCS LF282
          LDA #$FF
          STA ram_81
          LDA #$00
          LDX #$46
LF271     STA P1_Col_3_Offset,X
          DEX
          BPL LF271
          INC Frame_Val
          BIT ram_D3
          BMI LF2D3
          LDA #ram_AA
          STA Score_Lo_P2
          BNE LF2D3
LF282     LDA Frame_Count
          BNE LF28C
          INC ram_9F
          BNE LF28C
          STA ram_81
LF28C     AND #$1F
          BNE LF292
          STA ram_A0
LF292     LDA SWCHB
          AND #$02
          BEQ LF29D
          STA ram_A0
          BNE LF2D7
LF29D     BIT ram_A0
          BMI LF2D7
          LDA #$FF
          STA ram_A0
          INC ram_82
LF2A7     LDA ram_D4
          STA Frame_Val
          LDX #$00
          STX ram_81
          STX ram_8C
          STX Frame_Count
          LDA ram_82
          CMP #$06
          BCC LF2BD
          STX Frame_Val
          STX ram_82
LF2BD     LDX #$03
          JSR Add_1_Score
          STA ram_D4
          LDX ram_82
          LDA LF7B2,X
          STA ram_D3
          AND #$80
          BEQ LF2D1
          LDA #$01
LF2D1     STA Player_Val
LF2D3     LDA #$01
          STA ram_A8
          
LF2D7     LDA SWCHB               ; load the value of SWCHB
          LDX #$07
          LDY #$06                ; point to the B&W table
          AND #$08                ; check if the color switch is set
          BEQ .skipColor          ; is it set to black and white?
          LDX #$F7
          LDY #$00                ; point to the color table
.skipColor
          LDA ram_81
          EOR #$FF
          BMI LF2EE
          LDX #$FF
LF2EE     AND ram_9F
          STA ram_D8
          STX ram_D7
          LDX #$05
LF2F6     LDA Color_LUT,Y
          EOR ram_D8
          AND ram_D7
          STA COLUP0,X
          STA ram_CD,X
          INY
          DEX
          BPL LF2F6
          
          LDA SWCHA
          EOR #$FF
          CMP ram_85
          BEQ LF312
          LDX #$00
          STX ram_9F
LF312     STA ram_85
          AND #$03
          STA ram_84
          LDA ram_85
          LSR
          LSR
          LSR
          LSR
          AND #$03
          STA ram_83
          LDA ram_8C
          BNE LF354
          LDA #$FF
          STA ram_8C
          LDA #$00
          STA ram_8D
          STA ram_92
          STA Score_Lo_Frame
          LDX #$09
LF334     LDA LF78A,X
          STA ram_AF,X
          LDA LF794,X
          STA ram_B9,X
          LDA #$FF
          JSR LF6BA
          LDA #$00
          STA ram_C3,X
          DEX
          BPL LF334
          
          STA WSYNC
          LDY #$0B
LF34E     DEY
          BNE LF34E
          STA RESP0,Y
LF354     LDY ram_8D
          CPY #$05
          BEQ LF378
          BCS LF3D8
          LDA LF7E8,Y
          STA ram_AA
          LDA #$F7
          STA ram_AB
          LDA LF7ED,Y
          STA ram_9D
          CLC
          ADC LF7F2,Y
          STA Ball_X_Pos
          CLC
          LDA ram_A8
          ADC LF7F7,Y
          STA ram_A9
LF378     LDA CXM0P
          ORA CXP0FB
          ASL
          BPL LF3D8
          SEC
          LDA Ball_X_Pos
          SBC #$70
          LSR
          EOR #$07
          CMP #$08
          BCC LF38D
          LDA #$00
LF38D     STA ram_D5
          LDX #$09
LF391     LDA ram_D5
          CMP ram_B9,X
          BEQ LF3A0
          SEC
          SBC #$01
          BMI LF3AC
          CMP ram_B9,X
          BNE LF3AC
LF3A0     SEC
          LDA ram_AF,X
          SBC ram_A9
          CLC
          ADC #$01
          CMP #$06
          BCC LF3B1
LF3AC     DEX
          BPL LF391
          BMI LF3D8
LF3B1     STA ram_D5
          CMP #$03
          BCC LF3BB
          DEC ram_A9
          BCS LF3BD
LF3BB     INC ram_A9
LF3BD     LDY Player_Val
          CLC
          LDA SWCHB
          AND Difficulty_Switch_Mask,Y
          BEQ LF3CB
          LDA Frame_Count
          ASL
LF3CB     ROL ram_D5
          LDY ram_D5
          LDA LF7A6,Y
          STA ram_C3,X
          LDA #$08
          STA ram_A5
LF3D8     LDA #$03
          STA ram_D5
          LDX ram_AE
LF3DE     LDA ram_C3,X
          BEQ LF43B
          BMI LF43B
          LDA #$00
          JSR LF6BA
          LDA ram_C3,X
          AND #$0F
          CMP #$08
          BCC LF3F3
          ORA #$F0
LF3F3     TAY
          CLC
          ADC ram_AF,X
          STA ram_AF,X
          CMP #$22
          BCC LF401
          LDA #$FF
          BMI LF410
LF401     LDA ram_C3,X
          AND #$F0
          LSR
          LSR
          LSR
          LSR
          STA ram_D8
          SEC
          LDA ram_B9,X
          SBC ram_D8
LF410     STA ram_B9,X
          BPL LF418
          STA ram_C3,X
          BMI LF43B
LF418     LDA #$FF
          JSR LF6BA
          LDY #$09
LF41F     LDA ram_B9,Y
          CMP ram_B9,X
          BNE LF438
          SEC
          LDA ram_AF,Y
          SBC ram_AF,X
          CLC
          ADC #$02
          CMP #$05
          BCS LF438
          LDA ram_C3,X
          STA ram_C3,Y
LF438     DEY
          BPL LF41F
LF43B     DEX
          BPL LF440
          LDX #$09
LF440     DEC ram_D5
          BPL LF3DE
          STX ram_AE
          
LF446     LDA INTIM
          BNE LF446
          JMP Main_Loop
 
; ------------------------------------------------------------------------------
;   End Of Kernel Code
; ------------------------------------------------------------------------------
         
Game_Logic .subroutine
          LDA ram_81
          BPL LF497
          LDX Player_Val
          LDA ram_8D
          BNE LF489
          LDA Frame_Count
          AND #$03
          BNE LF47F
          LDA ram_83,X
          BEQ LF47F
          CMP #$01
          BEQ LF472
          DEC ram_A8
          BNE LF46E
          INC ram_A8
          BNE LF47F
LF46E     DEC ram_A9
          BNE LF47F
LF472     CLC
          LDA ram_A8
          ADC #$01
          CMP #$1D
          BCS LF47F
          STA ram_A8
          INC ram_A9
LF47F     LDA INPT4,X
          BMI LF497
          LDA #$00
          STA ram_90
          BEQ LF495
LF489     CMP #$05
          BEQ LF49A
          BCS LF4B9
          LDA Frame_Count
          AND #$0F
          BNE LF497
LF495     INC ram_8D
LF497     JMP LF62B
LF49A     LDA Frame_Count
          AND #$01
          BNE LF497
          INC Ball_X_Pos
          LDA Ball_X_Pos
          CMP #$8C
          BCS LF4B7
          LDA ram_D3
          AND #$20
          BNE LF497
          LDA Frame_Count
          AND #$07
          BNE LF497
          JMP LF60A
LF4B7     INC ram_8D
LF4B9     DEC ram_A9
          BNE LF497
          INC ram_A9
          DEC Ball_X_Pos
          LDY Ball_X_Pos
          CPY #$70
          BEQ LF4FF
          BCS LF497
          CPY #$06
          BCC LF523
          LDA ram_92
          BEQ LF4D5
          CPY #$52
          BCC LF497
LF4D5     LDA Score_Lo_Frame
          CMP #$10
          BNE LF520
          LDA Frame_Count
          STA COLUP0,X
          STA ram_CD,X
          AND #$0F
          STA ram_A5
          BNE LF520
          LDA LF7E8
          CMP ram_AA
          BNE LF4F1
          LDA LF7E9
LF4F1     STA ram_AA
          LDA ram_A8
          EOR #$04
          STA ram_A8
          BNE LF520
          INC ram_A8
          BNE LF520
LF4FF     LDX #$09
LF501     LDA ram_C3,X
          BEQ LF51D
          BMI LF50C
          LDA #$00
          JSR LF6BA
LF50C     LDA #$00
          STA ram_C3,X
          LDA #$FF
          STA ram_B9,X
          STX ram_D5
          LDX #$02
          JSR Add_1_Score
          LDX ram_D5
LF51D     DEX
          BPL LF501
LF520     JMP LF62B
LF523     LDA ram_9B,X
          STA ram_D6
          LDA #$00
          STA ram_8D
          LDA #$01
          STA ram_A8
          LDA ram_92
          BNE LF56A
          BIT ram_D6
          BVC LF54D
          BPL LF541
          LDA #$80
          STA ram_9B,X
          LDA #$20
          BNE LF545
LF541     LSR ram_9B,X
          LDA #$10
LF545     JSR Add_A_Score
          LDA Score_Lo_Frame
          JSR Add_A_Score
LF54D     INC ram_92
          LDA Score_Lo_Frame
          CMP #$10
          BCS LF560
          LDA ram_AC,X
          ASL
          BMI LF59A
          BCC LF520
          LDA #$01
          BNE LF564
LF560     ROR ram_9B,X
          LDA #$03
LF564     JSR LF6ED
          JMP LF596
LF56A     LDA Score_Lo_Frame
          CMP #$10
          BNE LF576
          LDA #$02
          LDY #$40
          BNE LF583
LF576     LDY Frame_Val
          CPY #$11
          BCS LF57F
          JSR Add_A_Score
LF57F     LDA #$01
          LDY #$00
LF583     STY ram_9B,X
          JSR LF6ED
          BIT ram_D6
          BPL LF596
          LDA #$10
          JSR Add_A_Score
          LDA Score_Lo_Frame
          JSR Add_A_Score
LF596     LDA #$00
          STA ram_8C
LF59A     BIT ram_D3
          BMI LF5B7
          LDX #$03
          JSR Add_1_Score
          CMP #$11
          BCC LF607
          ROL ram_AC
          BCS LF5DA
          BMI LF607
          LDA #$C0
          AND ram_9B
          BEQ LF5DA
          LDX #$00
          BEQ LF5FB
LF5B7     TXA
          TAY
          EOR #$01
          STA Player_Val
          CLC
          TXA
          LDX #$03
          JSR Add_A_Score
          ORA Player_Val
          CMP #$11
          BCC LF607
          TYA
          TAX
          BEQ LF5E2
          ROL ram_AD
          BCS LF5DA
          BMI LF605
          LDA #$C0
          AND ram_9C
          BNE LF5FB
LF5DA     LDA #$00
          STA ram_81
          STA ram_8D
          BEQ LF607
LF5E2     LDX #$03
          JSR Add_1_Score
          LDX #$00
          ROL ram_AC
          BCS LF5F5
          BMI LF605
          LDA #$C0
          AND ram_9B
          BNE LF5FB
LF5F5     LDA #$10
          STA Frame_Val
          BNE LF607
LF5FB     LDA #$40
          STA ram_AC,X
          LDA ram_9B,X
          BMI LF605
          ASL ram_AC,X
LF605     STX Player_Val
LF607     JMP LF62B
LF60A     BIT ram_D3
          BVS LF612
          LDA ram_90
          BNE LF618
LF612     LDA ram_83,X
          STA ram_90
          BEQ LF62B
LF618     CMP #$01
          BEQ LF620
          DEC ram_A9
          BNE LF62B
LF620     CLC
          LDA ram_A9
          ADC #$01
          CMP #$1D
          BCS LF62B
          STA ram_A9
LF62B     LDX #$01
LF62D     LDA Score_Lo_P1,X
          AND #$0F
          STA ram_D5
          ASL
          ASL
          CLC
          ADC ram_D5
          STA P1_Col_3_Offset,X
          LDA Score_Lo_P1,X
          AND #$F0
          LSR
          LSR
          STA ram_D5
          LSR
          LSR
          CLC
          ADC ram_D5
          STA P1_Col_2_Offset,X
          LDA Score_Hi_P1,X
          ASL
          ASL
          CLC
          ADC Score_Hi_P1,X
          STA P1_Col_1_Offset,X
          DEX
          BPL LF62D
          LDX #$03
LF657     TXA
          AND #$01
          TAY
          LDA ram_9D,Y
          CPX #$03
          BNE LF665
          CLC
          ADC #$01
LF665     LDY #$FF
          STA HMCLR
LF669     INY
          SEC
          SBC #$0F
          BPL LF669
          
          STA WSYNC
          CLC
          ADC #$07
          EOR #$FF
          ASL
          ASL
          ASL
          ASL
          STA HMP1,X
LF67C     DEY
          BPL LF67C
          STA RESP1,X
          
          STA WSYNC
          STA HMOVE
          DEX
          BPL LF657
          LDA #$00
          LDX ram_8D
          CPX #$05
          BNE LF699
          LDA #$0F
          STA AUDC0
          ROL
          STA AUDF0
          LDA Frame_Count
LF699     STA AUDV0
          LDA ram_A5
          BEQ LF6A9
          DEC ram_A5
          EOR #$0F
          STA AUDF1
          LDA #$0C
          STA AUDC1
LF6A9     STA AUDV1
          RTS
          
; ------------------------------------------------------------------------------
;   Add_1_Score / Add_A_Score
;
;   Inputs:
;     A - amount to add (only when calling Add_A_Score)
;     X - which score to store it in:
;       0 - P1
;       1 - P2
;       2 - Frame
; ------------------------------------------------------------------------------

Add_1_Score .subroutine
          LDA #1                  ; we're adding just 1
Add_A_Score                     
          SED                     ; use decimal mode for this
          CLC                     ; clear the carry flag
          ADC Score_Lo_P1,X       ; add the value in A to the score
          STA Score_Lo_P1,X       ; store the result back in
          BCC .skip_hi_digit      ; if carry is clear, we're done
          INC Score_Hi_P1,X       ; carry was set, add one to the high digit
.skip_hi_digit                    
          CLD                     ; clear decimal mode
          RTS                     ; we're done
          
; ------------------------------------------------------------------------------

LF6BA .subroutine
          STA Temp
          LDY ram_B9,X
          LDA #$00
          SEC
LF6C1     ROL
          DEY
          BPL LF6C1
          STA ram_D8
          LDY ram_AF,X
          LDA ram_DA,Y
          EOR Temp
          AND ram_D8
          BEQ LF6DA
          LDA ram_DA,Y
          EOR ram_D8
          STA ram_DA,Y
LF6DA     INY
          LDA ram_DA,Y
          EOR Temp
          AND ram_D8
          BEQ LF6EC
          LDA ram_DA,Y
          EOR ram_D8
          STA ram_DA,Y
LF6EC     RTS

; ------------------------------------------------------------------------------

LF6ED .subroutine
          STA Temp
          LDA Frame_Val
          CMP #$10
          BCC LF6F9
          AND #$0F
          ADC #$09
LF6F9     SEC
          SBC #$01
          LDY #$FF
LF6FE     INY
          SEC
          SBC #$03
          BPL LF6FE
          CMP #$FE
          BCC LF714
          ASL Temp
          ASL Temp
          CMP #$FF
          BCC LF714
          ASL Temp
          ASL Temp
LF714     TYA
          ASL
          ORA Player_Val
          TAY
          LDA Temp
          ORA Marks_Array,Y
          STA Marks_Array,Y
          RTS

; ------------------------------------------------------------------------------

Color_LUT
; Color Mode
     .byte $00        ; REFP0 value
     .byte $58        ; CTRLPF value
     .byte $26        ; COLUBK value
     .byte $84        ; COLUPF value
     .byte $D8        ; COLUP1 value
     .byte $88        ; COLUP0 value
                    
; Black & White Mode
     .byte $00        ; REFP0 value
     .byte $06        ; CTRLPF value
     .byte $0A        ; COLUBK value
     .byte $06        ; COLUPF value
     .byte $00        ; COLUP1 value
     .byte $0E        ; COLUP0 value

; Ball/Missile enable flags for bowling ball, or'd together
;   $01 - enable M0
;   $02 - enable Ball
Ball_Flags
     .byte $02, $03, $03, $03, $02, $00

; Hi-nyble is used for the 3rd digit of the score so that the zero is supressed
; Lo-nyble is used everywhere else      
Digits               
     .byte %00001110  ; |    XXX |
     .byte %00001010  ; |    X X |
     .byte %00001010  ; |    X X |
     .byte %00001010  ; |    X X |
     .byte %00001110  ; |    XXX |
     
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |

     .byte %11101110  ; |XXX XXX |
     .byte %00100010  ; |  X   X |
     .byte %11101110  ; |XXX XXX |
     .byte %10001000  ; |X   X   |               
     .byte %11101110  ; |XXX XXX |
     
     .byte %11101110  ; |XXX XXX |
     .byte %00100010  ; |  X   X |
     .byte %01100110  ; | XX  XX |
     .byte %00100010  ; |  X   X |
     .byte %11101110  ; |XXX XXX |
     
     .byte %10101010  ; |X X X X |               
     .byte %10101010  ; |X X X X |               
     .byte %11101110  ; |XXX XXX |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
          
     .byte %11101110  ; |XXX XXX |
     .byte %10001000  ; |X   X   |               
     .byte %11101110  ; |XXX XXX |     
     .byte %00100010  ; |  X   X |
     .byte %11101110  ; |XXX XXX |
           
     .byte %11101110  ; |XXX XXX |         
     .byte %10001000  ; |X   X   |               
     .byte %11101110  ; |XXX XXX |     
     .byte %10101010  ; |X X X X |               
     .byte %11101110  ; |XXX XXX |
          
     .byte %11101110  ; |XXX XXX |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
     .byte %00100010  ; |  X   X |
           
     .byte %11101110  ; |XXX XXX |         
     .byte %10101010  ; |X X X X |               
     .byte %11101110  ; |XXX XXX |     
     .byte %10101010  ; |X X X X |               
     .byte %11101110  ; |XXX XXX |
                    
     .byte %11101110  ; |XXX XXX |
     .byte %10101010  ; |X X X X |               
     .byte %11101110  ; |XXX XXX |         
     .byte %00100010  ; |  X   X |
     .byte %11101110  ; |XXX XXX |
   
; TODO: the fourth row of these must be aligned to a 4 byte boundary or the kernel code won't
; know that it is done drawing the row of marks.  This should be enforced by the assembler if
; possible
Marks_Lo         
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
                   
     .byte %00000000  ; |        |
     .byte %00001110  ; |    XXX |               
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
             
     .byte %00000010  ; |      X |
     .byte %00000100  ; |     X  |               
     .byte %00001000  ; |    X   |               
     .byte %00000000  ; |        |

     .byte %00001010  ; |    X X |           
     .byte %00000100  ; |     X  |               
     .byte %00001010  ; |    X X |           
     .byte %00000000  ; |        |
                    
     .byte %00001000  ; |    X   |               
     .byte %00000100  ; |     X  |               
     .byte %00000010  ; |      X |
     .byte %00000000  ; |        |
     
Marks_Hi              
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
                 
     .byte %00000000  ; |        |
     .byte %11100000  ; |XXX     |               
     .byte %00000000  ; |        |
     .byte %00000000  ; |        |
     
     .byte %00100000  ; |  X     |
     .byte %01000000  ; | X      |               
     .byte %10000000  ; |X       |               
     .byte %00000000  ; |        |
                   
     .byte %10100000  ; |X X     |           
     .byte %01000000  ; | X      |               
     .byte %10100000  ; |X X     |           
     .byte %00000000  ; |        |  
        
LF78A       
     .byte $10, $13            
     .byte $0D, $16, $10         
     .byte $0A               
     .byte $19, $13, $0D         
     .byte $07
     
LF794               
     .byte $07               
     .byte $05, $05            
     .byte $03               
     .byte $03               
     .byte $03               
     .byte $01, $01            
     .byte $01, $01
     
; Used to mirror the bitmap in the digits for when using in PF2
Mirror_LUT           
     .byte $00, $04, $02, $06, $01, $05, $03, $07 

LF7A6              
     .byte $0F               
     .byte $1E, $1F, $3F         
     .byte $2F               
     .byte $10, $10            
     .byte $21, $31            
     .byte $11, $12            
     .byte $01
     
LF7B2
     .byte $00            
     .byte $80               
     .byte $40               
     .byte $C0, $20            
     .byte $A0
     
; Bowler Frame 0
     .byte %00111000  ; |  XXX   |
     .byte %00110000  ; |  XX    |
     .byte %00110000  ; |  XX    |
     .byte %00110000  ; |  XX    |
     .byte %00110000  ; |  XX    |
LF7BD            
     .byte %00110000  ; |  XX    |
     .byte %00111000  ; |  XXX   |
     .byte %00111000  ; |  XXX   |
     .byte %00111110  ; |  XXXXX |
     .byte %00111111  ; |  XXXXXX|
     .byte %00111001  ; |  XXX  X|
     .byte %00111000  ; |  XXX   |
     .byte %00010000  ; |   X    |
     .byte %00111000  ; |  XXX   |
     .byte %00111100  ; |  XXXX  |
     .byte %00111000  ; |  XXX   |
     
; Bowler Frame 1             
     .byte %00011011  ; |   XX XX|             
     .byte %00010010  ; |   X  X |
     .byte %00010010  ; |   X  X |
     .byte %00010010  ; |   X  X |
     .byte %00010110  ; |   X XX |
     .byte %00010100  ; |   X X  |
     .byte %10011100  ; |X  XXX  |
     .byte %11011100  ; |XX XXX  |
     .byte %01011100  ; | X XXX  |
     .byte %01111100  ; | XXXXX  |
     .byte %00111100  ; |  XXXX  |
     .byte %00011100  ; |   XXX  |
     .byte %00001000  ; |    X   |
     .byte %00011100  ; |   XXX  |
     .byte %00011110  ; |   XXXX |
     .byte %00011100  ; |   XXX  |

; Bowler Frame 2
     .byte %11000011  ; |XX    XX|
     .byte %10000010  ; |X     X |
     .byte %10000010  ; |X     X |
     .byte %11000010  ; |XX    X |
     .byte %01100110  ; | XX  XX |
     .byte %00101100  ; |  X XX  |
     .byte %00111000  ; |  XXX   |
     .byte %00111000  ; |  XXX   |
     .byte %00111011  ; |  XXX XX|
     .byte %00111110  ; |  XXXXX |
     .byte %00111100  ; |  XXXX  |
     .byte %00111000  ; |  XXX   |
     .byte %00010000  ; |   X    |
     .byte %00111000  ; |  XXX   |
     .byte %00111100  ; |  XXXX  |
     .byte %00111000  ; |  XXX   |

LF7E8               
     .byte $B8

LF7E9               
     .byte $D8               
     .byte $C8               
     .byte $C8
     
LF7EB          
     .byte $D8
     
LF7ED               
     .byte $08          
     .byte $0C               
     .byte $10, $14            
     .byte $18

LF7F2               
     .byte $07               
     .byte $08               
     .byte $FE, $FE, $08
     
LF7F7         
     .byte $0B          
     .byte $07               
     .byte $02               
     .byte $02               
     .byte $00               

  .org $f7fc
Reset_Vector
     .word Entry
Difficulty_Switch_Mask
     .byte $40        ; SWCHB mask for P0 difficulty switch
     .byte $80        ; SWCHB mask for P1 difficulty switch
