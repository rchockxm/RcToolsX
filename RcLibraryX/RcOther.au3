#include-once
#include <WindowsConstants.au3>
#include <GUIConstants.au3>
#include <ScreenCapture.au3>
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------Other Rc Libery
;===============================================================================
;---Name        :    _OthPlayMusicX()
;---Description :    Play Music (Wait = 1, NoWait = 0)
;===============================================================================
Func _OthPlayMusicX($MusicName, $Flag = 0)
    Switch $Flag
        Case 0
            If FileExists($MusicName) Then   
                SoundPlay($MusicName, 0)  
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case 1
            If FileExists($MusicName) Then  
                SoundPlay($MusicName, 1)  
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_OthPlayMusicX

;===============================================================================
;---Name        :    _OthBeepX()
;---Description :    Play Beep
;===============================================================================
Func _OthBeepX($BeepKey, $Wait = 0)
    Beep($BeepKey, $Wait)
EndFunc  ;==>_OthBeepX

;===============================================================================
;---Name        :    _OthCaptureX()
;---Description :    Capture Screen
;===============================================================================
Func _OthCaptureX($ImagePath)
    _ScreenCapture_Capture($ImagePath)
    If @error Then Return 0 
EndFunc  ;==>_OthCaptureX

;===============================================================================
;---Name        :    _OthSayEnglishX()
;---Description :    Say English Language (Not Save = 0, Save = 1)
;===============================================================================
Func _OthSayEnglishX($SayString, $SavePath = "", $Flag = 0)
    Switch $Flag
        Case 0
            Local $o_speech
            $o_speech = ObjCreate("SAPI.SpVoice")
            $o_speech.Speak ($SayString)
            $o_speech = ""
            If @error Then Return 0
        Case 1
            Local $ObjVoice, $ObjFile, $objVoice
            $ObjVoice = ObjCreate("Sapi.SpVoice")
            $ObjFile = ObjCreate("SAPI.SpFileStream.1")
            $objFile.Open($SavePath, 3)
            $objVoice.AudioOutputStream = $objFile
            $objVoice.Speak($SayString)
            If @error Then Return 0
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_OthSayEnglishX

;===============================================================================
;---Name        :    _OthInfoX()
;---Description :    Show Info
;===============================================================================
Func _OthInfoX($Info, $Title = "", $PosX = "", $PosY = "", $Wait = 0)
    Local $X = $PosX
    Local $Y = $PosY
    If $X = "" Then $X = @DesktopWidth - 320
    If $Y = "" Then $Y = @DesktopHeight - 100
    ToolTip($Info, $X, $Y, $Title, 1)
    If @error Then Return 0 
    Sleep($Wait)
    ToolTip("")
EndFunc  ;==>_OthInfoX

;===============================================================================
;---Name        :    _OthInfoScrollX()
;---Description :    Show Scroll Info
;===============================================================================
Func _OthInfoScrollX($Info, $Title = "", $PosX = "", $PosY = "", $Wait = 0, $MaxStr = 8)
    Local $X = $PosX
    Local $Y = $PosY
    If $X = "" Then $X = @DesktopWidth - 320
    If $Y = "" Then $Y = @DesktopHeight - 100
    Local $Min = 0 
    If $Info <> "" Then
        Local $I
        Local $GetStrLen = StringLen($Info) 
        For $I = $Min To $GetStrLen - $MaxStr
            If $GetStrLen > $MaxStr Then
                Local $GetStrNid = StringMid ($Info, $Min, $MaxStr)
                $Min = $Min + 1
                ToolTip($GetStrNid, $X, $Y, $Title, 1) 
                Sleep($Wait) 
            EndIf
        Next
        Sleep(500) 
    EndIf
EndFunc  ;==>_OthInfoScrollX

;===============================================================================
;---Name        :    _OthPoPInfoMessageX()
;---Description :    Show PopInfo
;===============================================================================
Func _OthPoPInfoMessageX($Info, $Wait = 5)
    If WinExists("Rc_PoPInformationMessage") Then
        WinWaitClose("Rc_PoPInformationMessage")
    EndIf

    Local $SetText = $Info  
    Local $FormHeight, $FormWidth
    Local $FormMain, $FormPic, $ShowText, $TickTimeLabel
    Local $BGFile = @AppDataDir & "\Rchockxm\RcToolsX\BG.jpg"

    DirCreate(@AppDataDir&"\Rchockxm\RcToolsX")
    FileInstall("Bin\BG.jpg", $BGFile, 1)
    If Not FileExists($BGFile) Then Return 0

    $FormHeight = _GetTaskbar(1) - 160
    $FormWidth = @DesktopWidth - 258
    $FormMain = GUICreate("Rc_PoPInformationMessage", 256, 159, $FormWidth, $FormHeight, $WS_POPUP, $WS_EX_TOOLWINDOW, WinGetHandle(AutoItWinGetTitle()))	
        WinSetOnTop($FormMain, "", 1)
        _RoundGUI($FormMain, 0, 0, 5, 5)
    $FormPic = GUICtrlCreatePic($BGFile, 0, 0, 0, 0)
        GUICtrlSetState($FormPic, $GUI_DISABLE)
    $ShowText = GUICtrlCreateLabel($SetText, 15, 35, 230, 90, 0)
        GUICtrlSetBkColor($ShowText, $GUI_BKCOLOR_TRANSPARENT)
        GUICtrlSetColor($ShowText, 0x09f0)
    $TickTimeLabel = GUICtrlCreateLabel("", 20, 138, 182, 28)
        GUICtrlSetBkColor($TickTimeLabel, $GUI_BKCOLOR_TRANSPARENT)
    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $FormMain, "int", 500, "long", 0x00040008)
    GUISetState(@SW_SHOW, $FormMain)
    WinSetTrans($FormMain, "", 250)    

    Local $ID   
    Sleep(50)
    For $ID = $Wait To 0 Step -1               
        GUICtrlSetData($TickTimeLabel, "At Least " & $ID & " Second Close...")
        Sleep(1000)
    Next 
    WinSetTrans($FormMain, "", 255) 

    DllCall("user32.dll", "int", "AnimateWindow", "hwnd", $FormMain, "int", 500, "long", 0x00050004)
    GUIDelete($FormMain)
    FileDelete($BGFile)
EndFunc

;===============================================================================
;---Name        :    _OthMsgBoxX()
;---Description :    Show NsgBox Dialer
;===============================================================================

Func _OthMsgBoxX($Info, $Title = "", $Wait = 30, $Lens = 10)
	Local $TempStr, $StrB = $Lens, $StrA = 1
	Local $i, $j	
	If StringLen($Info) > $Lens Then		
		For $i = 1 To Round(StringLen($Info)/$Lens)    
		    For $j = $StrA To $StrB * $i
                $TempStr = $TempStr & StringMid($Info, $j, 1)
            Next
		    $TempStr = $TempStr & @CRLF
		    $StrA = $StrA + $Lens
		Next	
    Else
        $TempStr = $Info
	EndIf	
    MsgBox(4096, $Title, $TempStr, $Wait)
EndFunc  ;==>_OthMsgBoxX

;===============================================================================
;---Name        :    _OthProgressBox()
;---Description :    Show ProgressBox
;===============================================================================
Func _OthProgressBox($Wait = 200, $PosX = @DesktopWidth, $PosY = @DesktopHeight, $Trans = 160)
    If WinExists("Rc_ProgressMessage") Then
        WinWaitClose("Rc_ProgressMessage")
    Else
        Local $X = $PosX - 350
        Local $Y = $PosY - 80
        Local $ProgressGUI, $ProcLabel

        $ProgressGUI = GUICreate("Rc_ProgressMessage", 350, 25, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
            GUISetBkColor(0x000000)
            _API_SetLayeredWindowAttributes($ProgressGUI, 0x000000, $Trans)
        $ProcLabel = GUICtrlCreateLabel("0 %", 250, 0, 80, 40)
            GUICtrlSetFont($ProcLabel, 18, 800, 0, "MS Sans Serif")
            GUICtrlSetColor($ProcLabel, 0xFFFFFF)  

        Local $ProgressS[16]
        $ProgressS[0] = GUICtrlCreateGraphic(0, 0, 10, 25)
        $ProgressS[1] = GUICtrlCreateGraphic(15, 0, 10, 25)  
        $ProgressS[2] = GUICtrlCreateGraphic(30, 0, 10, 25)  
        $ProgressS[3] = GUICtrlCreateGraphic(45, 0, 10, 25)  
        $ProgressS[4] = GUICtrlCreateGraphic(60, 0, 10, 25)  
        $ProgressS[5] = GUICtrlCreateGraphic(75, 0, 10, 25) 
        $ProgressS[6] = GUICtrlCreateGraphic(90, 0, 10, 25) 
        $ProgressS[7] = GUICtrlCreateGraphic(105, 0, 10, 25) 
        $ProgressS[8] = GUICtrlCreateGraphic(120, 0, 10, 25) 
        $ProgressS[9] = GUICtrlCreateGraphic(135, 0, 10, 25) 
        $ProgressS[10] = GUICtrlCreateGraphic(150, 0, 10, 25) 
        $ProgressS[11] = GUICtrlCreateGraphic(165, 0, 10, 25) 
        $ProgressS[12] = GUICtrlCreateGraphic(180, 0, 10, 25) 
        $ProgressS[13] = GUICtrlCreateGraphic(195, 0, 10, 25) 
        $ProgressS[14] = GUICtrlCreateGraphic(210, 0, 10, 25) 
        $ProgressS[15] = GUICtrlCreateGraphic(225, 0, 10, 25) 
        GUISetState(@SW_SHOW, $ProgressGUI) 

        Local $I, $J, $ProcStep = 0
        For $I = 0 To 15
            GUICtrlSetColor($ProgressS[$I], 0xA0A0A4)
            GUICtrlSetBkColor($ProgressS[$I], 0xFFFFFF)
            Sleep(10)
        Next

        For $J = 0 To 15
            $ProcStep = $ProcStep+6
            GUICtrlSetColor($ProgressS[$J], 0x800000)
            GUICtrlSetBkColor($ProgressS[$J], 0xFF0000)            
            GUICtrlSetData($ProcLabel, $ProcStep & " %")
            Sleep($Wait)
        Next

        GUICtrlSetData($ProcLabel, "100 %")
        Sleep(1000)
    EndIf  
EndFunc   ;==>_OthProgressBox