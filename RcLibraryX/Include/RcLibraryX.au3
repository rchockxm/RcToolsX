#include-once

;===============================================================================
;---RcLiberyX 1.3.0.0 (build 100208)--------------------------------------------
;===============================================================================

;-------------------------------------------------------------------------------------------------------RcTools Libery
;===============================================================================
;---Name        :    _ChangeSysPathtoVar()
;---Description :    Change System Var To Common Var (%WINDIR%==>C:\Windows)
;===============================================================================
Func _ChangeSysPathtoVar($Filesyspath)
    Local $SpiltPath, $SYSDriver, $PathLen, $DelFirst, $DelFinal, $VarConver
    Local $VarPath, $Str, $SysVarPath
    $SpiltPath = StringSplit($Filesyspath, "\", 1)
    If Not @error Then
        $SYSDriver = $SpiltPath[1]
        $PathLen = StringLen($SYSDriver)
        If Not @error Then
            If $PathLen = 2 Then
                Return $Filesyspath
            Else
                $DelFirst = StringTrimLeft($SYSDriver, 1)
                $DelFinal = StringTrimRight($DelFirst, 1)
                If Not @error Then
                    $VarConver = EnvGet($DelFinal)
                    If Not @error Then
                        If $VarConver = "" Then
                            Return $Filesyspath
                        Else
                            $SpiltPath[1] = $VarConver
                            $VarPath = ""
                            For $Str = 1 To $SpiltPath[0]
                                $VarPath = $VarPath & $SpiltPath[$Str] & "\"
                            Next
                            $SysVarPath = StringTrimRight($VarPath, 1)
                            If Not @error Then
                                Return $SysVarPath
                            Else
                                Return $SysVarPath
                            EndIf
                        EndIf
                    Else
                        Return $Filesyspath
                    EndIf
                Else
                    Return $Filesyspath
                EndIf
            EndIf
        Else
            Return $Filesyspath
        EndIf
    Else
        Return $Filesyspath
    EndIf
EndFunc  ;==>_ChangeSysPathtoVar

;-------------------------------------------------------------------------------------------------------File Libery
;===============================================================================
;---Name        :    _SpiltFilePathToName()
;---Description :    Spilt Path To File Name (xx.exe = 1, xx = 0)
;===============================================================================
Func _SpiltFilePathToName($FilePath, $Flag=1)
    Local $SpiltFileX, $SpiltName, $FileExName, $CombName, $FileNoName
    Local $Str1, $Str2, $X
    $SpiltFileX = StringSplit($FilePath, "\", 1)
    If Not @error Then
        $Str1 = $SpiltFileX[0]
        Switch $Flag
            Case 1
                $FileExName = $SpiltFileX[$Str1]
                If Not @error Then
                    Return $FileExName
                Else
                    Return $FilePath
                EndIf
            Case 0
                $FileExName = $SpiltFileX[$Str1]
                $SpiltName = StringSplit($FileExName, ".", 1)
                If Not @error Then
                    $Str2 = $SpiltName[0]
                    $CombName = ""
                    For $X = 1 To $Str2 - 1
                        $CombName = $CombName & $SpiltName[$X] & "."
                    Next
                    $FileNoName = StringTrimRight($CombName, 1)
                    If Not @error Then
                        Return $FileNoName
                    Else
                        Return $FileExName
                    EndIf
                Else
                    Return $FileExName
                EndIf
        Case Else
            Return $FilePath
        EndSwitch
    Else
        Return $FilePath
    EndIf
EndFunc  ;==>_SpiltFilePathToName

;===============================================================================
;---Name        :    _SpiltFilePathNoName()
;---Description :    Spilt File Path Without Name
;===============================================================================
Func _SpiltFilePathNoName($FilePath)
    Local $SpiltFilePath, $FilePathNoName, $WithoutName
    Local $Str, $X
    $SpiltFilePath = StringSplit($FilePath, "\", 1)
    If Not @error Then
        $Str = $SpiltFilePath[0]
        $FilePathNoName = ""
        For $X = 1 To $Str - 1
            $FilePathNoName = $FilePathNoName & $SpiltFilePath[$X] & "\"
        Next
        $WithoutName = StringTrimRight($FilePathNoName, 1)
        If Not @error Then
            Return $WithoutName
        Else
            Return $FilePath
        EndIf
    Else
        Return $FilePath
    EndIf
EndFunc  ;==>_SpiltFilePathNoName

;===============================================================================
;---Name        :    _SpiltFileNameExt()
;---Description :    Spilt File Ext Name
;===============================================================================
Func _SpiltFileNameExt($FileName)
    Local $SpiltFileName, $FileExtName
    Local $Str
    $SpiltFileName = StringSplit($FileName, ".", 1)
    If Not @error Then
        $Str = $SpiltFileName[0]
        $FileExtName = $SpiltFileName[$Str]
        Return $FileExtName
    Else
        Return $FileName
    EndIf
EndFunc  ;==>_SpiltFileNameExt

;===============================================================================
;---Name        :    _SpiltFilePathWithCurrentDir()
;---Description :    Get Current Dir (Dir\Sub = 0, Dir = 1)
;===============================================================================
Func _SpiltFilePathWithCurrentDir($FilePath, $ReplaceDir, $Flag = 1)
    Local $SpiltDir = StringReplace($FilePath, $ReplaceDir, "", 1)
    If Not @error Then
        Switch $Flag
            Case 0
                Return $SpiltDir
            Case 1
                Local $SpiltCurrentDir = StringSplit($SpiltDir, "\", 1)
                If Not @error Then
                    Return $SpiltCurrentDir[1]
                Else
                    Return $SpiltDir
                EndIf
            Case Else
                Return $SpiltDir
        EndSwitch
    Else
        Return $FilePath
    EndIf
EndFunc  ;==>_SpiltFilePathWithCurrentDir

;===============================================================================
;---Name        :    _CheckFileExtName()
;---Description :    Check File Ext Name (Return False = 0, True = 1)
;===============================================================================
Func _CheckFileExtName($FilePath, $FileExt, $Str = 3)
    Local $ChkPath = StringRight($FilePath, $Str)
    If $ChkPath <> "" Then
        If StringLower($ChkPath) = StringLower($FileExt) Then
            Return 1
        Else
            Return 0
        EndIf
    Else
        Return 0
    EndIf
EndFunc  ;==>_CheckFileExtName

;-------------------------------------------------------------------------------------------------------SpecialText/Other Rc Libery
;===============================================================================
;---Name        :    _API_SetLayeredWindowAttributes()
;---Description :    Use API Set GUI Rough
;===============================================================================
Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255, $isColorRef = false)
    Local Const $AC_SRC_ALPHA = 1
    Local Const $ULW_ALPHA = 2
    Local Const $LWA_ALPHA = 0x2
    Local Const $LWA_COLORKEY = 0x1
    If Not $isColorRef Then
        $i_transcolor = Hex(String($i_transcolor), 6)
        $i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
    EndIf
    Local $Ret = DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $hwnd, "long", $i_transcolor, "byte", $Transparency, "long", $LWA_COLORKEY + $LWA_ALPHA)
    Select
        Case @error
            Return SetError(@error, 0, 0)
        Case $Ret[0] = 0
            Return SetError(4, 0, 0)
        Case Else
            Return 1
    EndSelect
EndFunc   ;==>_API_SetLayeredWindowAttributes

;-------------------------------------------------------------------------------------------------------Win Rc Libery
;===============================================================================
;---Name        :    IsVisible()
;---Description :    Check If Win Have Title (True = 1, False = 0)
;===============================================================================
Func IsVisible($handle)
    If BitAnd(WinGetState($handle), 2) Then
      Return 1
    Else
      Return 0
    EndIf
EndFunc  ;==>IsVisible

;===============================================================================
;---Name        :    _GetTaskbar()
;---Description :    Get TaskBar Postion
;===============================================================================
Func _GetTaskbar($dimension)
    $s_PrevOpt = Opt("WinTitleMatchMode", 4)
    $return = WinGetPos("Classname=Shell_TrayWnd")
    Opt("WinTitleMatchMode", $s_PrevOpt)
    Return $return[$dimension]
EndFunc  ;==>_GetTaskbar

;===============================================================================
;---Name        :    _RoundGUI()
;---Description :    Set GUI Rough
;===============================================================================
Func _RoundGUI($h_win, $i_x1, $i_y1, $i_x3, $i_y3)
    Local $pos, $ret, $ret2
    $pos = WinGetPos($h_win)
    $ret = DllCall("gdi32.dll", "long", "CreateRoundRectRgn", "long", $i_x1, "long", $i_y1, "long", $pos[2], "long", $pos[3], "long", $i_x3, "long", $i_y3)
    If( $ret[0]) Then
        $ret2 = DllCall("user32.dll", "long", "SetWindowRgn", "hwnd", $h_win, "long", $ret[0], "int", 1)
        If $ret2[0] Then
            Return 1
        Else
            Return 0
        EndIf
    Else
        Return 0
    EndIf
EndFunc

;===============================================================================
;---Name        :    _GetWinPostSize()
;---Description :    Get Windows Postion And Size (X = 1, Y = 2 , W = 3, H = 4)
;===============================================================================
Func _GetWinPostSize($WinName, $Flag)
    If WinExists($WinName) Then
        Local $GetWinSize
        $GetWinSize = WinGetPos($WinName)
        If Not @error Then
            Switch $Flag
                Case 1
                    Return $GetWinSize[0]
                Case 2
                    Return $GetWinSize[1]
                Case 3
                    Return $GetWinSize[2]
                Case 4
                    Return $GetWinSize[3]
                Case Else
                    Return 0
            EndSwitch
        Else
            Return 0
        EndIf
    Else
        Return 0
    EndIf
EndFunc  ;==>_GetWinPostSize

;-------------------------------------------------------------------------------------------------------System Rc Libery
;===============================================================================
;---Name        :    _ProcessGetLocation()
;---Description :    Get Procress True Path (Procress Name / PID)
;===============================================================================
Func _ProcessGetLocation($sProc = @ScriptFullPath)
    Local $iPID = ProcessExists($sProc)
    If ($iPID = 0 )Then Return SetError(1, 0, -1)
    Local $aProc = DllCall('kernel32.dll', 'hwnd', 'OpenProcess', 'int', BitOR(0x0400, 0x0010), 'int', 0, 'int', $iPID)
    If ($aProc[0] = 0) Then Return SetError(1, 0, -1)
    Local $vStruct = DllStructCreate('int[1024]')
    DllCall('psapi.dll', 'int', 'EnumProcessModules', 'hwnd', $aProc[0], 'ptr', DllStructGetPtr($vStruct), 'int', DllStructGetSize($vStruct), 'int*', 0)
    Local $aReturn = DllCall('psapi.dll', 'int', 'GetModuleFileNameEx', 'hwnd', $aProc[0], 'int', DllStructGetData($vStruct, 1), 'str', '', 'int', 2048)
    If (StringLen($aReturn[3]) = 0) Then Return SetError(2, 0, '')
    Return $aReturn[3]
EndFunc  ;==>_ProcessGetLocation
