    processor 6502

;----------------------------------------------------------------------------
; Compile switches

NTSC                    = 0
PAL                     = 1
COMPILE_VERSION         = NTSC
NO_ILLEGAL_OPCODES      = 0


TIA_BASE_READ_ADDRESS = $30

    include vcs.h
    include macro.h

    ORG $1000
    include p1.s
    ORG $2000
    include p2.s
    ORG $3000
    include p3.s
    ORG $4000
    include p4.s
