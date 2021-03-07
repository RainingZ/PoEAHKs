#MaxThreadsperHotKey 2
;#IfWinActive, ahk_class POEWindowClass

; Auto-run left click modification
LButton::
if (Run) {
	send, {LButton up}
	send, {LButton down}
} else {
	send, {LButton down}
}
return

LButton Up::
if (Run) {
	send, {LButton up}
	sleep 100
	send, {LButton down}
} else {
	send, {LButton up}
}
return

; Panic all flask button / ~ for self call
MButton::
send, 1
send, 2
send, 3
send, 4
send, 5
send, 6
return

; Blade Vortex with greater spell echo 70% more dmg trick / Blade blast mine on 7 and V for detonation
!q::
MouseGetPos, xpos, ypos
x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y
send, 7
sleep 500
send, q
sleep 150
send, v
mousemove, xpos, ypos
return

; Insta skill / Flask before R skill
a::
Send {a down}
if (Toggle) {
	send, 3
}
return

a up::
Send {a up}
return

/*
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
send, /kick
send, {Space}
send, Ba_BaBa_BV
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
if (Run) {
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

; Flask & Auto-run toggle & "Q" for BV startup & "9" for RF startup
XButton2::
if (Toggle) {
	send, {LButton up}
} else {
	send, 9
}
Toggle := !Toggle
Run := Toggle ; Comment this to disable auto-run
if (Run) {
	send, {LButton down}
	;send, q
} else {
	send, {LButton up}
}

SetTimer, Loop1, % (Toggle) ? 6700 : "Off"
SetTimer, Loop2, % (Toggle) ? 6100 : "Off"
SetTimer, Loop3, % (Toggle) ? 4800 : "Off"
SetTimer, Loop4, % (Toggle) ? 4800 : "Off"
SetTimer, Loop5, % (Toggle) ? 0 : "Off"
;SetTimer, Loop6, % (Toggle) ? 4500 : "Off"
;SetTimer, Loop7, % (Toggle) ? 1900 : "Off"
;SetTimer, Loop8, % (Toggle) ? 0 : "Off"
;SetTimer, Loop9, % (Toggle) ? 0 : "Off"
;SetTimer, Loop10, % (Toggle) ? 0 : "Off"

return

;Vortex
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
		;if (Toggle) {
		;	send, 3
		;	sleep 4500
		;}
		;if (Toggle) {
		;	send, 4
		;	sleep 4500
		;}
		if (Toggle) {
			send, 5
			sleep 4800
		}
}
return

;Focus
Loop7:
{
		Send 7
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
		if (Toggle) {
			send, q
			sleep 7750
		}
}
return

;Berserk
Loop10:
{
		send, 0
}
return

;Vaal Grace
Loop6:
{
		send, 6
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