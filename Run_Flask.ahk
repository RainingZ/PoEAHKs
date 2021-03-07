#MaxThreadsperHotKey 2
;#IfWinActive, ahk_class POEWindowClass

; Stash tab Scroll with Control + Mousewheel
^WheelDown::Send {Right}
^WheelUp::Send {Left}

; Alt + Q to control click 11x5 inventory (1 row left)
$!Q::
BlockInput On 
x := 1297
y := 616
CellWidth = 53
Loop 11 {
	Loop 5 { 
		if GetKeyState("LButton", "P") = 1
			break
		MouseMove , x, y, 1
		sleep 10
		send ^{Click}	
		y += CellWidth			
	}
	y := 616
	x += CellWidth
}
BlockInput Off
return

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
send, /kick ARainingC
send, {Enter}
return

; Hideout / Delve / Menagerie
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

; Hold Mouse4 to spam control left click
XButton1::
SetTimer, CtrlLeft, 50
return

XButton1 up::
SetTimer, CtrlLeft, OFF
if (Run) {
	send, {LButton down}
}
return

; Hold Shift + Mouse4 to spam shift left click
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
if (Toggle) {
	send, {LButton up}
}
Toggle := !Toggle
Run := Toggle ; Comment this to disable auto-run
if (Run) {
	;send, A ; Comment this to disable Righteous Fire start-up
	send, {LButton down}
} else {
	send, {LButton up}
}

; Comment to disable flask / skill
SetTimer, Loop1, % (Toggle) ? 6000 : "Off"
SetTimer, Loop2, % (Toggle) ? 6600 : "Off"
SetTimer, Loop3, % (Toggle) ? 4800 : "Off"
SetTimer, Loop4, % (Toggle) ? 6000 : "Off"
SetTimer, Loop5, % (Toggle) ? 0 : "Off"
;SetTimer, Loop6, % (Toggle) ? timer6 : "Off"
;SetTimer, Loop7, % (Toggle) ? timer7 : "Off"
;SetTimer, Loop8, % (Toggle) ? timer8 : "Off"
;SetTimer, Loop9, % (Toggle) ? timer9 : "Off"
;SetTimer, Loop10, % (Toggle) ? timer10 : "Off"

return

; Flask 1
Loop1:
{
		send, 1
}
return

; Flask 2
Loop2:
{
		send, 2
}
return

; Flask 3
Loop3:
{
		send, 3
}
return

; Flask 4
Loop4:
{
		send, 4
}
return

; Quick Silver (Flask 5)
Loop5:
{
		;if (Toggle) {
		;	send, 3
		;	sleep timer3
		;}
		;if (Toggle) {
		;	send, 4
		;	sleep timer4
		;}
		if (Toggle) {
			send, 5
			sleep 3500
		}
}
return

; Skill A
Loop6:
{
		send, A
}
return

; Skill 7
Loop7:
{
		Send 7
}
return

; Skill 8
Loop8:
{
		send, 8
}
return

; Skill 9
Loop9:
{
		send, 9
}
return

; Skill 0
Loop10:
{
		send, 0
}
return

; Helper Loops
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