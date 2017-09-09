; Segment type: Pure code
AREA .text, CODE, ALIGN=4
; ORG 0x82E0
CODE32


; Attributes: bp-based frame

; int __cdecl main(int argc, const char **argv, const char **envp)
EXPORT main
main

var_C= -0xC
var_8= -8

STMFD   SP!, {R11,LR}
ADD     R11, SP, #4
SUB     SP, SP, #8
STR     R0, [R11,#var_8]
STR     R1, [R11,#var_C]
LDR     R3, =(aHelloArm - 0x8300)
ADD     R3, PC, R3      ; "Hello ARM!"
MOV     R0, R3          ; s
BL      puts
MOV     R3, #0
MOV     R0, R3
SUB     SP, R11, #4
LDMFD   SP!, {R11,PC}
; End of function main
