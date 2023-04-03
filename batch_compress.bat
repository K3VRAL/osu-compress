set target=%1
set target=%target:"=%
mkdir "osu-compressed"
for /f "usebackq delims=|" %%f in (`dir /b "%target%" ^| findstr /i ".osu"`) do .\osu-compress.exe "%target%\%%f" ".\osu-compressed\%%f"