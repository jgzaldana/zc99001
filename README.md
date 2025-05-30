# zc99001
Portafolio
# Guía de Ensamblador - Operaciones con entrada de usuario (NASM + Linux 32-bit)

Este paquete contiene tres programas en ensamblador x86 para Linux (modo 32 bits) usando NASM, cada uno con entrada de usuario.

## Archivos incluidos

1. `resta.asm`  
   - Solicita tres números desde teclado.
   - Resta los tres valores: resultado = num1 - num2 - num3
   - Usa registros de 16 bits (`AX`).

2. `multiplicacion.asm`  
   - Solicita dos números desde teclado (máximo 8 bits).
   - Multiplica ambos valores: resultado = num1 * num2
   - Usa registros de 8 bits (`AL`, `BL`), resultado en `AX`.

3. `division.asm`  
   - Solicita dividendo y divisor.
   - Realiza la división: resultado = num1 / num2
   - Usa registros de 32 bits (`EAX`, `EBX`, `EDX`).

## Cómo compilar y ejecutar

```bash
nasm -f elf32 archivo.asm -o archivo.o
ld -m elf_i386 archivo.o -o archivo
./archivo
