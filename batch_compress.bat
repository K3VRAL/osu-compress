@echo off

set argc=0
for %%x in (%*) do Set /A argc+=1
if not %argc% == 1 goto error

if not exist ".\osu-compressed" mkdir "osu-compressed"

set target=%1
set target=%target:"=%
for /f "usebackq delims=|" %%f in (`dir /b "%target%" ^| findstr /i ".osu"`) do .\osu-compress.exe "%target%\%%f" ".\osu-compressed\%%f"
exit /b 0

:error
@echo ERROR: You did not supply the required number of arguments. Please input the path to your project. Make sure you have the project path be in "quotes" e.g. .\batch_compress.bat "...\osu!\Songs\ExampleProject"
exit /b 1
