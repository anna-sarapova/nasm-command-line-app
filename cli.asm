[bits 16]
mov ax, 07E0h
mov ds, ax
mov es, ax
add ax, 80h
mov ss, ax
mov ax, 255
mov sp, ax

jmp start                     ;jump to start

; ==================================================== 
draw_christmas_tree:


mov ax, 06h           ;scroll up window
mov bh, 07h           ;normal attribute
mov cx, 0000          ;from row=00, column=00
mov dx, 1C1Ch         ;to row=1Ch, column=1Ch
int 10h               ;BIOS interrupt call, video services

mov ah, 00h           ;set video mode
mov al, 13h           ;mode=13(CGA High resolution)
int 10h               ;BIOS interrupt call, video services

mov dx,80
mov bx,101

DrwTree:             ;draws a green pine tree with a 3 nested jump commands
mov cx, 126
sub cx, bx           ;keeps green tree symmetrical

GrTree:
mov ah, 0Ch
mov al, 02h          ;pixels=green
int 10h
inc cx
cmp cx, bx
jnz GrTree
cmp bx, 65           ;when bx reaches a predetermined value (size of green tree)
jle break            ;loop exits

sub dx, 3            ;moves green line up
sub bx, 2            ;makes tree narrow on each pass

jmp DrwTree

break:
;break

DrwTrunk:            ;draws a brown trunk 
mov cx, 53           ;start line at column=53   
mov dx, 81           ;start line at row=81
jmp drw_hrz_lines

increment: 
inc dx
mov cx, 53

drw_hrz_lines:
mov ah, 0Ch         ;write graphics pixel
mov al, 06h         ;pixels=light brown
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 73          ;draw until column=73
jne drw_hrz_lines   ;if not equal, repeat
cmp dx, 87   
jne increment


Star:

mov cx, 62
mov dx, 25

drw_point:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 64          ;draw until column=64
jne drw_point       ;if not equal, repeat

;;
mov cx, 62
mov dx, 21

drw_point_1:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 64          ;draw until column=64
jne drw_point_1     ;if not equal, repeat

;;
mov cx, 61
mov dx,  24

drw_hrz_line_1:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 65          ;draw until column=65
jne drw_hrz_line_1  ;if not equal, repeat

;;
mov cx, 60
mov dx, 23

drw_hrz_line_2:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 66          ;draw until column=66
jne drw_hrz_line_2  ;if not equal, repeat

;;
mov cx, 61
mov dx,  22

drw_hrz_line_3:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 65          ;draw until column=65
jne drw_hrz_line_3  ;if not equal, repeat




lights:

mov cx, 59
mov dx, 34

drw_diag_1:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 61          ;draw until column=61
inc dx
cmp dx, 51
jne drw_diag_1     ;if not equal, repeat

;;
mov cx, 74
mov dx, 54

drw_diag_2:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
dec cx              ;increment CX register
cmp cx, 76          ;draw until column=76
inc dx
cmp dx, 78
jne drw_diag_2     ;if not equal, repeat

;;
mov cx, 70
mov dx, 37

drw_diag_3:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
dec cx              ;increment CX register
cmp cx, 62          ;draw until column=62
inc dx
cmp dx, 81
jne drw_diag_3     ;if not equal, repeat

;;
mov cx, 47
mov dx, 47

drw_diag_4:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 49          ;draw until column=49
inc dx
cmp dx, 79
jne drw_diag_4     ;if not equal, repeat

;;
mov cx, 35
mov dx, 64

drw_diag_5:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 37          ;draw until column=37
inc dx
cmp dx, 77
jne drw_diag_5     ;if not equal, repeat

;;
mov cx, 91
mov dx, 67

drw_diag_6:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Eh         ;pixels=light yelow
int 10h             ;BIOS interrupt call, video services
dec cx              ;increment CX register
cmp cx, 78           ;draw until column=78
inc dx
cmp dx, 79
jne drw_diag_6     ;if not equal, repeat



Balls:
;;
mov cx, 44          ;start line at column=46 
mov dx, 61          ;start line at row=61
jmp drw_box_1

increment_2: 
inc dx
mov cx, 44

drw_box_1:
mov ah, 0Ch         ;write graphics pixel
mov al, 09h         ;pixels=light blue
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 47          ;draw until column=47
jne drw_box_1       ;if not equal, repeat
cmp dx, 63   
jne increment_2

;;
mov cx, 76
mov dx, 51
jmp drw_box_2

increment_3:
inc dx
mov cx, 76

drw_box_2:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Ch         ;pixels=light red
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 79          ;draw until column=79
jne drw_box_2       ;if not equal, repeat
cmp dx, 53   
jne increment_3

;;
mov cx, 48
mov dx, 78
jmp drw_box_3

increment_4:
inc dx
mov cx, 48

drw_box_3:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Bh         ;pixels=light cyan
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 51          ;draw until column=51
jne drw_box_3       ;if not equal, repeat
cmp dx, 80   
jne increment_4

;;
mov cx, 56
mov dx, 31
jmp drw_box_4

increment_5:
inc dx
mov cx, 56

drw_box_4:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Dh         ;pixels=light magenta
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 59          ;draw until column=59
jne drw_box_4       ;if not equal, repeat
cmp dx, 33  
jne increment_5

;;
mov cx, 78
mov dx, 78
jmp drw_box_5 

increment_6:
inc dx
mov cx, 78

drw_box_5:
mov ah, 0Ch         ;write graphics pixel
mov al, 0Fh         ;pixels=light white
int 10h             ;BIOS interrupt call, video services
inc cx              ;increment CX register
cmp cx, 81          ;draw until column=81
jne drw_box_5       ;if not equal, repeat
cmp dx, 80   
jne increment_6



hlt


                
compare_strs_si_bx:
    push si                   ;push SI value to stack
    push bx                   ;push BX value to stack
    push ax                   ;push AX value to stack

comp:
    mov ah, [bx]              ;move input character into AH register
    cmp [si], ah              ;check if characters match
    jne not_equal             ;if not, jump to not_rqual

    cmp byte [si], 0          ;checking if SI is empty
    je first_zero             ;if equal, jump to first_zero

    inc si                    ;increment SI register
    inc bx                    ;increment BX register

    jmp comp                  ;and repeat

first_zero:
    cmp byte [bx], 0          ;check if BX is empty
    jne not_equal             ;if not, jump to not_equal

    stc                       ;set carry flag

    pop si                    ;restoring what is on top of stack into SI
    pop bx                    ;restoring what is on top of stack into BX
    pop ax                    ;restoring what is on top of stack into AX

    ret

not_equal:
    clc                       ;clear carry flag

    pop si                    ;restoring what is on top of stack into SI
    pop bx                    ;restoring what is on top of stack into BX
    pop ax                    ;restoring what is on top of stack into AX

    ret       
    
print_string_si:
    push ax                   ;push AX value to stack

    mov ah, 0Eh               ;teletype output
    call print_next_char      

    pop ax                    ;restoring  what is on top of stack into AX
    ret                       

print_next_char:
    mov al, [si]              ;loading of chracter into AL register
    cmp al, 0                 ;cheking if AL is empty

    jz if_zero                ;jump to if_zero if empty

    int 10h                   ;BIOS interrupt call video services
    inc si                    ;increment SI register

    jmp print_next_char       ;and repeat

if_zero:
    ret
    
    
start:
    cli                       ;clear interrupt flag

    mov ah, 00h               ;clearing the screen
    mov al, 03h
    int 10h

    mov sp, 0x7c00            ;stack initialization

    mov si, greetings         ;move greetings variable into SI register
    call print_string_si      ;call printing method

mainloop:
    mov si, prompt            ;move prompt into SI register
    call print_string_si      ;call printing method

    call get_input            ;call get_input method

    jmp mainloop             

get_input:
    mov bx, 0                 ;intializing BX register for user input

input_processing:
    mov ah, 00h               ;read key press
    int 16h                   ;BIOS interrupt call keyboard services

    cmp al, 0Dh               ;checking if carriage return is pressed
    je check_the_input        ;jump to check_the_input if pressed

    cmp al, 08h               ;cheking if backspace is pressed
    je backspace_pressed      ;jump to backspace_pressed if pressed

    mov ah, 0Eh               ;teletype output
                              ;if none of above just type the next character
    int 10h                   ;BIOS interrupt call video services

    mov [input+bx], al        ;storing chracter in input buffer
    inc bx                    ;increment BX register

    cmp bx, 32                ;if BX is full
    je check_the_input        ;jump to check_the_input

    jmp input_processing      ;if not, repeat


backspace_pressed:
    cmp bx, 0                 ;if BX is empty
    je input_processing       ;we do nothing

    mov ah, 0Eh               ;printing backspace, meaning that the carriage
    int 10h                   ;moves back, but the charcater is not deleted

    mov al, ' '               ;we print blank space on that place to black out
    int 10h                   ;the character the cursor is now on top of

    mov al, 08h               ;then printing another backspace
    int 10h                   

    dec bx
    mov byte [input+bx], 0    ;delete the character from input buffer

    jmp input_processing      ;and go back

check_the_input:
    inc bx                    ;put 0 at the end of input
    mov byte [input+bx], 0    ;marking end of line   

    mov si, new_line          ;printing new line
    call print_string_si

    mov si, help_command      ;move help_command variable into SI register
    mov bx, input             ;move input into BX register
    call compare_strs_si_bx   ;check if input matches help_command
    
    jc equal_help             ;if matched, jump to equal_help

    mov si, about_command     ;move about_command variable into SI register
    mov bx, input             ;move input into BX register
    call compare_strs_si_bx   ;check if input matches about_command
    
    jc equal_about            ;if macthed, jump to equal_about
    
    mov si, secret_command    ;move about_command variable into SI register
    mov bx, input             ;move input into BX register
    call compare_strs_si_bx   ;check if input matches secret_command
    
    jc equal_secret           ;if macthed, jump to equal_secret
    
    mov si, draw_command    ;move about_command variable into SI register
    mov bx, input             ;move input into BX register
    call compare_strs_si_bx   ;check if input matches secret_command
    
    jc equal_draw           ;if macthed, jump to equal_secret
    
    mov bx, input
    cmp byte[bx], 0
    je mainloop

    jmp equal_to_nothing      ;if matches nething then inavlid command

equal_help:
    mov si, help_desc1
    call print_string_si
    
    mov si, help_desc2
    call print_string_si   
    
    mov si, help_desc3
    call print_string_si 
    
    jmp done

equal_about:
    mov si, about_desc
    call print_string_si

    jmp done
    
equal_secret:
    mov si, secret_desc1
    call print_string_si
      
    jmp done

equal_draw:
    call draw_christmas_tree
    jmp done

equal_to_nothing:
    mov si, wrong_command
    call print_string_si

    jmp done

; done clears input buffer
done:
    cmp bx, 0                 
    je exit                   

    dec bx                    
    mov byte [input+bx], 0

    jmp done                  

exit:
    ret
    
; 0Dh - carriage return symbol, 0Ah - new line symbol
wrong_command: db "Wrong command!", 0Dh, 0Ah, 0
greetings: db "The OS is on. Type 'help' for commands", 0Dh, 0Ah, 0Ah, 0
help_desc1: db "about - short description", 0Dh, 0Ah, 0
help_desc2: db "secret - surprise", 0Dh, 0Ah, 0
help_desc3: db "draw - prints a drawing", 0Dh, 0Ah, 0
about_desc: db "CLI app, Sarapova Ana, FAF-192", 0Dh, 0Ah, 0
secret_desc1: db "    \(^o^)/ -- HoHoHo, Happy New Year!", 0Dh, 0Ah, 0
prompt: db ">", 0
new_line: db 0Dh, 0Ah, 0
help_command: db "help", 0
about_command: db "about", 0
secret_command: db "secret", 0
draw_command: db "draw", 0
input: times 16 db 0          ;input buffer size - 16 bytes

times 2048 - ($-$$) db 0 ; pad with zeros in order to fill the 1024 bytes
stack:
  times 256 db 0
times 2560 - ($-$$) db 0