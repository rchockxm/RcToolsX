#include-once
#include "Include\ServiceControl.au3"

;-------------------------------------------------------------------------------------------------------Service Rc Libery
;===============================================================================
;---Name        :    _ScStartX()
;---Description :    Start Services  
;===============================================================================
Func _ScStartX($ScName)
    _StartService("", $ScName)  
    If @error Then Return 0 
EndFunc  ;==>_ScStartX

;===============================================================================
;---Name        :    _ScStopX()
;---Description :    Stop Services  
;===============================================================================
Func _ScStopX($ScName)
    _StopService("", $ScName)  
    If @error Then Return 0 
EndFunc  ;==>_ScStopX

;===============================================================================
;---Name        :    _ScCreateX()
;---Description :    Create Services  
;===============================================================================
Func _ScCreateX($ScName, $DisName, $Path)
    _CreateService("", $ScName, $DisName, $Path)
    If @error Then Return 0 
EndFunc  ;==>_ScCreateX

;===============================================================================
;---Name        :    _ScDeleteX()
;---Description :    Delete Services  
;===============================================================================
Func _ScDeleteX($ScName)
    _DeleteService("", $ScName)
    If @error Then Return 0 
EndFunc  ;==>_ScDeleteX



