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
  goto ContinueFromAnaconda
)
if exist %USERPROFILE%\Anaconda3\Scripts\activate.bat (
  set anaconda=%USERPROFILE%\Anaconda3\
  goto ContinueFromAnaconda
)
if exist %USERPROFILE%\miniconda3\Scripts\activate.bat (
    set anaconda=%USERPROFILE%\miniconda3\
    goto ContinueFromAnaconda
)
if exist C:\ProgramData\Anaconda3\Scripts\activate.bat (
    set anaconda=C:\ProgramData\Anaconda3\
    goto ContinueFromAnaconda
)
if exist C:\ProgramData\Miniconda3\Scripts\activate.bat (
    set anaconda=C:\ProgramData\Miniconda3\
    goto ContinueFromAnaconda
)
goto ProcessError
:ContinueFromAnaconda


echo Checking if config.yaml files exist...
echo:
if not exist "%~dp0..\Ultrasound\config.yaml" (
  if not exist "%~dp0..\Lips\config.yaml" (
    @REM Here we only overwrite the configuration files if both config.yaml files are missing, in case the user is busy modifying them.
    goto InstallConfigFiles
  )
)
echo Found!
echo:
:ContinueFromInstallConfigFiles


echo Updating and launching DeepLabCut. Please wait, this may take a few minutes...
echo:


@REM Second, open an Anaconda instance.

call %anaconda%\Scripts\activate.bat %anaconda%


@REM Third, download the conda environment .yaml file from the official DeepLabCut repository.

call powershell -Command "(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/DeepLabCut/DeepLabCut/master/conda-environments/DEEPLABCUT.yaml', '%~dp0Other_Files\official_environment.yml')"


@REM Fourth, create an Anaconda environment from the downloaded .yaml file by passing it as an argument to an environment creation.
@REM   The above Powershell command to download the file tries to delete the old one first, regardless of whether the download was successful.
@REM   Because of this, we keep a separate duplicate backup file which we can load if the latest download fails, and update it if successful.

if exist "%~dp0Other_Files\official_environment.yml" (
  echo Latest DeepLabCut environment successfully downloaded. Making a backup:
  copy /y "%~dp0Other_Files\official_environment.yml" "%~dp0Other_Files\backup_environment.yml"
  call conda create -f "%~dp0Other_Files\official_environment.yml"
  call conda env update -f "%~dp0Other_Files\official_environment.yml"
) else (
  echo:
  echo Failed to download latest official DeepLabCut environment. Now using the last successful DeepLabCut environment instead.
  echo It may be out of date and cannot update to the latest DeepLabCut version.
  echo:
  echo ^(If this happened because of a SSL/TLS secure channel error and you are running Windows 10, you probably need to install the latest Windows Updates.^)
  echo:
  call conda create -f "%~dp0Other_Files\backup_environment.yml"
)


@REM Fifth, activate the installed environment. Its environment name is set from the "name" property inside the downloaded .yaml file.

if exist "%~dp0Other_Files\official_environment.yml" (
  for /f %%i in ('powershell -Command "(select-string -path '%~dp0Other_Files\official_environment.yml' -pattern 'name: (.*)').Matches.captures.groups[1].value"') do set envname=%%i
) else (
  for /f %%i in ('powershell -Command "(select-string -path '%~dp0Other_Files\backup_environment.yml' -pattern 'name: (.*)').Matches.captures.groups[1].value"') do set envname=%%i
)
call conda activate %envname%


@REM Finally, inside the Anaconda environment instance, open up an ipython or wxpython instance and run the following commands:
@REM     import deeplabcut
@REM     deeplabcut.launch_dlc()

call ipython "%~dp0Other_Files\run_deepLabCut_part2.py"
exit /b 0


@REM (Additional script functions below)

:ProcessError
echo:
echo  It seems you have installed Anaconda in a non-default directory, or this script can't access your Anaconda install.
echo  Please edit this Run_DeepLabCut.bat file (by right-clicking it and selecting Edit)
echo  and replace the path at the top of the file with a path to your Anaconda directory.
echo:
echo  Press any key to exit...
pause >nul
exit /b 1

:InstallConfigFiles
call "%~dp0Install_Config_Files.bat" nopause
echo:
echo If this is the first time you are running this then it will install DeepLabCut, which may take up to 20 minutes.
echo:
setlocal DisableDelayedExpansion
goto ContinueFromInstallConfigFiles