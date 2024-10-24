@echo off
@REM Win + R で実行できるようにカレントディレクトリを変更
cd "%OBSIDIAN%\MyVault"
@REM PowerShell スクリプトを実行
powershell -ExecutionPolicy Bypass -File "%OBSIDIAN%\MyVault\obs.ps1"
