#include-once
#Include <GDIPlus.au3>

;-------------------------------------------------------------------------------------------------------Desktop Rc Libery
;===============================================================================
;---Name        :    _DesCleanDesktopIconX()
;---Description :    Clean All Desktop Icon  (All User = 1, Cur User = 0)
;===============================================================================
Func _DesCleanDesktopIconX($Flag = 0)
    Switch $Flag
        Case 0
            If FileExists(@DesktopDir & "\*.lnk") Then
                FileDelete(@DesktopDir & "\*.lnk")
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case 1
            If FileExists(@DesktopCommonDir & "\*.lnk") Then
                FileDelete(@DesktopCommonDir & "\*.lnk")
                If @error Then Return 0
            Else
                Return 0
            EndIf
        Case Else
            Return 0  
    EndSwitch
EndFunc  ;==>_DesCleanDesktopIconX

;===============================================================================
;---Name        :    _DesRefreshIconX()
;---Description :    Refresh Desktop Icon Or All Desktop (Icon = 1, Desktop = 0)
;===============================================================================
Func _DesRefreshIconX($Flag = 0)
    Switch $Flag
        Case 0
            RunWait(@ComSpec & " /c " & 'RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters', "", @SW_HIDE)
            If @error Then Return 0
        Case 1
            DllCall("shell32.dll", "none", "SHChangeNotify", "long", 0x8000000, "int", 0, "ptr", 0, "ptr", 0)
            If @error Then Return 0 
        Case Else
            Return 0  
    EndSwitch
EndFunc  ;==>_DesRefreshIconX

;===============================================================================
;---Name        :    _DesWallpaperX()
;---Description :    Set Wallpaper  (Supper JPG File) 
;===============================================================================
Func _DesWallpaperX($pic, $style = 2, $warn = 1)
    Local $m1, $m2
    If $warn = 1 then
        $m1 = @DesktopHeight / 2
        $m2 = @DeskTopWidth / 2
    EndIf
    If Not FileExists($pic) Then Return -1
   
    Local $s, $bmp
    $s = StringSplit($pic, ".", 1)
    If $s[2] = "bmp" Then
        $bmp = "true"
    Else
        $bmp = "false"
    EndIf
 
    Local $text, $hImage, $sCLSID
    If @OSVersion <> "WIN_VISTA" Or @OSVersion <> "WIN_2008" Then 
        ;
    Else
        If ($bmp = "false") Then
            $text = StringReplace($pic, ".jpg", ".bmp")
                _GDIPlus_Startup()
            $hImage = _GDIPlus_ImageLoadFromFile($pic)
            $sCLSID = _GDIPlus_EncodersGetCLSID("BMP")
                _GDIPlus_ImageSaveToFileEx($hImage, $text, $sCLSID)
                _GDIPlus_ShutDown()
            $pic = $text
        EndIf
    EndIf

    Local $SPI_SETDESKWALLPAPER = 20
    Local $SPIF_UPDATEINIFILE = 1
    Local $SPIF_SENDCHANGE = 2
    Local $REG_DESKTOP = "HKEY_CURRENT_USER\\Control Panel\\Desktop"

    Switch $style
        Case 1
            RegWrite($REG_DESKTOP, "TileWallPaper", "REG_SZ", 1)
            RegWrite($REG_DESKTOP, "WallpaperStyle", "REG_SZ", 0)
        Case 2
           RegWrite($REG_DESKTOP, "TileWallPaper", "REG_SZ", 0)
           RegWrite($REG_DESKTOP, "WallpaperStyle", "REG_SZ", 0)
        Case 3
           RegWrite($REG_DESKTOP, "TileWallPaper", "REG_SZ", 0)
           RegWrite($REG_DESKTOP, "WallpaperStyle", "REG_SZ", 2)
        Case Else
           Return 0  
    EndSwitch

    RegWrite($REG_DESKTOP, "Wallpaper", "reg_sz", $pic) 
    DllCall("user32.dll", "int", "SystemParametersInfo", "int", $SPI_SETDESKWALLPAPER, "int", 0, "str", $pic, "int", BitOR($SPIF_UPDATEINIFILE, $SPIF_SENDCHANGE))    
    If @error Then Return 0

    If $warn = 1 Then
       Sleep(1000)
    EndIf
EndFunc  ;==>_DesWallpaperX

;===============================================================================
;---Name        :    _DesAddIconX()
;---Description :    Add Icon To Desktop  (All User = 1, Cur User = 0)
;===============================================================================
Func _DesAddIconX($FilePath, $FileName, $ScrName = "", $Flag = 0)
    Switch $Flag
        Case 0
            FileCreateShortcut($FilePath, @DesktopCommonDir & "\" & $FileName, "", "", $ScrName, $FilePath, "", "0", @SW_SHOWNORMAL)
            If @error Then Return 0
        Case 1
            FileCreateShortcut($FilePath, @DesktopDir & "\" & $FileName, "", "", $ScrName, $FilePath, "", "0", @SW_SHOWNORMAL)
            If @error Then Return 0
        Case Else
            Return 0  
    EndSwitch
EndFunc  ;==>_DesAddIconX

;===============================================================================
;---Name        :    _DesDeleteIconX()
;---Description :    Delete Icon To Desktop  (All User = 1, Cur User = 0)
;===============================================================================
Func _DesDeleteIconX($FileName, $Flag = 0)
    Switch $Flag
        Case 0
            If FileExists(@DesktopCommonDir & "\" & $FileName) Then
                  FileDelete(@DesktopCommonDir & "\" & $FileName)
                  If @error Then Return 0
            Else  
                Return 0
            EndIf
        Case 1
            If FileExists(@DesktopDir & "\" & $FileName) Then
                  FileDelete(@DesktopDir & "\" & $FileName)
                  If @error Then Return 0
            Else  
                Return 0
            EndIf
        Case Else
            Return 0  
    EndSwitch
EndFunc  ;==>_DesDeleteIconX()

;===============================================================================
;---Name        :    _DesChangeResX()
;---Description :    Change Desktop Res
;===============================================================================
Func _DesChangeResX($i_Width = @DesktopWidth, $i_Height = @DesktopHeight, $i_BitsPP = @DesktopDepth, $i_RefreshRate = @DesktopRefresh)
    Local Const $DM_PELSWIDTH = 0x00080000
    Local Const $DM_PELSHEIGHT = 0x00100000
    Local Const $DM_BITSPERPEL = 0x00040000
    Local Const $DM_DISPLAYFREQUENCY = 0x00400000
    Local Const $CDS_TEST = 0x00000002
    Local Const $CDS_UPDATEREGISTRY = 0x00000001
    Local Const $DISP_CHANGE_RESTART = 1
    Local Const $DISP_CHANGE_SUCCESSFUL = 0
    Local Const $HWND_BROADCAST = 0xffff
    Local Const $WM_DISPLAYCHANGE = 0x007E

    If $i_Width = "" Or $i_Width = -1 Then $i_Width = @DesktopWidth ; default to current setting
    If $i_Height = "" Or $i_Height = -1 Then $i_Height = @DesktopHeight ; default to current setting
    If $i_BitsPP = "" Or $i_BitsPP = -1 Then $i_BitsPP = @DesktopDepth ; default to current setting
    If $i_RefreshRate = "" Or $i_RefreshRate = -1 Then $i_RefreshRate = @DesktopRefresh ; default to current setting

    Local $DEVMODE = DllStructCreate("byte[32];int[10];byte[32];int[6]")
    Local $B = DllCall("user32.dll", "int", "EnumDisplaySettings", "ptr", 0, "long", 0, "ptr", DllStructGetPtr($DEVMODE))
    If @error Then
        $B = 0
        SetError(1)
        Return $B
    Else
        $B = $B[0]
    EndIf

    If $B <> 0 Then
        DllStructSetData($DEVMODE, 2, BitOR($DM_PELSWIDTH, $DM_PELSHEIGHT, $DM_BITSPERPEL, $DM_DISPLAYFREQUENCY), 5)
        DllStructSetData($DEVMODE, 4, $i_Width, 2)
        DllStructSetData($DEVMODE, 4, $i_Height, 3)
        DllStructSetData($DEVMODE, 4, $i_BitsPP, 1)
        DllStructSetData($DEVMODE, 4, $i_RefreshRate, 5)
        $B = DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_TEST)
        If @error Then
            $B = -1
        Else
            $B = $B[0]
        EndIf

        Select
            Case $B = $DISP_CHANGE_RESTART
                $DEVMODE = ""
                Return 2
            Case $B = $DISP_CHANGE_SUCCESSFUL
                DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_UPDATEREGISTRY)
                DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_DISPLAYCHANGE, "int", $i_BitsPP, "int", $i_Height * 2 ^ 16 + $i_Width)
                $DEVMODE = ""
                Return 1
            Case Else
                $DEVMODE = ""
                SetError(1)
                Return $B
        EndSelect
    EndIf
EndFunc ;==>_DesChangeResX

;===============================================================================
;---Name        :    _DesLockDesktopX()
;---Description :    Lock/UnLock Desktop Function (Need Rcbin.dll)
;===============================================================================
Func _DesLockDesktopX($Flag, $Item)
    Local $RcBinDll = @AppDataDir & "\Rchockxm\RcToolsX\Rcbin.dll"
    DirCreate(@AppDataDir & "\Rchockxm\RcToolsX")
    FileInstall("Bin\Rcbin.dll", $RcBinDll, 1)
    If (@error) Then Return 0

    If FileExists($RcBinDll) Then
        Local $UseDllFile 
        $UseDllFile = DllOpen($RcBinDll)
        Switch $Flag    
            Case 1    ;Lock
                If $Item = 1 Then
                    DllCall($UseDllFile, "int", "Disable_Desktop")
                    If @error Then Return 0
                ElseIf ($Item = 2) Then
                    DllCall($UseDllFile, "int", "Disable_Start_Menu_Button")
                    If @error Then Return 0
                ElseIf ($Item = 3) Then
                    DllCall($UseDllFile, "int", "Disable_Taskbar")
                    If @error Then Return 0
                ElseIf ($Item = 4) Then
                    DllCall($UseDllFile, "int", "Disable_Task_Manager")
                    If @error Then Return 0
                EndIf

            Case 2    ;UnLock
                If $Item = 1 Then
                    DllCall($UseDllFile, "int", "Enable_Desktop")
                    If @error Then Return 0   
                ElseIf $Item = 2 Then
                    DllCall($UseDllFile, "int", "Enable_Start_Menu_Button")
                    If @error Then Return 0
                ElseIf $Item = 3 Then
                    DllCall($UseDllFile, "int", "Enable_Taskbar")
                    If @error Then Return 0
                ElseIf $Item = 4 Then
                    DllCall($UseDllFile, "int", "Enable_Task_Manager")
                    If @error Then Return 0
                EndIf

            Case 3    ;Hide
                If $Item = 1 Then
                    DllCall($UseDllFile, "int", "Hide_Desktop")
                    If @error Then Return 0   
                ElseIf $Item = 2 Then
                    DllCall($UseDllFile, "int", "Hide_Start_Menu_Button")
                    If @error Then Return 0
                ElseIf $Item = 3 Then
                    DllCall($UseDllFile, "int", "Hide_Taskbar")
                    If @error Then Return 0
                EndIf

            Case 4    ;Show
                If $Item = 1 Then
                    DllCall($UseDllFile, "int", "Show_Desktop")
                    If @error Then Return 0   
                ElseIf $Item = 2 Then
                    DllCall($UseDllFile, "int", "Show_Start_Menu_Button")
                    If @error Then Return 0
                ElseIf $Item = 3 Then
                    DllCall($UseDllFile, "int", "Show_Taskbar")
                    If @error Then Return 0
                EndIf

            Case Else
                ;  
        EndSwitch
        DllClose($UseDllFile)
        FileDelete($RcBinDll)
        If @error Then Return 0 
    Else
        Return 0
    EndIf
EndFunc ;==>_DesLockDesktopX