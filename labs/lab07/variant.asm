%include 'in_out.asm'               ; подключение внешнего файла

SECTION .data
msg: DB 'Введите № студенческого билета: ',0
rem: DB 'Ваш вариант: ',0

SECTION .bss
x:   RESB 80

SECTION .text
GLOBAL _start
_start:
mov eax, msg        ; вывод приглашения
call sprintLF

mov ecx, x          ; буфер для ввода
mov edx, 80         ; длина буфера
call sread          ; читаем строку

mov eax, x          ; адрес введённой строки
call atoi           ; ASCII -> число, результат в eax

xor edx, edx
mov ebx, 20         ; делитель
div ebx             ; eax = номер варианта, edx = остаток

inc edx             ; варианты считаются с 1

mov eax, rem        ; печать сообщения
call sprint
mov eax, edx        ; печать номера варианта
call iprintLF

call quit           ; завершение программы
