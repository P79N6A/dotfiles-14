@echo off 

rem This batch file installs the Windows Any Preset AutoHotkey keyboard
rem shortcut in the Startup folder, so it runs automatically after 
rem the user logs in.

copy /Y Keyboard-Shortcut.ahk "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

if not exist "%ProgramFiles%\AutoHotkey" (
	echo(     
	echo AutoHotkey may not be installed. It must installed for the keyboard
	echo shortcut to work.  See the Any Preset help for how to install it.
	echo(
	pause
) else (
    echo(
    echo You must restart your computer for the keyboard shortcut to take effect.
    echo(
    pause
)
