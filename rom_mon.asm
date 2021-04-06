;;; Sample ROM Monitor.

%org 0
_start:
                ; TODO
                
; SAMPLE IMPLEMENTATION of getc/putc. Assumes a magical, non-blocking serial port exists in machine mode CSRs FFFD, FFFE, and FFFF.
; Assumes bit 0 of FFFF indicates a byte is ready to read, and bit 1 of FFFF indicates a byte can be queued to send.
#define SERIN   0xFFFD
#define SEROUT  0xFFFE
#define SERSTAT 0xFFFF
                ; clobbers x2
_getc:          ; char getc()
.loop:          ldmsrm.d x2, SERSTAT                            ; Read serial status          <
                tbrz.d x2, #1, .loop                            ; Test bit 0, branch if zero  /
                ldmsrm.d x0, SERIN                              ; Read input
                ret x30                                         ; Return
                
                ; clobbers x2
_putc:          ; putc(x0: char)
.loop:          ldmsrm.d x2, SERSTAT                            ; Read serial status          <
                tbrz.d x2, #2, .loop                            ; Test bit 1, branch if zero  /
                stmsrm.d x0, SEROUT                             ; Write output
                ret x30                                         ; Return

                ; clobbers x0, x1, x2, x3
_gets:          ; void gets(x0: *char buf, x1: uint32_t buf_len)
                mov x3, x0
                tbrz.d x1, x1, .exit                            ; Bail on empty buffer
                add x1, x0                                      ; Compute end point
                st.q x30, +[sp + 8]
.loop:          jalr _getc
                st.b x0, [x3 + 1]+
                cbre.d x0, '\n', .term_exit
                cbrne.q x3, x1, .loop
                sub x3, 1
.term_exit:     mov x1, 0
                st.b x1, [x3 - 1]
.exit:          ld.q x30, [sp - 8]+                             ; Decrement sp, restore link register from stack
                ret x30                                         ; Return
                

                ; clobbers x0, x1, x2
_puts:          ; void puts(x0: *char buf)
                mov x1, x0
                st.q x30, +[sp + 8]
.loop:          ld.b x0, [x1 + 1]+
                tbrz.d x0, x0, .exit
                jalr x30, _putc
                jmpr .loop
.exit:          ld.q x30, [sp - 8]+                             ; Decrement sp, restore link register from stack
                ret x30                                         ; Return

