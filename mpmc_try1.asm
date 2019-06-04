; multi-segment executable file template.   

include 'emu8086.inc'

data segment     
    shelfa DW "booka","bookb","bookc","bookp","bookq","bookr","bookx","booky","bookz"  ;initializing array called shelfa
    
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here 
    mov cx,05h      ;setting loop counter to string length
               
    mov bx,1000h   
               
    mov dx,bx  
               
    
    printn "please enter the book name/value "    
    
    getting_word:
        mov ah,01h ;setting up for input
        int 21h    ;calling interrupt for input
        mov [bx],al ;moving input to memory location [bx]
        inc bx      ;incrementing value of bx
        loop getting_word:   ;calling loop
        
    
    mov di,offset shelfa   ;di stores pointers of elements of array
       ;setting up counter equal to no elements in array shelfa
       
       mov bx,dx 
       mov ah,9h    ;no of books present we are also performing the l1 loop the same no of times as ah
       
              
     l1: 
     mov cx,05h         
     comparing:
        mov al,[bx] 
        scasb 
        jnz exit
        inc bx
        loop comparing:    
          
    ;repne scasw
    ;jnz exit
    printn " found"
    hlt
    
    exit: 
    mov bx,dx
    inc di
    sub ah,1h   
    cmp ah,0h
    jz  not
            
            
    jmp l1
     
     not: printn " not found"    
      
ends

end start ; set entry point and stop the assembler.
