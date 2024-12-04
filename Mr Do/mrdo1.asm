; Disassembly of mrdo1.bin
; Disassembled Sun Feb 08 23:47:52 2004
; Using DiStella v2.0
;
; Command Line: C:\BIN\DISTELLA.EXE -pafscmrdo1.cfg mrdo1.bin 
;
; mrdo1.cfg contents:
;
;      CODE 3000 3005
;      GFX 3006 3011
;      CODE 3012 30E1
;      GFX 30E2 30E3
;      CODE 30E4 3323
;      GFX 3324 333B
;      CODE 333C 34C5
;      GFX 34C6 34CC
;      CODE 34CD 381E
;      GFX 381F 383A
;      CODE 383B 396C
;      GFX 396D 3985
;      CODE 3986 3B16
;      GFX 3B17 3B22
;      CODE 3B23 3BA9
;      GFX 3BAA 3BAE
;      CODE 3BAF 3E02
;      GFX 3E03 3FA8
;      CODE 3FA9 3FE7
;      GFX 3FE8 3FFF

      processor 6502

VSYNC   =  $00
VBLANK  =  $01
WSYNC   =  $02
COLUBK  =  $09
CTRLPF  =  $0A
INPT4   =  $3C
SWCHA   =  $0280
SWCHB   =  $0282
INTIM   =  $0284
TIM64T  =  $0296
L30E1   =   $30E1

       ORG $3000

L3000: LDA    $FFF9                  ;4
       JMP    START                  ;3
       NOP                           ;2
       NOP                           ;2
       NOP                           ;2
       NOP                           ;2
       JMP    L302E                  ;3
       NOP                           ;2
       NOP                           ;2
       NOP                           ;2
       NOP                           ;2
       NOP                           ;2

START: SEI                           ;2
       CLD                           ;2
       LDX    #$00                   ;2
       TXA                           ;2
L3017: STA    VSYNC,X                ;4
       TXS                           ;2
       INX                           ;2
       BNE    L3017                  ;2
       JSR    L39A9                  ;6
       LDA    #$30                   ;2
       STA    $DA                    ;3
       LDA    #$FF                   ;2
       STA    $88                    ;3
       STA    $89                    ;3
       LDA    #$31                   ;2
       STA    CTRLPF                 ;3

L302E:
       LDA    #$9F                   ;2
       STA    WSYNC                  ;3
       STA    TIM64T                 ;4
       LDA    $DA                    ;3
       CMP    #$10                   ;2
       BEQ    L303E                  ;2
       JMP    L333C                  ;3
L303E: LDA    #$F8                   ;2
       AND    $8B                    ;3
       CMP    #$F8                   ;2
       BEQ    L3052                  ;2
       LDA    $BE                    ;3
       BPL    L3052                  ;2
       LDA    $BF                    ;3
       BPL    L3052                  ;2
       LDA    $8A                    ;3
       BEQ    L305F                  ;2
L3052: LDA    $89                    ;3
       BPL    L306F                  ;2
       LDX    #$07                   ;2
L3058: LDA    $90,X                  ;4
       BMI    L306F                  ;2
       DEX                           ;2
       BPL    L3058                  ;2
L305F: LDA    #$80                   ;2
       STA    $DA                    ;3
       LDA    #$00                   ;2
       JSR    L3D2C                  ;6
       LDA    #$D8                   ;2
       STA    $84                    ;3
       JMP    L333C                  ;3
L306F: LDA    $BD                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $EF                    ;3
       LDX    #$01                   ;2
L3079: LDA    $BE,X                  ;4
       BMI    L3092                  ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       CMP    $EF                    ;3
       BNE    L3092                  ;2
       SEC                           ;2
       LDA    $C0                    ;3
       SBC    $C1,X                  ;4
       CMP    #$02                   ;2
       BCC    L30A5                  ;2
       CMP    #$FE                   ;2
       BCS    L30A5                  ;2
L3092: DEX                           ;2
       BPL    L3079                  ;2
       JMP    L30C0                  ;3
L3098: LDA    $BE                    ;3
       BMI    L309E                  ;2
       INC    $8A                    ;5
L309E: LDA    $BF                    ;3
       BMI    L30A4                  ;2
       INC    $8A                    ;5
L30A4: RTS                           ;6

L30A5: LDA    #$20                   ;2
       STA    $DA                    ;3
       LDA    #$51                   ;2
       JSR    L3D2C                  ;6
       JSR    L3098                  ;6
       LDA    #$00                   ;2
       STA    $84                    ;3
       LDA    #$04                   ;2
       STA    $BC                    ;3
       LDA    #$FF                   ;2
       STA    $BA                    ;3
       JMP    L333C                  ;3
L30C0: LDA    $BD                    ;3
       LDX    $C0                    ;3
       JSR    L3DB6                  ;6
       LDY    #$01                   ;2
L30C9: LDA.wy $00CA,Y                ;4
       BPL    L30D8                  ;2
       LDA.wy $00BE,Y                ;4
       BMI    L30D8                  ;2
       LDX    $C1,Y                  ;4
       JSR    L3DB6                  ;6
L30D8: DEY                           ;2
       BPL    L30C9                  ;2
       LDA    $89                    ;3
       BMI    L30E4                  ;2
       JMP    L333C                  ;3
       .byte $40 ; | X      | $30E2
       .byte $20 ; |  X     | $30E3
L30E4: LDA    $DA                    ;3
       CMP    #$10                   ;2
       BEQ    L30ED                  ;2
L30EA: JMP    L333C                  ;3
L30ED: LDA    $84                    ;3
       AND    #$01                   ;2
       TAX                           ;2
       INX                           ;2
       LDA    L30E1,X                ;4
       AND    $8E                    ;3
       BNE    L30EA                  ;2
       LDA    $BD,X                  ;4
       BMI    L30EA                  ;2
       LDA    $C0,X                  ;4
       AND    #$07                   ;2
       BNE    L310D                  ;2
       LDA    $BD,X                  ;4
       AND    #$0F                   ;2
       BNE    L310D                  ;2
       JMP    L31A8                  ;3
L310D: LDA    $C5,X                  ;4
       AND    #$03                   ;2
       CMP    #$00                   ;2
       BNE    L3139                  ;2
       LDY    $C7,X                  ;4
       LDA    L3F95,Y                ;4
       AND    #$01                   ;2
       STA    $F5                    ;3
L311E: JSR    L3BF7                  ;6
       BCC    L3126                  ;2
       JMP    L31C0                  ;3
L3126: LDA    $BD,X                  ;4
       AND    #$0F                   ;2
       BEQ    L3136                  ;2
       DEC    $F5                    ;5
       BMI    L3136                  ;2
       LDA    $D9                    ;3
       AND    #$02                   ;2
       BEQ    L311E                  ;2
L3136: JMP    L333C                  ;3
L3139: CMP    #$01                   ;2
       BNE    L315E                  ;2
       LDY    $C7,X                  ;4
       LDA    L3F95,Y                ;4
       AND    #$02                   ;2
       LSR                           ;2
       STA    $F5                    ;3
L3147: JSR    L3BAF                  ;6
       BCS    L31C0                  ;2
       LDA    $BD,X                  ;4
       AND    #$0F                   ;2
       BEQ    L3136                  ;2
       DEC    $F5                    ;5
       BMI    L3136                  ;2
       LDA    #$02                   ;2
       AND    $D9                    ;3
       BEQ    L3147                  ;2
       BNE    L3136                  ;2
L315E: CMP    #$03                   ;2
       BNE    L3184                  ;2
       LDY    $C7,X                  ;4
       LDA    L3F95,Y                ;4
       AND    #$04                   ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F5                    ;3
L316D: JSR    L3CA6                  ;6
       BCS    L31C0                  ;2
       LDA    $C0,X                  ;4
       AND    #$07                   ;2
       BEQ    L3136                  ;2
       DEC    $F5                    ;5
       BMI    L3136                  ;2
       LDA    #$02                   ;2
       AND    $D9                    ;3
       BEQ    L316D                  ;2
       BNE    L3136                  ;2
L3184: LDY    $C7,X                  ;4
       LDA    L3F95,Y                ;4
       AND    #$08                   ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F5                    ;3
L3190: JSR    L3C3D                  ;6
       BCS    L31C0                  ;2
       LDA    $C0,X                  ;4
       AND    #$07                   ;2
       BEQ    L31A5                  ;2
       DEC    $F5                    ;5
       BMI    L31A5                  ;2
       LDA    #$02                   ;2
       AND    $D9                    ;3
       BEQ    L3190                  ;2
L31A5: JMP    L333C                  ;3
L31A8: LDA    #$03                   ;2
       STA    $F3                    ;3
       LDA    $CB,X                  ;4
       BEQ    L31E3                  ;2
       DEC    $CB,X                  ;6
       LDA    $BD                    ;3
       AND    #$70                   ;2
       CMP    $BD,X                  ;4
       BEQ    L31C0                  ;2
       LDA    $C0                    ;3
       CMP    $C0,X                  ;4
       BNE    L31C7                  ;2
L31C0: LDA    #$00                   ;2
       STA    $CB,X                  ;4
       JMP    L31E3                  ;3
L31C7: LDA    $C5,X                  ;4
       AND    #$03                   ;2
       CMP    #$00                   ;2
       BNE    L31D2                  ;2
       JMP    L3223                  ;3
L31D2: CMP    #$01                   ;2
       BNE    L31D9                  ;2
       JMP    L31F1                  ;3
L31D9: CMP    #$03                   ;2
       BNE    L31E0                  ;2
       JMP    L324F                  ;3
L31E0: JMP    L3235                  ;3
L31E3: LDA    $BD                    ;3
       AND    #$70                   ;2
       CMP    $BD,X                  ;4
       BCS    L321B                  ;2
       LDA    $C0                    ;3
       CMP    $C0,X                  ;4
       BNE    L3201                  ;2
L31F1: LDY    #$12                   ;2
       LDA    #$10                   ;2
       AND    $D9                    ;3
       BNE    L31FC                  ;2
       JMP    L3263                  ;3
L31FC: LDY    #$0C                   ;2
       JMP    L3263                  ;3
L3201: BCC    L320F                  ;2
       LDY    #$0C                   ;2
       JSR    L32F7                  ;6
       BCS    L3263                  ;2
       LDY    #$08                   ;2
       JMP    L3263                  ;3
L320F: LDY    #$12                   ;2
       JSR    L32F7                  ;6
       BCS    L3263                  ;2
       LDY    #$02                   ;2
       JMP    L3263                  ;3
L321B: PHP                           ;3
       LDA    $C0                    ;3
       CMP    $C0,X                  ;4
       BNE    L3230                  ;2
       PLP                           ;4
L3223: LDY    #$06                   ;2
       LDA    #$08                   ;2
       AND    $D9                    ;3
       BNE    L322D                  ;2
       LDY    #$00                   ;2
L322D: JMP    L3263                  ;3
L3230: BCC    L324C                  ;2
       PLP                           ;4
       BNE    L3240                  ;2
L3235: LDY    #$08                   ;2
       LDA    #$04                   ;2
       AND    $D9                    ;3
       BNE    L3247                  ;2
       JMP    L3263                  ;3
L3240: LDY    #$00                   ;2
       JSR    L32F7                  ;6
       BCS    L3263                  ;2
L3247: LDY    #$14                   ;2
       JMP    L3263                  ;3
L324C: PLP                           ;4
       BNE    L325A                  ;2
L324F: LDA    #$10                   ;2
       AND    $D9                    ;3
       BNE    L3261                  ;2
       LDY    #$02                   ;2
       JMP    L3263                  ;3
L325A: LDY    #$06                   ;2
       JSR    L32F7                  ;6
       BCS    L3263                  ;2
L3261: LDY    #$0E                   ;2
L3263: STY    $F4                    ;3
       JMP    L32CD                  ;3
L3268: LDA    $C0,X                  ;4
       CLC                           ;2
       ADC    #$08                   ;2
       TAY                           ;2
       LDA    $BD,X                  ;4
       JSR    L3D79                  ;6
       BEQ    L3278                  ;2
       JMP    L32C7                  ;3
L3278: JSR    L3C3D                  ;6
       BCC    L3280                  ;2
       JMP    L32C7                  ;3
L3280: LDA    #$02                   ;2
       JMP    L32E4                  ;3
L3285: LDA    $BD,X                  ;4
       LDY    $C0,X                  ;4
       BEQ    L32C7                  ;2
       DEY                           ;2
       JSR    L3D79                  ;6
       BNE    L32C7                  ;2
       JSR    L3CA6                  ;6
       BCS    L32C7                  ;2
       LDA    #$03                   ;2
       JMP    L32E4                  ;3
L329B: LDA    $BD,X                  ;4
       LDY    $C0,X                  ;4
       SEC                           ;2
       SBC    #$10                   ;2
       JSR    L3D79                  ;6
       BNE    L32C7                  ;2
       JSR    L3BAF                  ;6
       BCS    L32C7                  ;2
       LDA    #$01                   ;2
       JMP    L32E4                  ;3
L32B1: LDA    $BD,X                  ;4
       LDY    $C0,X                  ;4
       CLC                           ;2
       ADC    #$10                   ;2
       JSR    L3D79                  ;6
       BNE    L32C7                  ;2
       JSR    L3BF7                  ;6
       BCS    L32C7                  ;2
       LDA    #$00                   ;2
       JMP    L32E4                  ;3
L32C7: DEC    $F3                    ;5
       BMI    L32F4                  ;2
       INC    $F4                    ;5
L32CD: LDY    $F4                    ;3
       LDA    L3324,Y                ;4
       CMP    #$00                   ;2
       BEQ    L32B1                  ;2
       CMP    #$01                   ;2
       BEQ    L329B                  ;2
       CMP    #$03                   ;2
       BEQ    L32E1                  ;2
       JMP    L3268                  ;3
L32E1: JMP    L3285                  ;3
L32E4: STA    $C5,X                  ;4
       LDA    $F3                    ;3
       CMP    #$03                   ;2
       BEQ    L32F4                  ;2
       LDA    $D9                    ;3
       AND    #$0F                   ;2
       ADC    #$01                   ;2
       STA    $CB,X                  ;4
L32F4: JMP    L333C                  ;3
L32F7: LDA    $BD                    ;3
       AND    #$70                   ;2
       SEC                           ;2
       SBC    $BD,X                  ;4
       BPL    L3305                  ;2
       EOR    #$FF                   ;2
       CLC                           ;2
       ADC    #$01                   ;2
L3305: LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F5                    ;3
       LDA    $C0                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F6                    ;3
       LDA    $C0,X                  ;4
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       SEC                           ;2
       SBC    $F6                    ;3
       BPL    L3321                  ;2
       EOR    #$FF                   ;2
       CLC                           ;2
       ADC    #$01                   ;2
L3321: CMP    $F5                    ;3
       RTS                           ;6

L3324: .byte $00 ; |        | $3324
       .byte $02 ; |      X | $3325
       .byte $03 ; |      XX| $3326
       .byte $01 ; |       X| $3327
       .byte $00 ; |        | $3328
       .byte $02 ; |      X | $3329
       .byte $00 ; |        | $332A
       .byte $03 ; |      XX| $332B
       .byte $02 ; |      X | $332C
       .byte $01 ; |       X| $332D
       .byte $00 ; |        | $332E
       .byte $03 ; |      XX| $332F
       .byte $01 ; |       X| $3330
       .byte $02 ; |      X | $3331
       .byte $03 ; |      XX| $3332
       .byte $00 ; |        | $3333
       .byte $01 ; |       X| $3334
       .byte $02 ; |      X | $3335
       .byte $01 ; |       X| $3336
       .byte $03 ; |      XX| $3337
       .byte $02 ; |      X | $3338
       .byte $00 ; |        | $3339
       .byte $01 ; |       X| $333A
       .byte $03 ; |      XX| $333B
L333C: LDA    $8D                    ;3
       BPL    L337B                  ;2
       LDA    $84                    ;3
       AND    #$03                   ;2
       TAX                           ;2
       LDA    $D0,X                  ;4
       BMI    L3364                  ;2
       AND    #$70                   ;2
       BEQ    L3364                  ;2
       LDA    $D4,X                  ;4
       AND    #$07                   ;2
       CMP    #$04                   ;2
       LDA    $D4,X                  ;4
       BCC    L3359                  ;2
       ADC    #$07                   ;2
L3359: TAY                           ;2
       LDA    $D0,X                  ;4
       SEC                           ;2
       SBC    #$10                   ;2
       JSR    L3D89                  ;6
       BEQ    L3367                  ;2
L3364: JMP    L34D7                  ;3
L3367: TXA                           ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ORA    #$0F                   ;2
       STA    $8D                    ;3
       LDA    $D0,X                  ;4
       AND    #$F0                   ;2
       ORA    #$01                   ;2
       STA    $D0,X                  ;4
       JMP    L34D7                  ;3
L337B: LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       DEC    $8D                    ;5
       LDA    $8D                    ;3
       AND    #$0F                   ;2
       BEQ    L338B                  ;2
       JMP    L34D7                  ;3
L338B: LDA    $D0,X                  ;4
       AND    #$0F                   ;2
       CMP    #$01                   ;2
       BNE    L3398                  ;2
       INC    $D0,X                  ;6
       JMP    L3459                  ;3
L3398: CMP    #$02                   ;2
       BNE    L33B1                  ;2
       INC    $D0,X                  ;6
       LDA    $D4,X                  ;4
       AND    #$07                   ;2
       CMP    #$04                   ;2
       LDA    $D4,X                  ;4
       BCC    L33AA                  ;2
       ADC    #$07                   ;2
L33AA: AND    #$F8                   ;2
       STA    $D4,X                  ;4
       JMP    L3459                  ;3
L33B1: CMP    #$03                   ;2
       BEQ    L33CD                  ;2
       CMP    #$04                   ;2
       BEQ    L33C8                  ;2
       LDA    #$80                   ;2
       STA    $D0,X                  ;4
       STA    $8D                    ;3
       LDA    #$1F                   ;2
       AND    $8E                    ;3
       STA    $8E                    ;3
       JMP    L34D7                  ;3
L33C8: INC    $D0,X                  ;6
       JMP    L3459                  ;3
L33CD: LDA    $D0,X                  ;4
       AND    #$70                   ;2
       BNE    L33D6                  ;2
       JMP    L3462                  ;3
L33D6: LDA    $D0,X                  ;4
       SEC                           ;2
       SBC    #$10                   ;2
       LDY    $D4,X                  ;4
       JSR    L3D89                  ;6
       BEQ    L33E5                  ;2
       JMP    L3462                  ;3
L33E5: STA    $D0,X                  ;4
       AND    #$70                   ;2
       STA    $F0                    ;3
       LDA    #$0A                   ;2
       ORA    $8D                    ;3
       STA    $8D                    ;3
       LDY    #$02                   ;2
L33F3: LDA    L34CA,Y                ;4
       AND    $8E                    ;3
       BEQ    L340A                  ;2
       LDA.wy $00BD,Y                ;4
       BMI    L3453                  ;2
       SEC                           ;2
       SBC    #$10                   ;2
       AND    #$F0                   ;2
       STA.wy $00BD,Y                ;5
       JMP    L3453                  ;3
L340A: LDA.wy $00C0,Y                ;4
       CMP    $D4,X                  ;4
       BEQ    L3427                  ;2
       BCC    L3421                  ;2
       SBC    #$07                   ;2
       BPL    L3419                  ;2
       LDA    #$00                   ;2
L3419: CMP    $D4,X                  ;4
       BEQ    L3427                  ;2
       BCS    L3453                  ;2
       BCC    L3427                  ;2
L3421: ADC    #$07                   ;2
       CMP    $D4,X                  ;4
       BCC    L3453                  ;2
L3427: LDA.wy $00BD,Y                ;4
       BMI    L3453                  ;2
       AND    #$70                   ;2
       SEC                           ;2
       SBC    $F0                    ;3
       BEQ    L344C                  ;2
       CMP    #$10                   ;2
       BNE    L3453                  ;2
       LDA.wy $00BD,Y                ;4
       AND    #$0F                   ;2
       BNE    L3441                  ;2
       TYA                           ;2
       BEQ    L3453                  ;2
L3441: LDA.wy $00BD,Y                ;4
       SEC                           ;2
       SBC    #$10                   ;2
       AND    #$F0                   ;2
       STA.wy $00BD,Y                ;5
L344C: LDA    L34CA,Y                ;4
       ORA    $8E                    ;3
       STA    $8E                    ;3
L3453: DEY                           ;2
       BPL    L33F3                  ;2
       JMP    L34D7                  ;3
L3459: LDA    #$0F                   ;2
       ORA    $8D                    ;3
       STA    $8D                    ;3
       JMP    L34D7                  ;3
L3462: LDA    $8E                    ;3
       AND    #$E0                   ;2
       BEQ    L34A3                  ;2
       LDA    #$40                   ;2
       AND    $8E                    ;3
       BEQ    L3478                  ;2
       LDA    #$81                   ;2
       STA    $BE                    ;3
       JSR    L3B82                  ;6
       JSR    L34CD                  ;6
L3478: LDA    #$20                   ;2
       AND    $8E                    ;3
       BEQ    L3485                  ;2
       LDY    #$81                   ;2
       STY    $BF                    ;3
       JSR    L34CD                  ;6
L3485: LDA    $8E                    ;3
       BPL    L34A0                  ;2
       LDA    #$81                   ;2
       STA    $BD                    ;3
       LDA    #$20                   ;2
       STA    $DA                    ;3
       LDA    #$00                   ;2
       STA    $84                    ;3
       LDA    #$FF                   ;2
       STA    $BA                    ;3
       LDA    #$04                   ;2
       STA    $BC                    ;3
       JSR    L3098                  ;6
L34A0: JMP    L34BC                  ;3
L34A3: LDA    $D0,X                  ;4
       AND    #$70                   ;2
       SEC                           ;2
       SBC    L34C6,X                ;4
       CMP    #$F0                   ;2
       BNE    L34BC                  ;2
       LDA    #$80                   ;2
       STA    $8D                    ;3
       LDA    $D0,X                  ;4
       AND    #$F0                   ;2
       STA    $D0,X                  ;4
       JMP    L34D7                  ;3
L34BC: INC    $D0,X                  ;6
       LDA    #$00                   ;2
       JSR    L3D41                  ;6
       JMP    L3459                  ;3
L34C6: .byte $70 ; | XXX    | $34C6
       .byte $50 ; | X X    | $34C7
       .byte $30 ; |  XX    | $34C8
       .byte $10 ; |   X    | $34C9
L34CA: .byte $80 ; |X       | $34CA
       .byte $40 ; | X      | $34CB
       .byte $20 ; |  X     | $34CC
L34CD: LDA    #$50                   ;2
       JSR    L3B23                  ;6
       LDA    #$50                   ;2
       JMP    L3B23                  ;3
L34D7: STA    WSYNC                  ;3
L34D9: LDA    INTIM                  ;4
       BMI    L34D9                  ;2
       LDA    #$A9                   ;2
       STA    WSYNC                  ;3
       STA    TIM64T                 ;4
       INC    $84                    ;5
       BNE    L3508                  ;2
       INC    $85                    ;5
       LDA    #$02                   ;2
       AND    $8E                    ;3
       BNE    L3508                  ;2
       LDA    $8B                    ;3
       AND    #$07                   ;2
       TAX                           ;2
       INX                           ;2
       CPX    #$05                   ;2
       BNE    L34FD                  ;2
       LDX    #$00                   ;2
L34FD: LDA    #$F8                   ;2
       AND    $8B                    ;3
       STA    $8B                    ;3
       TXA                           ;2
       ORA    $8B                    ;3
       STA    $8B                    ;3
L3508: LDA    $84                    ;3
       AND    #$01                   ;2
       BEQ    L351A                  ;2
       LDA    $8C                    ;3
       AND    #$1F                   ;2
       BNE    L3518                  ;2
       STA    $8C                    ;3
       BEQ    L351A                  ;2
L3518: DEC    $8C                    ;5
L351A: LDA    #$02                   ;2
       STA    WSYNC                  ;3
       STA    VBLANK                 ;3
       LDA    $89                    ;3
       BPL    L354E                  ;2
       LDA    $8A                    ;3
       BEQ    L354E                  ;2
       LDA    $84                    ;3
       AND    #$7F                   ;2
       BNE    L354E                  ;2
       LDX    #$00                   ;2
       LDA    $BE,X                  ;4
       BMI    L3539                  ;2
       INX                           ;2
       LDA    $BE,X                  ;4
       BPL    L354E                  ;2
L3539: LDA    #$38                   ;2
       STA    $C1,X                  ;4
       LDA    #$40                   ;2
       STA    $BE,X                  ;4
       LDA    #$00                   ;2
       STA    $C4,X                  ;4
       LDY    $C8,X                  ;4
       LDA    L3F6D,Y                ;4
       STA    $CA,X                  ;4
       DEC    $8A                    ;5
L354E: STA    WSYNC                  ;3
       LDA    $DA                    ;3
       CMP    #$10                   ;2
       BNE    L3577                  ;2
       LDA    #$F8                   ;2
       AND    $8B                    ;3
       CMP    #$F8                   ;2
       BNE    L3577                  ;2
       LDA    #$00                   ;2
       STA    $8B                    ;3
       LDA    $DB                    ;3
       CMP    #$06                   ;2
       BEQ    L356A                  ;2
       INC    $DB                    ;5
L356A: LDA    #$00                   ;2
       STA    $C0                    ;3
       LDA    #$70                   ;2
       STA    $DA                    ;3
       LDA    #$00                   ;2
       JSR    L3D2C                  ;6
L3577: STA    WSYNC                  ;3
       LDA    $DA                    ;3
       CMP    #$40                   ;2
       BNE    L358A                  ;2
       LDA    $85                    ;3
       BEQ    L35E9                  ;2
L3583: LDA    #$50                   ;2
       STA    $DA                    ;3
       JMP    L35E9                  ;3
L358A: CMP    #$30                   ;2
       BNE    L3596                  ;2
       LDA    $85                    ;3
       CMP    #$0A                   ;2
       BNE    L35E9                  ;2
       BEQ    L3583                  ;2
L3596: CMP    #$20                   ;2
       BNE    L35E9                  ;2
       LDA    $84                    ;3
       CMP    #$80                   ;2
       BEQ    L35BA                  ;2
       CMP    #$40                   ;2
       BNE    L35E9                  ;2
       LDA    #$FF                   ;2
       STA    $BD                    ;3
       STA    $BE                    ;3
       STA    $BF                    ;3
       STA    $BA                    ;3
       LDA    #$00                   ;2
       STA    $C4                    ;3
       STA    $C5                    ;3
       STA    $8E                    ;3
       STA    $BC                    ;3
       BEQ    L35E9                  ;2
L35BA: LDA    $DB                    ;3
       BNE    L35D9                  ;2
       LDA    #$40                   ;2
       STA    $DA                    ;3
       LDA    #$00                   ;2
       STA    $84                    ;3
       STA    $85                    ;3
       LDA    #$31                   ;2
       JSR    L3D2C                  ;6
       LDA    #$38                   ;2
       STA    $C0                    ;3
       LDA    #$FF                   ;2
       STA    $BE                    ;3
       STA    $BF                    ;3
       BNE    L35E9                  ;2
L35D9: DEC    $DB                    ;5
       LDA    #$10                   ;2
       STA    $DA                    ;3
       LDA    #$38                   ;2
       STA    $C0                    ;3
       LDA    #$00                   ;2
       STA    $BD                    ;3
       STA    $D8                    ;3
L35E9: LDA    #$02                   ;2
       STA    WSYNC                  ;3
       STA    VSYNC                  ;3
       LDA    $DA                    ;3
       CMP    #$80                   ;2
       BNE    L3601                  ;2
       LDA    $84                    ;3
       BNE    L3601                  ;2
       INC    $81                    ;5
       JSR    L39A9                  ;6
       JMP    L3605                  ;3
L3601: STA    WSYNC                  ;3
       INC    $D9                    ;5
L3605: STA    WSYNC                  ;3
       LDA    $DA                    ;3
       CMP    #$70                   ;2
       BNE    L361F                  ;2
       LDA    $84                    ;3
       AND    #$01                   ;2
       BNE    L361F                  ;2
       INC    $C0                    ;5
       BPL    L361F                  ;2
       LDA    #$80                   ;2
       STA    $DA                    ;3
       LDA    #$E8                   ;2
       STA    $84                    ;3
L361F: LDA    #$00                   ;2
       STA    WSYNC                  ;3
       STA    VSYNC                  ;3
       LDA    #$00                   ;2
       STA    COLUBK                 ;3
       LDA    $DA                    ;3
       CMP    #$10                   ;2
       BNE    L366E                  ;2
       LDA    $84                    ;3
       AND    #$7F                   ;2
       BNE    L366E                  ;2
       LDX    #$01                   ;2
L3637: LDA    $BE,X                  ;4
       BMI    L366B                  ;2
       LDA    $CA,X                  ;4
       BPL    L365A                  ;2
       AND    #$0F                   ;2
       BNE    L3669                  ;2
       LDA    #$00                   ;2
       STA    $C4,X                  ;4
       LDY    $C8,X                  ;4
       LDA    L3F6D,Y                ;4
       STA    $CA,X                  ;4
L364E: TXA                           ;2
       BNE    L3669                  ;2
       LDA    #$FD                   ;2
       AND    $8E                    ;3
       STA    $8E                    ;3
       JMP    L3669                  ;3
L365A: BNE    L3669                  ;2
       LDA    #$02                   ;2
       STA    $C4,X                  ;4
       LDY    $C8,X                  ;4
       LDA    L3F81,Y                ;4
       STA    $CA,X                  ;4
       BNE    L364E                  ;2
L3669: DEC    $CA,X                  ;6
L366B: DEX                           ;2
       BPL    L3637                  ;2
L366E: LDA    $DA                    ;3
       CMP    #$10                   ;2
       BNE    L36B6                  ;2
       LDA    $84                    ;3
       AND    #$01                   ;2
       TAX                           ;2
       LDA    $CA,X                  ;4
       BPL    L3686                  ;2
       LDA    $BE,X                  ;4
       BMI    L3686                  ;2
       LDY    $C1,X                  ;4
       JSR    L3A7F                  ;6
L3686: LDA    $BD                    ;3
       BMI    L36B6                  ;2
       LDY    $C0                    ;3
       JSR    L3A7F                  ;6
       BCC    L36B6                  ;2
       LDA    $8C                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       LDA    L3B1D,X                ;4
       JSR    L3B23                  ;6
       LDA    L3B17,X                ;4
       JSR    L3D3D                  ;6
       LDA    $8C                    ;3
       AND    #$E0                   ;2
       CLC                           ;2
       ADC    #$20                   ;2
       CMP    #$C0                   ;2
       BNE    L36B2                  ;2
       LDA    #$00                   ;2
L36B2: ORA    #$1F                   ;2
       STA    $8C                    ;3
L36B6: LDA    $89                    ;3
       BMI    L36BD                  ;2
L36BA: JMP    L3767                  ;3
L36BD: LDA    $DA                    ;3
       CMP    #$10                   ;2
       BNE    L36BA                  ;2
       LDA    $BD                    ;3
       BMI    L36BA                  ;2
       LDA    $84                    ;3
       AND    #$01                   ;2
       BNE    L36BA                  ;2
       LDA    #$80                   ;2
       AND    $8E                    ;3
       BNE    L36BA                  ;2
       LDA    #$01                   ;2
       STA    $F5                    ;3
       LDA    SWCHA                  ;4
       EOR    #$FF                   ;2
       STA    $F7                    ;3
       LDA    #$10                   ;2
       AND    $F7                    ;3
       BEQ    L36E7                  ;2
       JMP    L373E                  ;3
L36E7: LDA    #$20                   ;2
       AND    $F7                    ;3
       BNE    L372F                  ;2
       LDA    #$80                   ;2
       AND    $F7                    ;3
       BNE    L3720                  ;2
       LDA    #$40                   ;2
       AND    $F7                    ;3
       BNE    L3711                  ;2
       LDA    $BD                    ;3
       AND    #$0F                   ;2
       BEQ    L3702                  ;2
L36FF: JMP    L374B                  ;3
L3702: LDA    $C0                    ;3
       AND    #$07                   ;2
       BNE    L36FF                  ;2
       LDA    #$FE                   ;2
       AND    $8E                    ;3
       STA    $8E                    ;3
       JMP    L3767                  ;3
L3711: LDX    #$00                   ;2
       JSR    L3CA6                  ;6
       LDA    #$03                   ;2
       BCC    L3765                  ;2
       CMP    $B8                    ;3
       BEQ    L3767                  ;2
       BNE    L374B                  ;2
L3720: LDX    #$00                   ;2
       JSR    L3C3D                  ;6
       LDA    #$02                   ;2
       BCC    L3765                  ;2
       CMP    $B8                    ;3
       BEQ    L3767                  ;2
       BNE    L374B                  ;2
L372F: LDX    #$00                   ;2
       JSR    L3BAF                  ;6
       LDA    #$01                   ;2
       BCC    L3765                  ;2
       CMP    $B8                    ;3
       BEQ    L3767                  ;2
       BNE    L374B                  ;2
L373E: LDX    #$00                   ;2
       JSR    L3BF7                  ;6
       LDA    #$00                   ;2
       BCC    L3765                  ;2
       CMP    $B8                    ;3
       BEQ    L3767                  ;2
L374B: DEC    $F5                    ;5
       BMI    L3767                  ;2
       LDA    $B8                    ;3
       BEQ    L373E                  ;2
       CMP    #$01                   ;2
       BEQ    L372F                  ;2
       LDA    $C0                    ;3
       AND    #$07                   ;2
       BEQ    L3767                  ;2
       LDA    $B8                    ;3
       CMP    #$02                   ;2
       BEQ    L3720                  ;2
       BNE    L3711                  ;2
L3765: STA    $B8                    ;3
L3767: LDA    $84                    ;3
       AND    #$01                   ;2
       BEQ    L37CE                  ;2
       LDA    INPT4                  ;3
       BMI    L37CE                  ;2
       LDA    $DA                    ;3
       CMP    #$50                   ;2
       BEQ    L377B                  ;2
       CMP    #$30                   ;2
       BNE    L3781                  ;2
L377B: JSR    L3989                  ;6
       JMP    L37CE                  ;3
L3781: CMP    #$10                   ;2
       BNE    L37CE                  ;2
       LDA    $89                    ;3
       BPL    L37CE                  ;2
       LDA    $8E                    ;3
       BMI    L37CE                  ;2
       LDA    $BA                    ;3
       BMI    L37CE                  ;2
       LDA    $BC                    ;3
       BPL    L37CE                  ;2
       LDA    $C0                    ;3
       LDX    $B8                    ;3
       CLC                           ;2
       ADC    L3823,X                ;4
       BMI    L37CE                  ;2
       STA    $BB                    ;3
       LDA    L381F,X                ;4
       STA    $B9                    ;3
       CPX    #$00                   ;2
       BEQ    L37B0                  ;2
       LDA    $BD                    ;3
       AND    #$0F                   ;2
       BNE    L37B5                  ;2
L37B0: LDA    $BD                    ;3
       JMP    L37BA                  ;3
L37B5: LDA    $BD                    ;3
       SEC                           ;2
       SBC    #$10                   ;2
L37BA: LDX    $C0                    ;3
       JSR    L3D4E                  ;6
       BNE    L37CE                  ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $BA                    ;3
       LDX    $B8                    ;3
       LDA    L3827,X                ;4
       STA    $BC                    ;3
L37CE: LDA    SWCHB                  ;4
       EOR    #$FF                   ;2
       AND    #$01                   ;2
       BEQ    L37DA                  ;2
       JSR    L3989                  ;6
L37DA: LDA    $84                    ;3
       AND    #$1F                   ;2
       BNE    L3807                  ;2
       LDA    SWCHB                  ;4
       EOR    #$FF                   ;2
       AND    #$02                   ;2
       BEQ    L3807                  ;2
       STA    $84                    ;3
       STA    $85                    ;3
       LDA    $DA                    ;3
       CMP    #$30                   ;2
       BNE    L37FF                  ;2
       INC    $80                    ;5
       LDA    $80                    ;3
       CMP    #$04                   ;2
       BNE    L3807                  ;2
       LDA    #$00                   ;2
       STA    $80                    ;3
L37FF: LDA    #$30                   ;2
       STA    $DA                    ;3
       LDA    #$38                   ;2
       STA    $C0                    ;3
L3807: LDA    $81                    ;3
       AND    #$0F                   ;2
       TAY                           ;2
       LDX    #$04                   ;2
       LDA    SWCHB                  ;4
       EOR    #$FF                   ;2
       AND    #$08                   ;2
       BNE    L381A                  ;2
       LDX    L382B,Y                ;4
L381A: STX    $8F                    ;3
       JMP    L383B                  ;3
L381F: .byte $0E ; |    XXX | $381F
       .byte $01 ; |       X| $3820
       .byte $07 ; |     XXX| $3821
       .byte $07 ; |     XXX| $3822
L3823: .byte $03 ; |      XX| $3823
       .byte $03 ; |      XX| $3824
       .byte $07 ; |     XXX| $3825
       .byte $00 ; |        | $3826
L3827: .byte $02 ; |      X | $3827
       .byte $00 ; |        | $3828
       .byte $00 ; |        | $3829
       .byte $01 ; |       X| $382A
L382B: .byte $D2 ; |XX X  X | $382B
       .byte $92 ; |X  X  X | $382C
       .byte $E2 ; |XXX   X | $382D
       .byte $C4 ; |XX   X  | $382E
       .byte $04 ; |     X  | $382F
       .byte $74 ; | XXX X  | $3830
       .byte $F2 ; |XXXX  X | $3831
       .byte $52 ; | X X  X | $3832
       .byte $A4 ; |X X  X  | $3833
       .byte $D4 ; |XX X X  | $3834
       .byte $B4 ; |X XX X  | $3835
       .byte $64 ; | XX  X  | $3836
       .byte $30 ; |  XX    | $3837
       .byte $82 ; |X     X | $3838
       .byte $E4 ; |XXX  X  | $3839
       .byte $A4 ; |X X  X  | $383A
L383B: LDA    $DA                    ;3
       CMP    #$10                   ;2
       BNE    L384B                  ;2
       LDA    $BA                    ;3
       BPL    L3857                  ;2
       LDA    $84                    ;3
       AND    #$1F                   ;2
       BEQ    L384E                  ;2
L384B: JMP    L3986                  ;3
L384E: DEC    $BC                    ;5
       BPL    L384B                  ;2
       LDA    #$14                   ;2
       JSR    L3D37                  ;6
L3857: LDA    $BC                    ;3
       BPL    L388C                  ;2
       LDA    $BD                    ;3
       AND    #$0F                   ;2
       TAX                           ;2
       LDA    L3971,X                ;4
       STA    $B9                    ;3
       LDA    $BD                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAY                           ;2
       CPX    #$0A                   ;2
       BCC    L3871                  ;2
       DEY                           ;2
L3871: STY    $BA                    ;3
       LDA    $C0                    ;3
       LDX    $B8                    ;3
       CLC                           ;2
       ADC    L396D,X                ;4
       BPL    L3887                  ;2
       CMP    #$80                   ;2
       BNE    L3885                  ;2
       LDA    #$7F                   ;2
       BNE    L3887                  ;2
L3885: LDA    #$00                   ;2
L3887: STA    $BB                    ;3
       JMP    L3986                  ;3
L388C: LDX    #$00                   ;2
       LDA    $84                    ;3
       AND    #$01                   ;2
       BNE    L38A3                  ;2
       JSR    L3FA9                  ;6
       BCS    L389C                  ;2
       JMP    L38DC                  ;3
L389C: LDA    #$81                   ;2
       STA    $BC                    ;3
       JMP    L3857                  ;3
L38A3: LDX    #$02                   ;2
L38A5: JSR    L3FA9                  ;6
       BCS    L38B0                  ;2
       DEX                           ;2
       BNE    L38A5                  ;2
       JMP    L38DC                  ;3
L38B0: TXA                           ;2
       PHA                           ;3
       LDA    #$00                   ;2
       JSR    L3D41                  ;6
       PLA                           ;4
       TAX                           ;2
       LDA    #$80                   ;2
       STA    $BD,X                  ;4
       CPX    #$01                   ;2
       BNE    L38C4                  ;2
       JSR    L3B82                  ;6
L38C4: LDA    #$50                   ;2
       JSR    L3B23                  ;6
       LDY    $D8                    ;3
       LDA    L3981,Y                ;4
       STA    $BC                    ;3
       INY                           ;2
       CPY    #$05                   ;2
       BNE    L38D7                  ;2
       LDY    #$00                   ;2
L38D7: STY    $D8                    ;3
       JMP    L3986                  ;3
L38DC: LDA    $BC                    ;3
       AND    #$01                   ;2
       PHP                           ;3
       LDA    #$01                   ;2
       PLP                           ;4
       BEQ    L38E8                  ;2
       LDA    #$FF                   ;2
L38E8: CLC                           ;2
       ADC    $BB                    ;3
       CMP    #$80                   ;2
       BEQ    L3903                  ;2
       CMP    #$FF                   ;2
       BEQ    L3903                  ;2
       STA    $BB                    ;3
       LDA    $BA                    ;3
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       TAX                           ;2
       LDX    $BB                    ;3
       JSR    L3D4E                  ;6
       BEQ    L3911                  ;2
L3903: LDA    #$01                   ;2
       EOR    $BC                    ;3
       STA    $BC                    ;3
       LDA    #$08                   ;2
       JSR    L3D3D                  ;6
       JMP    L3986                  ;3
L3911: LDA    $BC                    ;3
       AND    #$02                   ;2
       BEQ    L394E                  ;2
       LDX    $B9                    ;3
       CPX    #$0E                   ;2
       BEQ    L3922                  ;2
       INC    $B9                    ;5
       JMP    L3986                  ;3
L3922: LDX    $BA                    ;3
       CPX    #$07                   ;2
       BEQ    L3940                  ;2
       INC    $BA                    ;5
       LDA    $BA                    ;3
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       LDX    $BB                    ;3
       JSR    L3D4E                  ;6
       BNE    L393E                  ;2
       LDA    #$01                   ;2
       STA    $B9                    ;3
       JMP    L3986                  ;3
L393E: DEC    $BA                    ;5
L3940: LDA    #$02                   ;2
       EOR    $BC                    ;3
       STA    $BC                    ;3
       LDA    #$0E                   ;2
       JSR    L3D3D                  ;6
       JMP    L3986                  ;3
L394E: DEC    $B9                    ;5
       BNE    L3986                  ;2
       LDA    $BA                    ;3
       BEQ    L3940                  ;2
       SEC                           ;2
       SBC    #$01                   ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       LDX    $BB                    ;3
       JSR    L3D4E                  ;6
       BNE    L3940                  ;2
       DEC    $BA                    ;5
       LDA    #$0E                   ;2
       STA    $B9                    ;3
       JMP    L3986                  ;3
L396D: .byte $08 ; |    X   | $396D
       .byte $08 ; |    X   | $396E
       .byte $08 ; |    X   | $396F
       .byte $FF ; |XXXXXXXX| $3970
L3971: .byte $08 ; |    X   | $3971
       .byte $08 ; |    X   | $3972
       .byte $07 ; |     XXX| $3973
       .byte $06 ; |     XX | $3974
       .byte $05 ; |     X X| $3975
       .byte $04 ; |     X  | $3976
       .byte $03 ; |      XX| $3977
       .byte $02 ; |      X | $3978
       .byte $01 ; |       X| $3979
       .byte $01 ; |       X| $397A
       .byte $0E ; |    XXX | $397B
       .byte $0E ; |    XXX | $397C
       .byte $0D ; |    XX X| $397D
       .byte $0D ; |    XX X| $397E
       .byte $0C ; |    XX  | $397F
       .byte $0B ; |    X XX| $3980
L3981: .byte $02 ; |      X | $3981
       .byte $08 ; |    X   | $3982
       .byte $0C ; |    XX  | $3983
       .byte $10 ; |   X    | $3984
       .byte $14 ; |   X X  | $3985
L3986: JMP    L3000                  ;3
L3989: LDA    #$00                   ;2
       STA    $84                    ;3
       STA    $85                    ;3
       STA    $81                    ;3
       STA    $82                    ;3
       STA    $83                    ;3
       STA    $8B                    ;3
       LDA    $80                    ;3
       ASL                           ;2
       TAX                           ;2
       STX    $C8                    ;3
       INX                           ;2
       STX    $C9                    ;3
       LDA    #$00                   ;2
       JSR    L3D2C                  ;6
       LDA    #$04                   ;2
       STA    $DB                    ;3
L39A9: LDA    #$06                   ;2
       STA    $8A                    ;3
       LDY    $C8                    ;3
       LDA    L3F6D,Y                ;4
       STA    $CC                    ;3
       LDY    $C9                    ;3
       LDA    L3F6D,Y                ;4
       STA    $CD                    ;3
       LDA    $81                    ;3
       AND    #$07                   ;2
       TAX                           ;2
       LDA    L3F27,X                ;4
       STA    $EF                    ;3
       LDA    #$3F                   ;2
       STA    $F0                    ;3
       LDA    #$3E                   ;2
       STA    $F2                    ;3
       STA    $F4                    ;3
       STA    $F6                    ;3
       STA    $F8                    ;3
       LDA    L3EA0,X                ;4
       STA    $F1                    ;3
       LDA    L3EA8,X                ;4
       STA    $F3                    ;3
       LDA    L3EB0,X                ;4
       STA    $F5                    ;3
       LDA    L3EB8,X                ;4
       STA    $F7                    ;3
       LDY    #$07                   ;2
L39E9: LDA    ($EF),Y                ;5
       STA.wy $0090,Y                ;5
       LDA    ($F1),Y                ;5
       STA.wy $0098,Y                ;5
       LDA    ($F3),Y                ;5
       STA.wy $00A0,Y                ;5
       LDA    ($F5),Y                ;5
       STA.wy $00A8,Y                ;5
       LDA    ($F7),Y                ;5
       STA.wy $00B0,Y                ;5
       DEY                           ;2
       BPL    L39E9                  ;2
       LDA    #$02                   ;2
       LDY    L3EC0,X                ;4
       AND    $D9                    ;3
       BEQ    L3A11                  ;2
       LDY    L3EC8,X                ;4
L3A11: STY    $D4                    ;3
       ASL                           ;2
       LDY    L3ED0,X                ;4
       AND    $D9                    ;3
       BEQ    L3A1E                  ;2
       LDY    L3ED8,X                ;4
L3A1E: STY    $D5                    ;3
       ASL                           ;2
       LDY    L3EE0,X                ;4
       AND    $D9                    ;3
       BEQ    L3A2B                  ;2
       LDY    L3EE8,X                ;4
L3A2B: STY    $D6                    ;3
       ASL                           ;2
       LDY    L3EF0,X                ;4
       AND    $D9                    ;3
       BEQ    L3A38                  ;2
       LDY    L3EF8,X                ;4
L3A38: STY    $D7                    ;3
       LDA    #$70                   ;2
       STA    $D0                    ;3
       LDA    #$50                   ;2
       STA    $D1                    ;3
       LDA    #$30                   ;2
       STA    $D2                    ;3
       LDA    #$10                   ;2
       STA    $D3                    ;3
       LDA    #$80                   ;2
       STA    $8D                    ;3
       STA    $BA                    ;3
       LDA    #$02                   ;2
       STA    $BC                    ;3
       LDA    #$38                   ;2
       STA    $C0                    ;3
       LDA    #$00                   ;2
       STA    $BD                    ;3
       STA    $C4                    ;3
       STA    $C5                    ;3
       STA    $D8                    ;3
       STA    $8E                    ;3
       LDA    #$80                   ;2
       STA    $BE                    ;3
       STA    $BF                    ;3
       LDA    #$10                   ;2
       STA    $DA                    ;3
       LDX    #$01                   ;2
L3A70: LDY    $C8,X                  ;4
       INY                           ;2
       CPY    #$14                   ;2
       BNE    L3A79                  ;2
       LDY    #$08                   ;2
L3A79: STY    $C8,X                  ;4
       DEX                           ;2
       BPL    L3A70                  ;2
       RTS                           ;6

L3A7F: STA    $F7                    ;3
       STY    $F8                    ;3
       AND    #$0F                   ;2
       BEQ    L3A8A                  ;2
       JMP    L3B15                  ;3
L3A8A: LDA    $F8                    ;3
       AND    #$07                   ;2
       BEQ    L3A93                  ;2
       JMP    L3B15                  ;3
L3A93: LDA    $F8                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $EF                    ;3
       LDA    $F7                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       AND    #$07                   ;2
       TAX                           ;2
       LDA    $90,X                  ;4
       BMI    L3AAA                  ;2
       JMP    L3B15                  ;3
L3AAA: AND    #$07                   ;2
       STA    $F3                    ;3
       ASL                           ;2
       TAY                           ;2
       LDA    L3F00,Y                ;4
       STA    $F0                    ;3
       LDA    L3F01,Y                ;4
       STA    $F1                    ;3
       LDA    $90,X                  ;4
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       AND    #$0F                   ;2
       STA    $F2                    ;3
       STA    $F6                    ;3
       LDX    #$00                   ;2
L3AC7: LDA    $EF                    ;3
       CMP    $F2                    ;3
       BEQ    L3ADB                  ;2
       DEC    $F0                    ;5
       BEQ    L3B15                  ;2
       CLC                           ;2
       LDA    $F2                    ;3
       ADC    $F1                    ;3
       STA    $F2                    ;3
       INX                           ;2
       BNE    L3AC7                  ;2
L3ADB: LDY    $F3                    ;3
       LDA    L3F0E,Y                ;4
       STA    $F4                    ;3
       LDA    #$3F                   ;2
       STA    $F5                    ;3
       TXA                           ;2
       ASL                           ;2
       TAY                           ;2
       LDA    ($F4),Y                ;5
       STA    $F3                    ;3
       INY                           ;2
       LDA    ($F4),Y                ;5
       TAX                           ;2
L3AF1: DEX                           ;2
       BMI    L3AFD                  ;2
       CLC                           ;2
       LDA    $F1                    ;3
       ADC    $F6                    ;3
       STA    $F6                    ;3
       BNE    L3AF1                  ;2
L3AFD: LDA    $F6                    ;3
       ASL                           ;2
       ASL                           ;2
       ASL                           ;2
       ORA    $F3                    ;3
       STA    $F3                    ;3
       LDA    $F7                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       AND    #$07                   ;2
       TAX                           ;2
       LDA    $F3                    ;3
       STA    $90,X                  ;4
       SEC                           ;2
       RTS                           ;6

L3B15: CLC                           ;2
       RTS                           ;6

L3B17: .byte $1C ; |   XXX  | $3B17
       .byte $29 ; |  X X  X| $3B18
       .byte $36 ; |  XX XX | $3B19
       .byte $43 ; | X    XX| $3B1A
       .byte $50 ; | X X    | $3B1B
       .byte $5D ; | X XXX X| $3B1C
L3B1D: .byte $05 ; |     X X| $3B1D
       .byte $05 ; |     X X| $3B1E
       .byte $05 ; |     X X| $3B1F
       .byte $05 ; |     X X| $3B20
       .byte $05 ; |     X X| $3B21
       .byte $55 ; | X X X X| $3B22
L3B23: STX    $F0                    ;3
       LDX    $83                    ;3
       STX    $EF                    ;3
       SED                           ;2
       CLC                           ;2
       ADC    $82                    ;3
       STA    $82                    ;3
       LDA    #$00                   ;2
       ADC    $83                    ;3
       STA    $83                    ;3
       CLD                           ;2
       CMP    $EF                    ;3
       BEQ    L3B7F                  ;2
       AND    #$01                   ;2
       BNE    L3B7F                  ;2
       LDA    #$02                   ;2
       AND    $8E                    ;3
       BNE    L3B7F                  ;2
       LDA    $8B                    ;3
       AND    #$07                   ;2
       TAX                           ;2
       LDA    #$08                   ;2
L3B4B: DEX                           ;2
       BMI    L3B52                  ;2
       ASL                           ;2
       JMP    L3B4B                  ;3
L3B52: AND    $8B                    ;3
       BNE    L3B7F                  ;2
       LDX    $C8                    ;3
       LDA    L3F6D,X                ;4
       STA    $CA                    ;3
       LDA    $8B                    ;3
       AND    #$07                   ;2
       TAX                           ;2
       LDA    L3BAA,X                ;4
       STA    $C4                    ;3
       LDA    #$02                   ;2
       ORA    $8E                    ;3
       STA    $8E                    ;3
       LDA    $BE                    ;3
       BPL    L3B7F                  ;2
       LDA    #$38                   ;2
       STA    $C1                    ;3
       LDA    #$40                   ;2
       STA    $BE                    ;3
       LDA    $8A                    ;3
       BEQ    L3B7F                  ;2
       DEC    $8A                    ;5
L3B7F: LDX    $F0                    ;3
       RTS                           ;6

L3B82: LDA    $8E                    ;3
       AND    #$FD                   ;2
       STA    $8E                    ;3
       LDA    $C4                    ;3
       CMP    #$06                   ;2
       BCC    L3BA9                  ;2
       STX    $F3                    ;3
       LDA    $8B                    ;3
       AND    #$07                   ;2
       TAX                           ;2
       LDA    #$08                   ;2
L3B97: DEX                           ;2
       BMI    L3B9E                  ;2
       ASL                           ;2
       JMP    L3B97                  ;3
L3B9E: ORA    $8B                    ;3
       STA    $8B                    ;3
       LDA    #$00                   ;2
       STA    $C4                    ;3
       LDX    $F3                    ;3
       SEC                           ;2
L3BA9: RTS                           ;6

L3BAA: .byte $06 ; |     XX | $3BAA
       .byte $08 ; |    X   | $3BAB
       .byte $0A ; |    X X | $3BAC
       .byte $0C ; |    XX  | $3BAD
       .byte $0E ; |    XXX | $3BAE
L3BAF: LDA    $C0,X                  ;4
       AND    #$07                   ;2
       BNE    L3BF5                  ;2
       LDA    $BD,X                  ;4
       BEQ    L3BF5                  ;2
       AND    #$0F                   ;2
       BEQ    L3BCE                  ;2
       CMP    #$0F                   ;2
       BNE    L3BCA                  ;2
       LDA    $BD,X                  ;4
       SEC                           ;2
       SBC    #$1F                   ;2
       STA    $BD,X                  ;4
       CLC                           ;2
       RTS                           ;6

L3BCA: INC    $BD,X                  ;6
       CLC                           ;2
       RTS                           ;6

L3BCE: LDA    $BD,X                  ;4
       SEC                           ;2
       SBC    #$10                   ;2
       STA    $EF                    ;3
       JSR    L3D1C                  ;6
       BNE    L3BF1                  ;2
       LDA.wy $00D4,Y                ;4
       CMP    $C0,X                  ;4
       BCS    L3BE9                  ;2
       ADC    #$07                   ;2
       CMP    $C0,X                  ;4
       BCS    L3BF5                  ;2
       BCC    L3BF1                  ;2
L3BE9: SBC    #$07                   ;2
       BCC    L3BF5                  ;2
       CMP    $C0,X                  ;4
       BCC    L3BF5                  ;2
L3BF1: INC    $BD,X                  ;6
       CLC                           ;2
       RTS                           ;6

L3BF5: SEC                           ;2
       RTS                           ;6

L3BF7: LDA    $C0,X                  ;4
       AND    #$07                   ;2
       BNE    L3BF5                  ;2
       LDA    $BD,X                  ;4
       AND    #$0F                   ;2
       BEQ    L3C07                  ;2
       DEC    $BD,X                  ;6
       CLC                           ;2
       RTS                           ;6

L3C07: LDA    $BD,X                  ;4
       CMP    #$70                   ;2
       BEQ    L3BF5                  ;2
       LDA    #$10                   ;2
       CLC                           ;2
       ADC    $BD,X                  ;4
       STA    $EF                    ;3
       JSR    L3D1C                  ;6
       BNE    L3C34                  ;2
       LDA.wy $00D4,Y                ;4
       CMP    $C0,X                  ;4
       BCS    L3C28                  ;2
       ADC    #$07                   ;2
       CMP    $C0,X                  ;4
       BCS    L3BF5                  ;2
       BCC    L3C34                  ;2
L3C28: SBC    #$07                   ;2
       BPL    L3C2E                  ;2
       LDA    #$00                   ;2
L3C2E: CMP    $C0,X                  ;4
       BEQ    L3BF5                  ;2
       BCC    L3BF5                  ;2
L3C34: LDA    $BD,X                  ;4
       CLC                           ;2
       ADC    #$1F                   ;2
       STA    $BD,X                  ;4
       CLC                           ;2
       RTS                           ;6

L3C3D: LDA    $BD,X                  ;4
       STA    $EF                    ;3
       AND    #$0F                   ;2
       BNE    L3CA4                  ;2
       LDA    $C0,X                  ;4
       CMP    #$78                   ;2
       BEQ    L3CA4                  ;2
       JSR    L3D1C                  ;6
       BNE    L3C83                  ;2
       LDA    $C0,X                  ;4
       CLC                           ;2
       ADC    #$08                   ;2
       CMP.wy $00D4,Y                ;4
       BNE    L3C83                  ;2
       LDA.wy $00D4,Y                ;4
       CMP    #$78                   ;2
       BEQ    L3C87                  ;2
       LDA    $8D                    ;3
       BMI    L3C6F                  ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F2                    ;3
       CPY    $F2                    ;3
       BEQ    L3CA4                  ;2
L3C6F: CLC                           ;2
       LDA.wy $00D4,Y                ;4
       ADC    #$08                   ;2
       JSR    L3CEF                  ;6
       BCS    L3C87                  ;2
       CLC                           ;2
       LDA    #$01                   ;2
       ADC.wy $00D4,Y                ;4
       STA.wy $00D4,Y                ;5
L3C83: INC    $C0,X                  ;6
       CLC                           ;2
       RTS                           ;6

L3C87: TXA                           ;2
       BEQ    L3CA4                  ;2
       LDA    #$03                   ;2
       STA    $CB,X                  ;4
       STA    $C3,X                  ;4
       LDA    #$83                   ;2
       STA    $C9,X                  ;4
       LDA    $BD,X                  ;4
       AND    #$70                   ;2
       BEQ    L3CA0                  ;2
       LDA    #$01                   ;2
       STA    $C5,X                  ;4
       SEC                           ;2
       RTS                           ;6

L3CA0: LDA    #$00                   ;2
       STA    $C5,X                  ;4
L3CA4: SEC                           ;2
       RTS                           ;6

L3CA6: LDA    $BD,X                  ;4
       STA    $EF                    ;3
       AND    #$0F                   ;2
       BNE    L3CA4                  ;2
       LDA    $C0,X                  ;4
       BEQ    L3CA4                  ;2
       JSR    L3D1C                  ;6
       BNE    L3CEB                  ;2
       LDA    $C0,X                  ;4
       SEC                           ;2
       SBC    #$08                   ;2
       CMP.wy $00D4,Y                ;4
       BNE    L3CEB                  ;2
       LDA.wy $00D4,Y                ;4
       BEQ    L3C87                  ;2
       LDA    $8D                    ;3
       BMI    L3CD4                  ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       STA    $F2                    ;3
       CPY    $F2                    ;3
       BEQ    L3CA4                  ;2
L3CD4: CLC                           ;2
       LDA.wy $00D4,Y                ;4
       SEC                           ;2
       SBC    #$08                   ;2
       BMI    L3CE2                  ;2
       JSR    L3CEF                  ;6
       BCS    L3C87                  ;2
L3CE2: SEC                           ;2
       LDA.wy $00D4,Y                ;4
       SBC    #$01                   ;2
       STA.wy $00D4,Y                ;5
L3CEB: DEC    $C0,X                  ;6
       CLC                           ;2
       RTS                           ;6

L3CEF: STA    $EF                    ;3
       LDA.wy $00D0,Y                ;4
       AND    #$F0                   ;2
       STA    $F1                    ;3
       STY    $F0                    ;3
       LDY    #$02                   ;2
L3CFC: LDA.wy $00C0,Y                ;4
       CMP    $EF                    ;3
       BNE    L3D11                  ;2
       LDA.wy $00BD,Y                ;4
       BMI    L3D11                  ;2
       SEC                           ;2
       SBC    $F1                    ;3
       BEQ    L3D18                  ;2
       CMP    #$20                   ;2
       BCC    L3D18                  ;2
L3D11: DEY                           ;2
       BPL    L3CFC                  ;2
       CLC                           ;2
       LDY    $F0                    ;3
       RTS                           ;6

L3D18: LDY    $F0                    ;3
       SEC                           ;2
       RTS                           ;6

L3D1C: LDY    #$03                   ;2
L3D1E: LDA.wy $00D0,Y                ;4
       AND    #$F0                   ;2
       CMP    $EF                    ;3
       BNE    L3D28                  ;2
       RTS                           ;6

L3D28: DEY                           ;2
       BPL    L3D1E                  ;2
       RTS                           ;6

L3D2C: STA    $86                    ;3
       STA    $87                    ;3
       LDA    #$00                   ;2
       STA    $88                    ;3
       STA    $89                    ;3
       RTS                           ;6

L3D37: STX    $F7                    ;3
       LDX    $BD                    ;3
       BMI    L3D4B                  ;2
L3D3D: LDX    $88                    ;3
       BPL    L3D4B                  ;2
L3D41: LDX    $89                    ;3
       BPL    L3D4B                  ;2
       STA    $86                    ;3
       LDA    #$00                   ;2
       STA    $88                    ;3
L3D4B: LDX    $F7                    ;3
       RTS                           ;6

L3D4E: STA    $EF                    ;3
       STX    $F0                    ;3
       JSR    L3DFB                  ;6
       LDA    $F0                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       LDA    L3E9C,X                ;4
       STA    $F1                    ;3
       LDA    #$00                   ;2
       STA    $F2                    ;3
       LDA    $F0                    ;3
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       LDA    L3E7C,X                ;4
       EOR    #$FF                   ;2
       AND    ($F1),Y                ;5
       PHP                           ;3
       LDA    $EF                    ;3
       LDX    $F0                    ;3
       PLP                           ;4
       RTS                           ;6

L3D79: STA    $EF                    ;3
       STY    $F0                    ;3
       LDA    $C3,X                  ;4
       AND    #$FE                   ;2
       EOR    #$02                   ;2
       BNE    L3D8D                  ;2
       LDA    #$00                   ;2
       BEQ    L3DAF                  ;2
L3D89: STA    $EF                    ;3
       STY    $F0                    ;3
L3D8D: TYA                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAY                           ;2
       LDA    L3E9C,Y                ;4
       STA    $F1                    ;3
       LDA    #$00                   ;2
       STA    $F2                    ;3
       LDA    $F0                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAY                           ;2
       LDA    L3FE8,Y                ;4
       PHA                           ;3
       LDA    $EF                    ;3
       JSR    L3DFB                  ;6
       PLA                           ;4
       AND    ($F1),Y                ;5
L3DAF: PHP                           ;3
       LDA    $EF                    ;3
       LDY    $F0                    ;3
       PLP                           ;4
       RTS                           ;6

L3DB6: STY    $F4                    ;3
       STA    $EF                    ;3
       STX    $F0                    ;3
       AND    #$0F                   ;2
       BEQ    L3DC4                  ;2
       CMP    #$01                   ;2
       BNE    L3DF8                  ;2
L3DC4: LDA    $EF                    ;3
       JSR    L3DFB                  ;6
       LDA    #$01                   ;2
       STA    $F3                    ;3
L3DCD: LDA    $F0                    ;3
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       LDA    L3E9C,X                ;4
       STA    $F1                    ;3
       LDA    #$00                   ;2
       STA    $F2                    ;3
       LDA    $F0                    ;3
       LSR                           ;2
       LSR                           ;2
       TAX                           ;2
       LDA    L3E7C,X                ;4
       AND    ($F1),Y                ;5
       STA    ($F1),Y                ;6
       DEC    $F3                    ;5
       BMI    L3DF8                  ;2
       LDA    $F0                    ;3
       CLC                           ;2
       ADC    #$04                   ;2
       STA    $F0                    ;3
       JMP    L3DCD                  ;3
L3DF8: LDY    $F4                    ;3
       RTS                           ;6

L3DFB: LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       AND    #$07                   ;2
       TAY                           ;2
       RTS                           ;6

       .byte $EA ; |XXX X X | $3E03
       .byte $85 ; |X    X X| $3E04
       .byte $F6 ; |XXXX XX | $3E05
       .byte $A9 ; |X X X  X| $3E06
       .byte $FF ; |XXXXXXXX| $3E07
       .byte $00 ; |        | $3E08
       .byte $FF ; |XXXXXXXX| $3E09
       .byte $FF ; |XXXXXXXX| $3E0A
       .byte $FF ; |XXXXXXXX| $3E0B
       .byte $FF ; |XXXXXXXX| $3E0C
       .byte $FF ; |XXXXXXXX| $3E0D
       .byte $0F ; |    XXXX| $3E0E
       .byte $3F ; |  XXXXXX| $3E0F
       .byte $3F ; |  XXXXXX| $3E10
       .byte $3F ; |  XXXXXX| $3E11
       .byte $3F ; |  XXXXXX| $3E12
       .byte $3F ; |  XXXXXX| $3E13
       .byte $3F ; |  XXXXXX| $3E14
       .byte $0F ; |    XXXX| $3E15
       .byte $3F ; |  XXXXXX| $3E16
       .byte $3F ; |  XXXXXX| $3E17
       .byte $00 ; |        | $3E18
       .byte $3F ; |  XXXXXX| $3E19
       .byte $FF ; |XXXXXXXX| $3E1A
       .byte $FF ; |XXXXXXXX| $3E1B
       .byte $FF ; |XXXXXXXX| $3E1C
       .byte $00 ; |        | $3E1D
       .byte $FF ; |XXXXXXXX| $3E1E
       .byte $FF ; |XXXXXXXX| $3E1F
       .byte $FF ; |XXXXXXXX| $3E20
       .byte $FF ; |XXXXXXXX| $3E21
       .byte $FF ; |XXXXXXXX| $3E22
       .byte $FF ; |XXXXXXXX| $3E23
       .byte $00 ; |        | $3E24
       .byte $FF ; |XXXXXXXX| $3E25
       .byte $FF ; |XXXXXXXX| $3E26
       .byte $FF ; |XXXXXXXX| $3E27
       .byte $FF ; |XXXXXXXX| $3E28
       .byte $FF ; |XXXXXXXX| $3E29
       .byte $FF ; |XXXXXXXX| $3E2A
       .byte $FF ; |XXXXXXXX| $3E2B
       .byte $FF ; |XXXXXXXX| $3E2C
       .byte $00 ; |        | $3E2D
       .byte $3F ; |  XXXXXX| $3E2E
       .byte $3F ; |  XXXXXX| $3E2F
       .byte $3F ; |  XXXXXX| $3E30
       .byte $3F ; |  XXXXXX| $3E31
       .byte $FF ; |XXXXXXXX| $3E32
       .byte $C0 ; |XX      | $3E33
       .byte $CF ; |XX  XXXX| $3E34
       .byte $FF ; |XXXXXXXX| $3E35
       .byte $FF ; |XXXXXXXX| $3E36
       .byte $FF ; |XXXXXXXX| $3E37
       .byte $FF ; |XXXXXXXX| $3E38
       .byte $FF ; |XXXXXXXX| $3E39
       .byte $FF ; |XXXXXXXX| $3E3A
       .byte $FF ; |XXXXXXXX| $3E3B
       .byte $FF ; |XXXXXXXX| $3E3C
       .byte $C0 ; |XX      | $3E3D
       .byte $FC ; |XXXXXX  | $3E3E
       .byte $FC ; |XXXXXX  | $3E3F
       .byte $00 ; |        | $3E40
       .byte $FF ; |XXXXXXXX| $3E41
       .byte $FF ; |XXXXXXXX| $3E42
       .byte $FF ; |XXXXXXXX| $3E43
       .byte $FF ; |XXXXXXXX| $3E44
       .byte $FF ; |XXXXXXXX| $3E45
       .byte $C0 ; |XX      | $3E46
       .byte $0F ; |    XXXX| $3E47
       .byte $3F ; |  XXXXXX| $3E48
       .byte $3F ; |  XXXXXX| $3E49
       .byte $3F ; |  XXXXXX| $3E4A
       .byte $3F ; |  XXXXXX| $3E4B
       .byte $0F ; |    XXXX| $3E4C
       .byte $C0 ; |XX      | $3E4D
       .byte $3F ; |  XXXXXX| $3E4E
       .byte $3F ; |  XXXXXX| $3E4F
       .byte $3F ; |  XXXXXX| $3E50
       .byte $3F ; |  XXXXXX| $3E51
       .byte $00 ; |        | $3E52
       .byte $3F ; |  XXXXXX| $3E53
       .byte $3F ; |  XXXXXX| $3E54
       .byte $3F ; |  XXXXXX| $3E55
       .byte $3F ; |  XXXXXX| $3E56
       .byte $3F ; |  XXXXXX| $3E57
       .byte $3F ; |  XXXXXX| $3E58
       .byte $3F ; |  XXXXXX| $3E59
       .byte $00 ; |        | $3E5A
       .byte $3F ; |  XXXXXX| $3E5B
       .byte $FF ; |XXXXXXXX| $3E5C
       .byte $FF ; |XXXXXXXX| $3E5D
       .byte $FF ; |XXXXXXXX| $3E5E
       .byte $3F ; |  XXXXXX| $3E5F
       .byte $3F ; |  XXXXXX| $3E60
       .byte $3F ; |  XXXXXX| $3E61
       .byte $3F ; |  XXXXXX| $3E62
       .byte $00 ; |        | $3E63
       .byte $FF ; |XXXXXXXX| $3E64
       .byte $FF ; |XXXXXXXX| $3E65
       .byte $FF ; |XXXXXXXX| $3E66
       .byte $FF ; |XXXXXXXX| $3E67
       .byte $FF ; |XXXXXXXX| $3E68
       .byte $FF ; |XXXXXXXX| $3E69
       .byte $3F ; |  XXXXXX| $3E6A
       .byte $00 ; |        | $3E6B
       .byte $0F ; |    XXXX| $3E6C
       .byte $3F ; |  XXXXXX| $3E6D
       .byte $3F ; |  XXXXXX| $3E6E
       .byte $3F ; |  XXXXXX| $3E6F
       .byte $3F ; |  XXXXXX| $3E70
       .byte $3F ; |  XXXXXX| $3E71
       .byte $3F ; |  XXXXXX| $3E72
       .byte $00 ; |        | $3E73
       .byte $C0 ; |XX      | $3E74
       .byte $0F ; |    XXXX| $3E75
       .byte $3F ; |  XXXXXX| $3E76
       .byte $3F ; |  XXXXXX| $3E77
       .byte $3F ; |  XXXXXX| $3E78
       .byte $3F ; |  XXXXXX| $3E79
       .byte $3F ; |  XXXXXX| $3E7A
       .byte $00 ; |        | $3E7B
L3E7C: .byte $7F ; | XXXXXXX| $3E7C
       .byte $BF ; |X XXXXXX| $3E7D
       .byte $DF ; |XX XXXXX| $3E7E
       .byte $EF ; |XXX XXXX| $3E7F
       .byte $F7 ; |XXXX XXX| $3E80
       .byte $FB ; |XXXXX XX| $3E81
       .byte $FD ; |XXXXXX X| $3E82
       .byte $FE ; |XXXXXXX | $3E83
       .byte $FE ; |XXXXXXX | $3E84
       .byte $FD ; |XXXXXX X| $3E85
       .byte $FB ; |XXXXX XX| $3E86
       .byte $F7 ; |XXXX XXX| $3E87
       .byte $EF ; |XXX XXXX| $3E88
       .byte $DF ; |XX XXXXX| $3E89
       .byte $BF ; |X XXXXXX| $3E8A
       .byte $7F ; | XXXXXXX| $3E8B
       .byte $7F ; | XXXXXXX| $3E8C
       .byte $BF ; |X XXXXXX| $3E8D
       .byte $DF ; |XX XXXXX| $3E8E
       .byte $EF ; |XXX XXXX| $3E8F
       .byte $F7 ; |XXXX XXX| $3E90
       .byte $FB ; |XXXXX XX| $3E91
       .byte $FD ; |XXXXXX X| $3E92
       .byte $FE ; |XXXXXXX | $3E93
       .byte $FE ; |XXXXXXX | $3E94
       .byte $FD ; |XXXXXX X| $3E95
       .byte $FB ; |XXXXX XX| $3E96
       .byte $F7 ; |XXXX XXX| $3E97
       .byte $EF ; |XXX XXXX| $3E98
       .byte $DF ; |XX XXXXX| $3E99
       .byte $BF ; |X XXXXXX| $3E9A
       .byte $7F ; | XXXXXXX| $3E9B
L3E9C: .byte $98 ; |X  XX   | $3E9C
       .byte $A0 ; |X X     | $3E9D
       .byte $A8 ; |X X X   | $3E9E
       .byte $B0 ; |X XX    | $3E9F
L3EA0: .byte $25 ; |  X  X X| $3EA0
       .byte $36 ; |  XX XX | $3EA1
       .byte $24 ; |  X  X  | $3EA2
       .byte $21 ; |  X    X| $3EA3
       .byte $26 ; |  X  XX | $3EA4
       .byte $25 ; |  X  X X| $3EA5
       .byte $4E ; | X  XXX | $3EA6
       .byte $2A ; |  X X X | $3EA7
L3EA8: .byte $0E ; |    XXX | $3EA8
       .byte $53 ; | X X  XX| $3EA9
       .byte $52 ; | X X  X | $3EAA
       .byte $57 ; | X X XXX| $3EAB
       .byte $6C ; | XX XX  | $3EAC
       .byte $5B ; | X XX XX| $3EAD
       .byte $5F ; | X XXXXX| $3EAE
       .byte $15 ; |   X X X| $3EAF
L3EB0: .byte $1D ; |   XXX X| $3EB0
       .byte $07 ; |     XXX| $3EB1
       .byte $26 ; |  X  XX | $3EB2
       .byte $29 ; |  X X  X| $3EB3
       .byte $63 ; | XX   XX| $3EB4
       .byte $1D ; |   XXX X| $3EB5
       .byte $21 ; |  X    X| $3EB6
       .byte $19 ; |   XX  X| $3EB7
L3EB8: .byte $46 ; | X   XX | $3EB8
       .byte $32 ; |  XX  X | $3EB9
       .byte $64 ; | XX  X  | $3EBA
       .byte $20 ; |  X     | $3EBB
       .byte $3E ; |  XXXXX | $3EBC
       .byte $74 ; | XXX X  | $3EBD
       .byte $4F ; | X  XXXX| $3EBE
       .byte $42 ; | X    X | $3EBF
L3EC0: .byte $28 ; |  X X   | $3EC0
       .byte $60 ; | XX     | $3EC1
       .byte $28 ; |  X X   | $3EC2
       .byte $18 ; |   XX   | $3EC3
       .byte $50 ; | X X    | $3EC4
       .byte $00 ; |        | $3EC5
       .byte $08 ; |    X   | $3EC6
       .byte $38 ; |  XXX   | $3EC7
L3EC8: .byte $08 ; |    X   | $3EC8
       .byte $50 ; | X X    | $3EC9
       .byte $30 ; |  XX    | $3ECA
       .byte $70 ; | XXX    | $3ECB
       .byte $48 ; | X  X   | $3ECC
       .byte $30 ; |  XX    | $3ECD
       .byte $38 ; |  XXX   | $3ECE
       .byte $68 ; | XX X   | $3ECF
L3ED0: .byte $68 ; | XX X   | $3ED0
       .byte $48 ; | X  X   | $3ED1
       .byte $50 ; | X X    | $3ED2
       .byte $28 ; |  X X   | $3ED3
       .byte $20 ; |  X     | $3ED4
       .byte $40 ; | X      | $3ED5
       .byte $40 ; | X      | $3ED6
       .byte $08 ; |    X   | $3ED7
L3ED8: .byte $20 ; |  X     | $3ED8
       .byte $28 ; |  X X   | $3ED9
       .byte $18 ; |   XX   | $3EDA
       .byte $30 ; |  XX    | $3EDB
       .byte $68 ; | XX X   | $3EDC
       .byte $70 ; | XXX    | $3EDD
       .byte $48 ; | X  X   | $3EDE
       .byte $18 ; |   XX   | $3EDF
L3EE0: .byte $48 ; | X  X   | $3EE0
       .byte $68 ; | XX X   | $3EE1
       .byte $08 ; |    X   | $3EE2
       .byte $48 ; | X  X   | $3EE3
       .byte $08 ; |    X   | $3EE4
       .byte $48 ; | X  X   | $3EE5
       .byte $08 ; |    X   | $3EE6
       .byte $40 ; | X      | $3EE7
L3EE8: .byte $58 ; | X XX   | $3EE8
       .byte $68 ; | XX X   | $3EE9
       .byte $48 ; | X  X   | $3EEA
       .byte $40 ; | X      | $3EEB
       .byte $48 ; | X  X   | $3EEC
       .byte $60 ; | XX     | $3EED
       .byte $28 ; |  X X   | $3EEE
       .byte $50 ; | X X    | $3EEF
L3EF0: .byte $18 ; |   XX   | $3EF0
       .byte $10 ; |   X    | $3EF1
       .byte $70 ; | XXX    | $3EF2
       .byte $08 ; |    X   | $3EF3
       .byte $70 ; | XXX    | $3EF4
       .byte $30 ; |  XX    | $3EF5
       .byte $20 ; |  X     | $3EF6
       .byte $48 ; | X  X   | $3EF7
L3EF8: .byte $28 ; |  X X   | $3EF8
       .byte $30 ; |  XX    | $3EF9
       .byte $40 ; | X      | $3EFA
       .byte $28 ; |  X X   | $3EFB
       .byte $28 ; |  X X   | $3EFC
       .byte $28 ; |  X X   | $3EFD
       .byte $48 ; | X  X   | $3EFE
       .byte $00 ; |        | $3EFF
L3F00: .byte $01 ; |       X| $3F00
L3F01: .byte $00 ; |        | $3F01
       .byte $02 ; |      X | $3F02
       .byte $02 ; |      X | $3F03
       .byte $02 ; |      X | $3F04
       .byte $04 ; |     X  | $3F05
       .byte $03 ; |      XX| $3F06
       .byte $02 ; |      X | $3F07
       .byte $02 ; |      X | $3F08
       .byte $08 ; |    X   | $3F09
       .byte $00 ; |        | $3F0A
       .byte $00 ; |        | $3F0B
       .byte $03 ; |      XX| $3F0C
       .byte $04 ; |     X  | $3F0D
L3F0E: .byte $15 ; |   X X X| $3F0E
       .byte $17 ; |   X XXX| $3F0F
       .byte $17 ; |   X XXX| $3F10
       .byte $1B ; |   XX XX| $3F11
       .byte $17 ; |   X XXX| $3F12
       .byte $00 ; |        | $3F13
       .byte $21 ; |  X    X| $3F14
       .byte $00 ; |        | $3F15
       .byte $00 ; |        | $3F16
       .byte $80 ; |X       | $3F17
       .byte $01 ; |       X| $3F18
       .byte $80 ; |X       | $3F19
       .byte $00 ; |        | $3F1A
       .byte $81 ; |X      X| $3F1B
       .byte $01 ; |       X| $3F1C
       .byte $82 ; |X     X | $3F1D
       .byte $00 ; |        | $3F1E
       .byte $81 ; |X      X| $3F1F
       .byte $00 ; |        | $3F20
       .byte $82 ; |X     X | $3F21
       .byte $01 ; |       X| $3F22
       .byte $84 ; |X    X  | $3F23
       .byte $00 ; |        | $3F24
       .byte $82 ; |X     X | $3F25
       .byte $00 ; |        | $3F26
L3F27: .byte $2F ; |  X XXXX| $3F27
       .byte $3D ; |  XXXX X| $3F28
       .byte $45 ; | X   X X| $3F29
       .byte $4D ; | X  XX X| $3F2A
       .byte $35 ; |  XX X X| $3F2B
       .byte $55 ; | X X X X| $3F2C
       .byte $5D ; | X XXX X| $3F2D
       .byte $65 ; | XX  X X| $3F2E
       .byte $83 ; |X     XX| $3F2F
       .byte $83 ; |X     XX| $3F30
       .byte $D3 ; |XX X  XX| $3F31
       .byte $D3 ; |XX X  XX| $3F32
       .byte $C3 ; |XX    XX| $3F33
       .byte $C3 ; |XX    XX| $3F34
       .byte $83 ; |X     XX| $3F35
       .byte $83 ; |X     XX| $3F36
       .byte $93 ; |X  X  XX| $3F37
       .byte $93 ; |X  X  XX| $3F38
       .byte $C3 ; |XX    XX| $3F39
       .byte $C3 ; |XX    XX| $3F3A
       .byte $DB ; |XX XX XX| $3F3B
       .byte $DB ; |XX XX XX| $3F3C
       .byte $8B ; |X   X XX| $3F3D
       .byte $8B ; |X   X XX| $3F3E
       .byte $C3 ; |XX    XX| $3F3F
       .byte $C3 ; |XX    XX| $3F40
       .byte $83 ; |X     XX| $3F41
       .byte $83 ; |X     XX| $3F42
       .byte $DB ; |XX XX XX| $3F43
       .byte $DB ; |XX XX XX| $3F44
       .byte $CB ; |XX  X XX| $3F45
       .byte $CB ; |XX  X XX| $3F46
       .byte $93 ; |X  X  XX| $3F47
       .byte $93 ; |X  X  XX| $3F48
       .byte $DB ; |XX XX XX| $3F49
       .byte $DB ; |XX XX XX| $3F4A
       .byte $83 ; |X     XX| $3F4B
       .byte $83 ; |X     XX| $3F4C
       .byte $93 ; |X  X  XX| $3F4D
       .byte $93 ; |X  X  XX| $3F4E
       .byte $DB ; |XX XX XX| $3F4F
       .byte $DB ; |XX XX XX| $3F50
       .byte $83 ; |X     XX| $3F51
       .byte $83 ; |X     XX| $3F52
       .byte $CB ; |XX  X XX| $3F53
       .byte $CB ; |XX  X XX| $3F54
       .byte $83 ; |X     XX| $3F55
       .byte $83 ; |X     XX| $3F56
       .byte $9B ; |X  XX XX| $3F57
       .byte $9B ; |X  XX XX| $3F58
       .byte $CB ; |XX  X XX| $3F59
       .byte $CB ; |XX  X XX| $3F5A
       .byte $8B ; |X   X XX| $3F5B
       .byte $8B ; |X   X XX| $3F5C
       .byte $D3 ; |XX X  XX| $3F5D
       .byte $D3 ; |XX X  XX| $3F5E
       .byte $93 ; |X  X  XX| $3F5F
       .byte $93 ; |X  X  XX| $3F60
       .byte $D3 ; |XX X  XX| $3F61
       .byte $D3 ; |XX X  XX| $3F62
       .byte $93 ; |X  X  XX| $3F63
       .byte $93 ; |X  X  XX| $3F64
       .byte $8B ; |X   X XX| $3F65
       .byte $8B ; |X   X XX| $3F66
       .byte $CB ; |XX  X XX| $3F67
       .byte $CB ; |XX  X XX| $3F68
       .byte $93 ; |X  X  XX| $3F69
       .byte $93 ; |X  X  XX| $3F6A
       .byte $C3 ; |XX    XX| $3F6B
       .byte $C3 ; |XX    XX| $3F6C
L3F6D: .byte $09 ; |    X  X| $3F6D
       .byte $09 ; |    X  X| $3F6E
       .byte $08 ; |    X   | $3F6F
       .byte $05 ; |     X X| $3F70
       .byte $02 ; |      X | $3F71
       .byte $07 ; |     XXX| $3F72
       .byte $02 ; |      X | $3F73
       .byte $04 ; |     X  | $3F74
       .byte $09 ; |    X  X| $3F75
       .byte $02 ; |      X | $3F76
       .byte $05 ; |     X X| $3F77
       .byte $04 ; |     X  | $3F78
       .byte $03 ; |      XX| $3F79
       .byte $02 ; |      X | $3F7A
       .byte $05 ; |     X X| $3F7B
       .byte $01 ; |       X| $3F7C
       .byte $01 ; |       X| $3F7D
       .byte $02 ; |      X | $3F7E
       .byte $03 ; |      XX| $3F7F
       .byte $04 ; |     X  | $3F80
L3F81: .byte $81 ; |X      X| $3F81
       .byte $81 ; |X      X| $3F82
       .byte $82 ; |X     X | $3F83
       .byte $82 ; |X     X | $3F84
       .byte $85 ; |X    X X| $3F85
       .byte $82 ; |X     X | $3F86
       .byte $81 ; |X      X| $3F87
       .byte $83 ; |X     XX| $3F88
       .byte $84 ; |X    X  | $3F89
       .byte $85 ; |X    X X| $3F8A
       .byte $84 ; |X    X  | $3F8B
       .byte $85 ; |X    X X| $3F8C
       .byte $83 ; |X     XX| $3F8D
       .byte $81 ; |X      X| $3F8E
       .byte $85 ; |X    X X| $3F8F
       .byte $83 ; |X     XX| $3F90
       .byte $83 ; |X     XX| $3F91
       .byte $84 ; |X    X  | $3F92
       .byte $81 ; |X      X| $3F93
       .byte $82 ; |X     X | $3F94
L3F95: .byte $00 ; |        | $3F95
       .byte $00 ; |        | $3F96
       .byte $00 ; |        | $3F97
       .byte $08 ; |    X   | $3F98
       .byte $01 ; |       X| $3F99
       .byte $04 ; |     X  | $3F9A
       .byte $06 ; |     XX | $3F9B
       .byte $03 ; |      XX| $3F9C
       .byte $0A ; |    X X | $3F9D
       .byte $0F ; |    XXXX| $3F9E
       .byte $0C ; |    XX  | $3F9F
       .byte $09 ; |    X  X| $3FA0
       .byte $07 ; |     XXX| $3FA1
       .byte $0B ; |    X XX| $3FA2
       .byte $0F ; |    XXXX| $3FA3
       .byte $0D ; |    XX X| $3FA4
       .byte $0E ; |    XXX | $3FA5
       .byte $0F ; |    XXXX| $3FA6
       .byte $0E ; |    XXX | $3FA7
       .byte $0F ; |    XXXX| $3FA8
L3FA9: LDA    $BD,X                  ;4
       BMI    L3FE6                  ;2
       AND    #$0F                   ;2
       STA    $EF                    ;3
       LDA    #$0F                   ;2
       SEC                           ;2
       SBC    $B9                    ;3
       STA    $F0                    ;3
       LDA    $BD,X                  ;4
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       LSR                           ;2
       SEC                           ;2
       SBC    $BA                    ;3
       BNE    L3FCB                  ;2
       LDA    $F0                    ;3
       CMP    $EF                    ;3
       BCS    L3FD5                  ;2
       BCC    L3FE6                  ;2
L3FCB: CMP    #$01                   ;2
       BNE    L3FE6                  ;2
       LDA    $F0                    ;3
       CMP    $EF                    ;3
       BCS    L3FE6                  ;2
L3FD5: LDA    $C0,X                  ;4
       CMP    $BB                    ;3
       BCS    L3FE6                  ;2
       ADC    #$06                   ;2
       CMP    $BB                    ;3
       BCC    L3FE6                  ;2
       LDA    #$80                   ;2
       STA    $BA                    ;3
       RTS                           ;6

L3FE6: CLC                           ;2
       RTS                           ;6

L3FE8: .byte $C0 ; |XX      | $3FE8
       .byte $30 ; |  XX    | $3FE9
       .byte $0C ; |    XX  | $3FEA
       .byte $03 ; |      XX| $3FEB
       .byte $03 ; |      XX| $3FEC
       .byte $0C ; |    XX  | $3FED
       .byte $30 ; |  XX    | $3FEE
       .byte $C0 ; |XX      | $3FEF
       .byte $C0 ; |XX      | $3FF0
       .byte $30 ; |  XX    | $3FF1
       .byte $0C ; |    XX  | $3FF2
       .byte $03 ; |      XX| $3FF3
       .byte $03 ; |      XX| $3FF4
       .byte $0C ; |    XX  | $3FF5
       .byte $30 ; |  XX    | $3FF6
       .byte $C0 ; |XX      | $3FF7
       .byte $03 ; |      XX| $3FF8
L3FF9: .byte $FF ; |XXXXXXXX| $3FF9
       .byte $01 ; |       X| $3FFA
       .byte $16 ; |   X XX | $3FFB

       .word START

       .byte $4D ; | X  XX X| $3FFE
       .byte $B7 ; |X XX XXX| $3FFF
