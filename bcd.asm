.MODEL SMALL
.CODE
MOV CL,00
MOV AH,00H
MOV AL,03H
INT 10H
BACK:MOV BH,00H
     MOV DH,00H
     MOV DL,00H
     MOV AH,02H
     INT 10H
     MOV AL,CL
     ADD AL,00H
     AAM
     ADD AX,3030H
     MOV CH,AL
     MOV DL,AH
     MOV AH,02H
     INT 21H
     MOV DL,CH
     MOV AH,02H
     INT 21H
     CALL DELAY
     INC CL
     XOR AX,AX
     CMP CL,100D
     JNE BACK
     JE LAST
DELAY PROC NEAR
PUSH AX
PUSH BX
PUSH CX
MOV CX,0FFFH
AG:MOV BX,0FFFFH
AG1:NOP
    DEC BX
    JNZ AG1
    DEC CX
    JNZ AG
    POP CX
    POP BX
    POP AX
    RET
    DELAY ENDP
LAST:MOV AH,4CH
INT 21H
END
