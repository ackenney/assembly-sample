;Program Description: This program calucates the mean and variance from the data in RAW
;Program 2.asm
INCLUDE Irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; Declaring variable with the values given in the program guide
	RAW	    WORD 10, 12, 8, 17, 9, 22 , 18 , 11 , 23 , 7 , 30 , 22 , 19 , 6 , 7 
	SQUARE	WORD LENGTHOF RAW dup(?)
	str1    BYTE "MEAN ",0
	str2	BYTE "VAR  ",0
	MEAN	WORD ?
	VAR     WORD ?

.code
main proc
	 
; Setting registers for loop 1
mov edi,OFFSET RAW		    ; EDI = address of RAW
mov ecx,LENGTHOF RAW		; initialize loop counter
mov eax,0					; sum = 0


; Getting the Sum of the array  from this loop the sum will be in ax
L1:					; The beginning of loop
add ax,[edi]		; Addition
add edi, TYPE RAW	; Pointing to next element
loop L1


; Division to get the mean. The mean will be in ax
mov dx, 0			; Setting dx to 0
mov cx,LENGTHOF RAW ; cx = n
div cx				; = sum / n
mov MEAN, ax		; setting mean


;Printing mean:
mov edx,OFFSET str1
call WriteString
mov dx, MEAN
call writedec
call crlf


; Setting registers for loop 2
mov esi, OFFSET SQUARE 
mov edi,OFFSET RAW		    ; EDI = address of RAW
mov ecx,LENGTHOF RAW		; initialize loop counter
mov eax,0					; sum = 0

L2:					

; Setting registers
mov eax,0
mov ebx, 0
mov ax,[edi]	
mov bx, MEAN

; Evaluating expression
sub eax, ebx	; x - mean
mov ebx,eax		; eax = x ebx = x
mul eax			; x*x

mov [esi], eax ; Moving square to array

add esi, TYPE SQUARE  ; Moving to next element 
add edi, TYPE RAW	  ; Moving to next element
loop L2

; Setting registers for loop 3
mov eax, 0
mov edi, OFFSET SQUARE 
mov ecx, LENGTHOF SQUARE 

; This loop sums each square
L3:
	add ax, [edi]			; Adding to the sum
	add edi, TYPE SQUARE	; Moving to next value
loop L3


; Division by n to get the variance. The variance will be in ax
mov dx, 0
mov cx,LENGTHOF RAW
div cx
mov VAR, ax

; Printing Variance
mov edx,OFFSET str2
call WriteString
mov dx,VAR
call writedec
call crlf


	invoke ExitProcess,0
main endp
end main