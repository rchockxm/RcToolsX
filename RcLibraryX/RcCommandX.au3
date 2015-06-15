#include-once
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#include <Array.au3>
#include <File.au3>
#Include <Misc.au3>
#Include <WinAPI.au3>
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------Compress Rc Libery
;===============================================================================
;---Name        :    _RcCompressSFX()
;---Description :    Compress File To SFX 
;===============================================================================
Func _RcCompressSFX($OutFilePath = "")
    If WinExists("Rc_ProgressMessage") Then
        WinWaitClose("Rc_ProgressMessage")
    Else
        Local $X = @DesktopWidth - 350
        Local $Y = @DesktopHeight - 80
        Local $ProgressGUI, $ProcLabel

        $ProgressGUI = GUICreate("Rc_ProgressMessage", 350, 25, $X, $Y, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
            GUISetBkColor(0x000000)
            _API_SetLayeredWindowAttributes($ProgressGUI, 0x000000, 160)
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

        Local $I, $J
        For $I = 0 To 15
            GUICtrlSetColor($ProgressS[$I], 0xA0A0A4)
            GUICtrlSetBkColor($ProgressS[$I], 0xFFFFFF)
            Sleep(10)
        Next
    EndIf

    ;---#Step 1#---------------------------------------
        GUICtrlSetColor($ProgressS[0], 0x800000)
        GUICtrlSetBkColor($ProgressS[0], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(1/16*100) & " %")
        GUICtrlSetColor($ProgressS[1], 0x800000)
        GUICtrlSetBkColor($ProgressS[1], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(2/16*100) & " %")
    ;---#Step 1#---------------------------------------

    ;---Compress Function
    Local $SFXFile = @AppDataDir & "\Rchockxm\RcToolsX\7zS.sfx"
    Local $ConfigX = @AppDataDir & "\Rchockxm\RcToolsX\Rc_Config.txt"
    Local $ZipFile
    DirCreate(@AppDataDir&"\Rchockxm\RcToolsX")
    FileInstall("Bin\7zS.sfx", $SFXFile, 1)    

    Sleep(100) 
    Local $WriteFile = FileOpen($ConfigX, 2) 
    If Not @error Then
        FileWrite($WriteFile, ';!@Install@!UTF-8!' & @CRLF)
        FileWrite($WriteFile, 'Title=' & '"' & 'RcToolsX 1.2.0.0' & '"' & @CRLF)
        FileWrite($WriteFile, 'ExecuteFile=' & '"' & @ScriptName & '"'  & @CRLF)
        FileWrite($WriteFile, ';!@InstallEnd@!' & @CRLF)
        FileClose($WriteFile)
    Else
        Return 0
    EndIf 
    If @error Then Return 0   

    ;---#Step 2#---------------------------------------
        GUICtrlSetColor($ProgressS[2], 0x800000)
        GUICtrlSetBkColor($ProgressS[2], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(3/16*100) & " %")
        GUICtrlSetColor($ProgressS[3], 0x800000)
        GUICtrlSetBkColor($ProgressS[3], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(4/16*100) & " %")
        GUICtrlSetColor($ProgressS[4], 0x800000)
        GUICtrlSetBkColor($ProgressS[4], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(5/16*100) & " %")
    ;---#Step 2#---------------------------------------

    Sleep(100) 
    If FileExists(@ScriptDir & "\7zr.exe") Then
        $ZipFile = @ScriptDir & "\7zr.exe"
    Else
        FileInstall("Bin\7zr.exe", @AppDataDir & "\Rchockxm\RcToolsX\7zr.exe", 1)
        If (@error) Then Return 0
        $ZipFile = @AppDataDir & "\Rchockxm\RcToolsX\7zr.exe"
    EndIf

    ;---#Step 3#---------------------------------------
        GUICtrlSetColor($ProgressS[5], 0x800000)
        GUICtrlSetBkColor($ProgressS[5], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(6/16*100) & " %")
        GUICtrlSetColor($ProgressS[6], 0x800000)
        GUICtrlSetBkColor($ProgressS[6], 0xFF0000)
        GUICtrlSetData($ProcLabel, Floor(7/16*100) & " %")
    ;---#Step 3#---------------------------------------

    If FileExists($SFXFile) And FileExists($ConfigX) And FileExists($ZipFile) Then   
        Local $TempFile = @AppDataDir & "\Rchockxm\RcToolsX\RcTemp.7z"
        Local $Source = @ScriptDir & "\*.*"
        If ($OutFilePath = "") Then
            Local $OutPut = @DesktopDir & "\Output\Demo_Setup.exe"
            DirCreate(@DesktopDir & "\Output")
        Else
            Local $OutPut = $OutFilePath
        EndIf

        ;---#Step 4#---------------------------------------
            GUICtrlSetColor($ProgressS[7], 0x800000)
            GUICtrlSetBkColor($ProgressS[7], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(8/16*100) & " %")
            GUICtrlSetColor($ProgressS[8], 0x800000)
            GUICtrlSetBkColor($ProgressS[8], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(9/16*100) & " %")
        ;---#Step 4#---------------------------------------
          
        If FileExists($TempFile) Then FileDelete($TempFile)   

        RunWait($ZipFile & ' a -t7z ' & '"' & $TempFile & '"' & ' ' & '"' & $Source & '"' & ' -r', "", @SW_HIDE)
        If @error Then Return 0

        ;---#Step 4#---------------------------------------
            GUICtrlSetColor($ProgressS[9], 0x800000)
            GUICtrlSetBkColor($ProgressS[9], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(10/16*100) & " %")
            GUICtrlSetColor($ProgressS[10], 0x800000)
            GUICtrlSetBkColor($ProgressS[10], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(11/16*100) & " %")
            GUICtrlSetColor($ProgressS[11], 0x800000)
            GUICtrlSetBkColor($ProgressS[11], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(12/16*100) & " %")
        ;---#Step 4#---------------------------------------

        Sleep(100)
        If FileExists($TempFile) Then
            If FileExists($OutPut) Then FileDelete($OutPut)
            RunWait(@ComSpec & ' /c ' & 'copy /b ' & '"' & $SFXFile & '"' & ' + ' & '"' & $ConfigX & '"' & ' + '& '"' & $TempFile & '"' & ' ' & '"' & $OutPut, "", @SW_HIDE)  
            If @error Then Return 0

            If FileExists($OutPut) Then
                GUIDelete($ProgressGUI)
                MsgBox(32, "RcToolsX", "OutPutPath: " & $OutPut) 
            EndIf
        Else
            Return 0
        EndIf

        ;---#Step 4#---------------------------------------
            GUICtrlSetColor($ProgressS[12], 0x800000)
            GUICtrlSetBkColor($ProgressS[12], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(13/16*100) & " %")
            GUICtrlSetColor($ProgressS[13], 0x800000)
            GUICtrlSetBkColor($ProgressS[13], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(14/16*100) & " %")
            GUICtrlSetColor($ProgressS[14], 0x800000)
            GUICtrlSetBkColor($ProgressS[14], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(15/16*100) & " %")
            GUICtrlSetColor($ProgressS[15], 0x800000)
            GUICtrlSetBkColor($ProgressS[15], 0xFF0000)
            GUICtrlSetData($ProcLabel, Floor(16/16*100) & " %")
        ;---#Step 4#---------------------------------------

        Sleep(100) 
        FileDelete($SFXFile)
        FileDelete($ConfigX)
        FileDelete($ZipFile)
        FileDelete($TempFile)
    Else
        Return 0
    EndIf
EndFunc  ;==>_RcCompressSFX

;-------------------------------------------------------------------------------------------------------AutoRecord Rc Libery
;===============================================================================
;---Name        :    _RcAutoInstallModeX()
;---Description :    Auto Record Software Mode
;===============================================================================
Global $GlobalWinTitle = ""
Global $GlobalProcPID = ""
Global $GlobalWriteLine = 1

Func _RcAutoInstallModeX($RunEXE)
    If FileExists($RunEXE) Then
        ;WinMinimizeAll()
        Run($RunEXE)
        If @error Then 
            ShellExecute($RunEXE)
            If @error Then Exit
        EndIf
        _WriteText('file::run,"' & $RunEXE & '"')
    Else
        Return 0 
    EndIf

    Global $GlobalWinTitle = ""
    Global $GlobalProcPID = ""
    Global $GlobalWriteLine = 1

    Opt("MouseCoordMode", 0) 

    HotKeySet("{F2}", "_GetWinTitle")
    HotKeySet("{F3}", "_GetMousePos")
    HotKeySet("{F4}", "_SetConText")
    HotKeySet("{F5}", "_SetPageButton")
    HotKeySet("{F6}", "_DelPreOption")
    HotKeySet("{ESC}", "_ExitRecord")   

    Local $SSD = 1, $Step = 1
    While ($SSD = 1)
        Local $WinTitle = WinGetTitle("", "")
        Local $WinProcs = WinGetProcess($WinTitle)

        $GlobalWinTitle = $WinTitle
        $GlobalProcPID = $WinProcs      
  
        Local $GetWinPoss = WinGetPos($GlobalWinTitle)
        Local $GetCurPoss = MouseGetPos()
        Local $GetConForc = ControlGetFocus($GlobalWinTitle)
        Local $GetConText = ControlGetText($GlobalWinTitle, "", "[CLASSNN:" & $GetConForc & "]")
        Local $GetTextNum = StringLen($GetConText) 
 
        If $GetTextNum >= 60 Then $GetConText = ""  
      
        Local $ToolTitle = "標題： " & $GlobalWinTitle & " [" & $GetWinPoss[2] & "," & $GetWinPoss[3] & "]" 
        Local $ToolText1 = "快捷： [F2-標題] [F3-滑鼠] [F4-文字] [F5-按鍵] [F6-取消] [TAB-切換] [ESC-離開]" 
        Local $ToolText2 = "步驟： [" & $GlobalWriteLine & "]" & "  滑鼠： [" & $GetCurPoss[0] & "," & $GetCurPoss[1] & "]" 
        Local $ToolText3 = "鍵盤： [" & $GetConText & "]" & "  控鍵： [" & $GetConForc & "]"

        ToolTip($ToolText1 & @CR & $ToolText2 & "  " & $ToolText3, @DesktopWidth - 600, @DesktopHeight - 200, $ToolTitle, 1)

        Sleep(110)
        If $GlobalWinTitle = "" Then
            _MouseTrap()
            $SSD = 1
        Else
            If $GetWinPoss[2] - $GetWinPoss[0] >= 50 Then
                _MouseTrap($GetWinPoss[0], $GetWinPoss[1], $GetWinPoss[0] + $GetWinPoss[2], $GetWinPoss[1] + $GetWinPoss[3]) 
            EndIf  
            If Not ProcessExists($GlobalProcPID) Then
                $SSD = 0
                _ExitRecord()
            EndIf  
        EndIf
    WEnd
EndFunc  ;==>_RcAutoInstallModeX

Func _GetWinTitle()
    Local $WinTitle = WinGetTitle("", "")
    Local $WinProcs = WinGetProcess($WinTitle)
    Local $Line = $GlobalWriteLine + 1
    $GlobalWinTitle = $WinTitle
    $GlobalProcPID = $WinProcs
    $GlobalWriteLine = $Line
    WinActivate($WinTitle, "")
EndFunc  ;==>_GetWinTitle

Func _GetMousePos()
    Local $WinTitle = WinGetTitle("", "")
    Local $MousePos = MouseGetPos()    
    Local $MousX = $MousePos[0]
    Local $MousY = $MousePos[1]
    Local $Line = $GlobalWriteLine + 1
    $GlobalWinTitle = $WinTitle
    $GlobalWriteLine = $Line
    _WriteText('win::mouseclik,"' & $GlobalWinTitle & '","' & ""  & '","' & $MousX & '","' & $MousY & '"')
EndFunc  ;==>_GetMousePos

Func _SetConText()
    Local $WinTitle = WinGetTitle("", "")    
    Local $GetConForc = ControlGetFocus($WinTitle)
    Local $GetConText = ControlGetText($WinTitle, "", "[CLASSNN:" & $GetConForc & "]")  
    Local $Line = $GlobalWriteLine + 1  
    $GlobalWinTitle = $WinTitle
    $GlobalWriteLine = $Line
    _WriteText('win::winsend,"' & $GlobalWinTitle & '","' & "" & '","' & $GetConForc & '","' & $GetConText & '"')
EndFunc  ;==>_SetConText

Func _SetPageButton()
    Local $WinTitle = WinGetTitle("", "")    
    Local $GetConForc = ControlGetFocus($WinTitle)  
    Local $GetConText = ControlGetText($WinTitle, "", "[CLASSNN:" & $GetConForc & "]")
    Local $Line = $GlobalWriteLine + 1  
    $GlobalWinTitle = $WinTitle  
    $GlobalWriteLine = $Line
    _WriteText('win::winclick,"' & $GlobalWinTitle & '","' & $GetConText & '","' & $GetConForc & '"')
EndFunc  ;==>_SetPageButton

Func _DelPreOption()
    Local $ArrayTemp
    If _FileReadToArray("RcToolsX.rcini", $ArrayTemp) Then   
        Local $CountLines = $GlobalWriteLine
        If ($CountLines > 1) Then
            Local $OpenFile = FileOpen("RcToolsX.rcini", 2)
            Local $Line = $CountLines - 1
            If Not @error Then
                _FileWriteFromArray($OpenFile , $ArrayTemp, 1, $Line)  
                $GlobalWriteLine = $Line         
            EndIf
            FileClose($OpenFile)     
        EndIf
    EndIf
EndFunc  ;==>_DelPreOption

Func _WriteText($Line)
    Local $SaveFile = "RcToolsX.rcini"
    Local $WriteFile = FileOpen($SaveFile, 1)
    If Not @error Then
        FileWrite($WriteFile, $Line & @CRLF) 
    EndIf
    FileClose($WriteFile)
EndFunc  ;==>_WriteText

Func _ExitRecord()
    Opt("MouseCoordMode", 1) 
    _MouseTrap()
    Exit
EndFunc  ;==>ExitRecord

;-------------------------------------------------------------------------------------------------------SelfDelete Rc Libery
;===============================================================================
;---Name        :    _RcSelfDeleteX()
;---Description :    Self-Delete RcToolsX 
;===============================================================================
Func _RcSelfDeleteX($iDelay = 0)
     Local $sCmdFile
     FileDelete(@TempDir & "\scratch.bat")
     $sCmdFile = 'ping -n ' & $iDelay & '127.0.0.1 > nul' & @CRLF _
             & ':loop' & @CRLF _
             & 'del "' & @ScriptFullPath & '"' & @CRLF _
             & 'if exist "' & @ScriptFullPath & '" goto loop' & @CRLF _
             & 'del ' & @TempDir & '\scratch.bat'
     FileWrite(@TempDir & "\scratch.bat", $sCmdFile)
     Run(@TempDir & "\scratch.bat", @TempDir, @SW_HIDE)
     If @error Then Return 0
EndFunc  ;==>_RcSelfDeleteX

;-------------------------------------------------------------------------------------------------------RcToolsXEnv Rc Libery
;===============================================================================
;---Name        :    _RcToolsXEnvX()
;---Description :    Add RcToolsX Env (Enable = 1, Disable = 0)      
;===============================================================================

Func _RcToolsXEnvX($Flag = 1)
    Local $GetExtEnv, $GetPathEnv, $ExtChk, $PathChk, $ExtReplace, $PathReplace
    Switch $Flag
        Case 0
            If FileExists(@SystemDir & "\RcToolsX\RcToolsX.exe") Then
                FileDelete(@SystemDir & "\RcToolsX\RcToolsX.exe")
            EndIf
            DirRemove(@SystemDir & "\RcToolsX", 1)
            $GetExtEnv = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATHEXT")
            $GetPathEnv = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "Path")
            $ExtChk = StringInStr($GetExtEnv, ".RCINI")
            If $ExtChk > 0 Then
                $ExtReplace = StringReplace($GetExtEnv, ".RCINI", "")
                If (StringRight($ExtReplace, 1) = ";") Then
                    RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATHEXT", "REG_EXPAND_SZ", StringTrimRight($ExtReplace, 1)) 
                Else
                    RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATHEXT", "REG_EXPAND_SZ", $ExtReplace) 
                EndIf
                If @error Then Sleep(1)
            EndIf
            $PathChk = StringInStr($GetPathEnv, @SystemDir & "\RcToolsX")
            If $PathChk > 0 Then
                $PathReplace = StringReplace($GetPathEnv, @SystemDir & "\RcToolsX", "")
                If (StringRight($ExtReplace, 1) = ";") Then
                    RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATH", "REG_EXPAND_SZ", StringTrimRight($PathReplace, 1)) 
                Else
                    RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATH", "REG_EXPAND_SZ", $PathReplace) 
                EndIf
                If (@error) Then Sleep(1)
            EndIf
            RegDelete("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "RCENV")
            EnvUpdate()
        Case 1
            DirCreate(@SystemDir & "\RcToolsX")
            FileCopy(@AutoItExe, @SystemDir & "\RcToolsX\RcToolsX.exe", 9)
            If Not FileExists(@SystemDir & "\RcToolsX\RcToolsX.exe") Then
                Return 0
            EndIf
            $GetExtEnv = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATHEXT")
            $GetPathEnv = RegRead("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "Path")
            $ExtChk = StringInStr($GetExtEnv, ".RCINI")
            If $ExtChk = 0 Then
                RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "PATHEXT", "REG_EXPAND_SZ", $GetExtEnv & ";.RCINI")
            EndIf
            $PathChk = StringInStr($GetPathEnv, @SystemDir & "\RcToolsX")
            If $PathChk = 0 Then
                RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "Path", "REG_EXPAND_SZ", $GetPathEnv & ";" & @SystemDir & "\RcToolsX")
            EndIf
            RegWrite("HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "RCENV", "REG_EXPAND_SZ", @SystemDir & "\RcToolsX\RcToolsX.exe")
            EnvUpdate()
    EndSwitch
    If @error Then Return 0
EndFunc  ;==>_RcToolsXEnvX

