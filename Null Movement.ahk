#SingleInstance force
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off

; Null Movement Script for AutoHotkey v2
; This script updates the A and D keys so that only one is held down at a time
; This avoids the situation where game engines treat holding both strafe keys as not moving
; Instead, holding both strafe keys will cause you to move in the direction of the last one that was pressed

a_held := 0  ; Variable that stores the actual keyboard state of the A key
d_held := 0  ; Variable that stores the actual keyboard state of the D key
a_scrip := 0 ; Variable that stores the state of the A key output from the script
d_scrip := 0 ; Variable that stores the state of the D key output from the script

*$a::
    a_held := 1  ; Track the actual state of the A key
    
    if (d_scrip){ 
        d_scrip := 0
        SendInput {Blind}{d up}  ; Release the D key if it's held down
    }
    
    if (!a_scrip){
        a_scrip := 1
        SendInput {Blind}{a down}  ; Send the A down key
    }
return

*$a up::
    a_held := 0
    
    if (a_scrip){
        a_scrip := 0
        SendInput {Blind}{a up}  ; Send the A up key
    }
        
    if (d_held && !d_scrip){
        d_scrip := 1
        SendInput {Blind}{d down}  ; Send the D down key if it's held
    }
return

*$d::
    d_held := 1
    
    if (a_scrip){
        a_scrip := 0
        SendInput {Blind}{a up}  ; Release the A key if it's held down
    }
    
    if (!d_scrip){
        d_scrip := 1
        SendInput {Blind}{d down}  ; Send the D down key
    }
return

*$d up::
    d_held := 0
    
    if (d_scrip){
        d_scrip := 0
        SendInput {Blind}{d up}  ; Send the D up key
    }
    
    if (a_held && !a_scrip){
        a_scrip := 1
        SendInput {Blind}{a down}  ; Send the A down key if it's held
    }
return
