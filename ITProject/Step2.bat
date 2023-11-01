@echo off

:: Ustawienia serwera
set "install_dir=%userprofile%\MinecraftServer"
set "server_properties=%install_dir%\server.properties"

:: Tworzenie katalogu docelowego
if not exist "%install_dir%" (
    mkdir "%install_dir%"
)

:: Tworzenie lub kopiowanie pliku server.properties
if not exist "%server_properties%" (
    echo # My server config > "%server_properties%"
    echo motd=Welcome on my minecraft server! >> "%server_properties%"
    echo difficulty=2 >> "%server_properties%"
    echo gamemode=0 >> "%server_properties%"
) else (
    echo File server.properties already exist.
)

echo Minecraft server configuration has been set in the file: "%server_properties%".

echo End of Step2
for /l %%i in (3,-1,1) do (
    echo Starting server configuration in %%i s...
    timeout /t 1 /nobreak >nul
)

call Step3.bat


