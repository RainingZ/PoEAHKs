#MaxThreadsperHotKey 2
;#IfWinActive, ahk_class POEWindowClass
Toggle := False

!D::
if (Toggle) {
	send, {LButton up}
}
MouseGetPos, xpos, ypos
send, F
mousemove, 1294, 893
Click
send, F
mousemove, xpos, ypos
if (Toggle) {
	send, {LButton down}
}
return

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


; Kick myself
F4::
send, {Enter}{Ctrl Down}a{Ctrl Up}
send, /kick ChromeGodo
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

; Flask & Auto-run toggle
XButton2::
Double_QS := False
Toggle := !Toggle

if (!Toggle) {
	send, {LButton up}
}
else {
	send, 1
	send, 2
	send, 3
	send, 4
	send, 5
	;send, r
	;send, v
	;send, a
	send, {LButton down}
}

timer1 := 3300
timer2 := 4000
timer3 := 4900
timer4 := 4000
timer5 := 5000
timer6 := 5000
timer7 := 4900
timer8 := 4900
timer9 := 4900
timer10 := 3800

if (Double_QS) {
	old_timer4 := timer4
	tmp := timer4 + timer5
	timer4 := tmp
	timer5 := tmp
}
SetTimer, Loop1, % (Toggle) ? timer1: "Off"
SetTimer, Loop2, % (Toggle) ? timer2: "Off"
SetTimer, Loop3, % (Toggle) ? timer3: "Off"
SetTimer, Loop4, % (Toggle) ? timer4: "Off"
SetTimer, Loop5, % (Toggle) ? timer5: "Off"
;SetTimer, Loop6, % (Toggle) ? timer6: "Off"
;SetTimer, Loop7, % (Toggle) ? timer7: "Off"
;SetTimer, Loop8, % (Toggle) ? timer8: "Off"
;SetTimer, Loop9, % (Toggle) ? timer9: "Off"
;SetTimer, Loop10, % (Toggle) ? timer10: "Off"
return

;Vortexr
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

;Atziri's Promise
Loop3:
{
		send, 3
}
return

;Silver/Rumi
Loop4:
{
		send, 4
}
return

;Quick Silver
Loop5:
{
			
		if (Toggle) {
			if (Double_QS) {
				sleep old_timer4
			}
			send, 5
		}
}
return

;Vaal Grace
Loop6:
{
		send, 6
}
return

;Focus
Loop7:
{
		send, 7
}
return

;Immortal Call
Loop8:
{
		send, 8
}
return

;War Banner
Loop9:
{
		send, 9
}
return

;Blood Rage
Loop10:
{
		send, A
}
return

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