; from: https://en.wikipedia.org/wiki/Intel_8080#Example_code

; memcpy --
; Copy a block of memory from one location to another.
;
; Entry registers
;       BC - Number of bytes to copy
;       DE - Address of source data block
;       HL - Address of target data block
;
; Return registers
;       BC - Zero

            org     1000h       ;Origin at 1000h
memcpy      public
            mov     a,b         ;Test BC,
            ora     c           ;If BC = 0,
            rz                  ;Return
loop:       ldax    d           ;Load A from (DE)
            mov     m,a         ;Store A into (HL)
            inx     d           ;Increment DE
            inx     h           ;Increment HL
            dcx     b           ;Decrement BC (does not affect Flags)
            mov     a,b         ;Test for done
            ora     c           ;B | C = 0 and done
            jnz     loop        ;Repeat loop until BC = 0
            ret
