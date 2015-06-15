#include-once
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#include <Array.au3>
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------SpecialText Rc Libery
;===============================================================================
;---Name        :    _TextRighttoLeft()
;---Description :    Text From RightTo Left    
;===============================================================================
Func _TextRighttoLeft($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = -1, $PosY = -1, $Wait = 5000)
    If WinExists("Rc_SPTextMessage1") Then
        WinWaitClose("Rc_SPTextMessage1")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX
    Local $Y = $PosY

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage1", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel($TransText, 0, 0, $FormSize, $FontHeight, $SS_CENTER)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)  
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00040002)
    GUISetState(@SW_SHOW, $SPTextGUI)

    Sleep($Wait)
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00050002)   
    GUIDelete($SPTextGUI) 
    If @error Then Return 0
EndFunc   ;==>_TextRighttoLeft

;===============================================================================
;---Name        :    _TextLefttoRight()
;---Description :    Text From Left To Right   
;===============================================================================
Func _TextLefttoRight($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = -1, $PosY = -1, $Wait = 5000)
    If WinExists("Rc_SPTextMessage2") Then
        WinWaitClose("Rc_SPTextMessage2")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX
    Local $Y = $PosY

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage2", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel($TransText, 0, 0, $FormSize, $FontHeight, $SS_CENTER)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)  
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00040001)
    GUISetState(@SW_SHOW, $SPTextGUI)

    Sleep($Wait)
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00050001)
    GUIDelete($SPTextGUI) 
    If @error Then Return 0
EndFunc   ;==>_TextLefttoRight

;===============================================================================
;---Name        :    _TextCentertoOut()
;---Description :    Text From Center To Out   
;===============================================================================
Func _TextCentertoOut($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = -1, $PosY = -1, $Wait = 5000)
    If WinExists("Rc_SPTextMessage3") Then
        WinWaitClose("Rc_SPTextMessage3")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX
    Local $Y = $PosY

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage3", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel($TransText, 0, 0, $FormSize, $FontHeight, $SS_CENTER)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)  
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00000010)
    GUISetState(@SW_SHOW, $SPTextGUI)

    Sleep($Wait)
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 1000, "long", 0x00010010)
    GUIDelete($SPTextGUI) 
    If @error Then Return 0
EndFunc   ;==>_TextCentertoOut

;===============================================================================
;---Name        :    _TextRunRighttoLeft()
;---Description :    Run Text From RightTo Left   
;===============================================================================
Func _TextRunRighttoLeft($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = @DesktopWidth, $PosY = @DesktopHeight, $Speed = 1)
    If WinExists("Rc_SPTextMessage4") Then
        WinWaitClose("Rc_SPTextMessage4")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = 20 
    Local $Y = $PosY - $FontSize - 60

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage4", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel($TransText, 0, 0, $FormSize, $FontHeight, $SS_CENTER)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)      
    GUISetState(@SW_SHOW, $SPTextGUI)

    Local $Value = @DesktopWidth
    If WinExists("Rc_SPTextMessage4") Then        
        Do
            $Value = $Value - 5     
            WinMove("Rc_SPTextMessage4", "", $Value, $Y, Default, Default, $Speed)
        Until $Value <= -$FormSize   
    EndIf 

    GUIDelete($SPTextGUI) 
    If @error Then Return 0
EndFunc   ;==>_TextRunRighttoLeft

;===============================================================================
;---Name        :    _TextLastOneFade()
;---Description :    Run Text One To Last   
;===============================================================================
Func _TextLastOneFade($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = 20, $PosY = @DesktopHeight, $Wait = 200)
    If WinExists("Rc_SPTextMessage5") Then
        WinWaitClose("Rc_SPTextMessage5")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX 
    Local $Y = $PosY - $FontSize - 60

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage5", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel("", 0, 0, $FormSize, $FontHeight)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)      
    GUISetState(@SW_SHOW, $SPTextGUI)

    Local $GetOneString 
    Local $S, $X, $Y
    Local $StrArray[$FontCount], $StrString 
    $S = 0
    Do
        $S = $S + 1        
        GUICtrlSetData($SPTextLabel, "_")
        Sleep(300)
        GUICtrlSetData($SPTextLabel, " ")
        Sleep(300)
    Until $S = 5

    For $X = 0 To $FontCount
        $GetOneString = StringMid($TransText, $X+1, 1)
        _ArrayInsert($StrArray, $X, $GetOneString)
    Next

    $StrString = ""
    For $Y In $StrArray
        $StrString = $StrString & $Y
        GUICtrlSetData($SPTextLabel, $StrString)
        Sleep($Wait)
    Next

    GUIDelete($SPTextGUI) 
    If @error Then Return 0
EndFunc   ;==>_TextLastOneFade

;===============================================================================
;---Name        :    _TextOneFade()
;---Description :    Run Text One By One   
;===============================================================================
Func _TextOneFade($SPText, $FontSize = 150, $Color = 0, $Trans = 255, $PosX = -1, $PosY = -1, $Wait = 200)
    If WinExists("Rc_SPTextMessage6") Then
        WinWaitClose("Rc_SPTextMessage6")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $FormSize = ($FontSize * 2)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX 
    Local $Y = $PosY 

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $SPTextGUI = GUICreate("Rc_SPTextMessage6", $FormSize, $FontHeight, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor($BkColor)
        _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
        WinSetOnTop($SPTextGUI, "", 1)
    $SPTextLabel = GUICtrlCreateLabel("", 0, 0, $FormSize, $FontHeight, $SS_CENTER)
        GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
        GUICtrlSetColor($SPTextLabel, $FontColor)      
    GUISetState(@SW_SHOW, $SPTextGUI)

    Local $GetOneString, $X, $Y
    For $X = 1 To $FontCount
        $GetOneString = StringMid($TransText, $X, 1)
        GUICtrlSetData($SPTextLabel, $GetOneString)
         For $Y=180 To 255
            _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Y)
            Sleep(1)
        Next
        Sleep($Wait)
    Next

    GUIDelete($SPTextGUI)
    If @error Then Return 0 
EndFunc   ;==>_TextOneFade

;===============================================================================
;---Name        :    _TextShowByLine()
;---Description :    Run Text Line By Line   
;===============================================================================
Func _TextShowByLine($SPText, $FontSize = 30, $Color = 0, $Trans = 255, $PosX = 400, $PosY = 100, $Wait = 5000)
    If WinExists("Rc_SPTextMessage7_1") Then
        WinWaitClose("Rc_SPTextMessage7_1")
    EndIf

    Local $TransText = $SPText
    Local $SPTextGUI, $SPTextLabel
    Local $FontCount = StringLen($SPText)
    Local $LineFontCo 
    Local $FormSize = ($FontCount * 42)
    Local $FontHeight = ($FontSize * 2)
    Local $FontColor = "0xFFFFFF"
    Local $BkColor = "0x000000"
    Local $X = $PosX 
    Local $Y = $PosY    
    Local $LineSpilt, $LineCount

    If $Color = 1 Then
        $FontColor = "0x000000"
        $BkColor = "0xFFFFFF"
    EndIf

    $LineSpilt = StringSplit($SPText, "-", 1)
    If Not @error Then
        $LineCount = $LineSpilt[0]        
    Else
        $LineCount = 1
    EndIf

    Local $Value, $NewY = $Y, $Stde, $MoveValue
    For $Value = 1 To $LineCount
        $LineFontCo = StringLen($LineSpilt[$Value])
        $FormSize = ($LineFontCo*42)
        $SPTextGUI = GUICreate("Rc_SPTextMessage7" & "_" & $Value, $FormSize, $FontHeight, $X, $NewY, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
            GUISetBkColor($BkColor)
            _API_SetLayeredWindowAttributes($SPTextGUI, $BkColor, $Trans)
            WinSetOnTop($SPTextGUI, "", 1)
        $SPTextLabel = GUICtrlCreateLabel($LineSpilt[$Value], 0, 0, $FormSize, $FontHeight)
            GUICtrlSetFont($SPTextLabel, $FontSize, 800, 0, "新細明體")
            GUICtrlSetColor($SPTextLabel, $FontColor)      
        DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $SPTextGUI, "int", 300, "long", 0x00040004)
        GUISetState(@SW_SHOW, $SPTextGUI)
        $NewY = $NewY + $FontSize + 20               
    Next

    Sleep($Wait)
    GUIDelete() 
    If @error Then Return 0
EndFunc   ;==>_TextLastOneFade