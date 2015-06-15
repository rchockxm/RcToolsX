#include-once
#include "Include\RcLibraryX.au3"

;-------------------------------------------------------------------------------------------------------REG Rc Libery
;===============================================================================
;---Name        :    _RegImportRegX()
;---Description :    Silent Add Reg File To PC   
;===============================================================================
Func _RegImportRegX($RegFile)
    Local $ChkFileName = _CheckFileExtName($RegFile, "reg", 3)
    If $ChkFileName = 0 Then
        Return 0
    EndIf
    If FileExists($RegFile) Then
        RunWait(@ComSpec & " /c " & "regedit /s" & " " & $RegFile, "", @SW_HIDE)
        If @error Then Return 0
    Else
        Return 0
    EndIf
EndFunc  ;==>_RegImportRegX

;===============================================================================
;---Name        :    _RegAddRunX()
;---Description :    Add Item To Run (HKCU = 1, HKLM = 0)     
;===============================================================================
Func _RegAddRunX($FilePath, $ItemName = "", $Flag = 0)
    Switch $Flag
        Case 0
            RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $ItemName, "REG_SZ", $FilePath)  
        Case 1
            RegWrite("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $ItemName, "REG_SZ", $FilePath)        
        Case Else
            Return 0
    EndSwitch
    If @error Then Return 0
EndFunc  ;==>_RegAddRunX

;===============================================================================
;---Name        :    _RegDelRunX()
;---Description :    Del Item To Run (HKCU = 1, HKLM = 0)     
;===============================================================================
Func _RegDelRunX($ItemName, $Flag = 0)
    Switch $Flag
        Case 0
            RegDelete("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $ItemName)
        Case 1
            RegDelete("HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run", $ItemName)          
        Case Else
            ;
    EndSwitch
    If @error Then Return 0
EndFunc  ;==>_RegDelRunX

;===============================================================================
;---Name        :    _RegSetValueX()
;---Description :    Set Item To Reg
;===============================================================================
Func _RegSetValueX($RegName, $RegKey, $RegValue, $RegType = "REG_SZ")
    RegWrite($RegName, $RegKey, $RegType, $RegValue)
    If @error Then Return 0
EndFunc  ;==>_RegSetValueX

;===============================================================================
;---Name        :    _RegDelValueX()
;---Description :    Del Item To Reg
;===============================================================================
Func _RegDelValueX($RegName, $RegKey = "")
    If $RegKey = "" Then
        RegDelete($RegName)
    Else
        RegDelete($RegName, $RegKey)
    EndIf
    If @error Then Return 0
EndFunc  ;==>_RegDelValueX