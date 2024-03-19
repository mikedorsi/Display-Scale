@echo off
rem DisplayScale - Changes the Windows scaling (DPI) based on current resolution

rem DPI Scale Chart
rem Description DPI     Scale Factor    Hexadecimal
rem Small       96      100%            0x60
rem Medium      120     125%            0x78
rem Large       144     150%            0x90
rem Very Large  192     200%            0xc0    

rem Select you favorite display scales below using the hexadecimal options listed above
rem Favorite HD (1080p) scale
set defaultHD=100
set defaultHDHex=0x60

rem Favorite QHD (2K) scale
set defaultQHD=125
set defaultQHDHex=0x78

rem Favorite UHD (4K) scale
set defaultUHD=200
set defaultUHDHex=0xc0

rem Horizatonal Resolution Scale Chart
rem Abbreviation    Pixel Count
rem UHD             3840
rem QHD             2560
rem HD              1920

set uhdResolution=3840
set qhdResolution=2560
set hdResolution=1920

rem  Checks Windows Registry key for DPI (Display Scale) as a DWORD (Hexadecimal value)
set KEY_NAME="HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics"
set VALUE_NAME=AppliedDPI

for /f "tokens=3" %%a in ('reg query %KEY_NAME% /v %VALUE_NAME%  ^|findstr /ri "REG_DWORD"') do (
    set currentDPI=%%a
)

rem Utilzies the WMIC command for screenwidth to know your resolution
rem wmic desktopmonitor get screenwidth, screenheight
for /f "tokens=*" %%f in ('wmic desktopmonitor get screenwidth /value ^| find "="') do (
    set horizonalResolution=%%f>nul
)

rem removes unneccessary text from the WMIC command
set currentResolution=%horizonalResolution:~12%

rem Checks resolution and sets DPI accordingly
rem SetDpi.exe /[Display Number 1 - means Display1] /[Scaling %]
rem https://github.com/imniko/SetDPI
if %currentResolution% == %uhdResolution% (
    if not %currentDPI% == %defaultUHDHex% (
        start SetDpi.exe 1 %defaultUHD%
    ) else {
        goto :eof
    }
)

if %currentResolution% == %qhdResolution% (
    if not %currentDPI% == %defaultQHDHex% (
        start SetDpi.exe 1 %defaultQHD%
    ) else {
        goto :eof
    }
)

if %currentResolution% == %hdResolution% (
    if not %currentDPI% == %defaultHDHex% (
        start SetDpi.exe 1 %defaultHD%
    ) else {
        goto :eof
    }
)
