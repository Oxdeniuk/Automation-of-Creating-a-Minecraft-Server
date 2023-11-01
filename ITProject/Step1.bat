@echo off

:: Ustawienie nazwy serwera i katalogu docelowego
set "server_name=server.jar"
set "install_dir=%userprofile%\MinecraftServer"

:: Tworzenie katalogu docelowego
if not exist "%install_dir%" (
    mkdir "%install_dir%"
)
set "selected_version="

:choose_version
:: Wybór wersji serwera
echo Choose the number corresponding to the server version(1-34) :
echo 1. 1.20.2
echo 2. 1.20.1
echo 3. 1.19.4
echo 4. 1.19.3
echo 5. 1.19.2
echo 6. 1.19.1
echo 7. 1.19
echo 8. 1.18.2
echo 9. 1.18.1
echo 10. 1.18
echo 11. 1.17.1
echo 12. 1.17
echo 13. 1.16.5
echo 14. 1.16.4
echo 15. 1.16.3
echo 16. 1.16.2
echo 17. 1.16.1
echo 18. 1.15.2
echo 19. 1.15.1
echo 20. 1.15
echo 21. 1.14.4
echo 22. 1.14.3
echo 23. 1.14.2
echo 24. 1.14.1
echo 25. 1.14
echo 26. 1.13.2
echo 27. 1.13.1
echo 28. 1.13
echo 29. 1.12.2
echo 30. 1.12.1
echo 31. 1.12
echo 32. 1.11.2
echo 33. 1.11.1
echo 34. 1.11

set /p version_choice="Choose the number corresponding to the server version(1-34) "
if "%version_choice%"=="" goto choose_version

:: Sprawdzenie poprawności wyboru wersji
set /a version_choice
if %version_choice% lss 1 goto choose_version
if %version_choice% gtr 34 goto choose_version

:: Określenie wybranej wersji i linku
if %version_choice%==1 set "selected_version=1.20.2"
if %version_choice%==2 set "selected_version=1.20.1"
if %version_choice%==3 set "selected_version=1.19.4"
if %version_choice%==4 set "selected_version=1.19.3"
if %version_choice%==5 set "selected_version=1.19.2"
if %version_choice%==6 set "selected_version=1.19.1"
if %version_choice%==7 set "selected_version=1.19"
if %version_choice%==8 set "selected_version=1.18.2"
if %version_choice%==9 set "selected_version=1.18.1"
if %version_choice%==10 set "selected_version=1.18"
if %version_choice%==11 set "selected_version=1.17.1"
if %version_choice%==12 set "selected_version=1.17"
if %version_choice%==13 set "selected_version=1.16.5"
if %version_choice%==14 set "selected_version=1.16.4"
if %version_choice%==15 set "selected_version=1.16.3"
if %version_choice%==16 set "selected_version=1.16.2"
if %version_choice%==17 set "selected_version=1.16.1"
if %version_choice%==18 set "selected_version=1.15.2"
if %version_choice%==19 set "selected_version=1.15.1"
if %version_choice%==20 set "selected_version=1.15"
if %version_choice%==21 set "selected_version=1.14.4"
if %version_choice%==22 set "selected_version=1.14.3"
if %version_choice%==23 set "selected_version=1.14.2"
if %version_choice%==24 set "selected_version=1.14.1"
if %version_choice%==25 set "selected_version=1.14"
if %version_choice%==26 set "selected_version=1.13.2"
if %version_choice%==27 set "selected_version=1.13.1"
if %version_choice%==28 set "selected_version=1.13"
if %version_choice%==29 set "selected_version=1.12.2"
if %version_choice%==30 set "selected_version=1.12.1"
if %version_choice%==31 set "selected_version=1.12"
if %version_choice%==32 set "selected_version=1.11.2"
if %version_choice%==33 set "selected_version=1.11.1"
if %version_choice%==34 set "selected_version=1.11"

:: Pobieranie pliku serwera na podstawie wybranej wersji

set "download_url=https://download.getbukkit.org/spigot/spigot-%selected_version%.jar"  :: Zmień URL na właściwy
curl -o "%install_dir%\server.jar" %download_url%

:: Sprawdzenie, czy pobieranie zakończyło się sukcesem
if %errorlevel%==0 (
    echo Download completed successfully.
) else (
    echo Error while downloading the server.
    exit /b 1
)

echo "Minecraft server has been downloaded and saved in the directory: "%install_dir%".

echo End of Step1
for /l %%i in (3,-1,1) do (
    echo Starting server configuration in %%i s...
    timeout /t 1 /nobreak >nul
)

call Step2.bat
