;;; Sample ROM Monitor.

%org 0
_start:
                ; TODO
                
; SAMPLE IMPLEMENTATION of getc/putc. Assumes a magical, non-blocking serial port exists in machine mode CSRs FFFD, FFFE, and FFFF.
; Assumes bit 0 of FFFF indicates a byte is ready to read, and bit 1 of FFFF indicates a byte can be queued to send.
#define SERIN   0xFFFD
#define SEROUT  0xFFFE
#define SERSTAT 0xFFFF

_getc:
.loop:          ldmsrm.d x2, SERSTAT                            ; Read serial status          <
                tbrz.d x2, #1, .loop                            ; Test bit 0, branch if zero  /
                ldmsrm.d x0, SERIN                              ; Read input
                ret x30                                         ; Return

_putc:
.loop:          ldmsrm.d x2, SERSTAT                            ; Read serial status          <
                tbrz.d x2, #2, .loop                            ; Test bit 1, branch if zero  /
                stmsrm.d x0, SEROUT                             ; Write output
                ret x30                                         ; Return

_gets:          ; gets(x0: *char buf, x1: uint32_t buf_len)
                mov x5, x0                                      ; Save input buffer pointer to x5                       <
                mov x3, 0                                       ; Zero out the index pointer (idx)                      |
                st.q x30, +[sp + 8]                             ; Save link register to stack, increment sp             |
                tbrz.d unlikely x1, x1, .exit                   ; If buffer cannot possibly store anything, just bail. -|--\
.loop:          jalr x30, _getc                                 ; Call _getc, result is chr                             |  |
                st.b x0, [x5 + x3]                              ; Store byte chr to buf[idx]                            |  |
                add x3, 1                                       ; Increment idx                                         |  |
                cbre.d x0, '\n', .term_exit                     ; Compare chr to newline, branch if equal. ------\      |  |
                dbrnz.d x1, .loop                               ; Decrement buf_len, branch if not zero. --------|------/  |
                sub x3, 1                                       ; Out of room. Overwrite last char with null.    |         |
.term_exit:     mov x1, 0                                       ; Store 0 to x1, which is now unused/safe to use <         |
                st.b x1, [x5 + x3]                              ; Terminate with a zero byte                               |
.exit:          ld.q x30, [sp - 8]+                             ; Decrement sp, restore link register from stack           <
                ret x30                                         ; Return