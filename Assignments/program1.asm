INCLUDE c:/irvine/irvine32.inc

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, deExitCode:DWORD

.data
	; variables

.code
main PROC
	mov eax, 5
	mov eax, 10
	sub eax, 3
	INVOKE ExitProces, 0

main ENDP
END main
