;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   ˵�����ɼ�����ģ��                    

;   �汾�� 1.0                                                

;   ���ߣ� Shanqincheng                                               

;   �������ڣ� 2016.01.21                                           

; --------------------------------------------------------;

;  [����˵��]  

;   1��	�궨��ģ�顣
;
;       showb ������Ϊ��ʮ��������ÿ�ſεĳɼ�ת��Ϊ��Ӧ��
;       ���������ַ����洢��ָ���Ĵ洢��Ԫ��ͬʱ��ת���ɵ�
;		�ַ�����ӡ����ڿ���̨������������Ϊ������ɼ���
;		������ɼ�ת��Ϊ��Ӧ�ַ������洢��
;		
;       showave ������Ϊ��ʮ��������ƽ���ɼ�ת��Ϊ��Ӧ����
;		����ͬʱ��ת���ɵ��ַ�����ӡ����ڿ���̨��
;                                                       
;   2��	�洢ģ�顣
; 
;   	���ݶ�Ϊ�洢ģ�顣�洢�����ַ��������ųɼ���ƽ����
;       ��������ɼ��ַ�����������ɼ��ַ�����
; 
; 
;   3�� �ӳ������
;
;       getnum �����ǻ�ȡ����ĳɼ�
;       getinput �����ǻ�ȡ����������ַ�����                                                   
;       printf �����Ǵ�ӡ����׵�ַ�����dx�е��ַ�����
;       newline�����ǻ���
; 
;       count �����ǻ�ȡ�û�һ������������ųɼ�����������
;       �ɼ��ֱ����ڶ�Ӧ�ĳɼ��洢��Ԫ�У�ͬʱ���������
;       �ɼ���ƽ���ɼ��������ƽ���ɼ��洢��Ԫ�С�
; 
;       storename �����ǻ�ȡ�û�����������ַ��������ַ���
;       �洢�����ݶ��е������������С�
; 
;       printname �����ǽ��洢�������������е������ַ���ĩ
;       β����$���ţ�֮�󽫻������������ַ����ô�ӡ�ַ�����
;       ��ʽ��ӡ����ڿ���̨��                                                   
; 
;       printspace �����Ǵ�ӡ�ո����
;       cleanscreen �����ǽ�����̨������
; 
;       printscore �����ǽ��ɼ��洢��Ԫ�е����ųɼ������ֳ�
;       ����ɼ��벻����ɼ������ú�����showb���ֱ𽫼����
;       ���벻����ɼ����ַ�������ʽ�洢����Ӧ�ļ���ɼ��ַ�
;       ���洢��Ԫ�Ͳ�����ɼ��ַ����洢��Ԫ��Ȼ�󽫲������
;       ���úڵ׺��ֵ��������ַ�����ʽ��ӡ����ڿ���̨������
;       ��ɼ��úڵ����ֵ��������ַ�����ʽ��ӡ����ڿ���̨��
; 
;       printave �����Ǵ�ӡ�洢��ƽ���ɼ��洢��Ԫ�е�ƽ���ɼ���
;                                                          
;       cleanoutput ��������ռ���ɼ��벻����ɼ��ַ����洢��
;       Ԫ��
; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;/





showb  macro da,str_adr
       local one,two,three
       ;----------------------
       push ax
       push bx
       push cx
       push dx
       mov di,str_adr  ; ���洢λ�ø���di
       cld         
       ;----------------------
one:   mov ax,da       
       mov bl,100
       and ax,00ffh
       div bl
       mov bh,ah
       mov dl,al
       add dl,30h
       cmp dl,30h
       jz  two        ; �ж��Ƿ����100
       mov ah,02h
       int 21h        ; ��ӡ�����λ������̨
       mov al,dl      
       stosb          ; ����λ���ַ���ʽ��ŵ�ָ��λ��
       
      
       ;----------------------
two:   mov bl,10
       mov ax,0
       mov al,bh
       div bl
       mov bh,ah
       mov dl,al
       add dl,30h
       cmp dl,30h
       jz three     ; �ж��Ƿ����10     
       mov ah,02h
       int 21h      ; ��ӡ���ʮλ������̨
       mov al,dl
       stosb        ; ����λ���ַ���ʽ��ŵ�ָ��λ��
       
      
       ;----------------------
      
three: mov dl,bh
       add dl,30h
       mov ah,02h
       int 21h    ; ��ӡ�����λ������̨
       mov al,dl
       stosb      ; ����λ���ַ���ʽ��ŵ�ָ��λ��
       pop dx
       pop cx
       pop bx
       pop ax
       ;----------------------
       endm
showave  macro da
       local one,two,three
       ;----------------------
       push ax
       push bx
       push cx
       push dx
      
       ;----------------------
one:   mov al,da  
       mov bl,100
       and ax,00ffh
       div bl
       mov bh,ah
       mov dl,al
       add dl,30h
       cmp dl,30h
       jz  two
       mov ah,02h
       int 21h            ; ��ӡ�����λ������̨
      
       
      
       ;----------------------
two:   mov bl,10
       mov ax,0
       mov al,bh
       div bl
       mov bh,ah
       mov dl,al
       add dl,30h
       cmp dl,30h
       jz three
       mov ah,02h
       int 21h         ; ��ӡ���ʮλ������̨
       
       
      
       ;----------------------
      
three: mov dl,bh
       add dl,30h
       mov ah,02h
       int 21h         ; ��ӡ�����λ������̨
       pop dx
       pop cx
       pop bx
       pop ax
       ;----------------------
       endm

data segment
     name_ db 5
           db ?
           db 5 dup(?)  ; ����������
     num1 dw ?     ; �ɼ�1�洢��Ԫ
     num2 dw ?     ; �ɼ�2�洢��Ԫ
     num3 dw ?     ; �ɼ�3�洢��Ԫ
     num4 dw ?     ; �ɼ�4�洢��Ԫ
     ave1 db ?     ; ƽ���ɼ��������ִ洢��Ԫ
     ave2 db ?     ; ƽ���ɼ�С������
     ask1 db 'please input name:$'
     ask2 db 'please input score:','$'
     ask3 db 'input continue?  y/n  $'
     output1 db 50 dup(?)  ; ������ɼ��ַ����洢��Ԫ
     output2 db 50 dup(?)  ; ����ɼ��ַ����洢��Ԫ
data ends

code segment
main proc far
     assume cs:code,ds:data,es:data
     start:
     mov ax,data
     mov ds,ax
     mov es,ax

     call cleanscreen
     jmp inputask
inputagain:
     call cleanoutput
     call storename
     lea dx,ask2
     mov ah,09h
     int 21h
     call count
     call printname
     call printscore
     call printave
inputask:
     call newline 
     lea dx,ask3
     mov ah,09h
     int 21h
     mov ah,01h
     int 21h

     sub al,121d
     call newline

     jz inputagain
     

total_exit:
     mov ah,4ch
     int 21h
main endp

getnum proc near
     mov bl,0h
lop1:
     mov ah,01h
     int 21h     ; ��������һ���ַ������ԣ�AL=�ַ�
     cmp al,20h
     jz exit
     cmp al,0dh
     jz exit
     sub al,30h

     xchg al,bl
     mov bh,0ah
     mul bh
     add bl,al
     jmp lop1   ; ��һ���ǽ�Ascii��ת��Ϊ���ֵĹ���

exit:
     ret
getnum endp

getinput proc near
     push ax
     push dx
     mov ah,0ah
     int 21h
     pop dx
     pop ax
     ret
getinput endp

printf proc near
     push ax
     mov ah,09h
     int 21h
     pop ax
     ret
printf endp

newline proc near
     push dx
     push ax
     mov dl,0ah
     mov ah,02h
     int 21h
     pop ax
     pop dx
     ret
newline endp

count proc near
     call getnum
     mov bh,0h
     mov num1,bx
     call getnum
     mov bh,0h
     mov num2,bx
     call getnum
     mov bh,0h
     mov num3,bx
     call getnum
     mov bh,0h
     mov num4,bx
     add bx,num3
     add bx,num2
     add bx,num1
     mov ax,bx
     mov bh,04h
     div bh
     mov ave1,al
     mov ave2,ah

     ret
count endp

storename proc near
     lea dx,ask1
     call printf
     lea dx,name_
     call getinput
     call newline ; �������ֲ��洢

     ret
storename endp

printname proc near
     lea dx,name_  
     mov bx, dx
     inc bx
     mov al,[bx] ; ��ȡ�û������е��ַ���
     add al,2d    
     mov ah,0d
     mov bx,dx   
     add bx,ax   ; bxΪ�û�������ĩβλ��
     mov al,24h  ; $�ַ���Ascii��Ϊ 24h
     mov [bx],ax 
     call newline
     add dx,2d
     call printf
     call newline ; ��ӡ�������

     ret
printname endp 

printspace proc near
       mov dl,20h
       mov ah,02h
       int 21h
       
       ret
printspace endp

cleanscreen proc near
     mov ah,06h
     mov al,0h
     mov bh,7
     mov ch,0
     mov cl,0
     mov dh,24
     mov dl,79
     int 10h
   
     ret
cleanscreen endp

printscore proc near
     num1_:     mov ax,num1     
     cmp ax,60d              ; �жϳɼ�1�Ƿ񼰸��������ŵ��洢��Ԫ output2           
     ja l1                   ; ���������ŵ��洢��Ԫ output1
     mov bx,offset output1
     showb num1,bx
     call printspace
     jmp num2_
l1:  mov bx,offset output2
     showb num1,bx
     call printspace

num2_: mov ax,num2
     cmp ax,60d
     ja l2
     mov bx,offset output1
     add bx,4d
     showb num2,bx
     call printspace
     jmp num3_
l2:  mov bx,offset output2
     add bx,4d
     showb num2,bx
     call printspace

num3_: mov ax,num3
     cmp ax,60d
     ja l3
     mov bx,offset output1
     add bx,8d
     showb num3,bx
     call printspace
     jmp num4_
l3:  mov bx,offset output2
     add bx,8d
     showb num3,bx
     call printspace

num4_: mov ax,num4
     cmp ax,60d
     ja l4
     mov bx,offset output1
     add bx,12d
     showb num4,bx
     call printspace
     jmp outnum
l4:  mov bx,offset output2
     add bx,12d
     showb num4,bx
     call printspace

outnum:     call newline
 ;    mov al,36d
 ;    mov bx,offset output1
 ;    mov di,bx
 ;    add di,15d
 ;    cld
 ;    stosb                  ; �� $ ��ŵ�������洢��Ԫ�ĵ�15d��λ����
 ;    mov bx,offset output2  ; ���� $ ���ţ���ӡ�ַ����Ϳ�����ֹ��
 ;    mov di,bx
 ;    add di,15d
 ;    cld
 ;    stosb                  ; �� $ ��ŵ�����洢��Ԫ�ĵ�15d��λ����
     
     mov bh,0h              ; ���û�ȡҳΪ��ǰҳ
     mov ah,03h             
     int 10h                ; ��ȡ��ǰ���λ��
     mov bp,offset output1  
     mov ah,09h             
     mov cx,15d             ; ����Ҫ��ӡ���ַ�������
     mov bh,0h              ; ���ô�ӡҳΪ��ǰҳ
     mov bl,00000100b       ; ������ɫΪ�ڵ׺���
     mov al,0               ; ��귵����ʼλ��
     mov ah,13h
     int 10h                ; ��ӡ�����ԵĲ�����ɼ��ַ���             
     call newline
     mov bh,0h
     mov ah,03h
     int 10h
     mov bp,offset output2
     mov ah,09h
     mov cx,15d
     mov bh,0h
     mov bl,00000001b
     mov al,0
     mov ah,13h
     int 10h
     call newline
 
     ret
printscore endp

printave proc near
     showave ave1
     mov dl,46d
     mov ah,02h
     int 21h
     showave ave2

     ret
printave endp

cleanoutput proc near
     mov di,offset output1
     mov al,0h
     cld
     mov cx,15d
     rep stosb
     mov di,offset output2
     mov al,0h
     mov cx,15d
     cld
     rep stosb

     ret
cleanoutput endp
code ends
     end start