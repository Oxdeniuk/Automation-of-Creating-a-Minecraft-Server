@echo off

:: Ustawienia serwera
set "install_dir=%userprofile%\MinecraftServer"
set "eula_file=%install_dir%\eula.txt"

:: Tworzenie pliku eula.txt
echo eula=false > "%eula_file%"
echo The eula.txt file has been created with the content: eula=false

:: Sprawdzenie, czy plik eula.txt istnieje
if not exist "%eula_file%" (
    echo File eula.txt doesn't exist. Make sure that the Minecraft server is properly installed..
    pause
    exit /b 1
)

:: Zmień wartość eula z false na true w pliku eula.txt
findstr /C:"eula=false" "%eula_file%" >nul
if %errorlevel%==0 (
    (echo eula=true) > "%eula_file%"
    echo The value of eula has been changed to true in the file: "%eula_file%"
) else (
    echo The value of eula is already set to true.
)

echo End of Step3

for /l %%i in (3,-1,1) do (
    echo Starting server configuration in %%i s...
    timeout /t 1 /nobreak >nul
)

call Step4.bat