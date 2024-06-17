; Program Description: This program gives the user a letter grade from the values 0 - 100
; Program 3.asm


INCLUDE Irvine32.inc
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; Declaring data for program
	str1 BYTE "Enter Value: ", 0
	str2 BYTE "Letter Grade: ", 0
	grade WORD "A", "B" , "C" , "D" , "E" , 0
	

.code
main proc
	
	; ecx is set to 10 so the output would be compact and still show each if statement working correctly
	; It can be changed to test any number of values
	mov ecx, 10 ; loop counter = 10 (Testing ten values)

	; If only one value needed to be tested this input loop could be removed
	
	INPUT:
	
	; Printing header for input
	mov edx,OFFSET str1
	call WriteString

	; Getting value
	call readint

	; Printing header for letter grade
	mov edx,OFFSET str2
	call WriteString

	; setting edx for output later
	mov edx, OFFSET grade

	cmp al,90
	jb L1						; Go to L1 if al < 90		
								; No Displacement needed for 'A'
	jmp L5						; Go to end(L5) if al >= 90

	L1:
	cmp al,80
	jb L2						; Go to L2 if al < 80
	add edx, 1* type grade		; Displacement to move to 'B' 
	jmp L5						; if 90 > al >= 80 go to L5
	
	L2:
	cmp al,70
	jb L3						; Go to L3 if al < 70
	add edx, 2* type grade		; Displacement to move to 'C' in the array
	jmp L5						; if 80 > al >= 70 go to L5

	L3:
	cmp al,60
	jb L4						; Go to L4 if al < 60
	add edx, 3* type grade		; Displacement to move to 'D' in the array
	jmp L5						; if 70 > al >= 60 go to L5
	
	L4: 
	; if al < 60
	add edx, 4* type grade		; Displacement to move to 'E' in the array

	L5: 
	

	; Print the letter grade
	call writestring 
	call crlf
	call crlf

	loop INPUT ; End of input loop


	invoke ExitProcess,0
main endp
end main