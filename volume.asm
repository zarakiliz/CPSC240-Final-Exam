;Program: Cuboids 
;Author: Elizabeth Orellana, Section 07
;Email: eorellana96@csu.fullerton.edu

extern printf   ; includes printf
extern scanf    ; includes scanf 

global cube

segment .data

string_format: db "%s", 0
float_input: db "Please enter length, width, and height as float numbers: ", 0
three_float_format: db "%lf %lf %lf", 0
tics: db "The time now is %lu tics", 10, 0
run_time: db "The run time was %lu tics.", 10, 0
;prompt_name: db "Please enter your name: ", 0 
;example_output: db "Inputted sides %lf and %lf with angle %lf", 10, 0
start_message: db "Here at Cuboids Inc. we know your volume", 10, 10,  0
volume: db "Thank you. Your volume is %.2lf cubic units.", 10,  0
;bad_input: db "Invalid input. Please try again.", 10, 0


segment .bss
volume_arr: resq 1

segment .text
cube:
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

;==============Print start message===============
    ;print prompt message
    mov rax, 0 
    mov rdi, string_format
	mov rsi, start_message
	call printf
;==============End Print start message===============

;==============Get the time in tics===============
    mov rax, 0
    mov rdx, 0

    ;stop system processes and read clock stamp
    cpuid
    rdtsc

    ;shift all the bits of rax 32 bits to the left 
    shl rdx, 32
    add rdx, rax ;complete number of tics

    ;move tics elasped to r15
    mov r15, rdx
 
    ;print out start time tics elapsed 
    mov rax, 0
    mov rdi, tics
    mov rsi, r15
    call printf
    
    pop rax 
;==============End Get Time in Tics==============

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
	push qword 0
	push qword 0
    push qword 0

	mov rax, 0
	mov rdi, three_float_format
	mov rsi, rsp
	mov rdx, rsp
	add rdx, qword 8
	mov rcx, rsp
	add rcx, qword 16
	call scanf
	movsd xmm15, [rsp]
	movsd xmm14, [rsp + 8]
	movsd xmm13, [rsp + 16]

	pop rax
	pop rax
	pop rax
    pop rax
;==================End input of floats===================
;check if valid num
;==================Calculate Volume===================
    ;vol = length * width * height
    ; length = xmm15 
    ; width = xmm14
    ; height = xmm13

    mov rax, 1
    ;cvtsi2sd xmm12, rax 
    ;make copy of xmm15 
    movsd xmm11, xmm15 ; xmm11 is xmm15
    mulsd xmm11, xmm14 ;xmm11 = xmm15 * xmm14 (length * width)
    mulsd xmm11, xmm13 ; xmm11 = (xmm15 * xmm14) * xmm13 = l * w * h

    movsd [volume_arr], xmm11
;==================End Calculate Volume===================

;=====================Print Volume===================
    movsd xmm0, [volume_arr]
    mov rdi, volume
    mov rax, 1
    call printf

    ;movsd xmm0, [volume_arr]

;==================End Print Volume===================

;==============Get the time in tics===============
    ;stop system processes and read clock stamp 
    cpuid
    rdtsc

    ;shift all the bits of rax 32 bits to the left 
    shl rdx, 32
    add rdx, rax ;complete number of tics

    ;move tics elasped to r14
    mov r14, rdx
 
    ;print out end time tics elapsed 
    mov rax, 0
    mov rdi, tics
    mov rsi, r14
    call printf
;==============End Get Time in Tics==============

;stop system processes and read clock stamp
    cpuid
    rdtsc

    ;shift all the bits of rax 32 bits to the left 
    shl rdx, 32
    add rdx, rax ;complete number of tics

    ;move tics elasped to r15
    mov r13, rdx

    ;==========Getting Elapsed Time===============
    ;convert integer numbers to float numbers 
    cvtsi2sd xmm15, r15 ; start time
    cvtsi2sd xmm14, r14 ;end time

    ;end - start
    subsd xmm14, xmm15
    movsd xmm15, xmm14 ;move to xmm15

    ;make a copy of xmm15(tics)
    movsd xmm13, xmm15

    ;print out the elapsed tics
    mov rax, 1
    mov rdi, run_time
    movsd xmm0, xmm15
    call printf

movsd xmm0, [volume_arr]

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
	