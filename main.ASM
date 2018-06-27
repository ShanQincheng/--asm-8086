;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;   说明：成绩管理模块                    

;   版本： 1.0                                                

;   作者： Shanqincheng                                               

;   创建日期： 2016.01.21                                           

; --------------------------------------------------------;

;  [程序说明]  

;   1、	宏定义模块。
;
;       showb 的作用为将十进制数字每门课的成绩转换为对应字
;       符串并将字符串存储到指定的存储单元，同时把转换成的
;		字符串打印输出在控制台，这个宏的作用为将及格成绩与
;		不及格成绩转换为相应字符串并存储。
;		
;       showave 的作用为将十进制数字平均成绩转换为对应的字
;		符串同时把转换成的字符串打印输出在控制台。
;                                                       
;   2、	存储模块。
; 
;   	数据段为存储模块。存储姓名字符串，四门成绩，平均成
;       绩，及格成绩字符串，不及格成绩字符串。
; 
; 
;   3、 子程序介绍
;
;       getnum 功能是获取输入的成绩
;       getinput 功能是获取输入的姓名字符串。                                                   
;       printf 功能是打印输出首地址存放在dx中的字符串。
;       newline功能是换行
; 
;       count 功能是获取用户一次性输入的四门成绩，并将四门
;       成绩分别存放在对应的成绩存储单元中，同时计算出四门
;       成绩的平均成绩，存放在平均成绩存储单元中。
; 
;       storename 功能是获取用户输入的姓名字符串并将字符串
;       存储在数据段中的姓名缓冲区中。
; 
;       printname 功能是将存储在姓名缓冲区中的姓名字符串末
;       尾加上$符号，之后将缓冲区的姓名字符串用打印字符串的
;       方式打印输出在控制台。                                                   
; 
;       printspace 功能是打印空格符。
;       cleanscreen 功能是将控制台清屏。
; 
;       printscore 功能是将成绩存储单元中的四门成绩，区分出
;       及格成绩与不及格成绩，调用宏命令showb，分别将及格成
;       绩与不及格成绩以字符串的形式存储到对应的及格成绩字符
;       串存储单元和不及格成绩字符串存储单元。然后将不及格成
;       绩用黑底红字的属性以字符串形式打印输出在控制台，将及
;       格成绩用黑底蓝字的属性以字符串形式打印输出在控制台。
; 
;       printave 功能是打印存储在平均成绩存储单元中的平均成绩。
;                                                          
;       cleanoutput 功能是清空及格成绩与不及格成绩字符串存储单
;       元。
; 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;/





showb  macro da,str_adr
       local one,two,three
       ;----------------------
       push ax
       push bx
       push cx
       push dx
       mov di,str_adr  ; 将存储位置赋给di
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
       jz  two        ; 判断是否大于100
       mov ah,02h
       int 21h        ; 打印输出百位到控制台
       mov al,dl      
       stosb          ; 将百位以字符形式存放到指定位置
       
      
       ;----------------------
two:   mov bl,10
       mov ax,0
       mov al,bh
       div bl
       mov bh,ah
       mov dl,al
       add dl,30h
       cmp dl,30h
       jz three     ; 判断是否大于10     
       mov ah,02h
       int 21h      ; 打印输出十位到控制台
       mov al,dl
       stosb        ; 将百位以字符形式存放到指定位置
       
      
       ;----------------------
      
three: mov dl,bh
       add dl,30h
       mov ah,02h
       int 21h    ; 打印输出个位到控制台
       mov al,dl
       stosb      ; 将个位以字符形式存放到指定位置
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
       int 21h            ; 打印输出百位到控制台
      
       
      
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
       int 21h         ; 打印输出十位到控制台
       
       
      
       ;----------------------
      
three: mov dl,bh
       add dl,30h
       mov ah,02h
       int 21h         ; 打印输出个位到控制台
       pop dx
       pop cx
       pop bx
       pop ax
       ;----------------------
       endm

data segment
     name_ db 5
           db ?
           db 5 dup(?)  ; 姓名缓冲区
     num1 dw ?     ; 成绩1存储单元
     num2 dw ?     ; 成绩2存储单元
     num3 dw ?     ; 成绩3存储单元
     num4 dw ?     ; 成绩4存储单元
     ave1 db ?     ; 平均成绩整数部分存储单元
     ave2 db ?     ; 平均成绩小数部分
     ask1 db 'please input name:$'
     ask2 db 'please input score:','$'
     ask3 db 'input continue?  y/n  $'
     output1 db 50 dup(?)  ; 不及格成绩字符串存储单元
     output2 db 50 dup(?)  ; 及格成绩字符串存储单元
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
     int 21h     ; 键盘输入一个字符并回显，AL=字符
     cmp al,20h
     jz exit
     cmp al,0dh
     jz exit
     sub al,30h

     xchg al,bl
     mov bh,0ah
     mul bh
     add bl,al
     jmp lop1   ; 这一段是将Ascii码转换为数字的过程

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
     call newline ; 输入名字并存储

     ret
storename endp

printname proc near
     lea dx,name_  
     mov bx, dx
     inc bx
     mov al,[bx] ; 获取该缓冲区中的字符数
     add al,2d    
     mov ah,0d
     mov bx,dx   
     add bx,ax   ; bx为该缓冲区最末尾位置
     mov al,24h  ; $字符的Ascii码为 24h
     mov [bx],ax 
     call newline
     add dx,2d
     call printf
     call newline ; 打印输出名字

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
     cmp ax,60d              ; 判断成绩1是否及格，若及格存放到存储单元 output2           
     ja l1                   ; 若不及格存放到存储单元 output1
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
 ;    stosb                  ; 将 $ 存放到不及格存储单元的第15d的位置上
 ;    mov bx,offset output2  ; 有了 $ 符号，打印字符串就可以终止了
 ;    mov di,bx
 ;    add di,15d
 ;    cld
 ;    stosb                  ; 将 $ 存放到及格存储单元的第15d的位置上
     
     mov bh,0h              ; 设置获取页为当前页
     mov ah,03h             
     int 10h                ; 获取当前光标位置
     mov bp,offset output1  
     mov ah,09h             
     mov cx,15d             ; 设置要打印的字符串长度
     mov bh,0h              ; 设置打印页为当前页
     mov bl,00000100b       ; 设置颜色为黑底红字
     mov al,0               ; 光标返回起始位置
     mov ah,13h
     int 10h                ; 打印带属性的不及格成绩字符串             
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
