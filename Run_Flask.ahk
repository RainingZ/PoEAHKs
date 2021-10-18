#MaxThreadsperHotKey 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; README ;
; Change timer for key 1-9 and t, when timer is 0, it's turned off
; Change Double_QS for two quick silver flasks on 4 and 5
; Change MyName to your character name, for kicking yourself function
; Change StartupStr for keys to press when starting up the auto run/flask (righteous fire etc.)
; Res = 0 for 1080p, 1 for 2k
; MButton5 for auto run and auto flasks
; MButton4 for control left click spam and pick up item spam (double z in between for item position reset)
; Shift+Mbutton4 for shift left click spam
; Alt+D for portal scroll, at inventory slot - left slot of the bottom right slot
; ~ for exit to character selection (esc+click)
; F4 for kicking yourself
; F5 for hideout
; F6 for delve
; F7 for menagerie
; Alt+R for script reload (after changing a timer and saving for example)
; Alt+S for gem swap on main weapon
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

timer1 := 0000
timer2 := 0000
timer3 := 0000
timer4 := 4000
timer5 := 4000
timer6 := 0000
timer7 := 0000
timer8 := 0000
timer9 := 0000
timer10 := 0000
Double_QS := True
MyName = Raining
StartupStr := ""
Res = 1
GemPos = 6

old_timer4 := timer4
tmp_timer := timer4 + timer5
if (Double_QS) {
	timer4 := tmp_timer
	timer5 := tmp_timer
}

!T::
MouseGetPos, xpos, ypos 
MsgBox, The cursor is at X%xpos%, Y%ypos%.
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

inSecWeap := False
firstLoop := True

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Flask & Auto-run toggle
XButton2::
Toggle := !Toggle

if (!Toggle) {
	send, {LButton up}
}
else {
	if (timer1 != 0) {
		send, 1
	}
	if (timer2 != 0) {
		send, 2
	}
	if (timer3 != 0) {
		send, 3
	}
	if (timer4 != 0) {
		send, 4
	}
	if (timer5 != 0 and !Double_QS) {
		send, 5
	}
	if (timer6 != 0) {
		send, 6
	}
	if (timer7 != 0) {
		send, 7
	}
	if (timer8 != 0) {
		send, 8
	}
	if (timer9 != 0) {
		send, 9
	}
	if (timer10 != 0) {
		send, t
	}
	send, %StartupStr%
	send, {LButton down}
}

SetTimer, Loop1, % (Toggle and (timer1 != 0)) ? timer1: "Off"
SetTimer, Loop2, % (Toggle and (timer2 != 0)) ? timer2: "Off"
SetTimer, Loop3, % (Toggle and (timer3 != 0)) ? timer3: "Off"
SetTimer, Loop4, % (Toggle and (timer4 != 0)) ? timer4: "Off"
SetTimer, Loop5, % (Toggle and (timer5 != 0)) ? timer5: "Off"
SetTimer, Loop6, % (Toggle and (timer6 != 0)) ? timer6: "Off"
SetTimer, Loop7, % (Toggle and (timer7 != 0)) ? timer7: "Off"
SetTimer, Loop8, % (Toggle and (timer8 != 0)) ? timer8: "Off"
SetTimer, Loop9, % (Toggle and (timer9 != 0)) ? timer9: "Off"
SetTimer, Loop10, % (Toggle and (timer10 != 0)) ? timer10: "Off"
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/*
;Whirling Blade - Fortify
e::
if (Toggle) {
	if (!inSecWeap){
		send x
		inSecWeap := !inSecWeap
	}
	sleep 100
	send 6
	sleep 700
	if (inSecWeap){
		send x
		inSecWeap := !inSecWeap
	}
}
else {
	send {e down}
}
return

e up::
if (!Toggle) {
	send {e up}
}
return
*/

1::
if (Toggle) {
	send, 123
}
else {
	send, {1 down}
}
return

1 up::
if (!Toggle) {
	send {1 up}
}	
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!S::
if (Toggle) {
	send, {LButton up}
}
MouseGetPos, xpos, ypos
BlockInput, On
send, F
if (GemPos = 8) {
	MouseClick, right, 1977, 494
}
else {
	MouseClick, left, 2499, 825
}
if (GemPos = 1) {
	MouseClick, left, 1808, 235
}
if (GemPos = 2) {
	MouseClick, left, 1877, 235
}
if (GemPos = 3) {
	MouseClick, left, 1877, 305
}
if (GemPos = 4) {
	MouseClick, left, 1808, 305
}
if (GemPos = 5) {
	MouseClick, left, 1808, 375
}
if (GemPos = 6) {
	MouseClick, left, 1877, 375
}
if (GemPos = 7) {
	MouseClick, left, 1877, 336
}
if (GemPos = 8) {
	MouseClick, left, 2081, 478
}
if (GemPos = 8) {
	MouseClick, left, 1977, 494
}
else {
	MouseClick, left, 2499, 825
}
send, F
BlockInput, Off

mousemove, xpos, ypos
if (Toggle) {
	send, {LButton down}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!D::
if (Toggle) {
	send, {LButton up}
}
MouseGetPos, xpos, ypos
BlockInput, On
send, F

; For skill level up
; mousemove, 1294, 893
; Click

; For portal scroll
if (Res = 0) {
	MouseClick, right, 1827, 829
}
else {
	MouseClick, right, 2430, 1099
}

send, F
BlockInput, Off

mousemove, xpos, ypos
if (Toggle) {
	send, {LButton down}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
`::
if (Toggle) {
	Toggle := False
}
BlockInput, On
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /exit
send, {Enter}
BlockInput, Off
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Auto-run left click modification
LButton::
if (Toggle) {
	send, {LButton up}
	send, {LButton down}
} else {
	send, {LButton down}
}
return

LButton Up::
if (Toggle) {
	send, {LButton up}
	sleep 100
	send, {LButton down}
} else {
	send, {LButton up}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
/*
; Insta skill / Flask before R skill
r::
if (Toggle) {
	send, A
}
Send {r down}
return

r up::
Send {r up}
return

; Unarmed weapon swap
x::
if (Toggle) {
	Send f
}
Send {x down}
Send {x up}
return

x up::
if (Toggle) {
	Send f
}
return
*/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Kick myself
F4::
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /kick
send, {Space}
send, %MyName%
send, {Enter}
return

; Hideout
F5::
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /hideout
send, {Enter}
return

F6::
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /delve
send, {Enter}
return

F7::
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /menagerie
send, {Enter}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hold to spam control left click
XButton1::
SetTimer, CtrlLeft, 50
return

XButton1 up::
SetTimer, CtrlLeft, OFF
if (Toggle) {
	send, {LButton down}
}
return

*XButton1::
send, {Shift down}
SetTimer, ShiftLeft, 50
return

*XButton1 up::
SetTimer, ShiftLeft, OFF
send, {Shift up}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
Loop1:
{
		send, 1
}
return

Loop2:
{
		send, 2
}
return

Loop3:
{
		send, 3
}
return

Loop4:
{
		send, 4
}
return

Loop5:
{
		if (Double_QS) {
			sleep old_timer4
		}
		send, 5
}
return

Loop6:
{
		send, 6
}
return

Loop7:
{
		send, 7
}
return

Loop8:
{
		send, 8
}
return

Loop9:
{
		send, 9
}
return

Loop10:
{
		send, t
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CtrlLeft:
{
		send, z
		send, z
		send ^{Click}
}
return

ShiftLeft:
{
		send {Click}
}
return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!R::
Reload
return
