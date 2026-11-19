org 100h

start:
    ; DISPLAY MAIN MENU
    mov dx, offset menu
    mov ah, 09h
    int 21h

    ; GET MENU CHOICE
    mov ah, 01h
    int 21h
    mov [choice], al

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov al, [choice]
    cmp al, '1'
    je binary_option
    cmp al, '2'
    je octal_option
    cmp al, '3'
    je hex_option
    cmp al, '4'
    je exit_program
    jmp invalid_option

; DECIMAL TO BINARY
binary_option:
    mov cx, 2
    mov dx, offset binary_msg
    jmp get_number

; DECIMAL TO OCTAL
octal_option:
    mov cx, 8
    mov dx, offset octal_msg
    jmp get_number

; DECIMAL TO HEXADECIMAL
hex_option:
    mov cx, 16
    mov dx, offset hex_msg

; READ AND VALIDATE DECIMAL INPUT
get_number:
    mov [base], cx

    mov ah, 09h
    int 21h

    mov dx, offset input_msg
    mov ah, 09h
    int 21h

    xor bx, bx
    mov byte ptr [digit_count], 0

read_digit:
    mov ah, 01h
    int 21h

    cmp al, 0Dh
    je input_finished

    ; Only decimal digits 0 through 9 are accepted.
    cmp al, '0'
    jb invalid_input
    cmp al, '9'
    ja invalid_input

    sub al, '0'
    xor ah, ah
    push ax

    ; BX = BX * 10 + digit
    mov ax, bx
    mov cx, 10
    mul cx

    ; DX != 0 means the multiplication exceeded 16 bits.
    or dx, dx
    jnz overflow_with_digit

    pop dx
    add ax, dx
    jc overflow_input

    mov bx, ax
    inc byte ptr [digit_count]
    jmp read_digit

overflow_with_digit:
    pop dx

overflow_input:
    ; Discard the rest of the current input line.
    mov ah, 01h
flush_overflow:
    int 21h
    cmp al, 0Dh
    jne flush_overflow

    mov dx, offset overflow_msg
    mov ah, 09h
    int 21h
    jmp start

invalid_input:
    ; Discard the rest of the current input line.
    mov ah, 01h
flush_invalid:
    int 21h
    cmp al, 0Dh
    jne flush_invalid

    mov dx, offset invalid_input_msg
    mov ah, 09h
    int 21h
    jmp start

input_finished:
    cmp byte ptr [digit_count], 0
    je empty_input

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset result_msg
    mov ah, 09h
    int 21h

    mov ax, bx
    mov cx, [base]
    call convert

    mov dx, offset newline
    mov ah, 09h
    int 21h
    jmp start

empty_input:
    mov dx, offset empty_msg
    mov ah, 09h
    int 21h
    jmp start

; CONVERT AX INTO THE BASE STORED IN CX
; Remainders are stored in reverse order in buffer.
convert:
    cmp ax, 0
    jne conversion_loop

    mov dl, '0'
    mov ah, 02h
    int 21h
    ret

conversion_loop:
    mov si, offset buffer

divide_loop:
    xor dx, dx
    div cx
    mov [si], dl
    inc si
    cmp ax, 0
    jne divide_loop

    dec si
    mov di, offset buffer

display_loop:
    mov dl, [si]
    cmp dl, 9
    jbe decimal_digit

    ; 10..15 become A..F
    add dl, 37h
    jmp print_digit

decimal_digit:
    add dl, 30h

print_digit:
    mov ah, 02h
    int 21h

    cmp si, di
    je conversion_done

    dec si
    jmp display_loop

conversion_done:
    ret

invalid_option:
    mov dx, offset error_msg
    mov ah, 09h
    int 21h
    jmp start

exit_program:
    mov ah, 4Ch
    int 21h

; DATA SECTION
menu db 13,10
     '================================',13,10
     '       NUMBER SYSTEM CONVERTER',13,10
     '================================',13,10
     '1. Decimal to Binary',13,10
     '2. Decimal to Octal',13,10
     '3. Decimal to Hexadecimal',13,10
     '4. Exit',13,10
     'Enter your choice: $'

binary_msg db 'Selected: Decimal to Binary',13,10,'$'
octal_msg  db 'Selected: Decimal to Octal',13,10,'$'
hex_msg    db 'Selected: Decimal to Hexadecimal',13,10,'$'
input_msg  db 'Enter a decimal number (0-65535): $'
result_msg db 'Converted result: $'
error_msg  db 'Invalid menu choice! Try again.',13,10,'$'
invalid_input_msg db 13,10,'Invalid input! Enter decimal digits only.',13,10,'$'
overflow_msg db 13,10,'Overflow! Maximum supported value is 65535.',13,10,'$'
empty_msg db 13,10,'No input entered. Please try again.',13,10,'$'
newline db 13,10,'$'

choice db 0
base dw 0
digit_count db 0
buffer db 16 dup(0)
