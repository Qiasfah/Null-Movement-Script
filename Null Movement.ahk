#SingleInstance
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A


; Null Movement Script
; This updates the A and D keys so that only one is held down at a time
; This avoids the situation where game engines treat holding both strafe keys as not moving
; Insead holding both strafe keys will cause you to move in the direction of the last one that was pressed

a_held := 0 ; Variable that stores the actual keyboard state of the a key
d_held := 0 ; Variable that stores the actual keyboard state of the d key
a_scrip := 0 ; Variable that stores the state of the a key output from the script
d_scrip := 0 ; Variable that stores the state of the d key output from the script

*$a:: ; Every time the a key is pressed, * to include occurences with modifiers (shift, control, alt, etc)
	a_held := 1 ; Track the actual state of the keyboard key
	
	if (d_scrip){ 
		d_scrip := 0
		Send {Blind}{d up} ; Release the d key if it's held down, {Blind} so it includes any key modifiers (shift primarily)
	}
	
	if (!a_scrip){
		a_scrip := 1
		Send {Blind}{a down} ; Send the a down key
	}
	return

*$a up:: ; Every time the a key is released
	a_held := 0
	
	if (a_scrip){
		a_scrip := 0
		Send {Blind}{a up} ; Send the a up key
	}
		
	if (d_held AND !d_scrip){
		d_scrip := 1
		Send {Blind}{d down} ; Send the d down key if it's held
	}
	return

*$d:: ; Every time the d key is pressed
	d_held := 1
	
	if (a_scrip){
		a_scrip := 0
		Send {Blind}{a up}
	}
	
	if (!d_scrip){
		d_scrip := 1
		Send {Blind}{d down}
	}
	return

*$d up:: ; Every time the d key is released
	d_held := 0
	
	if (d_scrip){
		d_scrip := 0
		Send {Blind}{d up}
	}
	
	if (a_held AND !a_scrip){
		a_scrip := 1
		Send {Blind}{a down}
	}
	return