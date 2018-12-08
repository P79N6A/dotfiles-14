;******************************************************************************
; 
; This AutoHotkey script defines a Windows keyboard shortcut for the Any
; Preset > Presets command.  To enable the shortcut:
; 
; 1.  Download and install AutoHotkey (free).
; 
; 2. In Windows File Explorer, navigate to "anypreset.lrplugin" (the folder
;    containing this file).
; 
; 3. Double-click the file "Install-Keyboard-Shortcut.bat", which will copy
;    this file to your Startup folder.
; 
; 4. Restart your computer.
; 
; If you edit this file to change the shortcut, you'll need to repeat
; steps 3 and 4.
; 
; You may use any key combination for the shortcut, but beware that some are
; already appropriated by Windows and Lightroom.  Try the shortcut first to
; see if it already has a use.
; 
; To change the shortcut, change "!a" below to whatever you want, using this
; syntax:
; 
; 	<1 or more modifiers><letter, digit, or punctuation>
; 
; where a modifier is one of:
; 
; 	^ 	Control
; 	!	Alt
; 	+	Shift
; 	#	Windows Logo 
; 
; For example, !a is ALT+A, and ^+3 is CTRL+SHIFT+3.  See the AutoHotKey
; documentation for the complete syntax of defining key combinations.
; 
;******************************************************************************

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;******************************************************************************
;
; CHANGE THE KEY COMBINATION BELOW
;
; Change !c below to some other key combination. Be sure to end the line
; with "::".

!c::
SetTitleMatchMode, 2 ; Substring match
WinMenuSelectItem, Lightroom,, File, Plug-in Extras, ` ` ` Presets
Return