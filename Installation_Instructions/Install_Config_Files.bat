@echo off
echo:
setlocal EnableDelayedExpansion

@REM Push current directory to memory and change to the target directory...
pushd %~dp0..\Ultrasound

@REM Save to variable the current directory, thus resolving a path containing \..\ into a qualified linear absolute path...
set ultrasoundFolderPath=%CD%

@REM Restore original directory...
popd

@REM Push current directory to memory and change to the target directory...
pushd %~dp0..\Lips

@REM Save to variable the current directory, thus resolving a path containing \..\ into a qualified linear absolute path...
set lipsFolderPath=%CD%

@REM Restore original directory...
popd

echo Generating config.yaml files, please wait...
echo:

set inputConfigPath=%~dp0Other_Files\autoConfigUltrasound
set outputConfigPath=%ultrasoundFolderPath%\config.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%ultrasoundFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Ultrasound config.yaml

set inputConfigPath=%~dp0Other_Files\autoConfigLips
set outputConfigPath=%lipsFolderPath%\config.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%lipsFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Lips config.yaml

if not exist "%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle1\test" (
  mkdir "%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle1\test"
)
set inputConfigPath=%~dp0Other_Files\autoPoseCfgLipsMobileNetTest
set outputConfigPath=%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle1\test\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%lipsFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo:
echo Generated: Lips MobileNetv2_1.0 Test pose_cfg.yaml

if not exist "%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle0\test" (
  mkdir "%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle0\test"
)
set inputConfigPath=%~dp0Other_Files\autoPoseCfgLipsResNetTest
set outputConfigPath=%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle0\test\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%lipsFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Lips ResNet50 Test pose_cfg.yaml

set inputConfigPath=%~dp0Other_Files\autoPoseCfgLipsMobileNetTrain
set outputConfigPath=%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle1\train\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%lipsFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Lips MobileNetv2_1.0 Train pose_cfg.yaml

set inputConfigPath=%~dp0Other_Files\autoPoseCfgLipsResNetTrain
set outputConfigPath=%lipsFolderPath%\dlc-models\iteration-0\Tal_LipsJan28-trainset35shuffle0\train\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%lipsFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Lips ResNet50 Train pose_cfg.yaml


if not exist "%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle1\test" (
  mkdir "%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle1\test"
)
set inputConfigPath=%~dp0Other_Files\autoPoseCfgUSMobileNetTest
set outputConfigPath=%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle1\test\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%ultrasoundFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Ultrasound MobileNetv2_1.0 Test pose_cfg.yaml

if not exist "%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle0\test" (
  mkdir "%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle0\test"
)
set inputConfigPath=%~dp0Other_Files\autoPoseCfgUSResNetTest
set outputConfigPath=%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle0\test\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%ultrasoundFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Ultrasound ResNet50 Test pose_cfg.yaml

set inputConfigPath=%~dp0Other_Files\autoPoseCfgUSMobileNetTrain
set outputConfigPath=%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle1\train\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%ultrasoundFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Ultrasound MobileNetv2_1.0 Train pose_cfg.yaml

set inputConfigPath=%~dp0Other_Files\autoPoseCfgUSResNetTrain
set outputConfigPath=%ultrasoundFolderPath%\dlc-models\iteration-0\SpeechProductionFeb12-trainset34shuffle0\train\pose_cfg.yaml
powershell -Command "(gc '%inputConfigPath%') -replace 'REPLACE_PATH', '%ultrasoundFolderPath%' | Out-File -encoding ASCII '%outputConfigPath%'"
echo Generated: Ultrasound ResNet50 Train pose_cfg.yaml

powershell -Command "& {Expand-Archive -Force -LiteralPath '%~dp0Other_Files\resnet_v1_50.zip' -DestinationPath '%~dp0..\Dependencies'}"
echo:
echo ResNet50 encoder network model unpacked.

echo:
echo All files successfully installed^^!
echo:
pause
