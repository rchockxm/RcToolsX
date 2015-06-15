#include-once
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------Win Rc Libery
;===============================================================================
;---Name        :    _WinCloseWinX()
;---Description :    Close Windows
;===============================================================================
Func _WinCloseWinX($WinName, $WinWait = 0)
    If WinExists($WinName) Then
        Sleep($WinWait)
        If @error Then Sleep(50)
        WinClose($WinName, "")
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinCloseWinX

;===============================================================================
;---Name        :    _WinCloseWinByFX()
;---Description :    Close Windows By Part String  (AllClose = 1, OneClose = 0)
;===============================================================================
Func _WinCloseWinByFX($WinNameX, $WinWait = 0, $Flag = 0)
    If WinExists($WinNameX) Then
        Sleep($WinWait)
        If (@error) Then Sleep(50)
        WinClose($WinNameX, "")
        If @error Then Return 0
    Else
        Local $TitleSpilt, $ListAllWin, $X
        $ListAllWin = WinList()
        For $X = 1 To $ListAllWin[0][0]
            If $ListAllWin[$X][0] <> "" And IsVisible($ListAllWin[$X][1]) Then
                 $TitleSpilt = StringInStr($ListAllWin[$X][0], $WinNameX)
                 If Not @error Then
                     Sleep($WinWait)
                     Switch $Flag
                         Case 0
                             WinClose($ListAllWin[$X][0], "")
                             If @error Then Return 0
                             Exit
                         Case 1
                             WinClose($ListAllWin[$X][0], "")
                             If @error Then Return 0
                         Case Else
                             Return 0
                     EndSwitch
                 EndIf
            EndIf
        Next
    EndIf
EndFunc  ;==>_WinCloseWinByFX

;===============================================================================
;---Name        :    _WinMoveWinX()
;---Description :    Move Windows To New Place
;===============================================================================
Func _WinMoveWinX($WinName, $PosX = "", $PosY = "", $WinWait = 1)
    If WinExists($WinName) Then
        WinMove($WinName, "", $PosX, $PosY, Default, Default, $WinWait = 1)
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinMoveWinX

;===============================================================================
;---Name        :    _WinSetTopX()
;---Description :    Set Windows To Top (Top = 1, NoTop = 0)
;===============================================================================
Func _WinSetTopX($WinName, $Flag = 1)
    If WinExists($WinName) Then
        Switch $Flag
            Case 0
                WinSetOnTop($WinName, "", $Flag)
                If @error Then Return 0
            Case 1
                WinSetOnTop($WinName, "", $Flag)
                If @error Then Return 0
            Case Else
                Return 0
        EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinSetTopX

;===============================================================================
;---Name        :    _WinSetTitleX()
;---Description :    Set Windows To New Title (Random = 1, NoRandom = 0)
;===============================================================================
Func _WinSetTitleX($WinName, $NewWinName, $Flag = 0)
    If WinExists($WinName) Then
        Switch $Flag
            Case 0
                WinSetTitle($WinName, "", $NewWinName)
                If @error Then Return 0
            Case 1
                Local $RUM1, $RUM2, $RUM3, $RUM4, $RUM5, $RUM6
                Local $CreateName
                $RUM1 = Random(0,9,1)
                $RUM1 = Random(0,9,1)
                $RUM3 = Random(0,9,1)
                $RUM4 = Random(0,9,1)
                $RUM5 = Random(0,9,1)
                $RUM6 = Random(0,9,1)
                $CreateName = $NewWinName & " - " & $RUM1 & $RUM2 & $RUM3 & $RUM4 & $RUM5 & $RUM6
                WinSetTitle($WinName, "", $CreateName)
                If @error Then Return 0
            Case Else
                Return 0
        EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinSetTitleX

;===============================================================================
;---Name        :    _WinSetTranX()
;---Description :    Set Windows Trans (All = 1, Cur = 0)
;===============================================================================
Func _WinSetTranX($WinName, $TranVal = 255, $Flag = 0)
    Local $SetTranValue = ($TranVal * 2.55)
	WinActivate($WinName, "")
    Switch $Flag
        Case 0
            If WinExists($WinName) Then
                WinSetTrans($WinName, "", $SetTranValue)
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case 1
            Local $ListAllWin, $X
            $ListAllWin = WinList()
            For $X = 1 To $ListAllWin[0][0]
                If $ListAllWin[$X][0] <> "" And IsVisible($ListAllWin[$X][1]) Then
                    WinSetTrans($ListAllWin[$X][0], "", $SetTranValue)
                    If @error Then Return 0
                EndIf
            Next
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_WinSetTranX

;===============================================================================
;---Name        :    _WinSetHideX()
;---Description :    Set Windows Hide (All = 1, Cur = 0)
;===============================================================================
Func _WinSetHideX($WinName, $Flag = 0)
	WinActivate($WinName, "")
    Switch $Flag
        Case 0
            If WinExists($WinName) Then
                WinSetState($WinName, "", @SW_HIDE)
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case 1
            Local $ListAllWin, $X
            $ListAllWin = WinList()
            For $X = 1 To $ListAllWin[0][0]
                If $ListAllWin[$X][0] <> "" And IsVisible($ListAllWin[$X][1]) Then
                    WinSetState($ListAllWin[$X][0], "", @SW_HIDE)
                    If @error Then Return 0
                EndIf
            Next
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_WinSetHideX

;===============================================================================
;---Name        :    _WinSetShowX()
;---Description :    Set Windows Show (All = 1, Cur = 0)
;===============================================================================
Func _WinSetShowX($WinName, $Flag = 0)
	WinActivate($WinName, "")
    Switch $Flag
        Case 0
            If WinExists($WinName) Then
                WinSetState($WinName, "", @SW_SHOW)
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case 1
            Local $ListAllWin, $X
            $ListAllWin = WinList()
            For $X = 1 to $ListAllWin[0][0]
                If $ListAllWin[$X][0] <> "" And IsVisible($ListAllWin[$X][1]) Then
                    WinSetState($ListAllWin[$X][0], "", @SW_SHOW)
                    If @error Then Return 0
                EndIf
            Next
        Case Else
            ;
    EndSwitch
EndFunc  ;==>_WinSetShowX

;===============================================================================
;---Name        :    _WinSetFadWinX()
;---Description :    Set Windows FadIn Or FadOut (Fadout = 1, Fadin = 0)
;===============================================================================
Func _WinSetFadWinX($WinName, $Flag = 0)
	WinActivate($WinName, "")
    Switch $Flag
        Case 0
            If WinExists($WinName) Then
                WinSetTrans($WinName, "", 0)
                Local $Value
                $Value = 0
                Do
                    $Value = $Value + 1
                    WinSetTrans($WinName, "", $Value)
                    If @error Then Return 0
                    Sleep(10)
                Until $Value = 255
            Else
                Return 0
            EndIf
        Case 1
            If WinExists($WinName) Then
                WinSetTrans($WinName, "", 255)
                Local $Value
                $Value = 255
                Do
                    $Value = $Value - 1
                    WinSetTrans($WinName, "", $Value)
                    If @error Then Return 0
                    Sleep(10)
                Until $Value = 0
            Else
                Return 0
            EndIf
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_WinSetFadWinX

;===============================================================================
;---Name        :    _WinSetMaxWinX()
;---Description :    Set Windows Max (Fad = 1, NoFad = 0)
;===============================================================================
Func _WinSetMaxWinX($WinName, $Flag = 0)
    If WinExists($WinName) Then
        WinActivate($WinName, "")
        Switch $Flag
            Case 0
                WinSetState($WinName, "", @SW_MAXIMIZE)
                If @error Then Return 0
            Case 1
                Local $Value
                $Value = 255
                Do
                    $Value = $Value - 1
                    WinSetTrans($WinName, "", $Value)
                    If @error Then Return 0
                    Sleep(10)
                Until $Value = 0
                WinSetTrans($WinName, "", 255)
                WinSetState($WinName, "", @SW_MAXIMIZE)
                If @error Then Return 0
            Case Else
                Return 0
            EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinSetMaxWinX

;===============================================================================
;---Name        :    _WinSetMinWinX()
;---Description :    Set Windows Min (Fad = 1, NoFad = 0)
;===============================================================================
Func _WinSetMinWinX($WinName, $Flag = 0)
    If WinExists($WinName) Then
        WinActivate($WinName, "")
        Switch $Flag
            Case 0
                WinSetState($WinName, "", @SW_MINIMIZE)
                If @error Then Return 0
            Case 1
                Local $Value
                $Value = 255
                Do
                    $Value = $Value - 1
                    WinSetTrans($WinName, "", $Value)
                    If @error Then Return 0
                    Sleep(10)
                Until $Value = 0
                WinSetTrans($WinName, "", 255)
                WinSetState($WinName, "", @SW_MINIMIZE)
                If @error Then Return 0
            Case Else
                Return 0
            EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_WinSetMinWinX

;===============================================================================
;---Name        :    _WinControlClickX()
;---Description :    Click Windows Control
;===============================================================================
Func _WinControlClickX($WinName, $KeyWord = "", $ControlID = "", $Wait = "")
    If WinExists($WinName) Then
        If Not WinActive($WinName, $KeyWord) Then
			WinWaitActive($WinName, $KeyWord, $Wait)
		Else
			WinActivate($WinName, $KeyWord)
        EndIf
    Else
		WinWait($WinName, $KeyWord, $Wait)
		WinActivate($WinName, $KeyWord)
        WinWaitActive($WinName, $KeyWord, $Wait)
    EndIf

	Local $Winstate = WinGetState($WinName)
	If $Winstate = 16 Then WinSetState($WinName, "", @SW_RESTORE)

	Local $Constate = ControlCommand($WinName, $KeyWord, "[CLASSNN:" & $ControlID & "]", "IsEnabled", "")
	While $Constate = 0
	    Sleep($Wait)
		$Constate = ControlCommand($WinName, $KeyWord, "[CLASSNN:" & $ControlID & "]", "IsEnabled", "")
        If $Constate = 1 Then ExitLoop
	Wend

	WinActivate($WinName, "")
    ControlClick($WinName, $KeyWord, "[CLASSNN:" & $ControlID & "]")
    If @error Then Return 0
EndFunc  ;==>_WinControlClickX

;===============================================================================
;---Name        :    _WinControlSendX()
;---Description :    Send Text Windows Control
;===============================================================================
Func _WinControlSendX($WinName, $KeyWord = "", $ControlID = "", $SendText = "", $Wait = "", $Mode = 1)
    If WinExists($WinName) Then
        If Not WinActive($WinName, $KeyWord) Then
			WinWaitActive($WinName, $KeyWord, $Wait)
		Else
			WinActivate($WinName, $KeyWord)
        EndIf
    Else
		WinWait($WinName, $KeyWord, $Wait)
		WinActivate($WinName, $KeyWord)
        WinWaitActive($WinName, $KeyWord, $Wait)
    EndIf

	Local $Winstate = WinGetState($WinName)
	If $Winstate = 16 Then WinSetState($WinName, "", @SW_RESTORE)

    Switch $Mode
        Case 1
            ControlSetText($WinName, $KeyWord, "[CLASSNN:" & $ControlID & "]", $SendText)
        Case 2
            Local $StrNum = StringLen($SendText)
            Local $I, $NotAscll = 0
            For $I = 1 To $StrNum
                Local $GetStr = StringMid($SendText, $I, 1)
                Local $CheckStr = AscW($GetStr)
                If $CheckStr >= 0 And $CheckStr <= 255 Then
                    ;
                Else
                    $NotAscll = $NotAscll + 1
                Endif
            Next
            If $NotAscll=0 Then
				WinActivate($WinName, "")
                ControlSend($WinName, $KeyWord, "[CLASSNN:" & $ControlID & "]", $SendText)
                If @error Then Return 0
			Else
				WinActivate($WinName, "")
                ControlFocus($WinName, "", "[CLASSNN:" & $ControlID & "]")
                ClipPut("")
                ClipPut($SendText)
                Send("+{ins}")
                If @error Then Return 0
            Endif
        Case 3
			WinActivate($WinName, "")
            ControlFocus($WinName, "", "[CLASSNN:" & $ControlID & "]")
            ;ClipPut("")
            ;ClipPut($SendText)
            ;Send("+{ins}")
			Send($SendText)
            If @error Then Return 0
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_WinControlSendX

;===============================================================================
;---Name        :    _WinMouseClikX()
;---Description :    Click Mouse Left Key
;===============================================================================
Func _WinMouseClikX($WinName, $KeyWord = "", $PosX = 0, $PosY = 0, $Wait = "")
    Local $ChkPos, $Sstr = 0
    If WinExists($WinName) Then
        If Not WinActive($WinName, $KeyWord) Then
			WinWaitActive($WinName, $KeyWord, $Wait)
		Else
			WinActivate($WinName, $KeyWord)
        EndIf
    Else
		WinWait($WinName, $KeyWord, $Wait)
		WinActivate($WinName, $KeyWord)
        WinWaitActive($WinName, $KeyWord, $Wait)
    EndIf

	Local $Winstate = WinGetState($WinName)
	If $Winstate = 16 Then WinSetState($WinName, "", @SW_RESTORE)

    Opt("MouseCoordMode", 0)
    MouseMove($PosX, $PosY, 0)
    While 1
		WinActivate($WinName, "")
        $ChkPos = _ChkMousePosX($PosX, $PosY)
        If $ChkPos = 1 Then
            $Sstr  = $Sstr + 1
            If $Sstr >= 5 Then
                MouseDown("left")
                Sleep(10)
                MouseUp("left")
                $Sstr = 0
                ExitLoop
            Else
                MouseMove($PosX, $PosY, 0)
                ContinueLoop
            EndIf
        Else
            MouseMove($PosX, $PosY, 0)
        EndIf
        Sleep(10)
    WEnd
    Opt("MouseCoordMode", 1)
EndFunc  ;==>_WinMouseClikX

;===============================================================================
;---Name        :    _ChkMousePosX()
;---Description :    Check Mouse Pos (Return 0 = False, Return 1 = True)
;===============================================================================
Func _ChkMousePosX($PosX = 0, $PosY = 0)
    Local $GetMousePos
    $GetMousePos = MouseGetPos()
    If Not @error Then
        If $GetMousePos[0] = $PosX And $GetMousePos[1] = $PosY Then
            Return 1
        Else
            Return 0
        EndIf
    Else
        Return 1
    EndIf
EndFunc  ;==>_ChkMousePosX