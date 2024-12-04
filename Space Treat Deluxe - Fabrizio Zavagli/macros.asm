
FLAG_ZERO = %11111110
FLAG_SET = %00000001
FLAG_TEST = %00000001
 
 MAC SLEEP
    IF {1} = 1
      ECHO "ERROR: SLEEP 1 not allowed !"
      END
    ENDIF
    IF {1} & 1
      bit $00
      REPEAT ({1}-3)/2
        nop
      REPEND
    ELSE
      REPEAT ({1})/2
        nop
      REPEND
    ENDIF
  ENDM

	; ZEROFLAG Flags, FLAG_ZERO (#%11111110)
	MAC ZEROFLAG
		LDA {1}
		AND #{2}
		STA {1}
	ENDM

	; SETFLAG Flags, FLAG_SET (#%00000001)
	MAC SETFLAG
		LDA {1}
		ORA #{2}
		STA {1}
	ENDM

	; TESTFLAG Flags, FLAG_TEST (#%00000001) (sets Z flag if flag was zero)
	MAC TESTFLAG
		LDA {1}
		AND #{2}
	ENDM
