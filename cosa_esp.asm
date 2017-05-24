.model tiny

org 100h ;archivo COM

.data ;segmento de datos
fila db 12 ;fila
col db 40 ;columna

.code ;segmento de codigo
main:
;modo de video
mov al,03h ;modo de texto 80x25
mov ah,00h ;funcion para establecer el modo de video
int 10h ;interrupcion

    puntero:
    ;establece posicion del cursor
    mov ah,02h ;funcion
    mov dh,fila ;fila
    mov dl,col ;columna
    mov bh,00h ;pagina de video
    int 10h ;interrupcion
    
    ;imprime un caracter
    mov ah,02h ;funcion
    mov dl,40h ;caracter '@'
    int 21h ;interrupcion
    
    ;lee un caracter sin echo del teclado
    mov ah,07h ;funcion
    int 21h ;interrupcion
    
    ;mete el caracter de entrada a la pila
    push ax
    
    ;establece posicion del cursor
    mov ah,02h ;funcion
    mov dh,fila ;fila
    mov dl,col ;columna
    mov bh,00h ;pagina de video
    int 10h ;interrupcion
    
    ;imprime un caracter
    mov ah,02h ;funcion
    mov dl,20h ;character ' ', simula el borrado
    int 21h ;interrupcion
    
    ;saca el caracter de la pila
    pop ax
    
    ;revisa la entrada en estas codiciones
    cmp al,'w' ;compara con 'w'
    je arriba ;si verdadero va a arriba
    
    cmp al,'s' ;compara con 's'
    je abajo ;si verdadero va abajo
    
    cmp al,'a' ;compara con 'a'
    je izq ;si verdadero va a izq
    
    cmp al,'d' ;compara con 'd'
    je der ;si verdadero va derecha
    
        ;mover hacia arriba
        arriba:
        cmp fila,0 ;compara fila con 0
        je ajustaARRIBA ;verdadero, va a ajustaARRIBA
        jne noAjustaARRIBA ;falso, va a noAjustaARRIBA
        
            ajustaARRIBA:
            mov fila,24 ;mover a fila 24
            jmp puntero ;va a puntero
            
            noAjustaARRIBA:
            sub fila,1 ;quita 1 fila
            jmp puntero ;va a puntero
        
        ;mover hacia abajo
        abajo:
        cmp fila,24 ;compara fila con 24
        je ajustaABAJO ;verdadero, va a ajustaABAJO
        jne noAjustaABAJO ;falso, va a noAjustaABAJO
        
            ajustaABAJO:
            mov fila,0 ;mover a fila 0
            jmp puntero ;va a puntero
            
            noAjustaABAJO:
            add fila,1 ;agrega 1 fila
            jmp puntero
        
        ;mover a la izquierda
        izq:
        cmp col,0 ;compara columna con 0
        je ajustaIZQ ;verdadero, va a ajustaIZQ
        jne noAjustaIZQ ;falso, va a noAjustaIZQ
        
            ajustaIZQ:
            mov col,79 ;mover a columna 79
            jmp puntero
            
            noAjustaIZQ:
            sub col,1 ;quita 1 columna
            jmp puntero
        
        ;mover a la derecha
        der:
        cmp col,79 ;compara columna con 79
        je ajustaDER ;verdadero, va a ajustaDER
        jne noAjustaDER ;falso, va a noAjustaDER
        
            ajustaDER:
            mov col,0 ;mover a columna 0
            jmp puntero
            
            noAjustaDER:
            add col,1 ;agrega 1 columna
            jmp puntero

end main

ret