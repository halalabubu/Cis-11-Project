.ORIG x3000
;Program start


JSR	FINDAVERAGEFUNCTION 


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
JSR FINDAVGLOOP
ENDFINDAVGLOOP

ST R2, average
LEA	R0,	average   
;PUTS 
RET
;calc min and max 








;display info









;Variables


  

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


