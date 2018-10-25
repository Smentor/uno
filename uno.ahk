#NoEnv                          ;#(win) !(alt) +(shift)  ^(contrl)
SendMode Input
SetWorkingDir %A_ScriptDir%


;------------Var---------Global----------------------------------------------
salircaptura=0
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
#z::
ARRA := []
WinGet, id, List,,, Program Manager
Loop, %id%
{
    this_id := id%A_Index%
    WinGet, OutputVar1, MinMax, ahk_id %this_id%
   ;count := OutputVar1 + 4
    ARRA[A_Index] := OutputVar1 
    
}
MsgBox % ARRA[]
MsgBox % ARRA[1] 
MsgBox % ARRA[2]
MsgBox % ARRA[3]
MsgBox % ARRA[4]
MsgBox % ARRA[5]
MsgBox %id%
MsgBox %mensa%
MsgBox %previous_ID%

return
;----------------------------------------------------------------------------
;----------------------------------------------------------------------------
^!+j::					               		;ASIGNACION PARA ESC
send,{Esc}
salircaptura=1 
return


;----------------------------------------------------------------------------
^!+i::WinMaximize, A 						;MAXIMIZAR VENTANA
;----------------------------------------------------------------------------

;^!+h::SendInput !{Tab}						;ALTERNAR VENTANA



;----------------------------------------------------------------------------
^!+g::								;MINIMIZAR VENTANA
ifWinActive, ahk_class WorkerW
{
return
}

else
{
;WinMinimize, A 
mensa := "hola mundo"
	
	WinGet, current_ID, ID, A
	
	
	;WinWaitNotActive, ahk_id %current_ID%
	
	
	previous_ID := current_ID
WinMinimize, A 

}
return                      	       
;----------------------------------------------------------------------------

^!+f::                              				;ABRIR EQUIPO        		             
IfWinExist, Este equipo
{
    WinActivate  
    WinMaximize  
    return
}

else
{
Send, {LWin down}e{LWin up}
WinWait, Este equipo
WinMaximize 
}
return
;----------------cccccccccc------------------------------------------------------------
;^!+e::send #d						;MOSTRAR ESCRITORIO
;----------------------------------------------------------------------------
^!+d:: 								;CERRAR APLICACION
;send (^w)
ifWinActive, ahk_class Chrome_WidgetWin_1
{
SendInput ^w
return
}

else
{
WinGet, nom, ID, A
WinGetTitle, title, ahk_id %nom%
WinClose, %title%
return
}
return
;----------------------------------------------------------------------------
~^!+c:: 								;GUARDAR ARCHIVO NOTA EN ESCRITORIO . Recorte en chrome . Recorte en windows



		
ifWinActive, ahk_exe notepad.exe
{
send, !a
keywait a
send, o
keywait, o
send, {BackSpace}
;send, `t`t`t`t`t`t`t`t`t`t
;send e{Enter}
;send,`t`t`t{BackSpace}
return
}
ifWinActive, ahk_exe chrome.exe
{
send, {Ctrl Down}{Shift down}y{Shift up}{Ctrl up}
return
}
;MsgBox, The cursor is at0



 
send, {LWin down}{Shift down}s{LWin up}{Shift up}

WinWait, ahk_class Microsoft-Windows-SnipperCaptureForm-WinShiftS

Loop
{

If (GetKeyState("Escape", "P") or salircaptura=1){
;MsgBox, dentro de lopp-if
salircaptura=0
return
}

If (GetKeyState("LButton", "P")){
;MsgBox, dentro de lopp-if2
Goto, ContinuaCaptura
return
}

If (A_PriorHotkey=A_ThisHotkey){
;sleep, 10
Goto, ParaFile
return
}

return
}

ParaFile:
WinClose
WinWaitClose, ahk_class Microsoft-Windows-SnipperCaptureForm-WinShiftS
send, {PrintScreen}
return

ContinuaCaptura:
;MsgBox, paso while



WinWaitClose, ahk_class Microsoft-Windows-SnipperCaptureForm-WinShiftS




IfWinExist, ahk_exe ONENOTE.EXE
{
WinActivate, ahk_exe ONENOTE.EXE
WinWait, ahk_exe ONENOTE.EXE
;MsgBox, existe
return
} 
IfWinNotExist, ahk_exe ONENOTE.EXE
{
run ONENOTE.EXE
WinWait, ahk_exe ONENOTE.EXE
return
}
;MsgBox, ultimo return
return




;----------------------------------------------------------------------------
^!+b::								;ABRIR BLOC DE NOTAS
IfWinExist, Sin título: Bloc de notas
{
    WinActivate  
    WinMaximize  
    return
}

else
{
Run, notepad.exe
WinWait, Sin título: Bloc de notas
WinMaximize 
return
}

;----------------------------------------------------------------------------


;----------------------------------------------------------------------------

^!+a::								;MENSAJE PRUEVA
MouseGetPos, xpos, ypos 
MsgBox, The cursor is at X%xpos% Y%ypos%. 
return    


;----------------------------------------------------------------------------
#If MouseIsOver("ahk_class Shell_TrayWnd")			;CONTROL DE VOLUMEN CON SCROLL
{
WheelUp::Send {Volume_Up}     
WheelDown::Send {Volume_Down} 

MouseIsOver(carro) {
    MouseGetPos,,,, Win
	cass := carro . " ahk_id " . win	
	If (cass="ahk_class Shell_TrayWnd ahk_id TrayClockWClass1") or (cass="ahk_class Shell_TrayWnd ahk_id TrayButton1") or (cass="ahk_class Shell_TrayWnd ahk_id InputIndicatorButton1") or (cass="ahk_class Shell_TrayWnd ahk_id ToolbarWindow325") or (cass="ahk_class Shell_TrayWnd ahk_id Button2") or (cass="ahk_class Shell_TrayWnd ahk_id ReBarWindow321") or (cass="ahk_class Shell_TrayWnd ahk_id ClockButton1")
		{
		return carro
		}
	} 
} 