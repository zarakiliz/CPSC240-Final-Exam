;Program: Blank Program 
;Author: Elizabeth Orellana, Section 07
;Email: eorellana96@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 

global blank

segment .data

string_format: db "%s", 0
float_input: db "Please enter a float number: ", 0
float_format: db "%lf", 0
tics: db "The time now is %lu tics", 10, 0
;run_time: db "The run time was %lu tics.", 10, 0
;prompt_name: db "Please enter your name: ", 0 
;example_output: db "Inputted sides %lf and %lf with angle %lf", 10, 0
;start_message: db "Here at Cuboids Inc. we know your volume", 10, 10,  0
;volume: db "Thank you. Your volume is %.2lf cubic units.", 10,  0
;bad_input: db "Invalid input. Please try again.", 10, 0


segment .bss
;volume_arr: resq 1

segment .text
blank:
;==============BoilerPlate================
    push rbp ; Push memory address of base of previous stack frame onto stack top

    mov rbp, rsp ; Copy value of stack pointer into base pointer, rbp = rsp = both point to stack top
    ; Rbp now holds the address of the new stack frame, i.e "top" of stack
    push rdi ; Backup rdi
    push rsi ; Backup rsi
    push rdx ; Backup rdx
    push rcx ; Backup rcx
    push r8 ; Backup r8
    push r9 ; Backup r9
    push r10 ; Backup r10
    push r11 ; Backup r11
    push r12 ; Backup r12
    push r13 ; Backup r13
    push r14 ; Backup r14
    push r15 ; Backup r15
    push rbx ; Backup rbx
    pushf ; Backup rflags
	
	push qword 0
;===========End of BoilerPlate=============

;============Begin input for three floats===========
	push qword 0
	;display prompt message 
	mov rax, 0 
	mov rdi, float_input
	call printf
	pop rax 

ask_floats:
	;Input the 3 floats 
	push qword 0
	;push qword 0
	;push qword 0
    ;push qword 0

	mov rax, 0
	mov rdi, float_format
	mov rsi, rsp
	;mov rdx, rsp
	;add rdx, qword 8
	;mov rcx, rsp
	;add rcx, qword 16
	call scanf
	movsd xmm15, [rsp]
	;movsd xmm14, [rsp + 8]
	;movsd xmm13, [rsp + 16]

	pop rax
	pop rax
	;pop rax
    ;pop rax
;==================End input of floats===================

movsd xmm0, xmm15

end:
	; return 0
    ;mov rax, 0

    popf ; Restore rflags
    pop rbx ; Restore rbx
    pop r15 ; Restore r15
    pop r14 ; Restore r14
    pop r13 ; Restore r13
    pop r12 ; Restore r12
    pop r11 ; Restore r11
    pop r10 ; Restore r10
    pop r9 ; Restore r9
    pop r8 ; Restore r8
    pop rcx ; Restore rcx
    pop rdx ; Restore rdx
    pop rsi ; Restore rsi
    pop rdi ; Restore rdi

    pop rbp ; Restore rbp

    ret ;  return
	