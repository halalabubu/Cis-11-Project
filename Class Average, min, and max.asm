.ORIG x3000
;Program start


JSR	FINDAVERAGEFUNCTION 
JSR FINDMIN

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

LEA R0, ARRAY

MINLOOP
ADD R0, R0, #1	;++ ARRAY INDEX
NOT R4, R0	;1'S COMPLEMENT
ADD R4, R4, #1	;2'S COMPLEMENT
ADD R4, R4, #5	; CHECK COUNTER

BRn ENDMINLOOP		


NOT R2, R2	; 1'S COMPLEMENT
ADD R2, R2, #1	; 2'S COMPLEMENT

BRn MINLOOP	; IF NEG R1 IS MINIMUM
AND R1, R1, #0
ADD R1, R2, #0	; RESET R1 AND COPY TO R2
BR MINLOOP	; MIN IS IN R1
ENDMINLOOP					
ST R1, MINTOTAL	; STORE MIN
LEA	R0, MINTOTAL
;PUTS
		
RET








;display info









;Variables


  
MINTOTAL .FIll x00
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


