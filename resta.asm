section .bss
num1 resb 8
num2 resb 8
num3 resb 8

section .data
msg1 db "Ingrese el primer número: ", 0
msg2 db "Ingrese el segundo número: ", 0
msg3 db "Ingrese el tercer número: ", 0
newline db 10, 0

section .text
    global _start

_start:
    ; Mostrar mensaje 1 y leer num1
    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 8
    int 0x80

    ; Mostrar mensaje 2 y leer num2
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 8
    int 0x80

    ; Mostrar mensaje 3 y leer num3
    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, 25
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, num3
    mov edx, 8
    int 0x80

    ; Convertir los números ASCII a enteros
    mov ecx, num1
    call atoi
    mov ax, cx      ; resultado en AX

    mov ecx, num2
    call atoi
    sub ax, cx

    mov ecx, num3
    call atoi
    sub ax, cx

    ; Resultado final en AX

    ; Terminar
    mov eax, 1
    xor ebx, ebx
    int 0x80

; --------------------------------------------------
; atoi: convierte string numérica en ECX a entero → CX
; --------------------------------------------------
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
