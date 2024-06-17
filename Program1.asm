;Program Description: This program calculates the expression (A+B) - (C1 + D)

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
	; Declaring variable with the values given in the program guide
	A   DWORD 30
	B   DWORD 20
	C1  DWORD 10
	D   DWORD 5

.code
main proc
	; Copying the values from the variables to the register 
	mov eax, A
	mov ebx, B
	mov ecx, C1
	mov edx, D
	
	; Expression A = (A+B) - (C1 + D)
	add eax,ebx ; Adding B to A  (A + B)
	add ecx,edx ; Adding D to C1 (C1 + D)
	sub eax,ecx ;Taking the result of (A + B) and subtracting (C1 + D)

	mov A,eax ; Making A equal to the expression (A + B) - (C1 + D)

	invoke ExitProcess,0
main endp
end main