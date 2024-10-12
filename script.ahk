; Start Point : (0, 40)
; End Point : (1315, 780)
; Start Button {1} : (980, 675)
; Confirm Button {2} : (400, 700) 
; Open Button {3} : (660, 700)

SetControlDelay, -1
SetKeyDelay, -1
SetMouseDelay, -1
SetWinDelay, -1
SetBatchLines, -1
SetDefaultMouseSpeed, 0

Gui, Font, Bold
Gui, Add, Text, x12 y20 w150 h20, F9 : 매크로 시작
Gui, Add, Text, x12 y50 w150 h20, F10 : 매크로 종료
Gui, Add, Text, x12 y90 w180 h20 vStatus, 대기중...
Gui, Add, Text, x12 y140 w150 h20 vStartEnd, 매크로 중지됨
Gui, Show, x1400 y80 h180 w360, 쿠키런 매크로

return

GuiClose:
	ExitApp


fMouseMoveDefault() {
	MouseMove, 0, 40, 100
	
	return
}

fCheckMode() {
	; Start
	ImageSearch, sX, sY, 0, 40, 1315, 780, *75 ./imgs/start.png
	if (ErrorLevel = 0) {
		Random, randomizeX, -20, 20
		Random, randomizeY, -10, 10
		GuiControl,, Status, Found "게임 시작" at %sX% %sY%
		
		MouseClick, left, sX + randomizeX, sY + randomizeY, 1, 50
		sleep 500
		fMouseMoveDefault()
		
		return
	}
	ImageSearch, sX, sY, 0, 40, 1315, 780, *100 ./imgs/start_2.png
	if (ErrorLevel = 0) {
		Random, randomizeX, -20, 20
		Random, randomizeY, -10, 10
		GuiControl,, Status, Found "게임 시작" at %sX% %sY%
		
		MouseClick, left, sX + 200 + randomizeX, sY + 95 + randomizeY, 1, 50
		sleep 500
		fMouseMoveDefault()
		
		return
	}
	
	; Confirm
	ImageSearch, sX, sY, 0, 40, 1315, 780, *75 ./imgs/confirm_1.png
	if (ErrorLevel = 0) {
		Random, randomizeX, -20, 20
		Random, randomizeY, -30, 10
		GuiControl,, Status, Found "확인" at %sX% %sY%
		
		MouseClick, left, sX + randomizeX, sY + randomizeY, 1, 50
		sleep 500
		fMouseMoveDefault()
		
		return
	}
	ImageSearch, sX, sY, 0, 40, 1315, 780, *75 ./imgs/confirm_2.png
	if (ErrorLevel = 0) {
		Random, randomizeX, -20, 20
		Random, randomizeY, -30, 10
		GuiControl,, Status, Found "확인" at %sX% %sY%
		
		MouseClick, left, sX + randomizeX, sY + randomizeY, 1, 50
		sleep 500
		fMouseMoveDefault()
		
		return
	}
	
	; Open
	ImageSearch, sX, sY, 0, 40, 1315, 780, *75 ./imgs/open.png
	if (ErrorLevel = 0) {
		Random, randomizeX, -20, 20
		Random, randomizeY, -30, 10
		GuiControl,, Status, Found "모두 열기" at %sX% %sY%
		
		MouseClick, left, sX + randomizeX, sY + randomizeY, 1, 50
		sleep 500
		fMouseMoveDefault()
		
		return
	}
	
	; If not found anywhere
	GuiControl,, Status, Image not found
	fMouseMoveDefault()
	
	return
}

RunLoop:
	fCheckMode()
	
return


F9::
	fMouseMoveDefault()
	SetTimer, RunLoop, 2000  ; Repeat every 2 seconds
	GuiControl,, StartEnd, 매크로 실행 중...
	
return

F10::
	fMouseMoveDefault()
	SetTimer, RunLoop, Off
	GuiControl,, Status, 대기중...
	GuiControl,, StartEnd, 매크로 중지됨
	
return
