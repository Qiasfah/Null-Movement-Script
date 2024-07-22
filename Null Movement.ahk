#SingleInstance, Force
#NoEnv
#MaxHotkeysPerInterval, 99000000
#HotkeyInterval, 99000000
#KeyHistory, 0
SetWorkingDir, %A_ScriptDir%
#Persistent
SetKeyDelay, -1, -1
SetBatchLines, -1
ListLines, Off
Process, Priority,, A

; Null Movement Script
a_held := a_scrip := d_held := d_scrip := 0
w_held := w_scrip := s_held := s_scrip := 0

*$a::
    a_held := 1
    if d_scrip {
        d_scrip := 0
        Send, {Blind}{d up}
    }
    if !a_scrip {
        a_scrip := 1
        Send, {Blind}{a down}
    }
return

*$a up::
    a_held := 0
    if a_scrip {
        a_scrip := 0
        Send, {Blind}{a up}
    }
    if d_held && !d_scrip {
        d_scrip := 1
        Send, {Blind}{d down}
    }
return

*$d::
    d_held := 1
    if a_scrip {
        a_scrip := 0
        Send, {Blind}{a up}
    }
    if !d_scrip {
        d_scrip := 1
        Send, {Blind}{d down}
    }
return

*$d up::
    d_held := 0
    if d_scrip {
        d_scrip := 0
        Send, {Blind}{d up}
    }
    if a_held && !a_scrip {
        a_scrip := 1
        Send, {Blind}{a down}
    }
return

*$w::
    w_held := 1
    if s_scrip {
        s_scrip := 0
        Send, {Blind}{s up}
    }
    if !w_scrip {
        w_scrip := 1
        Send, {Blind}{w down}
    }
return

*$w up::
    w_held := 0
    if w_scrip {
        w_scrip := 0
        Send, {Blind}{w up}
    }
    if s_held && !s_scrip {
        s_scrip := 1
        Send, {Blind}{s down}
    }
return

*$s::
    s_held := 1
    if w_scrip {
        w_scrip := 0
        Send, {Blind}{w up}
    }
    if !s_scrip {
        s_scrip := 1
        Send, {Blind}{s down}
    }
return

*$s up::
    s_held := 0
    if s_scrip {
        s_scrip := 0
        Send, {Blind}{s up}
    }
    if w_held && !w_scrip {
        w_scrip := 1
        Send, {Blind}{w down}
    }
return
