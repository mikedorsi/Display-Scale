Display Scale will auto change your Display Scale on startup based on the current resolution.

VBS script belongs in \AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup and will point to where you keep the .BAT script and SetDPI.exe.
Make sure to edit the .VBS to point to that folder.

In the .BAT you must enter the scale percentage and the related hexademical value for the native resolutions.

For example: If you want a display scale of 200% while your resolution is set to 4k use the values listed below:

Favorite UHD (4K) scale
defaultUHD=200
defaultUHDHex=0xc0

Script requires SetDPI.exe from https://github.com/imniko/SetDPI.
Just place SetDPI.exe in the same folder as the .bat file.