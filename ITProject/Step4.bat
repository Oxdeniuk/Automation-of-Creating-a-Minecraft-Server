@echo off

:: Ustawienia serwera
set "install_dir=%userprofile%\MinecraftServer"
set "server_name=server.jar"
set "java_args=-Xmx2G -Xms1G"  :: Ustawienia parametrów Java (możesz dostosować)

:: Sprawdzenie, czy plik serwera istnieje
if not exist "%install_dir%\%server_name%" (
    echo The server file does not exist. Make sure the server has been downloaded and placed in the correct directory.
    pause
    exit /b 1
)

:: Tworzenie pliku BAT do uruchomienia serwera
echo java %java_args% -jar %server_name% nogui > "%install_dir%\StartServer.bat"

:: Uruchomienie serwera Minecraft
cd "%install_dir%"
StartServer.bat
echo End of Step4



