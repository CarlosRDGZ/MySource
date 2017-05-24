.model tiny

org 100h

.data
msg1 db "Ingrese 1er numero de 3 digitos$"
msg2 db "Ingrese 2do numero de 3 digitos$"
.code

main:
;imprime primera instruccion, msg1
mov dx, offset msg1 ;mensaje
mov ah, 9h ;funcion
int 21h ;interrupcion
;mover cursor al siguiente renglon
mov ah,2
mov dh,1
mov dl,0
mov bh,0
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

;imprime segunda instruccion, msg2
mov dx, offset msg2 ;mensaje
mov ah, 9h ;funcion
int 21h ;interrupcion
;mover cursor al siguiente renglon
mov ah,2
mov dh,3
mov dl,0
mov bh,0
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

push cx ;almacena primer numero en la pila

xor ax,ax 
xor bx,bx
xor cx,cx
xor dx,dx

pop cx ;saca segundo
pop ax ;saca priemero

add ax,cx ;suma segundo a priemero



end main
ret