#RequireAdmin
;cl_draw_only_deathnotices 1

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\Pictures\Icon\Chrisl21-Minecraft-3D-Grass.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Misc.au3>
#include <MsgBoxConstants.au3>
Local $hDLL = DllOpen("user32.dll")

$speed = 0
$sleepSpeed = 33
$key = '{F2}'

HotKeySet('{F1}', '_ex')
HotKeySet('{F3}', '_help')

;~ _help()
_main()

Func _main()
	HotKeySet($key, '_pause')
	ConsoleWrite('_Script is running' & @CRLF)
	MouseUp('left')

	; MAKE SOME COOL SOUND:
	Beep(320, 111)
	Beep(390, 111)
	Beep(420, 111)
	; -----------------------f

	While 1
		If _IsPressed("10", $hDLL) Then ;L Shift key
			Global $pointA = MouseGetPos()
			ConsoleWrite(@CRLF & "\/ [" & $pointA[0] & ', ' & $pointA[1] & ']')
			MouseDown('left')
			While _IsPressed("10", $hDLL)
				Sleep(50)
			WEnd
			Global $pointB = MouseGetPos()
			ConsoleWrite("     -->     [" & $pointB[0] & ', ' & $pointB[1] & '] /\ ' & @CRLF)
			Sleep(50)
			MouseUp('left')
			Sleep(50)
			_cutloop()
		EndIf
		Sleep(100)
		While _IsPressed("46", $hDLL) ;F Keye
			MouseClick('left')
			Sleep(60)
		WEnd
	WEnd
EndFunc   ;==>_main

Func _help()
	MsgBox(0, @ScriptName, '[F1] - QUIT!' & @CRLF & '[F2] - PAUSE/REFRESH' & @CRLF & '[F3] - SHOW THIS TOOL TIP AGAIN' & @CRLF & '-------------------------------------------------------------------' & @CRLF & '[SHIFT DOWN] - Get first position of the mouse' & @CRLF & '[SHIFT UP] Get second position of the mouse and start mouse loop' & @CRLF & '[SHIFT DOWN again] - Stop mouse loop process if its running' & @CRLF & '[F] - Auto clicker (Terrain up/down)')
EndFunc   ;==>_help

Func _cutloop()
	Do
		If _IsPressed("51", $hDLL) Then ;51 Q , 57 W
			MouseMove($pointA[0], $pointA[1], $speed)
			Mouseclick('left')
			Sleep($sleepSpeed)
			MouseMove($pointB[0], $pointB[1], $speed)
			Mouseclick('left')
			Sleep($sleepSpeed)
			While _IsPressed("51", $hDLL)
				Sleep(50)
			WEnd
			Send('e')

		ElseIf _IsPressed("57", $hDLL) Then ;51 Q , 57 W
			MouseMove($pointA[0], $pointA[1], $speed)
			Mouseclick('left')
			Sleep($sleepSpeed)
			MouseMove($pointB[0], $pointB[1], $speed)
			Mouseclick('left')
			Sleep($sleepSpeed)
			While _IsPressed("57", $hDLL)
				Sleep(50)
			WEnd
			Send('e')
		Else

			MouseMove($pointA[0], $pointA[1], $speed)
			MouseDown('left')
			Sleep($sleepSpeed)
			MouseMove($pointB[0], $pointB[1], $speed)
			MouseUp('left')
			Sleep($sleepSpeed)
		EndIf
	Until _IsPressed("10", $hDLL)
	ConsoleWrite("_Loop executed" & @CRLF)
	While _IsPressed("10", $hDLL)
		Sleep(100)
	WEnd
EndFunc   ;==>_cutloop

Func _pause()
	HotKeySet($key, '_main')
	ConsoleWrite('_Script is paused' & @CRLF)

	; MAKE SOME COOL SOUND:
	Beep(420, 111)
	Beep(390, 111)
	Beep(320, 111)
	; -----------------------

	While 1
		Sleep(200)
	WEnd
EndFunc   ;==>_pause

Func _ex()
	MouseUp('left')
	Exit
EndFunc   ;==>_ex

