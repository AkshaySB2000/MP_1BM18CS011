.MODEL SMALL
.DATA
N DW 6
R DW 2
RES DW ?
.CODE
MOV AX,@DATA
MOV DS,AX
MOV AX,N
MOV BX,R
CALL NCR
MOV DX,RES
MOV AH,4CH
INT 21H
NCR PROC NEAR
CMP AX,BX
JE RES1
CMP BX,0
JE RES1
CMP BX,1
JE RESN
DEC AX
CMP BX,AX
JE INCR
PUSH AX
PUSH BX
CALL NCR
POP BX
POP AX
DEC BX
PUSH AX
PUSH BX
CALL NCR
POP BX
POP AX
RET
RES1:INC RES
     RET
INCR:INC RES
RESN:ADD RES,AX
RET
NCR ENDP
END

