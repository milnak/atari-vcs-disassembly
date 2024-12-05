
;        globals
; Atari 2600 Equates

VSYNC   equ     $00             ;   0000 00x0       Vertical Sync Set-Clear
VBLANK  equ     $01             ;   xx00 00x0       Vertical Blank Set-Clear
WSYNC   equ     $02             ;   ---- ----       Wait for Horizontal Blank
RSYNC   equ     $03             ;   ---- ----       Reset Horizontal Sync Counter
NUSIZ0  equ     $04             ;   00xx 0xxx       Number-Size player/missle 0
NUSIZ1  equ     $05             ;   00xx 0xxx       Number-Size player/missle 1
COLUP0  equ     $06             ;   xxxx xxx0       Color-Luminance Player 0
COLUP1  equ     $07             ;   xxxx xxx0       Color-Luminance Player 1
COLUPF  equ     $08             ;   xxxx xxx0       Color-Luminance Playfield
COLUBK  equ     $09             ;   xxxx xxx0       Color-Luminance Background
CTRLPF  equ     $0A             ;   00xx 0xxx       Control Playfield, Ball, Collisions
REFP0   equ     $0B             ;   0000 x000       Reflection Player 0
REFP1   equ     $0C             ;   0000 x000       Reflection Player 1
PF0     equ     $0D             ;   xxxx 0000       Playfield Register Byte 0
PF1     equ     $0E             ;   xxxx xxxx       Playfield Register Byte 1
PF2     equ     $0F             ;   xxxx xxxx       Playfield Register Byte 2
RESP0   equ     $10             ;   ---- ----       Reset Player 0
RESP1   equ     $11             ;   ---- ----       Reset Player 1
RESM0   equ     $12             ;   ---- ----       Reset Missle 0
RESM1   equ     $13             ;   ---- ----       Reset Missle 1
RESBL   equ     $14             ;   ---- ----       Reset Ball
AUDC0   equ     $15             ;   0000 xxxx       Audio Control 0
AUDC1   equ     $16             ;   0000 xxxx       Audio Control 1
AUDF0   equ     $17             ;   000x xxxx       Audio Frequency 0
AUDF1   equ     $18             ;   000x xxxx       Audio Frequency 1
AUDV0   equ     $19             ;   0000 xxxx       Audio Volume 0
AUDV1   equ     $1A             ;   0000 xxxx       Audio Volume 1
GRP0    equ     $1B             ;   xxxx xxxx       Graphics Register Player 0
GRP1    equ     $1C             ;   xxxx xxxx       Graphics Register Player 1
ENAM0   equ     $1D             ;   0000 00x0       Graphics Enable Missle 0
ENAM1   equ     $1E             ;   0000 00x0       Graphics Enable Missle 1
ENABL   equ     $1F             ;   0000 00x0       Graphics Enable Ball
HMP0    equ     $20             ;   xxxx 0000       Horizontal Motion Player 0
HMP1    equ     $21             ;   xxxx 0000       Horizontal Motion Player 1
HMM0    equ     $22             ;   xxxx 0000       Horizontal Motion Missle 0
HMM1    equ     $23             ;   xxxx 0000       Horizontal Motion Missle 1
HMBL    equ     $24             ;   xxxx 0000       Horizontal Motion Ball
VDELP0  equ     $25             ;   0000 000x       Vertical Delay Player 0
VDELP1  equ     $26             ;   0000 000x       Vertical Delay Player 1
VDELBL  equ     $27             ;   0000 000x       Vertical Delay Ball
RESMP0  equ     $28             ;   0000 00x0       Reset Missle 0 to Player 0
RESMP1  equ     $29             ;   0000 00x0       Reset Missle 1 to Player 1
HMOVE   equ     $2A             ;   ---- ----       Apply Horizontal Motion
HMCLR   equ     $2B             ;   ---- ----       Clear Horizontal Move Registers
CXCLR   equ     $2C             ;   ---- ----       Clear Collision Latches
 
; Read Address Registers
;                                           bit 7   bit 6
CXM0P   equ     $0              ;   xx00 0000       Read Collision  M0-P1   M0-P0
CXM1P   equ     $1              ;   xx00 0000                       M1-P0   M1-P1
CXP0FB  equ     $2              ;   xx00 0000                       P0-PF   P0-BL
CXP1FB  equ     $3              ;   xx00 0000                       P1-PF   P1-BL
CXM0FB  equ     $4              ;   xx00 0000                       M0-PF   M0-BL
CXM1FB  equ     $5              ;   xx00 0000                       M1-PF   M1-BL
CXBLPF  equ     $6              ;   x000 0000                       BL-PF   -----
CXPPMM  equ     $7              ;   xx00 0000                       P0-P1   M0-M1
INPT0   equ     $8              ;   x000 0000       Read Pot Port 0
INPT1   equ     $9              ;   x000 0000       Read Pot Port 1
INPT2   equ     $A              ;   x000 0000       Read Pot Port 2
INPT3   equ     $B              ;   x000 0000       Read Pot Port 3
INPT4   equ     $C              ;   x000 0000       Read Input (Trigger) 0
INPT5   equ     $D              ;   x000 0000       Read Input (Trigger) 1
 
; Atari 2600      RIOT Memory Map

; RAM equ $80                             ; 80-FF, also shadowed to $180-$1FF
 
SWCHA   equ     $280            ;                   Port A data register for joysticks:
                            ;                   Bits 4-7 for player 1.  Bits 0-3 for player 2.
SWACNT  equ     $281            ;                   Port A data direction register (DDR)
SWCHB   equ     $282            ;                   Port B data (console switches)
SWBCNT  equ     $283            ;                   Port B DDR
INTIM   equ     $284            ;                   Timer output
TIM1T   equ     $294            ;                   set 1 clock interval
TIM8T   equ     $295            ;                   set 8 clock interval
TIM64T  equ     $296            ;                   set 64 clock interval
T1024T  equ     $297            ;                   set 1024 clock interval

