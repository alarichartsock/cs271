; Author: Alaric Hartsock
; Last Modified: Jan 2 2020
; OSU Email Address: hartsoca@oregonstate.edu
; CS271
; Assignment Number 1 Due Date: Jan 20 2020
; Description: This program takes 2 inputs and prints the sum, difference, product, quotient, remainder, and squares the two inputs as well.

INCLUDE c:/irvine/irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, deExitCode:DWORD

.data ; Variables
intro1	BYTE	"Elementary Operations by Alaric J. Hartsock", 0
intro2	BYTE	"**EC**: Program verifies second number less than first.", 0
intro3	BYTE	"Enter 2 numbers, and I'll show you the sum, difference, product, quotient, and remainder.", 0

prompt1	BYTE	"First number: ", 0
prompt2	BYTE	"Second number: ", 0

outro	BYTE	"Impressed? Bye!", 0

error1	BYTE	"Error: second number cannot be 0", 0
error2	BYTE	"Error: second number cannot be greater than first ", 0

equals	BYTE	" = ", 0
plus	BYTE	" + ", 0
minus	BYTE	" - ", 0
times	BYTE	" x ", 0
divide	BYTE	" / ", 0
remain	BYTE	" remainder ", 0
square	BYTE	"Square of ", 0

num1	DWORD	? ; First integer to be entered by user
num2	DWORD	? ; Second integer to be entered by user
sum		DWORD	? ; Sum of num1 and num2
diff	DWORD	? ; Difference of num1 and num2
prod	DWORD	? ; Product of num1 and num2
quot	DWORD	? ; Quotient of num1 and num2
rem		DWORD	? ; Difference of num1 and num2
sq1		DWORD	? ; Square of num1
sq2		DWORD	? ; Square of num2

.code 
main PROC

intro:
; Introduce the program
	mov 	edx, OFFSET intro1
	call 	WriteString
	call 	CrLf

	mov 	edx, OFFSET intro2
	call 	WriteString
	call 	CrLf

	mov 	edx, OFFSET intro3
	call 	WriteString
	call 	CrLf

input:
; Recieve and store num1 and num2
; Get number 1
	mov		edx, OFFSET prompt1
	call	WriteString
	call	ReadInt
	mov		num1, eax

; Get number 2
	mov		edx, OFFSET prompt2
	call	WriteString
	call	ReadInt
	mov		num2, eax

	; Throw error if num2 is zero
	cmp		eax, 0
	je		err1

	; Throw error if num2>num1
	mov		ebx,eax
	mov		eax,num1
	cmp		eax,ebx
	jl		err2
	jmp		calc

err1:
; Throw zero error
	mov		edx, OFFSET error1
	call	WriteString
	call	CrLF
	jmp		input

err2:
; Throw zero error
	mov		edx, OFFSET error2
	call	WriteString
	call	CrLF
	jmp		input

calc:
; Calculate sum
	mov		eax,num1
	mov		ebx,num2
	add		eax,ebx
	mov		sum,eax

; Calculate difference
	mov		eax,num1 ; EAX needs to be reassigned, EBX stays equal to num2
	sub		eax,ebx
	mov		diff,eax

; Calculate product
	mov		eax,num1
	imul	eax,ebx
	mov		prod,eax

; Calculate qoutient
	mov		eax,num1
	cdq
	div		ebx
	mov		quot,eax
	mov		rem,edx

; Calculate square of num1
	mov		eax,num1
	imul	eax,eax
	mov		sq1,eax

; Calculate square of num2
	imul	ebx,ebx
	mov		sq2,ebx
	
display:
; Equals in ECX for easy access
	mov	ebx, OFFSET equals

; Prints sum
	mov		eax, num1
	call	WriteDec

	mov		edx, OFFSET plus
	call	WriteString

	mov		eax, num2
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, sum
	call	WriteDec
	call	CrLf

; Prints difference
	mov		eax, num1
	call	WriteDec

	mov		edx, OFFSET minus
	call	WriteString

	mov		eax, num2
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, diff
	call	WriteDec
	call	CrLf

; Prints product
	mov		eax, num1
	call	WriteDec

	mov		edx, OFFSET times
	call	WriteString

	mov		eax, num2
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, prod
	call	WriteDec
	call	CrLf

; Prints quotient and remainder
	mov		eax, num1
	call	WriteDec

	mov		edx, OFFSET divide
	call	WriteString

	mov		eax, num2
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, quot
	call	WriteDec

	mov		edx, OFFSET remain
	call	WriteString

	mov		eax, rem
	call	WriteDec

	call	CrLf	

; Prints square of num1
	mov		edx, OFFSET square
	call	WriteString

	mov		eax, num1
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, sq1
	call	WriteDec
	call	CrLf	

; Prints square of num2
	mov		edx, OFFSET square
	call	WriteString

	mov		eax, num2
	call	WriteDec

	mov		edx, ebx ; Prints =
	call	WriteString

	mov		eax, sq2
	call	WriteDec
	call	CrLf	

bye:
; Say goodbye
	mov	edx, OFFSET outro
	call	WriteString
	call	CrLf

	INVOKE	ExitProcess, 0

main	ENDP
END		main
