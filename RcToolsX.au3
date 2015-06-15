; Code by Rchockxm (rchockxm.silver@gmail.com)

#NoTrayIcon
#RequireAdmin
#pragma compile(Out, RcToolsX.exe)
#pragma compile(ExecLevel, highestavailable)
#pragma compile(Compatibility, win7)
#pragma compile(UPX, False)
#pragma compile(FileDescription, RcToolsX)
#pragma compile(ProductName, RcToolsX)
#pragma compile(ProductVersion, 1.3)
#pragma compile(FileVersion, 1.3.0.0, 1.3.0.0)
#pragma compile(LegalCopyright, Silence Unlimited, Inc)
#pragma compile(LegalTrademarks, '')
#pragma compile(CompanyName, 'Silence Unlimited, Inc')

#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Version=beta
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=n
#AutoIt3Wrapper_Res_Comment=Rchockxm RcToolsX 1.3 (Build 100208)
#AutoIt3Wrapper_Res_Description=Silence Unlimited
#AutoIt3Wrapper_Res_Fileversion=1.3.0.0
#AutoIt3Wrapper_Res_LegalCopyright=Rchockxm
#AutoIt3Wrapper_Res_Language=1028
#AutoIt3Wrapper_Res_Field=OriginalFilename|RcToolsX
#AutoIt3Wrapper_Res_Field=ProductName|RcToolsX
#AutoIt3Wrapper_Res_Field=ProductVersion|1.3.0.0
#AutoIt3Wrapper_Res_Field=Web Site|http://rchockxm.com/
#AutoIt3Wrapper_Res_Field=E-Mail|Rchockxm.silver@gmail.com
#AutoIt3Wrapper_Res_Field=Support|Windows 2K/2K3/XP/Vista/7
#AutoIt3Wrapper_Res_Field=Extra AddIn|7z.exe or 7zr.exe
#Obfuscator_Parameters=/cs=1 /cn=1 /cf=1 /cv=1 /sf=1 /sv=1
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****

;=======================================================================
;---Rchockxm ToolsX 1.3.0.0 (Compiler AutoIt v3.4.0.0)------------------
;=======================================================================

#include <Array.au3>
#include <File.au3>
#include <Process.au3>

;-------------------------------------------------
;---Include User Define---------------------------
;-------------------------------------------------

#include "RcLibraryX\RcCommandX.au3"
#include "RcLibraryX\RcDesktop.au3"
#include "RcLibraryX\RcFile.au3"
#include "RcLibraryX\RcOther.au3"
#include "RcLibraryX\RcReg.au3"
#include "RcLibraryX\RcService.au3"
#include "RcLibraryX\RcSpecialText.au3"
#include "RcLibraryX\RcSystem.au3"
#include "RcLibraryX\RcWin.au3"

;-------------------------------------------------
;---Global User Var-------------------------------
;-------------------------------------------------

Opt("TrayIconHide", 1)
Opt("TrayAutoPause", 0)
Opt("WinTitleMatchMode", 2)

HotKeySet("{PAUSE}", "TogglePause")
HotKeySet("{ESC}", "Terminate")

Global $Paused

;=======================================================================
;---Check Operation System----------------------------------------------
;=======================================================================

If @OSType = "WIN32_WINDOWS" Then
    Exit
EndIf

AdlibRegister("_RedMem", 150)

Func _RedMem()
    _ReduceMemory(@AutoItPID)
EndFunc  ;==>_RedMem

;=======================================================================
;---Use Command Line Run------------------------------------------------
;=======================================================================

If $cmdline[0] >= 1 Then
  Global $Spiltcmd1, $Spiltcmd2, $Cmdnumber, $LowerCmd1
  Global $Tempcmd1="", $Tempcmd2="", $Tempcmd3="", $Tempcmd4="", $Tempcmd5="", $Tempcmd6="", $Tempcmd7=""

  _ReduceMemory(@AutoItPID)

  $Cmdnumber = $cmdline[0]
  Switch $Cmdnumber
      Case 1
          $Tempcmd1 = $cmdline[1]
      Case 2
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
      Case 3
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
          $Tempcmd3 = $cmdline[3]
      Case 4
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
          $Tempcmd3 = $cmdline[3]
          $Tempcmd4 = $cmdline[4]
      Case 5
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
          $Tempcmd3 = $cmdline[3]
          $Tempcmd4 = $cmdline[4]
          $Tempcmd5 = $cmdline[5]
      Case 6
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
          $Tempcmd3 = $cmdline[3]
          $Tempcmd4 = $cmdline[4]
          $Tempcmd5 = $cmdline[5]
          $Tempcmd6 = $cmdline[6]
      Case 7
          $Tempcmd1 = $cmdline[1]
          $Tempcmd2 = $cmdline[2]
          $Tempcmd3 = $cmdline[3]
          $Tempcmd4 = $cmdline[4]
          $Tempcmd5 = $cmdline[5]
          $Tempcmd6 = $cmdline[6]
          $Tempcmd6 = $cmdline[7]
      Case Else
          ;
  EndSwitch

  $LowerCmd1 = StringLower($Tempcmd1)
  $Spiltcmd1 = StringSplit($LowerCmd1, "::", 1)
  If Not (@error) Then
      Switch $Cmdnumber
          Case 1
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber)
          Case 2
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2)
          Case 3
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2, $Tempcmd3)
          Case 4
               _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2, $Tempcmd3, $Tempcmd4)
          Case 5
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5)
          Case 6
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5, $Tempcmd6)
          Case 7
              _RcToolsXCmdEnginee($Spiltcmd1[1], $Spiltcmd1[2], $Cmdnumber, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5, $Tempcmd6, $Tempcmd7)
          Case Else
              ;
      EndSwitch
  Else
      _ReadRciniScript($LowerCmd1)
  EndIf

  Exit
EndIf

;=======================================================================
;---Use Double-Click Run------------------------------------------------
;=======================================================================

If FileExists(@ScriptDir & "\RcToolsX.rcini") Then
    _ReadRciniScript(@ScriptDir & "\RcToolsX.rcini")
EndIf

Func _ReadRciniScript($ScriptPath)
  Dim $ReadRcFile, $Readline, $SpiltLine, $SpiltFunc, $LowerScFinc, $LineScNum
  Dim $RciniPath, $RciniCheck

  $RciniCheck = StringLower(StringRight($ScriptPath, 6))
  If $RciniCheck <> ".rcini" Then
      Return 0
  Else
      $RciniPath = _ChangeSysPathtoVar($ScriptPath)
  EndIf

  If Not FileExists($RciniPath) Then
      Return 0
  EndIf

  $ReadRcFile = FileOpen($RciniPath, 0)
  If $ReadRcFile = -1 Then
      Return 0
  EndIf

  While 1
    $Readline = FileReadLine($ReadRcFile)
    If @error = -1 Then ExitLoop

    $SpiltLine = StringSplit($Readline, ",", 1)
    If Not @error Then
        $LineScNum = $SpiltLine[0]
    Else
        $LineScNum = 1
    EndIf

    $LowerScFinc = StringLower($SpiltLine[1])
    $SpiltFunc = StringSplit($LowerScFinc, "::", 1)
    If Not @error Then
        Switch $LineScNum
            Case 1
                $Tempcmd1 = $SpiltLine[1]
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum)
            Case 2
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2)
            Case 3
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                $Tempcmd3 = StringReplace($SpiltLine[3], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2, $Tempcmd3)
            Case 4
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                $Tempcmd3 = StringReplace($SpiltLine[3], '"', "", 2)
                $Tempcmd4 = StringReplace($SpiltLine[4], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2, $Tempcmd3, $Tempcmd4)
            Case 5
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                $Tempcmd3 = StringReplace($SpiltLine[3], '"', "", 2)
                $Tempcmd4 = StringReplace($SpiltLine[4], '"', "", 2)
                $Tempcmd5 = StringReplace($SpiltLine[5], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5)
            Case 6
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                $Tempcmd3 = StringReplace($SpiltLine[3], '"', "", 2)
                $Tempcmd4 = StringReplace($SpiltLine[4], '"', "", 2)
                $Tempcmd5 = StringReplace($SpiltLine[5], '"', "", 2)
                $Tempcmd6 = StringReplace($SpiltLine[6], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5, $Tempcmd6)
            Case 7
                $Tempcmd1 = $SpiltLine[1]
                $Tempcmd2 = StringReplace($SpiltLine[2], '"', "", 2)
                $Tempcmd3 = StringReplace($SpiltLine[3], '"', "", 2)
                $Tempcmd4 = StringReplace($SpiltLine[4], '"', "", 2)
                $Tempcmd5 = StringReplace($SpiltLine[5], '"', "", 2)
                $Tempcmd6 = StringReplace($SpiltLine[6], '"', "", 2)
                $Tempcmd7 = StringReplace($SpiltLine[7], '"', "", 2)
                _RcToolsXCmdEnginee($SpiltFunc[1], $SpiltFunc[2], $LineScNum, $Tempcmd2, $Tempcmd3, $Tempcmd4, $Tempcmd5, $Tempcmd6, $Tempcmd7)
            Case Else
                Return 0
        EndSwitch
    Else
        ContinueLoop
    EndIf
  Wend

  FileClose($ReadRcFile)
EndFunc  ;==>_ReadRciniScript

;=======================================================================
;---Command Check Enginee-----------------------------------------------
;=======================================================================

Func _RcToolsXCmdEnginee($RunFuncType, $RunFuncName, $CmdNum, $Cmd2 = "", $Cmd3 = "", $Cmd4 = "", $Cmd5 = "", $Cmd6 = "", $Cmd7 = "")
    Select
    ;#---/rc command line-----------------------------------------#
    Case $RunFuncType = "/rc" Or $RunFuncType = "rc"
        If $RunFuncName="compress" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 1 Then
                _RcCompressSFX()
            ElseIf $CmdNum = 2 Then
                _RcCompressSFX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "autorecord" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _RcAutoInstallModeX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "readscript" Then
            If $CmdNum = 1 Then
                _ReadRciniScript(@ScriptDir & "\RcToolsX.rcini")
            ElseIf $CmdNum = 2 Then
                _ReadRciniScript($Cmd2)
            EndIf
        ElseIf $RunFuncName = "selfdelete" Then
            If $CmdNum = 1 Then
                _RcSelfDeleteX(0)
            ElseIf $CmdNum = 2 Then
                _RcSelfDeleteX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "rctoolsxenv" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/enable" Then
                    _RcToolsXEnvX(1)
                ElseIf StringLower($Cmd2) = "/disable" Then
                    _RcToolsXEnvX(0)
                EndIf
            EndIf
        EndIf

    ;#---/file command line---------------------------------------#
    Case $RunFuncType = "/file" Or $RunFuncType = "file"
        If ($RunFuncName = "run") Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _FileRunX($TrueFilePath1, "", 0, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/hide" Then
                    _FileRunX($TrueFilePath1, "", 1, 0)
                Else
                    _FileRunX($TrueFilePath1, $Cmd3, 0, 0)
                EndIf
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/hide" Then
                    _FileRunX($TrueFilePath1, $Cmd3, 1, 0)
                Else
                    _FileRunX($TrueFilePath1, $Cmd3, 0, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "runwait" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _FileRunX($TrueFilePath1, "", 0, 1)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/hide" Then
                    _FileRunX($TrueFilePath1, "", 1, 1)
                Else
                    _FileRunX($TrueFilePath1, $Cmd3, 0, 1)
                EndIf
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/hide" Then
                    _FileRunX($TrueFilePath1, $Cmd3, 1, 1)
                Else
                    _FileRunX($TrueFilePath1, $Cmd3, 0, 1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "delete" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _FileDeleteX($TrueFilePath1, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/force" Then
                    _FileDeleteX($TrueFilePath1, 1)
                Else
                    _FileDeleteX($TrueFilePath1, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "delalldrivers" Then
            If $CmdNum = 2 Then
                _FileDeleteAllDriversX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/force" Then
                    _FileDeleteAllDriversX($Cmd2, 1)
                Else
                    _FileDeleteAllDriversX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "copy" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 3 Then
                _FileCopyX($TrueFilePath1, $TrueFilePath2)
            EndIf
        ElseIf $RunFuncName = "combine" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd3)
            Local $TrueFilePath3 = _ChangeSysPathtoVar($Cmd4)
            If $CmdNum = 4 Then
                _FileCombineX($TrueFilePath1, $TrueFilePath2, $TrueFilePath3)
            EndIf
        ElseIf $RunFuncName = "move" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 3 Then
                _FileMoveX($TrueFilePath1, $TrueFilePath2)
            EndIf
        ElseIf $RunFuncName = "rename" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 3 Then
                _FileReNameX($TrueFilePath1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "replace" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 3 Then
                _FileReplaceX($TrueFilePath1, $TrueFilePath2, "")
            ElseIf $CmdNum = 4 Then
                _FileReplaceX($TrueFilePath1, $TrueFilePath2, $Cmd4)
            EndIf
        ElseIf $RunFuncName = "setattrib" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 3 Then
                _FileSetattribX($TrueFilePath1, $Cmd3, 0)
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/sub" Then
                    _FileSetattribX($TrueFilePath1, $Cmd3, 1)
                Else
                    _FileSetattribX($TrueFilePath1, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "fontinstall" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 3 Then
                _FileFontInstallX($TrueFilePath1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "infinstall" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _FileInfInstallX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "extractfile" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 3 Then
                _FileExtracterZipX($TrueFilePath1, $TrueFilePath2, "*.*")
            ElseIf $CmdNum = 4 Then
                _FileExtracterZipX($TrueFilePath1, $TrueFilePath2, $Cmd4)
            EndIf
        ElseIf $RunFuncName = "extracticon" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd4)
            If $CmdNum = 4 Then
                _FileExtracterIconX($TrueFilePath1, $Cmd3, $TrueFilePath2)
            EndIf
        ElseIf $RunFuncName = "xphotfix" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _FileXPHotFixInstallX($TrueFilePath1, "", "")
            ElseIf $CmdNum = 3 Then
                _FileXPHotFixInstallX($TrueFilePath1, $Cmd3, "")
            ElseIf $CmdNum = 4 Then
                _FileXPHotFixInstallX($TrueFilePath1, $Cmd3, $Cmd4)
            EndIf
        ElseIf $RunFuncName = "writeini" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 5 Then
                _FileWriteIniX($TrueFilePath1, $Cmd3, $Cmd4, $Cmd5)
            EndIf
        ElseIf $RunFuncName = "tempfile" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 2 Then
                _FileGetTempFile($Cmd2, "")
            ElseIf $CmdNum = 3 Then
                _FileGetTempFile($Cmd2, $TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "procfile" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 2 Then
                _FileGetProceFile($Cmd2, "")
            ElseIf $CmdNum = 3 Then
                _FileGetProceFile($Cmd2, $TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "download" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 3 Then
                _FileDownload($Cmd2, $TrueFilePath1, 0, "RcToolsX")
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/gui" Then
                    _FileDownload($Cmd2, $TrueFilePath1, 1, "RcToolsX")
                Else
                    _FileDownload($Cmd2, $TrueFilePath1, 0, "RcToolsX")
                EndIf
            ElseIf $CmdNum = 5 Then
                If StringLower($Cmd4) = "/gui" Then
                    _FileDownload($Cmd2, $TrueFilePath1, 1, $Cmd5)
                Else
                    _FileDownload($Cmd2, $TrueFilePath1, 0, $Cmd5)
                EndIf
            EndIf
        ElseIf $RunFuncName = "assoc" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd4)
            Local $TrueFilePath2 = _ChangeSysPathtoVar($Cmd5)
            If $CmdNum = 4 Then
                _FileAddAssocX($Cmd2, $Cmd3, $TrueFilePath1, "", 0)
            ElseIf $CmdNum = 5 Then
                _FileAddAssocX($Cmd2, $Cmd3, $TrueFilePath1, $TrueFilePath2, 0)
            ElseIf $CmdNum = 6 Then
                _FileAddAssocX($Cmd2, $Cmd3, $TrueFilePath1, $TrueFilePath2, $Cmd6)
            EndIf
        ElseIf $RunFuncName = "unassoc" Then
            If $CmdNum = 3 Then
                _FileUnAssocX($Cmd2, $Cmd3)
            EndIf
        EndIf

    ;#---/reg command line----------------------------------------#
    Case $RunFuncType = "/reg" Or $RunFuncType = "reg"
        If $RunFuncName = "import" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _RegImportRegX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "addrun" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _RegAddRunX($TrueFilePath1, "", 0)
            ElseIf $CmdNum = 3 Then
                _RegAddRunX($TrueFilePath1, $Cmd3, 0)
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "hklm" Then
                    _RegAddRunX($TrueFilePath1, $Cmd3, 0)
                ElseIf (StringLower($Cmd4) = "hkcu") Then
                    _RegAddRunX($TrueFilePath1, $Cmd3, 1)
                Else
                     _RegAddRunX($TrueFilePath1, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "delrun" Then
            If $CmdNum = 2 Then
                _RegDelRunX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "hklm" Then
                    _RegDelRunX($Cmd2, 0)
                ElseIf StringLower($Cmd3) = "hkcu" Then
                    _RegDelRunX($Cmd2, 0)
                Else
                    _RegDelRunX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "setvalue" Then
            If $CmdNum = 4 Then
                _RegSetValueX($Cmd2, $Cmd3, $Cmd4, "REG_SZ")
            ElseIf ($CmdNum = 5) Then
                _RegSetValueX($Cmd2, $Cmd3, $Cmd4, $Cmd5)
            EndIf
        ElseIf $RunFuncName = "delvalue" Then
            If $CmdNum = 3 Then
                _RegDelValueX($Cmd2, $Cmd3)
            EndIf
        EndIf

    ;#---/win command line----------------------------------------#
    Case $RunFuncType = "/win" Or $RunFuncType = "win"
        If $RunFuncName = "winclose" Then
            If $CmdNum = 2 Then
                _WinCloseWinX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                _WinCloseWinX($Cmd2, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "winclosef" Then
            If $CmdNum = 2 Then
                _WinCloseWinByFX($Cmd2, 0, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/all" Then
                    _WinCloseWinByFX($Cmd2, $Cmd3, 1)
                Else
                    _WinCloseWinByFX($Cmd2, $Cmd3, 0)
                EndIf
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/all" Then
                    _WinCloseWinByFX($Cmd2, $Cmd3, 1)
                Else
                    _WinCloseWinByFX($Cmd2, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "move" Then
            If $CmdNum = 3 Then
                _WinMoveWinX($Cmd2, $Cmd3, "", 1)
            ElseIf $CmdNum = 4 Then
                _WinMoveWinX($Cmd2, $Cmd3, $Cmd4, 1)
            ElseIf $CmdNum = 5 Then
                _WinMoveWinX($Cmd2, $Cmd3, $Cmd4, $Cmd5)
            EndIf
        ElseIf $RunFuncName = "settop" Then
            If $CmdNum = 3 Then
                If StringLower($Cmd3) = "/top" Then
                    _WinSetTopX($Cmd2, 1)
                ElseIf StringLower($Cmd3) = "/top" Then
                    _WinSetTopX($Cmd2, 0)
                Else
                    _WinSetTopX($Cmd2, 1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "settitle" Then
            If $CmdNum = 3 Then
                _WinSetTitleX($Cmd2, $Cmd3, 0)
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/random" Then
                    _WinSetTitleX($Cmd2, $Cmd3, 1)
                Else
                    _WinSetTitleX($Cmd2, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf ($RunFuncName = "settran") Then
            If ($CmdNum = 3) Then
                _WinSetTranX($Cmd2, $Cmd3, 0)
            ElseIf ($CmdNum = 4) Then
                If (StringLower($Cmd4) = "/all") Then
                    _WinSetTranX($Cmd2, $Cmd3, 1)
                Else
                    _WinSetTranX($Cmd2, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "hide" Then
            If $CmdNum = 2 Then
                _WinSetHideX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/all" Then
                    _WinSetHideX($Cmd2, 1)
                Else
                    _WinSetHideX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "show" Then
            If $CmdNum = 2 Then
                _WinSetShowX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/all" Then
                    _WinSetShowX($Cmd2, 1)
                Else
                    _WinSetShowX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "fad" Then
            If $CmdNum = 2 Then
                _WinSetFadWinX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/fadin" Then
                    _WinSetFadWinX($Cmd2, 0)
                ElseIf StringLower($Cmd3) = "/fadout" Then
                    _WinSetFadWinX($Cmd2, 1)
                Else
                    _WinSetFadWinX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "max" Then
            If $CmdNum = 2 Then
                _WinSetMinWinX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/fad" Then
                    _WinSetMinWinX($Cmd2, 1)
                Else
                    _WinSetMinWinX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "min" Then
            If $CmdNum = 2 Then
                _WinSetMinWinX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/fad" Then
                    _WinSetMinWinX($Cmd2, 1)
                Else
                    _WinSetMinWinX($Cmd2, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "winclick" Then
            If $CmdNum = 4 Then
                _WinControlClickX($Cmd2, $Cmd3, $Cmd4, "")
            ElseIf $CmdNum = 5 Then
                _WinControlClickX($Cmd2, $Cmd3, $Cmd4, $Cmd5)
            EndIf
        ElseIf $RunFuncName = "winsend" Then
            If $CmdNum = 5 Then
                _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "", 2)
            ElseIf $CmdNum = 6 Then
                If $Cmd6 = 1 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "", 1)
                ElseIf $Cmd6 = 2 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "", 2)
                ElseIf $Cmd6 = 3 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "", 3)
                Else
					_WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "", 3)
                EndIf
			ElseIf $CmdNum = 7 Then
                If $Cmd6 = 1 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, $Cmd7, 1)
                ElseIf $Cmd6 = 2 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, $Cmd7, 2)
                ElseIf $Cmd6 = 3 Then
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, $Cmd7, 3)
                Else
                    _WinControlSendX($Cmd2, $Cmd3, $Cmd4, $Cmd5, $Cmd7, 3)
                EndIf
            EndIf
        ElseIf $RunFuncName = "mouseclik" Then
            If $CmdNum = 5 Then
                _WinMouseClikX($Cmd2, $Cmd3, $Cmd4, $Cmd5, "")
			ElseIf $CmdNum = 6 Then
				_WinMouseClikX($Cmd2, $Cmd3, $Cmd4, $Cmd5, $Cmd6)
            EndIf
        EndIf

    ;#---/des command line----------------------------------------#
    Case $RunFuncType = "/des" Or $RunFuncType = "des"
        If $RunFuncName = "clean" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/all" Then
                    _DesCleanDesktopIconX(1)
                ElseIf StringLower($Cmd2) = "/user" Then
                    _DesCleanDesktopIconX(0)
                Else
                    _DesCleanDesktopIconX(1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "refresh" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/icon" Then
                    _DesRefreshIconX(1)
                ElseIf StringLower($Cmd2) = "/desktop" Then
                    _DesRefreshIconX(0)
                Else
                    _DesRefreshIconX(1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "wallpaper" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _DesWallpaperX($TrueFilePath1, 2)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/mode1" Then
                    _DesWallpaperX($TrueFilePath1, 1, 0)
                ElseIf StringLower($Cmd3) = "/mode2" Then
                    _DesWallpaperX($TrueFilePath1, 2, 0)
                ElseIf StringLower($Cmd3) = "/mode3" Then
                    _DesWallpaperX($TrueFilePath1, 3, 0)
                Else
                    _DesWallpaperX($TrueFilePath1, 1, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "addicon" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 3 Then
                _DesAddIconX($TrueFilePath1, $Cmd3, "", 0)
            ElseIf $CmdNum = 4 Then
                _DesAddIconX($TrueFilePath1, $Cmd3, $Cmd4, 0)
            ElseIf $CmdNum = 5 Then
                If StringLower($Cmd2) = "/all" Then
                    _DesAddIconX($TrueFilePath1, $Cmd3, $Cmd4, 1)
                ElseIf StringLower($Cmd2) = "/user" Then
                    _DesAddIconX($TrueFilePath1, $Cmd3, $Cmd4, 0)
                Else
                    _DesAddIconX($TrueFilePath1, $Cmd3, $Cmd4, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "delicon" Then
            If $CmdNum = 2 Then
                _DesDeleteIconX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/all" Then
                    _DesDeleteIconX($Cmd2, 1)
                ElseIf StringLower($Cmd3) = "/user" Then
                    _DesDeleteIconX($Cmd2, 0)
                Else
                    _DesDeleteIconX($Cmd2, 1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "changres" Then
            If $CmdNum = 3 Then
                _DesChangeResX($Cmd2, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "lock" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/desktop" Then
                    _DesLockDesktopX(1, 1)
                ElseIf StringLower($Cmd2) = "/startmen" Then
                    _DesLockDesktopX(1, 2)
                ElseIf StringLower($Cmd2) = "/taskbar" Then
                    _DesLockDesktopX(1, 3)
                ElseIf StringLower($Cmd2) = "/taskmsg" Then
                    _DesLockDesktopX(1, 4)
                EndIf
            EndIf
        ElseIf $RunFuncName = "unlock" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/desktop" Then
                    _DesLockDesktopX(2, 1)
                ElseIf StringLower($Cmd2) = "/startmen" Then
                    _DesLockDesktopX(2, 2)
                ElseIf StringLower($Cmd2) = "/taskbar" Then
                    _DesLockDesktopX(2, 3)
                ElseIf StringLower($Cmd2) = "/taskmsg" Then
                    _DesLockDesktopX(2, 4)
                EndIf
            EndIf
        ElseIf $RunFuncName = "hide" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/desktop" Then
                    _DesLockDesktopX(3, 1)
                ElseIf StringLower($Cmd2) = "/startmen" Then
                    _DesLockDesktopX(3, 2)
                ElseIf StringLower($Cmd2) = "/taskbar" Then
                    _DesLockDesktopX(3, 3)
                EndIf
            EndIf
        ElseIf $RunFuncName = "show" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/desktop" Then
                    _DesLockDesktopX(4, 1)
                ElseIf StringLower($Cmd2) = "/startmen" Then
                    _DesLockDesktopX(4, 2)
                ElseIf StringLower($Cmd2) = "/taskbar" Then
                    _DesLockDesktopX(4, 3)
                EndIf
            EndIf
        EndIf

    ;#---/sys command line----------------------------------------#
    Case $RunFuncType = "/sys" Or $RunFuncType = "sys"
        If $RunFuncName = "shutdown" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/reboot" Then
                    _SysShutdownGuiX(1, 0, 0)
                ElseIf StringLower($Cmd2) = "/shutdown" Then
                    _SysShutdownGuiX(2, 0, 0)
                ElseIf StringLower($Cmd2) = "/logoff" Then
                    _SysShutdownGuiX(3, 0, 0)
                EndIf
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd2) = "/reboot" Then
                    _SysShutdownGuiX(1, $Cmd3, 0)
                ElseIf StringLower($Cmd2) = "/shutdown" Then
                    _SysShutdownGuiX(2, $Cmd3, 0)
                ElseIf StringLower($Cmd2) = "/logoff" Then
                    _SysShutdownGuiX(3, $Cmd3, 0)
                EndIf
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd2) = "/reboot" Then
                    If StringLower($Cmd4) = "/gui" Then
                        _SysShutdownGuiX(1, $Cmd3, 1)
                    Else
                        _SysShutdownGuiX(1, $Cmd3, 0)
                    EndIf
                ElseIf StringLower($Cmd2) = "/shutdown" Then
                    If StringLower($Cmd4) = "/gui" Then
                        _SysShutdownGuiX(2, $Cmd3, 1)
                    Else
                        _SysShutdownGuiX(2, $Cmd3, 0)
                    EndIf
                ElseIf (StringLower($Cmd2) = "/logoff") Then
                    If (StringLower($Cmd4) = "/gui") Then
                        _SysShutdownGuiX(3, $Cmd3, 1)
                    Else
                        _SysShutdownGuiX(3, $Cmd3, 0)
                    EndIf
                EndIf
            EndIf
        ElseIf $RunFuncName = "cdout" Then
            If $CmdNum = 2 Then
                _SysCDTrayOutX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "sleep" Then
            If $CmdNum = 2 Then
                _SysSleepX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "sctheme" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/enable" Then
                    _SysThemeSCX(1)
                ElseIf StringLower($Cmd2) = "/disable" Then
                    _SysThemeSCX(0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "resmemory" Then
            If $CmdNum = 2 Then
                If StringLower($Cmd2) = "/all" Then
                    _SysRefeshMemoryX($Cmd2, 0)
                Else
                    _SysRefeshMemoryX($Cmd2, 1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "taskkill" Then
            If $CmdNum = 2 Then
                _SysTaskKillerX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "explorer" Then
            If $CmdNum = 1 Then
                _SysRestartExplorerX(0)
            ElseIf $CmdNum = 2 Then
                _SysRestartExplorerX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "open" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _SysShellOpenX($TrueFilePath1, "", 0)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/wait" Then
                    _SysShellOpenX($TrueFilePath1, $Cmd3, 1)
                Else
                    _SysShellOpenX($TrueFilePath1, $Cmd3, 0)
                EndIf
            ElseIf $CmdNum = 4 Then
                If StringLower($Cmd4) = "/wait" Then
                    _SysShellOpenX($TrueFilePath1, $Cmd3, 1)
                Else
                    _SysShellOpenX($TrueFilePath1, $Cmd3, 0)
                EndIf
            EndIf
        ElseIf $RunFuncName = "cmdx" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _SysCmdX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "rundos" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _SysRunDosX($TrueFilePath1)
            EndIf
        EndIf

    ;#---/sc command line-----------------------------------------#
    Case $RunFuncType = "/sc" Or $RunFuncType = "sc"
        If $RunFuncName = "start" Then
            If $CmdNum = 2 Then
                _ScStartX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "stop" Then
            If $CmdNum = 2 Then
                _ScStopX($Cmd2)
            EndIf
        ElseIf $RunFuncName = "create" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd4)
            If $CmdNum = 4 Then
                _ScCreateX($Cmd2, $Cmd3, $TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "delete" Then
            If $CmdNum = 2 Then
                _ScDeleteX($Cmd2)
            EndIf
        EndIf

    ;#---/spt command line----------------------------------------#
    Case $RunFuncType = "/spt" Or $RunFuncType = "spt"
        If $RunFuncName = "rtol" Then
            If $CmdNum = 2 Then
                _TextRighttoLeft($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextRighttoLeft($Cmd2, 30, 0, 255, -1, -1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "ltor" Then
            If $CmdNum = 2 Then
                _TextLefttoRight($Cmd2)
            ElseIf ($CmdNum = 3) Then
                _TextLefttoRight($Cmd2, 30, 0, 255, -1, -1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "center" Then
            If $CmdNum = 2 Then
                _TextCentertoOut($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextCentertoOut($Cmd2, 30, 0, 255, -1, -1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "runrtol" Then
            If $CmdNum = 2 Then
                _TextRunRighttoLeft($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextRunRighttoLeft($Cmd2, 30, 0, 255, "", "", $Cmd3)
            EndIf
        ElseIf $RunFuncName = "runonefade" Then
            If $CmdNum = 2 Then
                _TextLastOneFade($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextLastOneFade($Cmd2, 30, 0, 255, 20, "", $Cmd3)
            EndIf
        ElseIf $RunFuncName = "runone" Then
            If $CmdNum = 2 Then
                _TextOneFade($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextOneFade($Cmd2, 150, 0, 255, -1, -1, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "runline" Then
            If $CmdNum = 2 Then
                _TextShowByLine($Cmd2)
            ElseIf $CmdNum = 3 Then
                _TextShowByLine($Cmd2, 30, 0, 255, 400, 100, $Cmd3)
            EndIf
        EndIf

    ;#---/exf command line----------------------------------------#
    Case $RunFuncType = "/exf" Or $RunFuncType = "exf"
        If $RunFuncName = "playmusic" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _OthPlayMusicX($TrueFilePath1, 1)
            ElseIf $CmdNum = 3 Then
                If StringLower($Cmd3) = "/nowait" Then
                    _OthPlayMusicX($TrueFilePath1, 0)
                Else
                    _OthPlayMusicX($TrueFilePath1, 1)
                EndIf
            EndIf
        ElseIf $RunFuncName = "beep" Then
            If $CmdNum = 2 Then
                _OthBeepX($Cmd2, 0)
            ElseIf $CmdNum = 3 Then
                _OthBeepX($Cmd2, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "capture" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd2)
            If $CmdNum = 2 Then
                _OthCaptureX($TrueFilePath1)
            EndIf
        ElseIf $RunFuncName = "sayen" Then
            Local $TrueFilePath1 = _ChangeSysPathtoVar($Cmd3)
            If $CmdNum = 2 Then
                _OthSayEnglishX($Cmd2, "", 0)
            ElseIf $CmdNum = 3 Then
                _OthSayEnglishX($Cmd2, $TrueFilePath1, 1)
            EndIf
        ElseIf $RunFuncName = "info" Then
            If $CmdNum = 2 Then
                _OthInfoX($Cmd2, "", "", "", 0)
            ElseIf $CmdNum = 3 Then
                _OthInfoX($Cmd2, $Cmd3, "", "", 0)
            ElseIf $CmdNum = 4 Then
                _OthInfoX($Cmd2, $Cmd3, $Cmd4, "", 0)
            ElseIf $CmdNum = 5 Then
                _OthInfoX($Cmd2, $Cmd3, $Cmd4,  $Cmd5, 0)
            ElseIf $CmdNum = 6 Then
                _OthInfoX($Cmd2, $Cmd3, $Cmd4,  $Cmd5, $Cmd6)
            EndIf
        ElseIf $RunFuncName = "infox" Then
            If $CmdNum = 2 Then
                _OthInfoScrollX($Cmd2, "", "", "", 0, 8)
            ElseIf $CmdNum = 3 Then
                _OthInfoScrollX($Cmd2, $Cmd3, "", "", 0, 8)
            ElseIf $CmdNum = 4 Then
                _OthInfoScrollX($Cmd2, $Cmd3, $Cmd4, "", 0, 8)
            ElseIf $CmdNum = 5 Then
                _OthInfoScrollX($Cmd2, $Cmd3, $Cmd4,  $Cmd5, 0, 8)
            ElseIf $CmdNum = 6 Then
                _OthInfoScrollX($Cmd2, $Cmd3, $Cmd4,  $Cmd5, $Cmd6, 8)
            EndIf
        ElseIf $RunFuncName = "popinfo" Then
            If $CmdNum = 2 Then
                _OthPoPInfoMessageX($Cmd2, 5)
            ElseIf $CmdNum = 3 Then
                _OthPoPInfoMessageX($Cmd2, $Cmd3)
            EndIf
        ElseIf $RunFuncName = "msgbox" Then
            If $CmdNum = 2 Then
                _OthMsgBoxX($Cmd2, "", 30, 10)
            ElseIf $CmdNum = 3 Then
                _OthMsgBoxX($Cmd2, $Cmd3, 30, 10)
            ElseIf $CmdNum = 4 Then
                _OthMsgBoxX($Cmd2, $Cmd3, $Cmd4, 10)
            ElseIf $CmdNum = 5 Then
                _OthMsgBoxX($Cmd2, $Cmd3, $Cmd4, $Cmd5)
            EndIf
        ElseIf $RunFuncName = "progbox" Then
            If $CmdNum = 1 Then
                _OthProgressBox(200, @DesktopWidth, @DesktopHeight, 160)
            ElseIf $CmdNum = 2 Then
                _OthProgressBox($Cmd2, @DesktopWidth, @DesktopHeight, 160)
            EndIf
        EndIf
    Case Else
        ;
    EndSelect
EndFunc  ;==>_RcToolsXCmdEnginee

;=======================================================================
;---Other RcToolsX Function----------------------------------------------
;=======================================================================

;-------------------------------------------------
;---Script HotKey Setting-------------------------
;-------------------------------------------------

Func TogglePause()
    $Paused = NOT $Paused
    While $Paused
        Sleep(100)
    WEnd
EndFunc  ;==>TogglePause

Func Terminate()
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\7zr.exe")
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\7zS.sfx")
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\Rc_Config.txt")
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\BG.jpg")
    FileDelete(@AppDataDir & "\Rchockxm\RcToolsX\Rcbin.dll")
    Exit
EndFunc  ;==>Terminate