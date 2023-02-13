format PE GUI 5.0
entry start
include 'C:\Assembler\fasm\INCLUDE\win32a.inc'
IDM_EXIT  = 901
IDM_INFO  = 102
section '.code' code readable writeable executable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
UpdatePoints:
add byte[_Points+3],1
cmp byte[_Points+3],3Ah
jne end_update_points
sub byte[_Points+3],10
add byte[_Points+2],1
cmp byte[_Points+2],3Ah
jne end_update_points
sub byte[_Points+2],10
add byte[_Points+1],1
cmp byte[_Points+1],3Ah
jne end_update_points
sub byte[_Points+1],10
add byte[_Points],1
end_update_points:
ret
flip:
call make_buffer
mov bl,byte[sost]
mov byte[sost+1],bl

cmp byte[tip],1
jne no_tip1
cmp [tekx1+4],0
je not_do_flip
cmp [tekx1+4],9
je not_do_flip
   cmp byte[sost],1
   jne no_sost1_1
        inc dword[tekx1]
        dec dword[teky1]
        mov [sost],2
        jmp end_flip
   no_sost1_1:
   cmp byte[sost],2
   jne no_sost1_2
        dec dword[tekx1+8]
        dec dword[teky1+8]
        mov [sost],3
        jmp end_flip
    no_sost1_2:
    cmp byte[sost],3
    jne no_sost1_3
        cmp [teky1+4],21
        je not_do_flip
        dec dword[tekx1+12]
        inc dword[teky1+12]
        mov [sost],4
        jmp end_flip
    no_sost1_3:
        dec dword[tekx1]
        inc dword[teky1]
        inc dword[tekx1+8]
        inc dword[teky1+8]      
        inc dword[tekx1+12]
        dec dword[teky1+12]
        mov [sost],1
        jmp end_flip
no_tip1:

cmp byte[tip],2
jne no_tip2
cmp [tekx1+8],0
je not_do_flip
cmp [tekx1+8],9
je not_do_flip
   cmp byte[sost],1
   jne no_sost2_1
        cmp dword[teky1+8],14h
        jge not_do_flip
        add dword[tekx1],2
        sub dword[teky1],2              
        inc dword[tekx1+4]
        dec dword[teky1+4]              
        dec dword[tekx1+12]
        inc dword[teky1+12]
        mov [sost],2
        jmp end_flip
   no_sost2_1:
   cmp byte[sost],2
   jne no_sost2_2
   cmp dword[tekx1+8],8
   je not_do_flip
        add dword[tekx1],2
        add dword[teky1],2              
        inc dword[tekx1+4]
        inc dword[teky1+4]              
        dec dword[tekx1+12]
        dec dword[teky1+12]      
        mov [sost],3
        jmp end_flip
    no_sost2_2:
    cmp byte[sost],3
    jne no_sost2_3
        cmp dword[teky1+8],14h
        jge not_do_flip
        sub dword[tekx1],2
        add dword[teky1],2              
        dec dword[tekx1+4]
        inc dword[teky1+4]              
        inc dword[tekx1+12]
        dec dword[teky1+12]  
        mov [sost],4
        jmp end_flip
    no_sost2_3:
    cmp dword[tekx1+8],1
    je not_do_flip
        sub dword[tekx1],2
        sub dword[teky1],2              
        dec dword[tekx1+4]
        dec dword[teky1+4]              
        inc dword[tekx1+12]
        inc dword[teky1+12]         
        mov [sost],1
        jmp end_flip
no_tip2:
cmp byte[tip],4
jne no_tip4
cmp [tekx1+4],0
je not_do_flip
cmp [tekx1+4],9
je not_do_flip
   cmp byte[sost],1
   jne no_sost4_1
        inc [tekx1]
                dec [teky1]
                dec [tekx1+8]
                dec [teky1+8]
                sub [tekx1+12],2
        mov [sost],2
        jmp end_flip
   no_sost4_1:
        dec [tekx1]
                inc [teky1]
                inc [tekx1+8]
                inc [teky1+8]
                add [tekx1+12],2
        mov [sost],1
        jmp end_flip
no_tip4:

cmp byte[tip],5
jne no_tip5
cmp [tekx1+4],0
je not_do_flip
cmp [tekx1+4],9
je not_do_flip
   cmp byte[sost],1
   jne no_sost5_1
        inc [tekx1]
                dec [teky1]
                dec [tekx1+8]
                dec [teky1+8]
                sub [tekx1+12],2
        mov [sost],2
        jmp end_flip
   no_sost5_1:
        dec [tekx1]
                inc [teky1]
                inc [tekx1+8]
                inc [teky1+8]
                add [tekx1+12],2
        mov [sost],1
        jmp end_flip
no_tip5:

cmp byte[tip],6
jne no_tip6
   cmp byte[sost],1
   jne no_sost6_1
        add dword[tekx1],2
                sub dword[teky1],2
                inc dword[tekx1+4]
                dec dword[teky1+4]
                dec dword[tekx1+12]
                dec dword[teky1+12]
        mov [sost],2
        jmp end_flip
   no_sost6_1:
   cmp byte[sost],2
   jne no_sost6_2
      cmp [tekx1+8],8
      jge not_do_flip
        add dword[tekx1],2
                add dword[teky1],2
                inc dword[tekx1+4]
                inc dword[teky1+4]
                inc dword[tekx1+12]
                dec dword[teky1+12]
        mov [sost],3
        jmp end_flip
    no_sost6_2:
    cmp byte[sost],3
    jne no_sost6_3
        sub dword[tekx1],2
                add dword[teky1],2
                dec dword[tekx1+4]
                inc dword[teky1+4]
                inc dword[tekx1+12]
                inc dword[teky1+12]
        mov [sost],4
        jmp end_flip
    no_sost6_3:
           cmp [tekx1+8],1
       jle not_do_flip
        sub dword[tekx1],2
                sub dword[teky1],2
                dec dword[tekx1+4]
                dec dword[teky1+4]
                dec dword[tekx1+12]
                inc dword[teky1+12]
        mov [sost],1
        jmp end_flip
no_tip6:

cmp byte[tip],7
jne no_tip7
   cmp byte[sost],1
   jne no_sost7_1
      cmp [tekx1],0
      je not_do_flip
                dec dword[tekx1+4]
                dec dword[teky1+4]
                
                dec dword[tekx1+8]
                inc dword[teky1+8]
                
                sub dword[tekx1+12],2
                add dword[teky1+12],2
        mov [sost],2
        jmp end_flip
   no_sost7_1:
   cmp byte[sost],2
   jne no_sost7_2
   cmp [tekx1],1
   jle not_do_flip
                inc dword[tekx1+4]
                dec dword[teky1+4]
                
                dec dword[tekx1+8]
                dec dword[teky1+8]
                
                sub dword[tekx1+12],2
                sub dword[teky1+12],2
        mov [sost],3
        jmp end_flip
    no_sost7_2:
    cmp byte[sost],3
    jne no_sost7_3
        cmp [tekx1],9
    jge not_do_flip
                inc dword[tekx1+4]
                inc dword[teky1+4]
                
                inc dword[tekx1+8]
                dec dword[teky1+8]
                
                add dword[tekx1+12],2
                sub dword[teky1+12],2
        mov [sost],4
        jmp end_flip
    no_sost7_3:
       cmp [tekx1],8
       jge not_do_flip
        sub dword[tekx1+4],1
                inc dword[teky1+4]
                
                inc dword[tekx1+8]
                inc dword[teky1+8]
                
                add dword[tekx1+12],2
                add dword[teky1+12],2
        mov [sost],1
        jmp end_flip
no_tip7:

end_flip:
push 0
call check
cmp byte[stop],1
jne do_flip
not_do_flip:
mov bl,byte[sost+1]
mov byte[sost],bl
do_flip:
call clear_buffer
mov byte[stop],0
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
check:
tek_prov = 08h
push ebp
mov ebp, esp
cmp dword[ebp+tek_prov],0
je no_del_tetr
call DeleteTetramino
no_del_tetr:
mov eax,[teky1]
mov ecx,10
mul ecx
add eax,[tekx1]
add eax,[ebp+tek_prov]
cmp byte[Setka+eax],1
je check_end1
mov eax,[teky1+4]
mov ecx,10
mul ecx
add eax,[tekx1+4]
add eax,[ebp+tek_prov]
cmp byte[Setka+eax],1
je check_end1
mov eax,[teky1+8]
mov ecx,10
mul ecx
add eax,[tekx1+8]
add eax,[ebp+tek_prov]
cmp byte[Setka+eax],1
je check_end1
mov eax,[teky1+12]
mov ecx,10
mul ecx
add eax,[tekx1+12]
add eax,[ebp+tek_prov]
cmp byte[Setka+eax],1
je check_end1
jmp check_end0
check_end1:
cmp byte[ebp+tek_prov],0
jne nubuff
call get_buffer
nubuff:
call Place_Tetramino
mov byte[stop],1
pop ebp
ret 04h
check_end0:
call Place_Tetramino
mov byte[stop],0
pop ebp
ret 04h

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
make_buffer:
mov eax,[tekx1]
mov [tekx],eax
mov eax,[teky1]
mov [teky],eax

mov eax,[tekx1+4]
mov [tekx+4],eax
mov eax,[teky1+4]
mov [teky+4],eax

mov eax,[tekx1+8]
mov [tekx+8],eax
mov eax,[teky1+8]
mov [teky+8],eax

mov eax,[tekx1+12]
mov [tekx+12],eax
mov eax,[teky1+12]
mov [teky+12],eax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
get_buffer:
mov eax,[tekx]
mov [tekx1],eax
mov eax,[teky]
mov [teky1],eax

mov eax,[tekx+4]
mov [tekx1+4],eax
mov eax,[teky+4]
mov [teky1+4],eax

mov eax,[tekx+8]
mov [tekx1+8],eax
mov eax,[teky+8]
mov [teky1+8],eax

mov eax,[tekx+12]
mov [tekx1+12],eax
mov eax,[teky+12]
mov [teky1+12],eax

clear_buffer:
mov [tekx],0
mov [teky],0
mov [tekx+4],0
mov [teky+4],0
mov [tekx+8],0
mov [teky+8],0
mov [tekx+12],0
mov [teky+12],0
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
clear:
push edx
mov edx,grnd
clear_loop:
dec edx
cmp edx,Setka
jl end_clear
mov byte[edx],0
jmp clear_loop
end_clear:
pop edx
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
update:
push ecx
push eax
push ebx
mov ebx,Setka
mov eax,0
mov ecx,0
check_game_over:
cmp dword[ebx],0
jne to_over_game
cmp dword[ebx+4],0
jne to_over_game
cmp dword[ebx+8],0
jne to_over_game
cmp dword[ebx+12],0
jne to_over_game
cmp dword[ebx+16],0
jne to_over_game
jmp check_loop
to_over_game:
mov [gameover],1
mov [q],2
check_loop:
cmp ecx,22
je end_check_loop
mov eax,dword[ebx]
cmp eax,01010101h
jne next_loop
mov eax,dword[ebx+4]
cmp eax,01010101h
jne next_loop
mov eax,0
mov ax,word[ebx+8]
cmp eax,00000101h
jne next_loop
mov byte[ebx],2
call UpdatePoints
next_loop:
add ebx,0ah
inc ecx
jmp check_loop
end_check_loop:

mov ebx,Setka
stir_loop:
cmp ebx,grnd
je end_obn
cmp byte[ebx],2
jne no_stir
mov dword[ebx],0
mov dword[ebx+4],0
mov dword[ebx+6],0

push ecx
push ebx
perenos:
dec ebx
cmp ebx,Setka
jl end_perenos
mov ecx,0
mov cl,byte[ebx]
mov byte[ebx+10],cl
jmp perenos
end_perenos:
pop ebx
pop ecx

no_stir:
add ebx,10
jmp stir_loop
end_obn:
pop eax
pop ebx
pop ecx
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
randnew:
push edx
push eax
push ebx
mov eax,[time]
mov edx,0
mov ebx,7
idiv ebx
cmp EDX,0
jne rand_no0
mov [tekx1],4
mov [teky1],0
mov [tekx1+4],5
mov [teky1+4],0
mov [tekx1+8],5
mov [teky1+8],1
mov [tekx1+12],6
mov [teky1+12],0
mov byte[tip],1
jmp endrand
rand_no0:
cmp EDX,1
jne rand_no1
mov [tekx1],3
mov [teky1],0
mov [tekx1+4],4
mov [teky1+4],0
mov [tekx1+8],5
mov [teky1+8],0
mov [tekx1+12],6
mov [teky1+12],0
mov byte[tip],2
jmp endrand
rand_no1:
cmp EDX,2
jne rand_no2
mov [tekx1],4
mov [teky1],0
mov [tekx1+4],4
mov [teky1+4],1
mov [tekx1+8],5
mov [teky1+8],0
mov [tekx1+12],5
mov [teky1+12],1
mov byte[tip],3
jmp endrand
rand_no2:
cmp EDX,3
jne rand_no3
mov [tekx1],4
mov [teky1],0
mov [tekx1+4],5
mov [teky1+4],0
mov [tekx1+8],5
mov [teky1+8],1
mov [tekx1+12],6
mov [teky1+12],1
mov byte[tip],4
jmp endrand
rand_no3:
cmp EDX,4
jne rand_no4
mov [tekx1],4
mov [teky1],1
mov [tekx1+4],5
mov [teky1+4],1
mov [tekx1+8],5
mov [teky1+8],0
mov [tekx1+12],6
mov [teky1+12],0
mov byte[tip],5
jmp endrand
rand_no4:
cmp EDX,5
jne rand_no5
mov [tekx1],4
mov [teky1],0
mov [tekx1+4],5
mov [teky1+4],0
mov [tekx1+8],6
mov [teky1+8],0
mov [tekx1+12],6
mov [teky1+12],1
mov byte[tip],6
jmp endrand
rand_no5:
mov [tekx1],4
mov [teky1],0
mov [tekx1+4],4
mov [teky1+4],1
mov [tekx1+8],5
mov [teky1+8],0
mov [tekx1+12],6
mov [teky1+12],0
mov byte[tip],7
endrand:
pop ebx
pop eax
pop edx
mov [endfall],0
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end_fall:
mov [endfall],1
mov [stop],0
call Place_Tetramino
jmp prov_endfall
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Place_Tetramino:
push eax
push ecx

mov eax,[teky1]
mov ecx,10
mul ecx
add eax,[tekx1]
mov byte[Setka+eax],1
mov eax,[teky1+4]
mov ecx,10
mul ecx
add eax,[tekx1+4]
mov byte[Setka+eax],1
mov eax,[teky1+8]
mov ecx,10
mul ecx
add eax,[tekx1+8]
mov byte[Setka+eax],1
mov eax,[teky1+12]
mov ecx,10
mul ecx
add eax,[tekx1+12]
mov byte[Setka+eax],1

pop ecx
pop eax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DeleteTetramino:
push eax
push ebx

mov eax,[teky1]
mov ecx,10
mul ecx
add eax,[tekx1]
mov byte[Setka+eax],0
mov eax,[teky1+4]
mov ecx,10
mul ecx
add eax,[tekx1+4]
mov byte[Setka+eax],0
mov eax,[teky1+8]
mov ecx,10
mul ecx
add eax,[tekx1+8]
mov byte[Setka+eax],0
mov eax,[teky1+12]
mov ecx,10
mul ecx
add eax,[tekx1+12]
mov byte[Setka+eax],0

pop ebx
pop eax
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Thread2:
threadloop:
cmp [q],1
jne threadloop
push 500
call [Sleep]
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
jmp threadloop
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
turn:
;call DeleteTetramino
cmp [dvizh],0
je nomove
mov [dvizh],0
jmp conec
nomove:
push 10
call check
cmp [stop],1
je end_fall
prov_endfall:
call DeleteTetramino
cmp [endfall],1
je conec
inc dword[teky1]
inc dword[teky1+4]
inc dword[teky1+8]
inc dword[teky1+12]
conec:
call Place_Tetramino
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drawweb:
mov eax,[top1]
mov [teky],eax
mov eax,[left1]
mov [tekx],eax
vert:
mov eax,[right1]
cmp [tekx], eax
jg gor
  push 0
  push [top1]
  push [tekx]
  push [hdc]
  call [MoveToEx]
  
  push [bottom1]
  push [tekx]
  push [hdc]
  call [LineTo]
  add [tekx],21
  jmp vert
gor:
mov eax,[bottom1]
cmp [teky], eax
jg zakonch
  push 0
  push [teky]
  push [right1]
  push [hdc]
  call [MoveToEx]
  
  push [teky]
  push [left1]
  push [hdc]
  call [LineTo]
  add [teky],21
  jmp gor
zakonch:
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
drowblock:
cordy=0ch
cordx=10h
push ebp
push edx
mov ebp,esp
mov eax,[ebp+cordy]
sub eax,2
mov ebx,20
mul ebx
mov ebx,[top1]
add ebx,eax
add ebx,[ebp+cordy]
sub ebx,2
mov [top2],   ebx
sub ebx,20
mov [bottom2],ebx
mov eax,20
mov ebx,[ebp+cordx]
mul ebx
mov ebx,[left1]
add ebx,eax
add ebx,[ebp+cordx]
mov [left2],  ebx
sub ebx,20
mov [right2], ebx
push [hbrush]
push rect2
push [hdc]
call [FillRect]
pop edx
pop ebp
ret 08h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;
risovat:
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
game:
cmp [gameover],1
je game_over
mov edx,Setka
mov [schet],11
game_loop:
cmp edx,EndSetka
je endgame
cmp byte[edx],1
jne next_game_loop
mov eax,[schet]
mov ebx,[schet]

mov ecx,10
div cl

mov ebx,0
mov bl,ah
cmp ebx,0
jne ne_nol
push 10 ;x
mov ebx,0
mov bl,al
dec ebx
push ebx ;y
jmp prod2
ne_nol:

push ebx ;x
mov ebx,0
mov bl,al
push ebx ;y
prod2:

call drowblock
next_game_loop:
inc edx
inc [schet]
jmp game_loop
endgame:
jmp nogameover
game_over:
call clear
push 9
push _GameOver
push 50
push 75
push [hdc]
call [TextOut]
nogameover:
push ps
push dword [hWnd1]
call [EndPaint];, hwin, ADDR ps
mov [teky], 0
cmp [q],2
je no_turn
call turn
no_turn:
mov dword[takt],0
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CreateButton:
Button     = 08h
ButtonName = 0Ch
push ebp
mov ebp, esp

PUSH 0                                   ; /lParam = NULL
PUSH [hInstance]               ; |hInst = NULL
PUSH 0                                   ; |hMenu = NULL
PUSH [hWnd1]                                   ; |hParent = NULL
PUSH 25                                  ; |Height = 64 (100.)
PUSH 50                                  ; |Width = 96 (150.)
PUSH [teky]                                  ; |Y = 0
PUSH [tekx]                                   ; |X = 0
PUSH WS_VISIBLE + WS_TABSTOP + WS_CHILD + BS_DEFPUSHBUTTON
PUSH dword [ebp+ButtonName]                          ; |WindowName = "New Window"
PUSH _Button                           ; |Class = "ClassName"
PUSH 0                                 ; |ExtStyle = 0
call [CreateWindow]
mov ebx, [ebp+Button]
mov [ebx], eax
add [tekx],60
pop ebp
ret 08h
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
start:
push 0
call [GetModuleHandle]
push eax
WinMain:
mov [style], 0
mov [lpfnWndProc], WndProc
mov [cbClsExtra], 0
mov [cbWndExtra], 0
pop eax
mov [hInstance], eax
mov [hIcon], 0
mov [hCursor], 0
mov [hbrBackground], COLOR_BTNFACE
mov [lpszMenuName], 30h
mov [lpszClassName], _ClassName
push wcex
call [RegisterClass]
;wind
PUSH 0                                   ; /lParam = NULL
PUSH [hInstance]               ; |hInst = NULL
PUSH 0                                   ; |hMenu = NULL
PUSH 0                                   ; |hParent = NULL
PUSH 530                                  ; |Height = 64 (100.)
PUSH 250                                  ; |Width = 96 (150.)
PUSH 100                                  ; |Y = 0
PUSH 100                                   ; |X = 0
PUSH WS_OVERLAPPED+WS_SYSMENU+WS_VISIBLE
PUSH _WindowName                          ; |WindowName = "New Window"
PUSH _ClassName                           ; |Class = "ClassName"
PUSH 0 ; |ExtStyle = 0
call [CreateWindow]
mov [hWnd1], eax

push _Start
push hWndStart
call CreateButton
push _Pause
push hWndPause
call CreateButton
push _Stop
push hWndStop
call CreateButton
mov dword [tekx],0
push 0
push 1
push PS_SOLID
call [CreatePen];CreatePen(PS_SOLID, 2, 0);
push 000000FFh
call [CreateSolidBrush];CreatePen(PS_SOLID, 2, 0);
mov [hbrush],eax
push idThread
push 0
push 0
push Thread2
push 0
push 0
call [CreateThread]

StartLoop:
push 0
push 0
push 0
push msg
call [GetMessage]
cmp eax, 1

jb ExitProgramm
jne StartLoop

push msg
call [DispatchMessage]
jmp StartLoop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ExitProgramm:
push [wParam]
call [ExitProcess]

WndProc: ;HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam
hwnd2   = 08h
uMsg2   = 0ch
wParam2 = 10h
lParam2 = 14h
push ebp
mov ebp, esp
mov [stop],0
cmp dword [ebp+uMsg2], 10h
jz msgCloseWindow
cmp dword [ebp+uMsg2], 02h
jz msgDestroyWindow
cmp [endfall],1
jne no_endfall
call update
call randnew
mov byte[sost],1
no_endfall:

cmp dword [ebp+uMsg2],WM_KEYDOWN
jnz no_key
cmp dword [ebp+wParam2],VK_LEFT
jnz no_left
cmp [endfall],1
je no_key
cmp [tekx1],0
je no_key
cmp [tekx1+4],0
je no_key
cmp [tekx1+8],0
je no_key
cmp [tekx1+12],0
je no_key
push -1
call check
cmp [stop],1
je no_left
mov [dvizh],1
call DeleteTetramino
dec dword[tekx1]
dec dword[tekx1+4]
dec dword[tekx1+8]
dec dword[tekx1+12]
call Place_Tetramino
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
no_left:

cmp dword [ebp+wParam2],VK_RIGHT
jnz no_right
cmp [endfall],1
je no_key
cmp [tekx1],9
je no_key
cmp [tekx1+4],9
je no_key
cmp [tekx1+8],9
je no_key
cmp [tekx1+12],9
je no_key
push 1
call check
cmp [stop],1
je no_right
mov [dvizh],1
call DeleteTetramino
inc dword[tekx1]
inc dword[tekx1+4]
inc dword[tekx1+8]
inc dword[tekx1+12]
call Place_Tetramino
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
no_right:

cmp dword [ebp+wParam2],VK_DOWN
jne no_down
push 10
call check
cmp [stop],1
je no_down
mov [dvizh],1
call DeleteTetramino
inc dword[teky1]
inc dword[teky1+4]
inc dword[teky1+8]
inc dword[teky1+12]
call Place_Tetramino
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
no_down:
cmp dword [ebp+wParam2],VK_SPACE
jne no_space
cmp byte[tip],3
je no_space
call DeleteTetramino
call flip
call Place_Tetramino
mov [dvizh],1
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
no_space:
no_key:
cmp dword [ebp+uMsg2],WM_COMMAND
jnz nocom
cmp dword[ebp+wParam2],IDM_INFO
jnz nomessage
push 0
push _inf
push _Message
push 0
call [MessageBox]
nomessage:
cmp dword[ebp+wParam2],IDM_EXIT
jz msgCloseWindow
mov eax,[hWndStart]
cmp dword [ebp+lParam2],eax
jnz nostart
cmp [gameover],1
jnz nonewstart
mov dword[_Points],30303030h
nonewstart:
mov [gameover],0
push [hWnd1]
call [SetFocus]

mov byte[q],1
nostart:
mov eax,[hWndPause]
cmp dword [ebp+lParam2],eax
jnz nopause
mov byte[q],2
nopause:
mov eax,[hWndStop]
cmp dword [ebp+lParam2],eax
jnz nostop
mov dword[_Points],30303030h
mov byte[q],0
call clear
push 1
push rect3
push dword [hWnd1]
call [InvalidateRect]
mov byte[endfall],1
nostop:
nocom:

cmp dword [ebp+uMsg2],WM_PAINT
jnz nopaint
cmp [q],0
je nopaint
push ps
push dword [hWnd1]
call [BeginPaint]
call drawweb
push 5
push _Points
push 460
push 10
push [hdc]
call [TextOut]
call game
nopaint:
jmp ExitWndProc

msgCloseWindow:
push dword [ebp+hwnd2]
call [DestroyWindow]
jmp ExitWndProc
msgDestroyWindow:
push 0
call [PostQuitMessage]


ExitWndProc:
push dword [ebp+lParam2]
push dword [ebp+wParam2]
push dword [ebp+uMsg2]
push dword [ebp+hwnd2]
call [DefWindowProc]
pop ebp
ret 10h

section '.data' data readable writable
ClassName db 'PerFas',0
;
gameover db 0
sost db 1,0
tip  db 0
stop db 0
dvizh   db 0
endfall db 1
key     db 0
q       db 0
idThread dd ?
schet dd 0
takt dd 0
;coord
tekx dd 0,0,0,0
teky dd 0,0,0,0
tekx1 dd 4,5,6,7
teky1 dd 0,0,0,0

dc dd 0
;hbrush
hbrush dd 0
;hpen
hPen  dd 0
;;;;;;;
hWnd1     dd 0
hWndStart dd 0
hWndStop  dd 0
hWndPause dd 0
;wndclassex
wcex:
style           dd ?
lpfnWndProc     dd ?
cbClsExtra      dd ?
cbWndExtra      dd ?
hInstance       dd ?
hIcon           dd ?
hCursor         dd ?
hbrBackground   dd ?
lpszMenuName    dd ?
lpszClassName   dd ?
;msg
msg:
  hWnd    dd ?
  message dd ?
  wParam  dd ?
  lParam  dd ?
  time    dd ?
  pt:
    x dd ?
    y dd ?
;RECT
rect0:
left0   dd 11;
top0    dd 31;
right0  dd 221;
bottom0 dd 452;
rect1:
left1   dd 11;
top1    dd 31;
right1  dd 221;
bottom1 dd 452;
rect2:
left2   dd 0;
top2    dd 0;
right2  dd 0;
bottom2 dd 0;
rect3:
left3   dd 10;
top3    dd 30;
right3  dd 250;
bottom3 dd 480;
;;;;;;;;;;;;;;
sky: db 0,0,0,0,0,0,0,0,0,0
Setka:
sl22 db 0,0,0,0,0,0,0,0,0,0
sl21 db 0,0,0,0,0,0,0,0,0,0
sl20 db 0,0,0,0,0,0,0,0,0,0
sl19 db 0,0,0,0,0,0,0,0,0,0
sl18 db 0,0,0,0,0,0,0,0,0,0
sl17 db 0,0,0,0,0,0,0,0,0,0
sl16 db 0,0,0,0,0,0,0,0,0,0
sl15 db 0,0,0,0,0,0,0,0,0,0
sl14 db 0,0,0,0,0,0,0,0,0,0
sl13 db 0,0,0,0,0,0,0,0,0,0
sl12 db 0,0,0,0,0,0,0,0,0,0
sl11 db 0,0,0,0,0,0,0,0,0,0
sl10 db 0,0,0,0,0,0,0,0,0,0
sl9  db 0,0,0,0,0,0,0,0,0,0
sl8  db 0,0,0,0,0,0,0,0,0,0
sl7  db 0,0,0,0,0,0,0,0,0,0
sl6  db 0,0,0,0,0,0,0,0,0,0
sl5  db 0,0,0,0,0,0,0,0,0,0
sl4  db 0,0,0,0,0,0,0,0,0,0
sl3  db 0,0,0,0,0,0,0,0,0,0
sl2  db 0,0,0,0,0,0,0,0,0,0
sl1  db 0,0,0,0,0,0,0,0,0,0
EndSetka: 
grnd db 1,1,1,1,1,1,1,1,1,1
;PAINTSTRUCT
ps:
  hdc         dd ?
  fErase      dd ?
  rcPaint:     ;RECT
        left     dd ?
        top      dd ?
        right    dd ?
        bottom   dd ?
  fRestore    dd ?
  fIncUpdate  dd ?
  rgbReserved db 32 dup (?)

hMenu dd ?
_Points        : db 30h,30h,30h,30h,0
_GameOver      : db 'Game Over', 0
_ClassName     : db 'ClassName', 0
_WindowName    : db 'New Window', 0
_Button        : db 'Button', 0
_Start         : db 'Start', 0
_Stop          : db 'Stop',0
_Pause         : db 'Pause',0
_Message       : db 'Puhaev Vladimir',0
_inf           : db 'Info',0
section '.idata' import data readable writeable

  dd 0,0,0,RVA kernel_name,     RVA kernel_table
  dd 0,0,0,RVA user_name,       RVA user_table
  dd 0,0,0,RVA gdi32_name,      RVA GDI32_table
  dd 0,0,0,0,0

  kernel_table:
    ExitProcess            dd RVA _ExitProcess
    GetModuleHandle        dd RVA _GetModuleHandle
    CreateThread           dd RVA _CreateThread
    Sleep                  dd RVA _Sleep

    dd 0
  user_table:
    MessageBox             dd RVA _MessageBox
    CreateWindow           dd RVA _CreateWindow
    RegisterClass          dd RVA _RegisterClassA
    TranslateMessage       dd RVA _TranslateMessage
    GetMessage             dd RVA _GetMessage
    DispatchMessage        dd RVA _DispatchMessage
    DefWindowProc          dd RVA _DefWindowProcA
    PostQuitMessage        dd RVA _PostQuitMessage
    DestroyWindow          dd RVA _DestroyWindow
    InvalidateRect         dd RVA _InvalidateRect
    ShowWindow             dd RVA _ShowWindow
    BeginPaint             dd RVA _BeginPaint
    EndPaint               dd RVA _EndPaint
    FillRect               dd RVA _FillRect
	SetFocus               dd RVA _SetFocus
    dd 0
   
   GDI32_table:
        TextOut                dd RVA _TextOut
        CreatePen              dd RVA _CreatePen
        MoveToEx               dd RVA _MoveToEx
        LineTo                 dd RVA _LineTo
        CreateSolidBrush       dd RVA _CreateSolidBrush
        dd 0

  kernel_name db 'KERNEL32.DLL',0
  user_name   db 'USER32.DLL'  ,0
  gdi32_name  db 'GDI32.dll'   ,0

_Sleep             dw      0
  db 'Sleep',              0
_CreateThread      dw      0
  db 'CreateThread',       0
_FillRect          dw      0
   db 'FillRect',          0
_CreateSolidBrush  dw      0
   db 'CreateSolidBrush',  0
_LineTo            dw      0
   db 'LineTo',            0
_MoveToEx          dw      0
   db 'MoveToEx',          0
_CreatePen         dw      0
   db 'CreatePen',         0
_MessageBox        dw      0
   db 'MessageBoxA',       0
_GetModuleHandle   dw      0
   db 'GetModuleHandleA',  0
_ExitProcess       dw      0
   db 'ExitProcess',       0
_CreateWindow      dw      0
   db 'CreateWindowExA',   0
_GetMessage        dw      0
   db 'GetMessageA',       0
_TranslateMessage  dw      0
   db 'TranslateMessage',  0
_DispatchMessage   dw      0
   db 'DispatchMessageA',  0
_RegisterClassA    dw      0
   db 'RegisterClassA',    0
_DefWindowProcA    dw      0
   db 'DefWindowProcA',    0
_PostQuitMessage   dw      0 
   db 'PostQuitMessage',   0
_DestroyWindow     dw      0
   db 'DestroyWindow',     0
_InvalidateRect    dw      0
   db 'InvalidateRect',    0
_ShowWindow        dw      0
   db 'ShowWindow',        0
_BeginPaint        dw      0
   db 'BeginPaint',        0
_EndPaint          dw      0
   db 'EndPaint',          0
_TextOut           dw      0
   db 'TextOutA',          0
_SetFocus          dw      0
   db 'SetFocus',          0

section '.rsrc' resource data readable
directory RT_MENU , menus
resource menus,30h,LANG_ENGLISH+SUBLANG_DEFAULT,main_menu
menu main_menu
menuitem 'Exit',         IDM_EXIT
menuitem 'Info',      IDM_INFO, MFR_END