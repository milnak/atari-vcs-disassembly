
  MAC MOVE_INDEX_UP_ONE_ROW
    dex
    dex
  ENDM

  MAC MOVE_INDEX_DOWN_ONE_ROW
    inx
    inx
  ENDM

  MAC GET_STONE_BIT_POSITION
    lda    #ONE_STONE
    dey
.loopFindStone:
    lsr
    dey
    bne    .loopFindStone
  ENDM

  MAC TEST_STONE_BIT
    lda    stoneOrder,X
.loopTestStoneBit:
    asl
    dey
    bne    .loopTestStoneBit
  ENDM

  MAC REMOVE_STONE
    eor    #$FF
    and    stoneOrder,X
    sta    stoneOrder,X
  ENDM

  MAC ADD_STONE
    ora    stoneOrder,X
    sta    stoneOrder,X
  ENDM

  MAC EXIT_UNLESS_SUBFRAME
    cmp    #{1}
    beq    .contRoutine
    rts
.contRoutine:
  ENDM

  MAC EXIT_IF_STONE_SLIDING
    lda    movingStone
    bpl    .contRoutine
    rts
.contRoutine:
  ENDM

  MAC CONTINUE_IF_STONE_SLIDING
    lda    movingStone
    bmi    .contRoutine
    rts
.contRoutine:
  ENDM

  MAC SET_CAVEMAN_PTRS
    lda #<{1}
    sta cavemanPtr
    lda #>{1}
    sta cavemanPtr+1
    lda #<{2}
    sta cavemanColPtr
    lda #>{2}
    sta cavemanColPtr+1
  ENDM

  MAC DO_STONE_THROW
    lda    movingStone
    ora    #STONE_MOVING_FLAG
    sta    movingStone
    lda    #TONE_SLIDING_STONE
    sta    AUDC1
    lda    #FREQ_SLIDING_STONE
    sta    AUDF1
    lda    #VOL_SLIDING_STONE
    sta    AUDV1
  ENDM

  MAC stones
    .word {1}
  ENDM

  MAC dino1PosXY
    checkX {1}
    checkY {2}
    .byte ((NUM_OF_ROWS+1-{2})<<4) | {1}
  ENDM

  MAC dino2PosXY
    checkX {1}
    checkY {2}
    .byte ((NUM_OF_ROWS+1-{2})<<4) | {1}
  ENDM

  MAC dino3PosXY
    checkX {1}
    checkY {2}
    .byte ((NUM_OF_ROWS+1-{2})<<4) | {1}
  ENDM

  MAC dino4PosXY
    checkX {1}
    checkY {2}
    .byte ((NUM_OF_ROWS+1-{2})<<4) | {1}
  ENDM

  MAC cavemanPosXY
    checkX {1}
    checkY {2}
    .byte NUM_OF_ROWS+1-{2}
    .byte {1}
  ENDM


  MAC checkX
     IF ({1} = 0)
       postionError
     ENDIF
     IF ({1} > NUM_OF_COLUMNS)
       postionError
     ENDIF
  ENDM
  MAC checkY
     IF ({1} = 0)
       postionError
     ENDIF
     IF ({1} > NUM_OF_ROWS)
       postionError
     ENDIF
  ENDM
  MAC postionError
    ECHO "ERROR AT", *,"- Valid coordinate range is (1 to NUM_OF_COLUMNS) for X, and (1 to NUM_OF_ROWS) for Y."
    ECHO "NUM_OF_COLUMNS =", ([NUM_OF_COLUMNS]d)
    ECHO "NUM_OF_ROWS =", ([NUM_OF_ROWS]d)
    ERR
  ENDM

__________ = $0000
_________X = $0100
________X_ = $0200
________XX = $0300
_______X__ = $0400
_______X_X = $0500
_______XX_ = $0600
_______XXX = $0700
______X___ = $0800
______X__X = $0900
______X_X_ = $0A00
______X_XX = $0B00
______XX__ = $0C00
______XX_X = $0D00
______XXX_ = $0E00
______XXXX = $0F00
_____X____ = $1000
_____X___X = $1100
_____X__X_ = $1200
_____X__XX = $1300
_____X_X__ = $1400
_____X_X_X = $1500
_____X_XX_ = $1600
_____X_XXX = $1700
_____XX___ = $1800
_____XX__X = $1900
_____XX_X_ = $1A00
_____XX_XX = $1B00
_____XXX__ = $1C00
_____XXX_X = $1D00
_____XXXX_ = $1E00
_____XXXXX = $1F00
____X_____ = $0001
____X____X = $0101
____X___X_ = $0201
____X___XX = $0301
____X__X__ = $0401
____X__X_X = $0501
____X__XX_ = $0601
____X__XXX = $0701
____X_X___ = $0801
____X_X__X = $0901
____X_X_X_ = $0A01
____X_X_XX = $0B01
____X_XX__ = $0C01
____X_XX_X = $0D01
____X_XXX_ = $0E01
____X_XXXX = $0F01
____XX____ = $1001
____XX___X = $1101
____XX__X_ = $1201
____XX__XX = $1301
____XX_X__ = $1401
____XX_X_X = $1501
____XX_XX_ = $1601
____XX_XXX = $1701
____XXX___ = $1801
____XXX__X = $1901
____XXX_X_ = $1A01
____XXX_XX = $1B01
____XXXX__ = $1C01
____XXXX_X = $1D01
____XXXXX_ = $1E01
____XXXXXX = $1F01
___X______ = $0002
___X_____X = $0102
___X____X_ = $0202
___X____XX = $0302
___X___X__ = $0402
___X___X_X = $0502
___X___XX_ = $0602
___X___XXX = $0702
___X__X___ = $0802
___X__X__X = $0902
___X__X_X_ = $0A02
___X__X_XX = $0B02
___X__XX__ = $0C02
___X__XX_X = $0D02
___X__XXX_ = $0E02
___X__XXXX = $0F02
___X_X____ = $1002
___X_X___X = $1102
___X_X__X_ = $1202
___X_X__XX = $1302
___X_X_X__ = $1402
___X_X_X_X = $1502
___X_X_XX_ = $1602
___X_X_XXX = $1702
___X_XX___ = $1802
___X_XX__X = $1902
___X_XX_X_ = $1A02
___X_XX_XX = $1B02
___X_XXX__ = $1C02
___X_XXX_X = $1D02
___X_XXXX_ = $1E02
___X_XXXXX = $1F02
___XX_____ = $0003
___XX____X = $0103
___XX___X_ = $0203
___XX___XX = $0303
___XX__X__ = $0403
___XX__X_X = $0503
___XX__XX_ = $0603
___XX__XXX = $0703
___XX_X___ = $0803
___XX_X__X = $0903
___XX_X_X_ = $0A03
___XX_X_XX = $0B03
___XX_XX__ = $0C03
___XX_XX_X = $0D03
___XX_XXX_ = $0E03
___XX_XXXX = $0F03
___XXX____ = $1003
___XXX___X = $1103
___XXX__X_ = $1203
___XXX__XX = $1303
___XXX_X__ = $1403
___XXX_X_X = $1503
___XXX_XX_ = $1603
___XXX_XXX = $1703
___XXXX___ = $1803
___XXXX__X = $1903
___XXXX_X_ = $1A03
___XXXX_XX = $1B03
___XXXXX__ = $1C03
___XXXXX_X = $1D03
___XXXXXX_ = $1E03
___XXXXXXX = $1F03
__X_______ = $0004
__X______X = $0104
__X_____X_ = $0204
__X_____XX = $0304
__X____X__ = $0404
__X____X_X = $0504
__X____XX_ = $0604
__X____XXX = $0704
__X___X___ = $0804
__X___X__X = $0904
__X___X_X_ = $0A04
__X___X_XX = $0B04
__X___XX__ = $0C04
__X___XX_X = $0D04
__X___XXX_ = $0E04
__X___XXXX = $0F04
__X__X____ = $1004
__X__X___X = $1104
__X__X__X_ = $1204
__X__X__XX = $1304
__X__X_X__ = $1404
__X__X_X_X = $1504
__X__X_XX_ = $1604
__X__X_XXX = $1704
__X__XX___ = $1804
__X__XX__X = $1904
__X__XX_X_ = $1A04
__X__XX_XX = $1B04
__X__XXX__ = $1C04
__X__XXX_X = $1D04
__X__XXXX_ = $1E04
__X__XXXXX = $1F04
__X_X_____ = $0005
__X_X____X = $0105
__X_X___X_ = $0205
__X_X___XX = $0305
__X_X__X__ = $0405
__X_X__X_X = $0505
__X_X__XX_ = $0605
__X_X__XXX = $0705
__X_X_X___ = $0805
__X_X_X__X = $0905
__X_X_X_X_ = $0A05
__X_X_X_XX = $0B05
__X_X_XX__ = $0C05
__X_X_XX_X = $0D05
__X_X_XXX_ = $0E05
__X_X_XXXX = $0F05
__X_XX____ = $1005
__X_XX___X = $1105
__X_XX__X_ = $1205
__X_XX__XX = $1305
__X_XX_X__ = $1405
__X_XX_X_X = $1505
__X_XX_XX_ = $1605
__X_XX_XXX = $1705
__X_XXX___ = $1805
__X_XXX__X = $1905
__X_XXX_X_ = $1A05
__X_XXX_XX = $1B05
__X_XXXX__ = $1C05
__X_XXXX_X = $1D05
__X_XXXXX_ = $1E05
__X_XXXXXX = $1F05
__XX______ = $0006
__XX_____X = $0106
__XX____X_ = $0206
__XX____XX = $0306
__XX___X__ = $0406
__XX___X_X = $0506
__XX___XX_ = $0606
__XX___XXX = $0706
__XX__X___ = $0806
__XX__X__X = $0906
__XX__X_X_ = $0A06
__XX__X_XX = $0B06
__XX__XX__ = $0C06
__XX__XX_X = $0D06
__XX__XXX_ = $0E06
__XX__XXXX = $0F06
__XX_X____ = $1006
__XX_X___X = $1106
__XX_X__X_ = $1206
__XX_X__XX = $1306
__XX_X_X__ = $1406
__XX_X_X_X = $1506
__XX_X_XX_ = $1606
__XX_X_XXX = $1706
__XX_XX___ = $1806
__XX_XX__X = $1906
__XX_XX_X_ = $1A06
__XX_XX_XX = $1B06
__XX_XXX__ = $1C06
__XX_XXX_X = $1D06
__XX_XXXX_ = $1E06
__XX_XXXXX = $1F06
__XXX_____ = $0007
__XXX____X = $0107
__XXX___X_ = $0207
__XXX___XX = $0307
__XXX__X__ = $0407
__XXX__X_X = $0507
__XXX__XX_ = $0607
__XXX__XXX = $0707
__XXX_X___ = $0807
__XXX_X__X = $0907
__XXX_X_X_ = $0A07
__XXX_X_XX = $0B07
__XXX_XX__ = $0C07
__XXX_XX_X = $0D07
__XXX_XXX_ = $0E07
__XXX_XXXX = $0F07
__XXXX____ = $1007
__XXXX___X = $1107
__XXXX__X_ = $1207
__XXXX__XX = $1307
__XXXX_X__ = $1407
__XXXX_X_X = $1507
__XXXX_XX_ = $1607
__XXXX_XXX = $1707
__XXXXX___ = $1807
__XXXXX__X = $1907
__XXXXX_X_ = $1A07
__XXXXX_XX = $1B07
__XXXXXX__ = $1C07
__XXXXXX_X = $1D07
__XXXXXXX_ = $1E07
__XXXXXXXX = $1F07
_X________ = $0008
_X_______X = $0108
_X______X_ = $0208
_X______XX = $0308
_X_____X__ = $0408
_X_____X_X = $0508
_X_____XX_ = $0608
_X_____XXX = $0708
_X____X___ = $0808
_X____X__X = $0908
_X____X_X_ = $0A08
_X____X_XX = $0B08
_X____XX__ = $0C08
_X____XX_X = $0D08
_X____XXX_ = $0E08
_X____XXXX = $0F08
_X___X____ = $1008
_X___X___X = $1108
_X___X__X_ = $1208
_X___X__XX = $1308
_X___X_X__ = $1408
_X___X_X_X = $1508
_X___X_XX_ = $1608
_X___X_XXX = $1708
_X___XX___ = $1808
_X___XX__X = $1908
_X___XX_X_ = $1A08
_X___XX_XX = $1B08
_X___XXX__ = $1C08
_X___XXX_X = $1D08
_X___XXXX_ = $1E08
_X___XXXXX = $1F08
_X__X_____ = $0009
_X__X____X = $0109
_X__X___X_ = $0209
_X__X___XX = $0309
_X__X__X__ = $0409
_X__X__X_X = $0509
_X__X__XX_ = $0609
_X__X__XXX = $0709
_X__X_X___ = $0809
_X__X_X__X = $0909
_X__X_X_X_ = $0A09
_X__X_X_XX = $0B09
_X__X_XX__ = $0C09
_X__X_XX_X = $0D09
_X__X_XXX_ = $0E09
_X__X_XXXX = $0F09
_X__XX____ = $1009
_X__XX___X = $1109
_X__XX__X_ = $1209
_X__XX__XX = $1309
_X__XX_X__ = $1409
_X__XX_X_X = $1509
_X__XX_XX_ = $1609
_X__XX_XXX = $1709
_X__XXX___ = $1809
_X__XXX__X = $1909
_X__XXX_X_ = $1A09
_X__XXX_XX = $1B09
_X__XXXX__ = $1C09
_X__XXXX_X = $1D09
_X__XXXXX_ = $1E09
_X__XXXXXX = $1F09
_X_X______ = $000A
_X_X_____X = $010A
_X_X____X_ = $020A
_X_X____XX = $030A
_X_X___X__ = $040A
_X_X___X_X = $050A
_X_X___XX_ = $060A
_X_X___XXX = $070A
_X_X__X___ = $080A
_X_X__X__X = $090A
_X_X__X_X_ = $0A0A
_X_X__X_XX = $0B0A
_X_X__XX__ = $0C0A
_X_X__XX_X = $0D0A
_X_X__XXX_ = $0E0A
_X_X__XXXX = $0F0A
_X_X_X____ = $100A
_X_X_X___X = $110A
_X_X_X__X_ = $120A
_X_X_X__XX = $130A
_X_X_X_X__ = $140A
_X_X_X_X_X = $150A
_X_X_X_XX_ = $160A
_X_X_X_XXX = $170A
_X_X_XX___ = $180A
_X_X_XX__X = $190A
_X_X_XX_X_ = $1A0A
_X_X_XX_XX = $1B0A
_X_X_XXX__ = $1C0A
_X_X_XXX_X = $1D0A
_X_X_XXXX_ = $1E0A
_X_X_XXXXX = $1F0A
_X_XX_____ = $000B
_X_XX____X = $010B
_X_XX___X_ = $020B
_X_XX___XX = $030B
_X_XX__X__ = $040B
_X_XX__X_X = $050B
_X_XX__XX_ = $060B
_X_XX__XXX = $070B
_X_XX_X___ = $080B
_X_XX_X__X = $090B
_X_XX_X_X_ = $0A0B
_X_XX_X_XX = $0B0B
_X_XX_XX__ = $0C0B
_X_XX_XX_X = $0D0B
_X_XX_XXX_ = $0E0B
_X_XX_XXXX = $0F0B
_X_XXX____ = $100B
_X_XXX___X = $110B
_X_XXX__X_ = $120B
_X_XXX__XX = $130B
_X_XXX_X__ = $140B
_X_XXX_X_X = $150B
_X_XXX_XX_ = $160B
_X_XXX_XXX = $170B
_X_XXXX___ = $180B
_X_XXXX__X = $190B
_X_XXXX_X_ = $1A0B
_X_XXXX_XX = $1B0B
_X_XXXXX__ = $1C0B
_X_XXXXX_X = $1D0B
_X_XXXXXX_ = $1E0B
_X_XXXXXXX = $1F0B
_XX_______ = $000C
_XX______X = $010C
_XX_____X_ = $020C
_XX_____XX = $030C
_XX____X__ = $040C
_XX____X_X = $050C
_XX____XX_ = $060C
_XX____XXX = $070C
_XX___X___ = $080C
_XX___X__X = $090C
_XX___X_X_ = $0A0C
_XX___X_XX = $0B0C
_XX___XX__ = $0C0C
_XX___XX_X = $0D0C
_XX___XXX_ = $0E0C
_XX___XXXX = $0F0C
_XX__X____ = $100C
_XX__X___X = $110C
_XX__X__X_ = $120C
_XX__X__XX = $130C
_XX__X_X__ = $140C
_XX__X_X_X = $150C
_XX__X_XX_ = $160C
_XX__X_XXX = $170C
_XX__XX___ = $180C
_XX__XX__X = $190C
_XX__XX_X_ = $1A0C
_XX__XX_XX = $1B0C
_XX__XXX__ = $1C0C
_XX__XXX_X = $1D0C
_XX__XXXX_ = $1E0C
_XX__XXXXX = $1F0C
_XX_X_____ = $000D
_XX_X____X = $010D
_XX_X___X_ = $020D
_XX_X___XX = $030D
_XX_X__X__ = $040D
_XX_X__X_X = $050D
_XX_X__XX_ = $060D
_XX_X__XXX = $070D
_XX_X_X___ = $080D
_XX_X_X__X = $090D
_XX_X_X_X_ = $0A0D
_XX_X_X_XX = $0B0D
_XX_X_XX__ = $0C0D
_XX_X_XX_X = $0D0D
_XX_X_XXX_ = $0E0D
_XX_X_XXXX = $0F0D
_XX_XX____ = $100D
_XX_XX___X = $110D
_XX_XX__X_ = $120D
_XX_XX__XX = $130D
_XX_XX_X__ = $140D
_XX_XX_X_X = $150D
_XX_XX_XX_ = $160D
_XX_XX_XXX = $170D
_XX_XXX___ = $180D
_XX_XXX__X = $190D
_XX_XXX_X_ = $1A0D
_XX_XXX_XX = $1B0D
_XX_XXXX__ = $1C0D
_XX_XXXX_X = $1D0D
_XX_XXXXX_ = $1E0D
_XX_XXXXXX = $1F0D
_XXX______ = $000E
_XXX_____X = $010E
_XXX____X_ = $020E
_XXX____XX = $030E
_XXX___X__ = $040E
_XXX___X_X = $050E
_XXX___XX_ = $060E
_XXX___XXX = $070E
_XXX__X___ = $080E
_XXX__X__X = $090E
_XXX__X_X_ = $0A0E
_XXX__X_XX = $0B0E
_XXX__XX__ = $0C0E
_XXX__XX_X = $0D0E
_XXX__XXX_ = $0E0E
_XXX__XXXX = $0F0E
_XXX_X____ = $100E
_XXX_X___X = $110E
_XXX_X__X_ = $120E
_XXX_X__XX = $130E
_XXX_X_X__ = $140E
_XXX_X_X_X = $150E
_XXX_X_XX_ = $160E
_XXX_X_XXX = $170E
_XXX_XX___ = $180E
_XXX_XX__X = $190E
_XXX_XX_X_ = $1A0E
_XXX_XX_XX = $1B0E
_XXX_XXX__ = $1C0E
_XXX_XXX_X = $1D0E
_XXX_XXXX_ = $1E0E
_XXX_XXXXX = $1F0E
_XXXX_____ = $000F
_XXXX____X = $010F
_XXXX___X_ = $020F
_XXXX___XX = $030F
_XXXX__X__ = $040F
_XXXX__X_X = $050F
_XXXX__XX_ = $060F
_XXXX__XXX = $070F
_XXXX_X___ = $080F
_XXXX_X__X = $090F
_XXXX_X_X_ = $0A0F
_XXXX_X_XX = $0B0F
_XXXX_XX__ = $0C0F
_XXXX_XX_X = $0D0F
_XXXX_XXX_ = $0E0F
_XXXX_XXXX = $0F0F
_XXXXX____ = $100F
_XXXXX___X = $110F
_XXXXX__X_ = $120F
_XXXXX__XX = $130F
_XXXXX_X__ = $140F
_XXXXX_X_X = $150F
_XXXXX_XX_ = $160F
_XXXXX_XXX = $170F
_XXXXXX___ = $180F
_XXXXXX__X = $190F
_XXXXXX_X_ = $1A0F
_XXXXXX_XX = $1B0F
_XXXXXXX__ = $1C0F
_XXXXXXX_X = $1D0F
_XXXXXXXX_ = $1E0F
_XXXXXXXXX = $1F0F
X_________ = $0010
X________X = $0110
X_______X_ = $0210
X_______XX = $0310
X______X__ = $0410
X______X_X = $0510
X______XX_ = $0610
X______XXX = $0710
X_____X___ = $0810
X_____X__X = $0910
X_____X_X_ = $0A10
X_____X_XX = $0B10
X_____XX__ = $0C10
X_____XX_X = $0D10
X_____XXX_ = $0E10
X_____XXXX = $0F10
X____X____ = $1010
X____X___X = $1110
X____X__X_ = $1210
X____X__XX = $1310
X____X_X__ = $1410
X____X_X_X = $1510
X____X_XX_ = $1610
X____X_XXX = $1710
X____XX___ = $1810
X____XX__X = $1910
X____XX_X_ = $1A10
X____XX_XX = $1B10
X____XXX__ = $1C10
X____XXX_X = $1D10
X____XXXX_ = $1E10
X____XXXXX = $1F10
X___X_____ = $0011
X___X____X = $0111
X___X___X_ = $0211
X___X___XX = $0311
X___X__X__ = $0411
X___X__X_X = $0511
X___X__XX_ = $0611
X___X__XXX = $0711
X___X_X___ = $0811
X___X_X__X = $0911
X___X_X_X_ = $0A11
X___X_X_XX = $0B11
X___X_XX__ = $0C11
X___X_XX_X = $0D11
X___X_XXX_ = $0E11
X___X_XXXX = $0F11
X___XX____ = $1011
X___XX___X = $1111
X___XX__X_ = $1211
X___XX__XX = $1311
X___XX_X__ = $1411
X___XX_X_X = $1511
X___XX_XX_ = $1611
X___XX_XXX = $1711
X___XXX___ = $1811
X___XXX__X = $1911
X___XXX_X_ = $1A11
X___XXX_XX = $1B11
X___XXXX__ = $1C11
X___XXXX_X = $1D11
X___XXXXX_ = $1E11
X___XXXXXX = $1F11
X__X______ = $0012
X__X_____X = $0112
X__X____X_ = $0212
X__X____XX = $0312
X__X___X__ = $0412
X__X___X_X = $0512
X__X___XX_ = $0612
X__X___XXX = $0712
X__X__X___ = $0812
X__X__X__X = $0912
X__X__X_X_ = $0A12
X__X__X_XX = $0B12
X__X__XX__ = $0C12
X__X__XX_X = $0D12
X__X__XXX_ = $0E12
X__X__XXXX = $0F12
X__X_X____ = $1012
X__X_X___X = $1112
X__X_X__X_ = $1212
X__X_X__XX = $1312
X__X_X_X__ = $1412
X__X_X_X_X = $1512
X__X_X_XX_ = $1612
X__X_X_XXX = $1712
X__X_XX___ = $1812
X__X_XX__X = $1912
X__X_XX_X_ = $1A12
X__X_XX_XX = $1B12
X__X_XXX__ = $1C12
X__X_XXX_X = $1D12
X__X_XXXX_ = $1E12
X__X_XXXXX = $1F12
X__XX_____ = $0013
X__XX____X = $0113
X__XX___X_ = $0213
X__XX___XX = $0313
X__XX__X__ = $0413
X__XX__X_X = $0513
X__XX__XX_ = $0613
X__XX__XXX = $0713
X__XX_X___ = $0813
X__XX_X__X = $0913
X__XX_X_X_ = $0A13
X__XX_X_XX = $0B13
X__XX_XX__ = $0C13
X__XX_XX_X = $0D13
X__XX_XXX_ = $0E13
X__XX_XXXX = $0F13
X__XXX____ = $1013
X__XXX___X = $1113
X__XXX__X_ = $1213
X__XXX__XX = $1313
X__XXX_X__ = $1413
X__XXX_X_X = $1513
X__XXX_XX_ = $1613
X__XXX_XXX = $1713
X__XXXX___ = $1813
X__XXXX__X = $1913
X__XXXX_X_ = $1A13
X__XXXX_XX = $1B13
X__XXXXX__ = $1C13
X__XXXXX_X = $1D13
X__XXXXXX_ = $1E13
X__XXXXXXX = $1F13
X_X_______ = $0014
X_X______X = $0114
X_X_____X_ = $0214
X_X_____XX = $0314
X_X____X__ = $0414
X_X____X_X = $0514
X_X____XX_ = $0614
X_X____XXX = $0714
X_X___X___ = $0814
X_X___X__X = $0914
X_X___X_X_ = $0A14
X_X___X_XX = $0B14
X_X___XX__ = $0C14
X_X___XX_X = $0D14
X_X___XXX_ = $0E14
X_X___XXXX = $0F14
X_X__X____ = $1014
X_X__X___X = $1114
X_X__X__X_ = $1214
X_X__X__XX = $1314
X_X__X_X__ = $1414
X_X__X_X_X = $1514
X_X__X_XX_ = $1614
X_X__X_XXX = $1714
X_X__XX___ = $1814
X_X__XX__X = $1914
X_X__XX_X_ = $1A14
X_X__XX_XX = $1B14
X_X__XXX__ = $1C14
X_X__XXX_X = $1D14
X_X__XXXX_ = $1E14
X_X__XXXXX = $1F14
X_X_X_____ = $0015
X_X_X____X = $0115
X_X_X___X_ = $0215
X_X_X___XX = $0315
X_X_X__X__ = $0415
X_X_X__X_X = $0515
X_X_X__XX_ = $0615
X_X_X__XXX = $0715
X_X_X_X___ = $0815
X_X_X_X__X = $0915
X_X_X_X_X_ = $0A15
X_X_X_X_XX = $0B15
X_X_X_XX__ = $0C15
X_X_X_XX_X = $0D15
X_X_X_XXX_ = $0E15
X_X_X_XXXX = $0F15
X_X_XX____ = $1015
X_X_XX___X = $1115
X_X_XX__X_ = $1215
X_X_XX__XX = $1315
X_X_XX_X__ = $1415
X_X_XX_X_X = $1515
X_X_XX_XX_ = $1615
X_X_XX_XXX = $1715
X_X_XXX___ = $1815
X_X_XXX__X = $1915
X_X_XXX_X_ = $1A15
X_X_XXX_XX = $1B15
X_X_XXXX__ = $1C15
X_X_XXXX_X = $1D15
X_X_XXXXX_ = $1E15
X_X_XXXXXX = $1F15
X_XX______ = $0016
X_XX_____X = $0116
X_XX____X_ = $0216
X_XX____XX = $0316
X_XX___X__ = $0416
X_XX___X_X = $0516
X_XX___XX_ = $0616
X_XX___XXX = $0716
X_XX__X___ = $0816
X_XX__X__X = $0916
X_XX__X_X_ = $0A16
X_XX__X_XX = $0B16
X_XX__XX__ = $0C16
X_XX__XX_X = $0D16
X_XX__XXX_ = $0E16
X_XX__XXXX = $0F16
X_XX_X____ = $1016
X_XX_X___X = $1116
X_XX_X__X_ = $1216
X_XX_X__XX = $1316
X_XX_X_X__ = $1416
X_XX_X_X_X = $1516
X_XX_X_XX_ = $1616
X_XX_X_XXX = $1716
X_XX_XX___ = $1816
X_XX_XX__X = $1916
X_XX_XX_X_ = $1A16
X_XX_XX_XX = $1B16
X_XX_XXX__ = $1C16
X_XX_XXX_X = $1D16
X_XX_XXXX_ = $1E16
X_XX_XXXXX = $1F16
X_XXX_____ = $0017
X_XXX____X = $0117
X_XXX___X_ = $0217
X_XXX___XX = $0317
X_XXX__X__ = $0417
X_XXX__X_X = $0517
X_XXX__XX_ = $0617
X_XXX__XXX = $0717
X_XXX_X___ = $0817
X_XXX_X__X = $0917
X_XXX_X_X_ = $0A17
X_XXX_X_XX = $0B17
X_XXX_XX__ = $0C17
X_XXX_XX_X = $0D17
X_XXX_XXX_ = $0E17
X_XXX_XXXX = $0F17
X_XXXX____ = $1017
X_XXXX___X = $1117
X_XXXX__X_ = $1217
X_XXXX__XX = $1317
X_XXXX_X__ = $1417
X_XXXX_X_X = $1517
X_XXXX_XX_ = $1617
X_XXXX_XXX = $1717
X_XXXXX___ = $1817
X_XXXXX__X = $1917
X_XXXXX_X_ = $1A17
X_XXXXX_XX = $1B17
X_XXXXXX__ = $1C17
X_XXXXXX_X = $1D17
X_XXXXXXX_ = $1E17
X_XXXXXXXX = $1F17
XX________ = $0018
XX_______X = $0118
XX______X_ = $0218
XX______XX = $0318
XX_____X__ = $0418
XX_____X_X = $0518
XX_____XX_ = $0618
XX_____XXX = $0718
XX____X___ = $0818
XX____X__X = $0918
XX____X_X_ = $0A18
XX____X_XX = $0B18
XX____XX__ = $0C18
XX____XX_X = $0D18
XX____XXX_ = $0E18
XX____XXXX = $0F18
XX___X____ = $1018
XX___X___X = $1118
XX___X__X_ = $1218
XX___X__XX = $1318
XX___X_X__ = $1418
XX___X_X_X = $1518
XX___X_XX_ = $1618
XX___X_XXX = $1718
XX___XX___ = $1818
XX___XX__X = $1918
XX___XX_X_ = $1A18
XX___XX_XX = $1B18
XX___XXX__ = $1C18
XX___XXX_X = $1D18
XX___XXXX_ = $1E18
XX___XXXXX = $1F18
XX__X_____ = $0019
XX__X____X = $0119
XX__X___X_ = $0219
XX__X___XX = $0319
XX__X__X__ = $0419
XX__X__X_X = $0519
XX__X__XX_ = $0619
XX__X__XXX = $0719
XX__X_X___ = $0819
XX__X_X__X = $0919
XX__X_X_X_ = $0A19
XX__X_X_XX = $0B19
XX__X_XX__ = $0C19
XX__X_XX_X = $0D19
XX__X_XXX_ = $0E19
XX__X_XXXX = $0F19
XX__XX____ = $1019
XX__XX___X = $1119
XX__XX__X_ = $1219
XX__XX__XX = $1319
XX__XX_X__ = $1419
XX__XX_X_X = $1519
XX__XX_XX_ = $1619
XX__XX_XXX = $1719
XX__XXX___ = $1819
XX__XXX__X = $1919
XX__XXX_X_ = $1A19
XX__XXX_XX = $1B19
XX__XXXX__ = $1C19
XX__XXXX_X = $1D19
XX__XXXXX_ = $1E19
XX__XXXXXX = $1F19
XX_X______ = $001A
XX_X_____X = $011A
XX_X____X_ = $021A
XX_X____XX = $031A
XX_X___X__ = $041A
XX_X___X_X = $051A
XX_X___XX_ = $061A
XX_X___XXX = $071A
XX_X__X___ = $081A
XX_X__X__X = $091A
XX_X__X_X_ = $0A1A
XX_X__X_XX = $0B1A
XX_X__XX__ = $0C1A
XX_X__XX_X = $0D1A
XX_X__XXX_ = $0E1A
XX_X__XXXX = $0F1A
XX_X_X____ = $101A
XX_X_X___X = $111A
XX_X_X__X_ = $121A
XX_X_X__XX = $131A
XX_X_X_X__ = $141A
XX_X_X_X_X = $151A
XX_X_X_XX_ = $161A
XX_X_X_XXX = $171A
XX_X_XX___ = $181A
XX_X_XX__X = $191A
XX_X_XX_X_ = $1A1A
XX_X_XX_XX = $1B1A
XX_X_XXX__ = $1C1A
XX_X_XXX_X = $1D1A
XX_X_XXXX_ = $1E1A
XX_X_XXXXX = $1F1A
XX_XX_____ = $001B
XX_XX____X = $011B
XX_XX___X_ = $021B
XX_XX___XX = $031B
XX_XX__X__ = $041B
XX_XX__X_X = $051B
XX_XX__XX_ = $061B
XX_XX__XXX = $071B
XX_XX_X___ = $081B
XX_XX_X__X = $091B
XX_XX_X_X_ = $0A1B
XX_XX_X_XX = $0B1B
XX_XX_XX__ = $0C1B
XX_XX_XX_X = $0D1B
XX_XX_XXX_ = $0E1B
XX_XX_XXXX = $0F1B
XX_XXX____ = $101B
XX_XXX___X = $111B
XX_XXX__X_ = $121B
XX_XXX__XX = $131B
XX_XXX_X__ = $141B
XX_XXX_X_X = $151B
XX_XXX_XX_ = $161B
XX_XXX_XXX = $171B
XX_XXXX___ = $181B
XX_XXXX__X = $191B
XX_XXXX_X_ = $1A1B
XX_XXXX_XX = $1B1B
XX_XXXXX__ = $1C1B
XX_XXXXX_X = $1D1B
XX_XXXXXX_ = $1E1B
XX_XXXXXXX = $1F1B
XXX_______ = $001C
XXX______X = $011C
XXX_____X_ = $021C
XXX_____XX = $031C
XXX____X__ = $041C
XXX____X_X = $051C
XXX____XX_ = $061C
XXX____XXX = $071C
XXX___X___ = $081C
XXX___X__X = $091C
XXX___X_X_ = $0A1C
XXX___X_XX = $0B1C
XXX___XX__ = $0C1C
XXX___XX_X = $0D1C
XXX___XXX_ = $0E1C
XXX___XXXX = $0F1C
XXX__X____ = $101C
XXX__X___X = $111C
XXX__X__X_ = $121C
XXX__X__XX = $131C
XXX__X_X__ = $141C
XXX__X_X_X = $151C
XXX__X_XX_ = $161C
XXX__X_XXX = $171C
XXX__XX___ = $181C
XXX__XX__X = $191C
XXX__XX_X_ = $1A1C
XXX__XX_XX = $1B1C
XXX__XXX__ = $1C1C
XXX__XXX_X = $1D1C
XXX__XXXX_ = $1E1C
XXX__XXXXX = $1F1C
XXX_X_____ = $001D
XXX_X____X = $011D
XXX_X___X_ = $021D
XXX_X___XX = $031D
XXX_X__X__ = $041D
XXX_X__X_X = $051D
XXX_X__XX_ = $061D
XXX_X__XXX = $071D
XXX_X_X___ = $081D
XXX_X_X__X = $091D
XXX_X_X_X_ = $0A1D
XXX_X_X_XX = $0B1D
XXX_X_XX__ = $0C1D
XXX_X_XX_X = $0D1D
XXX_X_XXX_ = $0E1D
XXX_X_XXXX = $0F1D
XXX_XX____ = $101D
XXX_XX___X = $111D
XXX_XX__X_ = $121D
XXX_XX__XX = $131D
XXX_XX_X__ = $141D
XXX_XX_X_X = $151D
XXX_XX_XX_ = $161D
XXX_XX_XXX = $171D
XXX_XXX___ = $181D
XXX_XXX__X = $191D
XXX_XXX_X_ = $1A1D
XXX_XXX_XX = $1B1D
XXX_XXXX__ = $1C1D
XXX_XXXX_X = $1D1D
XXX_XXXXX_ = $1E1D
XXX_XXXXXX = $1F1D
XXXX______ = $001E
XXXX_____X = $011E
XXXX____X_ = $021E
XXXX____XX = $031E
XXXX___X__ = $041E
XXXX___X_X = $051E
XXXX___XX_ = $061E
XXXX___XXX = $071E
XXXX__X___ = $081E
XXXX__X__X = $091E
XXXX__X_X_ = $0A1E
XXXX__X_XX = $0B1E
XXXX__XX__ = $0C1E
XXXX__XX_X = $0D1E
XXXX__XXX_ = $0E1E
XXXX__XXXX = $0F1E
XXXX_X____ = $101E
XXXX_X___X = $111E
XXXX_X__X_ = $121E
XXXX_X__XX = $131E
XXXX_X_X__ = $141E
XXXX_X_X_X = $151E
XXXX_X_XX_ = $161E
XXXX_X_XXX = $171E
XXXX_XX___ = $181E
XXXX_XX__X = $191E
XXXX_XX_X_ = $1A1E
XXXX_XX_XX = $1B1E
XXXX_XXX__ = $1C1E
XXXX_XXX_X = $1D1E
XXXX_XXXX_ = $1E1E
XXXX_XXXXX = $1F1E
XXXXX_____ = $001F
XXXXX____X = $011F
XXXXX___X_ = $021F
XXXXX___XX = $031F
XXXXX__X__ = $041F
XXXXX__X_X = $051F
XXXXX__XX_ = $061F
XXXXX__XXX = $071F
XXXXX_X___ = $081F
XXXXX_X__X = $091F
XXXXX_X_X_ = $0A1F
XXXXX_X_XX = $0B1F
XXXXX_XX__ = $0C1F
XXXXX_XX_X = $0D1F
XXXXX_XXX_ = $0E1F
XXXXX_XXXX = $0F1F
XXXXXX____ = $101F
XXXXXX___X = $111F
XXXXXX__X_ = $121F
XXXXXX__XX = $131F
XXXXXX_X__ = $141F
XXXXXX_X_X = $151F
XXXXXX_XX_ = $161F
XXXXXX_XXX = $171F
XXXXXXX___ = $181F
XXXXXXX__X = $191F
XXXXXXX_X_ = $1A1F
XXXXXXX_XX = $1B1F
XXXXXXXX__ = $1C1F
XXXXXXXX_X = $1D1F
XXXXXXXXX_ = $1E1F
XXXXXXXXXX = $1F1F

