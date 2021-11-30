@echo off


@REM ---- Please replace the path below with a path to your Anaconda directory in double-quotes ----
set anaconda="C:\Articulate_Instruments_Machine_Learning\Anaconda\2021.05"
@REM ------------------ (Please ensure it does NOT end with a backslash "\") -----------------------



setlocal enableextensions
echo:

@REM First, check where Anaconda is installed, and go to an error if none of the default locations contain an Anaconda install.

if exist %anaconda%\Scripts\activate.bat (
  goto Continue
)
if exist %USERPROFILE%\Anaconda3\Scripts\activate.bat (
  set anaconda=%USERPROFILE%\Anaconda3\
  goto Continue
)
if exist C:\ProgramData\Anaconda3\Scripts\activate.bat (
    set anaconda=C:\ProgramData\Anaconda3\
    goto Continue
)
goto ProcessError
:Continue
echo Please wait, this may take a few minutes...
echo:

@REM Second, open an Anaconda instance.

call %anaconda%\Scripts\activate.bat %anaconda%
for /f %%i in ('powershell -Command "(select-string -path '%~dp0Other_Files\official_environment.yml' -pattern 'name: (.*)').Matches.captures.groups[1].value"') do set envname=%%i
call conda activate %envname%


@REM Third, create the folder .\320x240 if it does not exist.

if not exist "%~dp0320x240" (
  mkdir "%~dp0320x240"
)

@REM Finally, iterate over all run arguments for this script and call ffmpeg on each one.

for %%x in (%*) do (
  @REM for %%F in ("%%x") do call ffmpeg -i "%%x" -c:v libx264 -qp 0 "%~dp0320x240\%%~nxF"
  for %%F in (%%x) do call ffmpeg -i %%x -filter:v scale=-1:240 -c:v libx264 -qp 0 "%~dp0320x240\%%~nxF"
)

exit /b 0

@REM (Below is the error shown if the Anaconda directory can't be found.)

:ProcessError
echo:
echo  It seems you have installed Anaconda in a non-default directory, or this script can't access your Anaconda install.
echo  Please edit this Convert_Video_to_320x240.bat file (by right-clicking it and selecting Edit)
echo  and replace the path at the top of the file with a path to your Anaconda directory.
echo:
pause
exit /b 1