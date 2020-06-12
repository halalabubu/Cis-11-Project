.ORIG x3000
;Program start


JSR	FINDAVERAGEFUNCTION 
JSR 	FINDMIN
JSR 	FINDMAX
JSR	DISPLAY

ENDME
HALT
;Program end



;CALC AVERAGE || Should be 75
FINDAVERAGEFUNCTION
;clear R1 and R2
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
ADD R1, R1, #5 ;array length

LEA R2, ARRAY
AVGTOTALLOOP 
LDR R0, R2, #0       ; ARRAY + offset
ADD R2, R2, #1       ; R2++
ADD R3, R3, R0
ADD R1, R1, #-1 ; R1--
BRp AVGTOTALLOOP             ; loop

ST R3, averageTotal
;Test value output 
;******************************************************
;LEA	R0,	averageTotal    
;PUTS 
;******************************************************
;Division Loop..............yay.............. >:(
;clear R1 and R2
AND R2, R2, #0
AND R3, R3, #0
LD R1, averageTotal

FINDAVGLOOP
ADD R1, R1, #-5
BRn ENDFINDAVGLOOP
ADD R2, R2, #1
BR FINDAVGLOOP
ENDFINDAVGLOOP

ST R2, average
;LEA	R0,	average   
;PUTS 
RET
;calc min and max 
FINDMIN
AND R0, R0, #0	;CLEAR R0
AND R4, R4, #0
LEA R0, ARRAY
;ADD R0, R0, #1
LDR	R1,	R0, #0


;R1 current min, R2 to be checked
MINLOOP
ADD	R4,	R4,	#1  ; counter
AND R5, R5, #0
ADD	R5,	R4,	#-4
BRzp MINLOOPEND
ADD R0, R0, #1	; ++ ARRAY INDEX
LDR	R2,	R0, #0
NOT	R2,	R2
ADD	R2,	R2,	#1
ADD	R3,	R1,	R2
BRn MINLOOP
BRzp NEWMIN

NEWMIN
LDR	R1,	R0, #0
BR MINLOOP

MINLOOPEND
ST	R1,	MIN

RET






FINDMAX

AND R0, R0, #0	;CLEAR R0
AND R4, R4, #0
LEA R0, ARRAY
;ADD R0, R0, #1
LDR	R1,	R0, #0


;R1 current min, R2 to be checked
MAXLOOP
ADD	R4,	R4,	#1  ; counter
AND R5, R5, #0
ADD	R5,	R4,	#-4
BRzp MAXLOOPEND
ADD R0, R0, #1	; ++ ARRAY INDEX
LDR	R2,	R0, #0
NOT	R2,	R2
ADD	R2,	R2,	#1
ADD	R3,	R1,	R2
BRp MAXLOOP
BRnz NEWMAX

NEWMAX
LDR	R1,	R0, #0
BR MAXLOOP

MAXLOOPEND
ST	R1,	MAX
RET	



;display info

DISPLAY

;display average

AND R0, R0, #0	;CLEAR R0
LEA R0, AVGSTR	;LOAD AVGSTR INTO R0
PUTS		;PRINT

AND R1, R1, #0	;CLEAR R1
AND R2, R2, #0	;CLEAR R2
	
LD R1, average	;LOAD AVERAGE INTO R1

DECIMALCONVLOOP
ADD R1, R1, #-10      
BRn ENDDECIMALCONVLOOP 
ADD R2, R2, #1     ;counter

BR DECIMALCONVLOOP

ENDDECIMALCONVLOOP

AND R0, R0, #0
ADD R0, R0, R2
LD    R2,    ASCII
ADD R0, R0, R2
OUT

ADD R1, R1, #10
ADD R0, R1, R2
OUT


;Minimum display
LEA R0, MINSTR	;LOAD MINSTR INTO R0
PUTS		;PRINT
AND R1, R1, #0	;CLEAR R1
AND R2, R2, #0	;CLEAR R2
	
LD R1, MIN	;LOAD MAX INTO R1

DECIMALCONVLOOP2
ADD R1, R1, #-10      
BRn ENDDECIMALCONVLOOP2 
ADD R2, R2, #1     ;counter

BR DECIMALCONVLOOP2

ENDDECIMALCONVLOOP2

AND R0, R0, #0
ADD R0, R0, R2
LD    R2,    ASCII
ADD R0, R0, R2
OUT

ADD R1, R1, #10
ADD R0, R1, R2
OUT

;Max display
LEA R0, MAXSTR	;LOAD MAXSTR INTO R0
PUTS		;PRINT
AND R1, R1, #0	;CLEAR R1
AND R2, R2, #0	;CLEAR R2
	
LD R1, MAX	;LOAD MAX INTO R1

DECIMALCONVLOOP3
ADD R1, R1, #-10      
BRn ENDDECIMALCONVLOOP3 
ADD R2, R2, #1     ;counter

BR DECIMALCONVLOOP3

ENDDECIMALCONVLOOP3

AND R0, R0, #0
ADD R0, R0, R2
LD    R2,    ASCII
ADD R0, R0, R2
OUT

ADD R1, R1, #10
ADD R0, R1, R2
OUT

JSR ENDME
RET; doesnt work too far?


;Variables


AVGSTR	.STRINGZ	"\nThe average grade is: "
MINSTR  .STRINGZ	"\nThe minimum grade is: "
MAXSTR	.STRINGZ	"\nThe maximum grade is: "

MAX .fill x00  
MIN .fill x00
average .fill x00
averageTotal .fill x00
ASCII   .fill  x30    ; ASCII offset

;Student Grades array 
ARRAY   
.fill x34   ;52
.fill x57   ;87
.fill x60   ;96
.fill x4F   ;79
.fill x3D   ;61

; test values x0A == 10
;.fill x0A
;.fill x0A
;.fill x0A
;.fill x0A
;.fill x0A

.end
