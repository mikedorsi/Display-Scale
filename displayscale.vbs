Set WshShell = CreateObject("WScript.Shell") 
  WshShell.CurrentDirectory = ("C:\**ENTER_YOUR_PATH_HERE**\Display Scale")
  WshShell.Run chr(34) & "displayscale.bat" & Chr(34), 0
Set WshShell = Nothing