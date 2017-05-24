.model tiny

org 100h

.data
msg1 db "Ingrese 1er numero de 3 digitos$"
msg2 db "Ingrese 2do numero de 3 digitos$"
msg3 db "La suma de estos es $"
.code

main:
;limpia los registros
xor ax,ax 
xor bx,bx
xor cx,cx
xor dx,dx
;imprime primera instruccion, msg1
mov dx, offset msg1 ;mensaje
mov ah, 9h ;funcion
int 21h ;interrupcion

;salto de linea
mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h

;Lee el priemer caracter del primer numero
mov ah,1h ;funcion leer caracter con echo, lo guarda en AL
int 21h
push ax ;almacena el caracter leido en la pila

;Lee el segundo caracter del primer numero
mov ah,1
int 21h
push ax ;almacena el caracter leido en la pila

;Lee el tercer caracter del primer numero
mov ah,1
int 21h

   
sub al,30h ;resta 30h al valor ascii para obtener el valor decimal
mov cl,al ;almacena unidades en cl

pop bx ;saca el segundo caracter de la pila, lo asigna a bx
sub bl,30h ;resta 30h al valor ascii para obtener el valor decimal
mov al,10 ;Multiplicando al = 10
mul bl ;valor de decenas
add cl,al ;suma decenas a cl

pop bx ;saca el tercer caracter de la pila, lo asigna a bx
sub bl,30h ;resta 30h al valor ascii para obtener el valor decimal
mov al,100 ;Multiplicando al = 100
mul bl ;valor de decenas
add cx,ax ;suma centenas cx, cl y ch

push cx ;almacena primer numero en la pila

;limpia los registros
xor ax,ax 
xor bx,bx
xor cx,cx
xor dx,dx

;salto de linea
mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,8
int 21h

;imprime segunda instruccion, msg2
mov dx, offset msg2 ;mensaje
mov ah, 9h ;funcion
int 21h ;interrupcion

;salto de linea
mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h                    

;Lee el priemer caracter del segundo numero
mov ah,1h ;funcion leer caracter con echo, lo guarda en AL
int 21h
push ax ;almacena el caracter leido en la pila

;Lee el segundo caracter del primer numero
mov ah,1
int 21h
push ax ;almacena el caracter leido en la pila

;Lee el tercer caracter del primer numero
mov ah,1
int 21h

   
sub al,30h ;resta 30h al valor ascii para obtener el valor decimal
mov cl,al ;almacena unidades en cl

pop bx ;saca el segundo caracter de la pila, lo asigna a bx
sub bl,30h ;resta 30h al valor ascii para obtener el valor decimal
mov al,10 ;Multiplicando al = 10
mul bl ;valor de decenas
add cl,al ;suma decenas a cl

pop bx ;saca el tercer caracter de la pila, lo asigna a bx
sub bl,30h ;resta 30h al valor ascii para obtener el valor decimal
mov al,100 ;Multiplicando al = 100
mul bl ;valor de decenas
add cx,ax ;suma centenas cx, cl y ch

push cx ;almacena primer numero en la 

;salto de linea
mov ah,2
mov dl,10
int 21h

mov ah,2
mov dl,13
int 21h

;imprime msg3
mov dx, offset msg3 ;mensaje
mov ah, 9h ;funcion
int 21h ;interrupcion

xor ax,ax 
xor bx,bx
xor cx,cx
xor dx,dx

pop cx ;saca segundo
pop ax ;saca priemero

add ax,cx ;suma segundo a priemero

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