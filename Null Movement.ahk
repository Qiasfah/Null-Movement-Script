; Null Movement Script for AutoHotkey v2
; This script updates the A and D keys so that only one is held down at a time
; This avoids the situation where game engines treat holding both strafe keys as not moving
; Instead, holding both strafe keys will cause you to move in the direction of the last one that was pressed

#SingleInstance force
Persistent true
ListLines False
KeyHistory 0
ProcessSetPriority "High"
A_MaxHotkeysPerInterval := 99000000
A_HotkeyInterval := 0

global a_held := 0  ; Variable that stores the actual keyboard state of the A key
global d_held := 0  ; Variable that stores the actual keyboard state of the D key
global a_scrip := 0 ; Variable that stores the state of the A key output from the script
global d_scrip := 0 ; Variable that stores the state of the D key output from the script
global w_held := 0
global w_scrip := 0
global s_held := 0
global s_scrip := 0

*$a::
{   
    global a_held
    global d_held
    global a_scrip
    global d_scrip
    a_held := 1  ; Track the actual state of the A key
    
    if d_scrip
    { 
        d_scrip := 0
        Send "{Blind}{d up}" ; Release the D key if it's held down
    }
    
    if !a_scrip
    {
        a_scrip := 1
        Send "{Blind}{a down}" ; Send the A down key
    }
}

*$a up::
{    
    global a_held
    global d_held
    global a_scrip
    global d_scrip

    a_held := 0
    
    if a_scrip
    {
        a_scrip := 0
        Send "{Blind}{a up}"  ; Send the A up key
    }
        
    if d_held && !d_scrip
    {
        d_scrip := 1
        Send "{Blind}{d down}"  ; Send the D down key if it's held
    }
}

*$d::
{    
    global a_held
    global d_held
    global a_scrip
    global d_scrip

    d_held := 1
    
    if a_scrip
    {
        a_scrip := 0
        Send "{Blind}{a up}"  ; Release the A key if it's held down
    }
    
    if !d_scrip
    {
        d_scrip := 1
        Send "{Blind}{d down}"  ; Send the D down key
    }
}

*$d up::
{    
    global a_held
    global d_held
    global a_scrip
    global d_scrip

    d_held := 0
    
    if d_scrip
    {
        d_scrip := 0
        Send "{Blind}{d up}"  ; Send the D up key
    }
    
    if a_held && !a_scrip
    {
        a_scrip := 1
        Send "{Blind}{a down}"  ; Send the A down key if it's held
    }
}

*$w::
{    
    global w_held
    global w_scrip
    global s_held
    global s_scrip

    w_held := 1

    if s_scrip 
    {
        s_scrip := 0
        Send "{Blind}{s up}"
    }
    if !w_scrip 
    {
        w_scrip := 1
        Send "{Blind}{w down}"
    }
}

*$w up::
{    
    global w_held
    global w_scrip
    global s_held
    global s_scrip

    w_held := 0

    if w_scrip
    {
        w_scrip := 0
        Send "{Blind}{w up}"
    }

    if s_held && !s_scrip 
    {
        s_scrip := 1
        Send "{Blind}{s down}"
    }
}

*$s::
{    
    global w_held
    global w_scrip
    global s_held
    global s_scrip

    s_held := 1

    if w_scrip 
    {
        w_scrip := 0
        Send "{Blind}{w up}"
    }

    if !s_scrip 
    {
        s_scrip := 1
        Send "{Blind}{s down}"
    }
}

*$s up::
{    
    global w_held
    global w_scrip
    global s_held
    global s_scrip

    s_held := 0

    if s_scrip 
    {
        s_scrip := 0
        Send "{Blind}{s up}"
    }

    if w_held && !w_scrip 
    {
        w_scrip := 1
        Send "{Blind}{w down}"
    }
}