@echo off


@REM ---- Please replace the path below with a path to your Anaconda directory in double-quotes ----
set anaconda="C:\Anaconda3"
@REM ------------------ (Please ensure it does NOT end with a backslash "\") -----------------------


@REM ---- If you wish to use your GPU for faster calcuations, you can find instructions here:
@REM ------ https://github.com/DeepLabCut/DeepLabCut/blob/master/docs/installation.md#gpu-support



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

@REM Third, download the conda environment .yaml file from the official DeepLabCut repository.

call powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/DeepLabCut/DeepLabCut/master/conda-environments/DEEPLABCUT.yaml', '%~dp0Other_Files\official_environment.yml')"

@REM Fourth, create an Anaconda environment from the downloaded .yaml file by passing it as an argument to an environment creation.

call conda env create -f "%~dp0Other_Files\official_environment.yml"
call conda env update -f "%~dp0Other_Files\official_environment.yml"

@REM Fifth, activate the installed environment. Its environment name is set from the "name" property inside the downloaded .yaml file.

for /f %%i in ('powershell -Command "(select-string -path '%~dp0Other_Files\official_environment.yml' -pattern 'name: (.*)').Matches.captures.groups[1].value"') do set envname=%%i
call conda activate %envname%

@REM Finally, inside the Anaconda environment instance, open up an ipython or wxpython instance and run the following commands:
@REM     import deeplabcut
@REM     deeplabcut.launch_dlc()

call ipython "%~dp0Other_Files\run_deepLabCut_part2.py"
exit /b 0

@REM (Below is the error shown if the Anaconda directory can't be found.)

:ProcessError
echo:
echo  It seems you have installed Anaconda in a non-default directory, or this script can't access your Anaconda install.
echo  Please edit this Run_DeepLabCut.bat file (by right-clicking it and selecting Edit)
echo  and replace the path at the top of the file with a path to your Anaconda directory.
echo:
pause
exit /b 1