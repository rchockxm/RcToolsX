#include-once
#include "Include\ExtractIconToFile.au3"
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------File Rc Libery
;===============================================================================
;---Name        :    _FileRun()
;---Description :    Run or RinWait EXE File (Enable = 1, Disable = 0)    
;===============================================================================
Func _FileRunX($FilePath, $Switch = "", $Hide = 0, $Wait = 0)
    If FileExists($FilePath) Then
        Switch $Hide
            Case 0
                If $Wait = 0 Then
                    Run($FilePath & " " & $Switch)
                    If @error Then 
                        ShellExecute($FilePath, $Switch, "", "open")
                        If @error Then Return 0
                    EndIf
                ElseIf $Wait = 1 Then
                    RunWait($FilePath & " " & $Switch)
                    If @error Then 
                        ShellExecuteWait($FilePath, $Switch, "", "open")
                        If @error Then Return 0
                    EndIf
                EndIf
            Case 1            
                If $Wait = 0 Then
                    Run($FilePath & " " & $Switch, "",@SW_HIDE)
                    If @error Then 
                        ShellExecute($FilePath, $Switch, "", "open", @SW_HIDE)
                        If @error Then Return 0
                    EndIf
                ElseIf $Wait = 1 Then
                    RunWait($FilePath & " " & $Switch, "", @SW_HIDE)  
                    If @error Then 
                        ShellExecuteWait($FilePath, $Switch, "", "open", @SW_HIDE)
                        If @error Then Return 0
                    EndIf
                EndIf
            Case Else
                Return 0
        EndSwitch       
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileRunX

;===============================================================================
;---Name        :    _FileDelete()
;---Description :    Delete File (Enable = 1, Disable = 0)    
;===============================================================================
Func _FileDeleteX($FilePath, $Force = 0)
    If FileExists($FilePath) Then
        Switch $Force
            Case 0
                FileDelete($FilePath)
                If @error Then Return 0
            Case 1
                Local $FileNameX = _SpiltFilePathToName($FilePath, 1)
                If Not @error Then
                    If ProcessExists($FileNameX) Then
                        Run(@ComSpec & " /c " & 'TASKKILL /F /IM ' & $FileNameX & ' /T', "", @SW_HIDE)
                        If @error Then 
                            ProcessClose($FileNameX)  
                        EndIf
                    EndIf
                EndIf
                FileSetAttrib($FilePath, "-RSH")
                FileDelete($FilePath)
                If @error Then Return 0
            Case Else
                Return 0
        EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileDeleteX

;===============================================================================
;---Name        :    _FileDeleteAllDriversX()
;---Description :    Delete All Drivers File (Enable = 1, Disable = 0)    
;===============================================================================
Func _FileDeleteAllDriversX($FileName, $Force = 0)
    Switch $Force
        Case 0   
            Local $GetAllDriver = DriveGetDrive("ALL")       
            If NOT @error Then
                Local $X, $Y
                For $X = 1 To $GetAllDriver[0]
                    Local $GetCDDriver = DriveGetDrive("CDROM")    
                    If NOT @error Then
                        For $Y = 1 To $GetCDDriver[0]    
                            If Not ($GetAllDriver[$X] = $GetCDDriver[$Y]) Then
                                If FileExists($GetAllDriver[$X] & "\" & $FileName) Then
                                    FileDelete($GetAllDriver[$X] & "\" & $FileName)  
                                    If @error Then Return 0
                                EndIf
                            EndIf
                        Next
                    Else
                        If FileExists($GetAllDriver[$X] & "\" & $FileName) Then
                            FileDelete($GetAllDriver[$X] & "\" & $FileName)    
                            If @error Then Return 0
                        EndIf
                    EndIf
                Next
            Else
                Return 0
            EndIf
        Case 1 
            Local $GetAllDriver = DriveGetDrive("ALL")       
            If NOT @error Then
                Local $X, $Y
                For $X = 1 To $GetAllDriver[0]
                    Local $GetCDDriver = DriveGetDrive("CDROM")    
                    If NOT @error Then
                        For $Y = 1 To $GetCDDriver[0]    
                            If Not $GetAllDriver[$X] = $GetCDDriver[$Y] Then
                                If FileExists($GetAllDriver[$X] & "\" & $FileName) Then
                                    Local $FileNameX = _SpiltFilePathToName($FileName, 1)
                                    If Not @error Then
                                        If ProcessExists($FileNameX) Then
                                            Run(@ComSpec & " /c " & 'TASKKILL /F /IM ' & $FileNameX & ' /T', "", @SW_HIDE)
                                            If @error Then 
                                                ProcessClose($FileNameX)  
                                            EndIf
                                        EndIf
                                    EndIf
                                    FileSetAttrib($GetAllDriver[$X] & "\" & $FileName, "-RSH")
                                    FileDelete($GetAllDriver[$X] & "\" & $FileName)  
                                    If @error Then Return 0
                                EndIf
                            EndIf
                        Next
                    Else
                        If FileExists($GetAllDriver[$X] & "\" & $FileName) Then
                            Local $FileNameX = _SpiltFilePathToName($FileName, 1)
                            If Not @error Then
                                If ProcessExists($FileNameX) Then
                                    Run(@ComSpec & " /c " & 'TASKKILL /F /IM ' & $FileNameX & ' /T', "", @SW_HIDE)
                                    If @error Then 
                                        ProcessClose($FileNameX)  
                                    EndIf
                                EndIf
                            EndIf
                            FileSetAttrib($GetAllDriver[$X] & "\" & $FileName, "-RSH")
                            FileDelete($GetAllDriver[$X] & "\" & $FileName)    
                            If @error Then Return 0
                        EndIf
                    EndIf
                Next
            Else
                Return 0
            EndIf
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_FileDeleteAllDriversX

;===============================================================================
;---Name        :    _FileCopyX()
;---Description :    Copy File    
;===============================================================================
Func _FileCopyX($FilePath, $CopyToPath)
    If FileExists($FilePath) Then
        If $CopyToPath <> "" Then
            FileCopy($FilePath, $CopyToPath, 9)
            If @error Then Return 0
        Else
            Return 0
        EndIf
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileCopyX

;===============================================================================
;---Name        :    _FileCombineX()
;---Description :    Combine A To B File 
;===============================================================================
Func _FileCombineX($FilePath1, $FilePath2, $DestPath)
    If FileExists($FilePath1) And FileExists($FilePath2) Then
        RunWait(@ComSpec & " /c " & "copy /b " & $FilePath1 & " + " & $FilePath2 & " " & $DestPath, "", @SW_HIDE) 
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileCombineX

;===============================================================================
;---Name        :    _FileMoveX()
;---Description :    Move File To New Place 
;===============================================================================
Func _FileMoveX($FilePath, $MoveToPath)
    If FileExists($FilePath) Then
        If $MoveToPath <> "" Then
            FileMove($FilePath, $MoveToPath, 9) 
            If @error Then Return 0
        Else
            Return 0
        EndIf
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileMoveX

;===============================================================================
;---Name        :    _FileReNameX()
;---Description :    Rename File To New File Name 
;===============================================================================
Func _FileReNameX($OldFilePath, $NewFileName)
    Local $SpiltSPath, $SpiltNewName
    Local $SPath, $SName, $SExtName
    Local $DName
    Local $MovePath
    If FileExists($OldFilePath) Then
        $SPath = _SpiltFilePathNoName($OldFilePath)
        $SName = _SpiltFilePathToName($OldFilePath, 1)
        $SExtName = _SpiltFileNameExt($SName)
        $DName = _SpiltFilePathToName($NewFileName, 1)  
        $SpiltSPath = StringSplit($OldFilePath, "\", 1)
        If Not @error Then    
            $SpiltNewName = StringSplit($NewFileName, ".", 1)
            If Not @error Then
                $MovePath = $SPath & "\" & $DName
            Else
                $MovePath = $SPath & "\" & $DName & "." & $SExtName
            EndIf        
        Else
            $SpiltNewName = StringSplit($NewFileName, ".", 1)
            If Not @error Then
                $MovePath = $DName
            Else
                $MovePath = $DName & "." & $SExtName
            EndIf  
        EndIf
        FileMove($OldFilePath, $MovePath, 9)
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileReNameX

;===============================================================================
;---Name        :    _FileReplaceX()
;---Description :    Replace File From Sources
;===============================================================================
Func _FileReplaceX($ReplaceName, $Sources, $BackupName = "")
    If FileExists($ReplaceName) Then    
        Local $BackReplaceFile, $CopyDir
        If $BackupName = "" Then
            $BackupName = _SpiltFilePathToName($ReplaceName, 1)
            $BackReplaceFile = $BackupName & ".rcfile"
        Else
            $BackReplaceFile = $BackupName
        Endif
        RunWait(@ComSpec & " /c " & 'takeown /f ' & $ReplaceName & ' /a & icacls ' & $ReplaceName & ' /grant:r Administrators:fC', "", @SW_HIDE)
        If @error Then Return 0
        RunWait(@ComSpec & " /c " & 'rename ' & $ReplaceName & ' ' & $BackReplaceFile, "", @SW_HIDE)
        If @error Then Return 0
        RunWait(@ComSpec & " /c " & 'copy  /y ' & $Sources & ' ' & $ReplaceName, "", @SW_HIDE) 
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileReplaceX

;===============================================================================
;---Name        :    _FileSetattribX()
;---Description :    Set File Attrib (+-RASHNOT) 
;===============================================================================
Func _FileSetattribX($FilePath, $Prep, $Flag = 0)
    If FileExists($FilePath) Then
        Switch $Flag
            Case 0
                FileSetAttrib($FilePath, $Prep, 0)
                If @error Then Return 0
            Case 1
                FileSetAttrib($FilePath, $Prep, 1)
                If @error Then Return 0
            Case Else
                Return 0
        EndSwitch
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileSetattribX

;===============================================================================
;---Name        :    _FileFontInstallX()
;---Description :    Install Font To PC
;===============================================================================
Func _FileFontInstallX($sSourceFile, $sFontDescription)
    Local Const $HWND_BROADCAST = 0xFFFF
    Local Const $WM_FONTCHANGE = 0x1D    
    Local $sFontFileName = StringRegExpReplace($sSourceFile, '^.*\\', '')
    If Not FileCopy($sSourceFile, @WindowsDir & "\fonts\" & $sFontFileName, 1) Then Return SetError(1, 0, 0)    
    Local $aRet = DllCall("gdi32.dll", "Int", "AddFontResource", "str", @WindowsDir & "\fonts\" & $sFontFileName)
    If IsArray($aRet) And $aRet[0] > 0 Then
        RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts", $sFontDescription, "REG_SZ", $sFontFileName)
        DllCall("user32.dll", "Int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_FONTCHANGE, "int", 0, "int", 0)
        If @error Then Return 0
    EndIf
    Return SetError(2, 0, 0)
EndFunc  ;==>_FileFontInstallX

;===============================================================================
;---Name        :    _FileInfInstallX()
;---Description :    Install Inf File
;===============================================================================
Func _FileInfInstallX($SourceFile)
    Local $ChkFileName = _CheckFileExtName($SourceFile, "inf", 3)
    If $ChkFileName = 0 Then
        Return 0
    EndIf
    If FileExists($SourceFile) Then
        RunWait(@ComSpec & " /c " & 'rundll32.exe advpack.dll,LaunchINFSection ' & '"' & $SourceFile & '"' & ',,3', "", @SW_HIDE)
        If @error Then Return 0
        Sleep(50)
    Else
        Return 0
    EndIf 
EndFunc  ;==>_FileInfInstallX

;===============================================================================
;---Name        :    _FileExtracterZipX()
;---Description :    Extracter Zip File To Dir (Need 7zr.exe)
;===============================================================================
Func _FileExtracterZipX($SourceFile, $DestFile, $ExtName = "*.*")
    Local $ZipFile
    If FileExists(@ScriptDir & "\7z.exe") Then
        $ZipFile = @ScriptDir & "\7z.exe"  
    ElseIf FileExists(@ScriptDir & "\7zr.exe") Then
        $ZipFile = @ScriptDir & "\7zr.exe" 
    Else
        DirCreate(@AppDataDir & "\Rchockxm\RcToolsX")
        FileInstall("Bin\7zr.exe", @AppDataDir & "\Rchockxm\RcToolsX\7zr.exe", 0)
        If @error Then Return 0    
        If FileExists(@AppDataDir & "\Rchockxm\RcToolsX\7zr.exe") Then
            $ZipFile = @AppDataDir & "\Rchockxm\RcToolsX\7zr.exe"
        Else
            Return 0 
        EndIf
    EndIf 
    Local $File = $SourceFile  
    Local $Dirx = $DestFile
    Local $Exts = $ExtName
    If FileExists($File) Then
        RunWait($ZipFile & ' e ' & '"' & $File & '"' & ' -o' & '"' & $Dirx & '"' & ' ' & '"' & $Exts & '"' & ' -r', "", @SW_HIDE)
        If @error Then Return 0
    Else
        Return 0
    EndIf
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\7zr.exe")
EndFunc  ;==>_FileExtracterZipX

;===============================================================================
;---Name        :    _FileExtracterIconX()
;---Description :    Extracter File To Icon (Need ExtractIconToFile.au3)
;===============================================================================
Func _FileExtracterIconX($SourceFile, $IconNum, $DestFile)
    If FileExists($SourceFile) Then
        Local $ConverNumber = $IconNum + 0
        _ExtractIconToFile($SourceFile, $ConverNumber, $DestFile)
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileExtracterIconX

;===============================================================================
;---Name        :    _FileXPHotFixInstallX()
;---Description :    Install XP HotFix And Check
;===============================================================================
Func _FileXPHotFixInstallX($FilePath, $Switchs = "", $CheckStr = "")
    If FileExists($FilePath) Then
        Local $ReadReg = RegRead("HKLM\Software\Microsoft\Windows NT\CurrentVersion\Hotfix", $CheckStr)
        If $ReadReg = -1 Then
            Run($FilePath & " " & $Switchs)
            If @error Then Return 0
        Else
            ;Have Install
            Return 1
        EndIf
    Else
        Return 0
    EndIf
EndFunc  ;==>_FileXPHotFixInstallX

;===============================================================================
;---Name        :    _FileWriteIniX()
;---Description :    Write Ini File
;===============================================================================
Func _FileWriteIniX($FileName, $Section = "", $Key = "", $Value = "")
    IniWrite($FileName, $Section, $Key, $Value)
    If @error Then Return 0
EndFunc  ;==>_FileWriteIniX()

;===============================================================================
;---Name        :    _FileGetTempFile()
;---Description :    Get Windows Temp File
;===============================================================================
Func _FileGetTempFile($WinTitle, $SavePath = "")
    If WinExists($WinTitle) Then
        Local $GetWinProcessPID = WinGetProcess($WinTitle)
        If ($WinTitle="") Then Return 0
    Else
        Return 0
    EndIf
    Local $GetTempFileTruePath = _ProcessGetLocation($GetWinProcessPID)
    If @error Then Return 0
    Local $TempDir = _SpiltFilePathNoName($GetTempFileTruePath)
    If @error Then Return 0
    If $SavePath = "" Then
        Local $GetFileSavePath = @DesktopDir & "\Output"
    Else
        Local $GetFileSavePath = $SavePath
    EndIf
    DirCopy($TempDir, $GetFileSavePath, 1)
    If @error Then Return 0
EndFunc  ;==>_FileGetTempFile

;===============================================================================
;---Name        :    _FileGetProceFile()
;---Description :    Get Process File
;===============================================================================
Func _FileGetProceFile($ProcName, $SavePath = "")
    Local $GetProcFileTruePath = _ProcessGetLocation($ProcName)
    If @error Then Return 0
    If $SavePath = "" Then
        Local $GetFileSavePath = @DesktopDir & "\Output\"
    Else
        Local $GetFileSavePath = $SavePath
    EndIf
    FileCopy($GetProcFileTruePath, $GetFileSavePath, 9)
    If @error Then Return 0
EndFunc  ;==>_FileGetProceFile

;===============================================================================
;---Name        :    _FileDownload()
;---Description :    Download File By Http (NoGui = 0, Gui = 1)
;===============================================================================
Func _FileDownload($Url, $SavePath, $Gui = 0, $TitleX = "RcToolsX") 
    Switch $Gui
        Case 0
            Local $hDownload = InetGet($Url, $SavePath, 0, 0)
			InetClose($hDownload)
        Case 1
            Local $hDownload = InetGet($Url, $SavePath, 0, 1)
            While InetGetInfo($hDownload, 2)
                ToolTip("Download File : " & InetGetInfo($hDownload, 1) & " Byte", @DesktopWidth - 220, @DesktopHeight - 100, $TitleX, 1)
                Sleep(100)
            Wend
			InetClose($hDownload)
        Case Else
            Return 0
    EndSwitch
EndFunc  ;==>_FileDownload

;===============================================================================
;---Name        :    _RegAddAssocX()
;---Description :    Add File Assoc to Reg  
;===============================================================================
Func _FileAddAssocX($FileSec, $FileExt, $FilePath, $IconPath = "", $IconType = 0)
    Local $ReadBack 
    If $IconPath = "" Then  
        $IconPath = $FilePath
        $IconType = 0
    EndIf
    $ReadBack = RegRead("HKEY_CLASSES_ROOT\" & $FileExt, "")
    If Not @error Then
        RegWrite("HKEY_CLASSES_ROOT\" & $FileExt, "Backup", "REG_SZ", $ReadBack)
    EndIf
    RegWrite("HKEY_CLASSES_ROOT\" & $FileExt, "", "REG_SZ", $FileSec)
    RegWrite("HKEY_CLASSES_ROOT\" & $FileSec & "\DefaultIcon", "", "REG_SZ", '"' & $IconPath & "," & $IconType & '"')
    RegWrite("HKEY_CLASSES_ROOT\" & $FileSec & "\shell", "", "REG_SZ", "open")
    RegWrite("HKEY_CLASSES_ROOT\" & $FileSec & "\shell\open\command", "", "REG_SZ", '"' & $FilePath & '"' & " " & '"' & "%1" & '"')

EndFunc  ;==>_RegAddAssoc

;===============================================================================
;---Name        :    _RegUnAssocX()
;---Description :    Add File Assoc to Reg (NoBack = 0 ,$Back = 1)   
;===============================================================================
Func _FileUnAssocX($FileSec, $FileExt)
    Local $ReadBack 
    $ReadBack = RegRead("HKEY_CLASSES_ROOT\" & $FileExt & "Backup", "")
    If Not @error Then
        RegWrite("HKEY_CLASSES_ROOT\" & $FileExt, "", "REG_SZ", $ReadBack)
    Else
        RegDelete("HKEY_CLASSES_ROOT\" & $FileExt) 
    EndIf

    RegDelete("HKEY_CLASSES_ROOT\" & $FileSec)      
EndFunc  ;==>_RegUnAssocX
