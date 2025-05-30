section .bss
num1 resb 8
num2 resb 8

section .data
msg1 db "Ingrese el dividendo: ", 0
msg2 db "Ingrese el divisor: ", 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 24
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 24
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Convertir ambos
    mov ecx, num1
    call atoi
    mov eax, ecx

    mov ecx, num2
    call atoi
    mov ebx, ecx

    xor edx, edx
    div ebx

    mov eax, 1
    xor ebx, ebx
    int 0x80

atoi:
    xor ecx, ecx
.next_digit:
    movzx edx, byte [ecx]
    cmp edx, 10
    je .done
    sub edx, '0'
    imul ecx, ecx, 10
    add ecx, edx
    inc ecx
    jmp .next_digit
.done:
    ret
