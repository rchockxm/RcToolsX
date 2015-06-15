#include-once
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Process.au3>
#include "Include\ServiceControl.au3"
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------System Rc Libery
;===============================================================================
;---Name        :    _SysShutdownGuiX(), _TimerGUIX()
;---Description :    Shutdown PC, TickTimer
;===============================================================================
Func _SysShutdownGuiX($Item, $Sec = 0, $Flag = 0)
    Switch $Flag
        Case 0    ;Without Gui
            Sleep($Sec * 1000)
            If $Item = 1 Then
                Shutdown(6)
                If @error Then Return 0 
            ElseIf ($Item = 2) Then
                Shutdown(10)
                If @error Then Return 0 
            ElseIf ($Item = 3) Then
                Shutdown(2)
                If @error Then Return 0 
            EndIf
        Case 1    ;With Gui
            If $Item = 1 Then
                _TimerGUIX($Sec)
                Shutdown(6)
                If @error Then Return 0 
            ElseIf $Item = 2 Then
                _TimerGUIX($Sec)
                Shutdown(10)
                If @error Then Return 0 
            ElseIf $Item = 3 Then
                _TimerGUIX($Sec)
                Shutdown(2)
                If @error Then Return 0 
            EndIf
        Case Else
            Return 0
    EndSwitch 
EndFunc  ;==>_SysShutdownGuiX

Func _TimerGUIX($Timer = 60)
    If WinExists("Rc_ShutdownMessage") Then
        WinWaitClose("Rc_ShutdownMessage")
    EndIf

    Local $TickTimer, $Mins, $Secs, $TimerX  
    Local $TimerGUI, $TimerLabel, $FFCheck

    $FFCheck = 1
    $TickTimer  = $Timer
    $Mins = Floor($TickTimer / 60)
    $Secs = $TickTimer - ($Mins * 60)
    If $Mins <= 9 Then $Mins = "0" & $Mins
    If $Secs <= 9 Then $Secs = "0" & $Secs

    $TimerGUI = GUICreate("Rc_ShutdownMessage", 270, 120, -1, -1, $WS_POPUP, Bitor($WS_EX_TOPMOST, $WS_EX_TOOLWINDOW, $WS_EX_LAYERED), WinGetHandle(AutoItWinGetTitle()))
        GUISetBkColor(0x800000)
        _API_SetLayeredWindowAttributes($TimerGUI, 0x800000)
        WinSetOnTop($TimerGUI, "", 1)
    $TimerLabel = GUICtrlCreateLabel($Mins & ":" & $Secs, 0, 0, 270, 120)
        GUICtrlSetFont($TimerLabel, 80, 800, 0, "MS Sans Serif")
        GUICtrlSetColor($TimerLabel, 0xFF0000)  
    GUISetState(@SW_SHOW, $TimerGUI)

    Do
        If $Secs = 0 Then 
            If $Mins >= 1 Then 
                $Mins = $Mins - 1
                $Secs = 59
            Else
                $Secs = 0
            EndIf  
        Else
            $Secs = $Secs - 1      
        EndIf  

        $TimerX = StringFormat("%02i:%02i", $Mins, $Secs)
        If $Mins = 0 And $Secs = 0 Then 
            $FFCheck = 0       
            Sleep(1000)     
            GUICtrlSetData($TimerLabel, $TimerX)            
        Else
            Sleep(1000)
            GUICtrlSetData($TimerLabel, $TimerX)            
        EndIf        
    Until $FFCheck = 0 

    GUIDelete($TimerGUI)
    If @error Then Return 0
EndFunc   ;==>_TimerGUIX

;===============================================================================
;---Name        :    _SysCDTrayOutX()
;---Description :    Open CD-Rom Devices
;===============================================================================
Func _SysCDTrayOutX($CDName)
    Local $GetDriver = DriveGetDrive("CDROM")
    Local $CurrentDir = StringLeft(@ScriptDir, 2)
    Local $X
    If NOT @error Then
        For $X = 1 To $GetDriver[0]
            If $GetDriver[$X] = $CDName Then
                CDTray($GetDriver[$X], "open") 
                If @error Then Exit                          
                ExitLoop
            ElseIf $GetDriver[$X] = $CurrentDir Then
                CDTray($GetDriver[$X], "open") 
                If @error Then Exit                                 
                ExitLoop
            EndIf
        Next
    EndIf
EndFunc   ;==>_SysCDTrayOutX

;===============================================================================
;---Name        :    _SysSleepX()
;---Description :    Sleep Like Cmd
;===============================================================================
Func _SysSleepX($Timer)
    Sleep($Timer)
EndFunc   ;==>_SysSleepX

;===============================================================================
;---Name        :    _SysThemeSCX()
;---Description :    Enable / Disable Themes Services (Enable = 1, Disable = 0)
;===============================================================================
Func _SysThemeSCX($Flag = 1)
    Switch $Flag
        Case 0
            _StopService("", "Themes")
        Case 1
            _StartService("", "Themes")        
        Case Else
            Return 0
    EndSwitch 
    If @error Then Return 0
EndFunc   ;==>_SysThemeSCX

;===============================================================================
;---Name        :    _SysRefeshMemoryX()
;---Description :    Refesh Process Memory (PID = 0 / /all = 1)
;===============================================================================
Func _SysRefeshMemoryX($ProcPID, $Flag = 0)
    Switch $Flag
        Case 0
            _ReduceMemory($ProcPID)
            If @error Then Return 0 
        Case 1
            Local $ListAllProc = ProcessList()
            Local $LStr
            If Not @error Then
                For $LStr = 1 To $ListAllProc[0][0]
                    _ReduceMemory($ListAllProc[$LStr][1])
                    If @error Then Return 0
                Next
            EndIf
        Case Else
            ;
    EndSwitch 
EndFunc   ;==>_SysRefeshMemoryX

Func _ReduceMemory($i_PID = -1)
    If $i_PID <> -1 Then
        Local $ai_Handle = DllCall("kernel32.dll", 'int', 'OpenProcess', 'int', 0x1f0fff, 'int', False, 'int', $i_PID)
        Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', $ai_Handle[0])
        DllCall('kernel32.dll', 'int', 'CloseHandle', 'int', $ai_Handle[0])
    Else
        Local $ai_Return = DllCall("psapi.dll", 'int', 'EmptyWorkingSet', 'long', -1)
    EndIf
    Return $ai_Return[0]
EndFunc   ;==>_ReduceMemory

;===============================================================================
;---Name        :    _SysTaskKillerX()
;---Description :    Kill Process
;===============================================================================
Func _SysTaskKillerX($ProcName)
    If ProcessExists($ProcName) Then
        Run(@ComSpec & " /c " & 'TASKKILL /F /IM ' & $ProcName & ' /T', "", @SW_HIDE)
        If @error Then 
            ProcessClose($ProcName) 
        EndIf
    EndIf
EndFunc   ;==>_SysTaskKillerX

;===============================================================================
;---Name        :    _SysRestartExplorerX()
;---Description :    Restart Explorer Process
;===============================================================================
Func _SysRestartExplorerX($Wait = 5)
    Local $ProcName = "explorer.exe"
    If ProcessExists($ProcName) Then
        Run(@ComSpec & " /c " & 'TASKKILL /F /IM ' & $ProcName & ' /T', "", @SW_HIDE)
        If @error Then 
            ProcessClose($ProcName) 
        EndIf
        Sleep($Wait)
        Run(@ComSpec & " /c " & 'explorer.exe', "", @SW_HIDE)
        If @error Then Run(@WindowsDir & "\explorer.exe", @WindowsDir)
    Else
        Run(@ComSpec & " /c " & 'explorer.exe', "", @SW_HIDE)
        If @error Then Run(@WindowsDir & "\explorer.exe", @WindowsDir)
    EndIf
EndFunc   ;==>_SysRestartExplorerX

;===============================================================================
;---Name        :    _SysShellOpenX()
;---Description :    Use Shell Open Dir or File (wait = 1, nowait = 0)
;===============================================================================
Func _SysShellOpenX($FilePath, $Switch = "", $Flag = 0)
    Switch $Flag
        Case 0
            ShellExecute($FilePath, $Switch)
            If @error Then Return 0
        Case 1
            ShellExecuteWait($FilePath, $Switch)
            If @error Then Return 0
        Case Else
            Return 0
    EndSwitch     
EndFunc   ;==>_SysShellOpenX

;===============================================================================
;---Name        :    _SysCmdX()
;---Description :    Run Command Line Switch
;===============================================================================
Func _SysCmdX($CmdSwitch)
    RunWait(@ComSpec & " /c " & $CmdSwitch, "", @SW_HIDE)
    If @error Then Return 0 
EndFunc   ;==>_SysCmdX

;===============================================================================
;---Name        :    _SysRunDosX()
;---Description :    Run Dos Switch
;===============================================================================
Func _SysRunDosX($CmdSwitch)
    _RunDos($CmdSwitch)
    If @error Then Return 0 
EndFunc   ;==>_SysRunDosX

