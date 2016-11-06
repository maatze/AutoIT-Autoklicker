#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.14.2
 Author:         maatze

 Script Function:
	Template AutoIt script.

#ce ----------------------------------------------------------------------------

; Script Start - Add your code below here
#include <GUIConstants.au3>
#include <Misc.au3>
Global $pos[2]

HotKeySet("{Esc}","_Exit")

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Autoklicker", 253, 136, 193, 115)
$Label1 = GUICtrlCreateLabel("Intervall", 16, 16, 118, 17)
$Label2 = GUICtrlCreateLabel("Position", 16, 40, 73, 17)
$Input_cks = GUICtrlCreateInput("", 152, 8, 41, 21)
$Input_X = GUICtrlCreateInput("", 152, 32, 41, 21)
$Input_Y = GUICtrlCreateInput("", 200, 32, 41, 21)
$Label3 = GUICtrlCreateLabel("Maustaste", 16, 64, 100, 17)
$Radio_lt = GUICtrlCreateRadio("Left", 152, 64, 41, 17)
$Radio_rt = GUICtrlCreateRadio("Right", 200, 64, 49, 17)
$Button_whereck = GUICtrlCreateButton("Position auswählen", 152, 88, 99, 17, 0)
$Button_go = GUICtrlCreateButton("Go", 48, 112, 51, 17, 0)
$Button_exit = GUICtrlCreateButton("Exit", 96, 112, 51, 17, 0)
GUICtrlSetState($Radio_lt, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


Func Wheretoclick()
$dll = DllOpen("user32.dll")
While 1
    Sleep ( 250 )
    If _IsPressed("01", $dll) Then
$pos = MouseGetPos()
GUICtrlSetData($Input_X,$pos[0])
GUICtrlSetData($Input_Y,$pos[1])
ExitLoop
EndIf
WEnd
EndFunc

func gogo()
$sidelt = GUICtrlRead($Radio_lt)
$sidert = GUICtrlRead($Radio_rt)
if $sidelt = "1" Then
$side = "left"
EndIf
If $sidert = "1" Then
    $side = "right"
EndIf
$clicks =   GUICtrlRead($Input_cks)
$loop = "0"
GUISetState(@SW_HIDE)
While 1
MouseClick($side, $pos[0], $pos[1], 1)
MouseMove(0, 0, 0)
$loop += "1"
if $loop = $clicks Then
    MsgBox(0, "Autoclicker", "Danke für die Nutzungs des Scripts.                                                                    GitHub(www.github.com/maatze) | skype(maatze-)")
    GUISetState(@SW_SHOW)
    ExitLoop
EndIf
WEnd
EndFunc

Func _Exit()
Exit
EndFunc


While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $Button_whereck
            Wheretoclick()
        case $Button_go
            gogo()
        Case $Button_exit
            Exit
    EndSwitch
WEnd