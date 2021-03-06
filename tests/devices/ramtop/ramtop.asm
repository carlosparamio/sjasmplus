    ; various syntax errors
    DEVICE  NONE x
    DEVICE  NONE,
    DEVICE  NONE,,
    DEVICE  NONE, 0     ; error valid range (ZX-like expected)
    DEVICE  NONE, $8000,    ; error for extra argument
    DEVICE  NONE, $8000, 0  ; error for extra argument
    ; following two are "good", because NONE ignores any ramtop value
    DEVICE  NONE, $5D00
    DEVICE  NONE, $5D01

    ; more checks exercised
    DEVICE  ZXSPECTRUMNEXT, 0
    DEVICE  ZXSPECTRUMNEXT, $5D00   ; warning about ignoring ramtop
    DEVICE  ZXSPECTRUMNEXT, $5D01   ; device was already initialized, silent line (still ignoring ramtop)
    DEVICE  ZXSPECTRUMNEXT          ; no warning (just switching)

    DEVICE  ZXSPECTRUM256, 0
    DEVICE  ZXSPECTRUM256
    DEVICE  ZXSPECTRUM256, $5D00    ; was already opened with default RAMTOP
    DEVICE  ZXSPECTRUM256           ; no warning (same ramtop)

    DEVICE  ZXSPECTRUM128, $5D00-1  ; error value
    DEVICE  ZXSPECTRUM128, $FFFF+1  ; error value
    DEVICE  ZXSPECTRUM128, $FFFF
    DEVICE  ZXSPECTRUM128           ; no warning (just switching device to zx128)
    DEVICE  ZXSPECTRUM128, $FFFE    ; warning about different RAMTOP
