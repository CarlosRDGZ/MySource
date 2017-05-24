
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

.model tiny

org 100h

.data
.code

; add your code here 
main:
 
;mov AX,0ffffh
;mov BX,2 
;mul BX      

;Escribir un numero almacenado en la pantalla

mov AX, 54800 ;En el registro AX alojamos un numero
;AX, registro de 16 bits, num max 2^16 - 1 = 65535
mov BX, 10000 ;registro BX almacena 10000 = 10^4, que es 
;la potencia del digito mas significativo en decimal de
;de un numero de un num de 16 bits
div BX ;Divide AX/BX = Num/10^4
;Cosiente en AX, residuo en DX 
push DX ;movemos el contenido de DX a la pila

mov dl , al ;movemos al (cosiente) a dl
add dl, 30h ;al cosiente se le agregan 30h(48)
;para obtener su valor en ascii

;imprimimos el digito en la pantalla
mov ah, 2 ;funcion
int 21h ;interrupcion

pop AX
 
xor dx,dx
mov bx, 1000 
div bx
push Dx
mov dl, al 
add dl,30h 
mov ah,2
int 21h

pop ax
xor dx,dx
mov bx, 100 
div bx
push Dx
mov dl, al 
add dl,30h 
mov ah,2
int 21h
           
pop ax
xor dx,dx
mov bx, 10 
div bx
push Dx
mov dl, al 
add dl,30h 
mov ah,2
int 21h 

pop dx
add dl, 30h
mov ah,2
int 21h
          
end main
ret
