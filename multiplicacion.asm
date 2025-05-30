section .bss
num1 resb 8
num2 resb 8

section .data
msg1 db "Ingrese el primer número (8 bits): ", 0
msg2 db "Ingrese el segundo número (8 bits): ", 0

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 32
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 32
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Convertir y multiplicar
    mov ecx, num1
    call atoi
    mov al, cl

    mov ecx, num2
    call atoi
    mov bl, cl

    mul bl ; AL * BL -> AX

    mov eax, 1
    xor ebx, ebx
    int 0x80

atoi:
    xor cx, cx
.next_digit:
    movzx edx, byte [ecx]
    cmp edx, 10
    je .done
    sub edx, '0'
    imul cx, cx, 10
    add cx, dx
    inc ecx
    jmp .next_digit
.done:
    ret
