%include 'in_out.asm' ; Подключение внешнего файла
SECTION .date ; Секция инициирования данных
msg: DB 'Введите строку:',0h ; сообщение 
SECTION .bss ; Секция не инициирование данных
buf1: RESB 80 ; Буфер размеровм 80 байт
SECTION .text ; Код программы
GLOBAL _start ; Начало программы
_start: ; Точка входа в программу
mov eax, msg ; 
call sprint ;
mov ecx,buf1 ;
mov edx,80 ;
call sread
call quit
