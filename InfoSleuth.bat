@echo off
setlocal enabledelayedexpansion

:menu
cls
echo Cyber Sleuthing Toolkit
echo -------------------------
echo 1. System Information
echo 2. Network Diagnostics
echo 3. File Integrity Check
echo 4. Process Monitoring
echo 5. Log File Analysis
echo 6. Check Open Ports
echo 7. Display Network Configuration
echo 8. Check for Malware (using Windows Defender)
echo 9. List Scheduled Tasks
echo 10. Check System Uptime
echo 11. Display Environment Variables
echo 12. Check Disk Usage
echo 13. List User Accounts
echo 14. Display Firewall Status
echo 15. Check Windows Updates
echo 16. Exit
set /p choice=Choose an option:

if "%choice%"=="1" goto system_info
if "%choice%"=="2" goto network_diagnostics
if "%choice%"=="3" goto file_integrity_check
if "%choice%"=="4" goto process_monitoring
if "%choice%"=="5" goto log_file_analysis
if "%choice%"=="6" goto check_open_ports
if "%choice%"=="7" goto display_network_config
if "%choice%"=="8" goto check_malware
if "%choice%"=="9" goto list_scheduled_tasks
if "%choice%"=="10" goto check_system_uptime
if "%choice%"=="11" goto display_env_vars
if "%choice%"=="12" goto check_disk_usage
if "%choice%"=="13" goto list_user_accounts
if "%choice%"=="14" goto display_firewall_status
if "%choice%"=="15" goto check_windows_updates
if "%choice%"=="16" exit

goto menu

:system_info
echo Gathering System Information...
echo -----------------------------------
systeminfo
echo -----------------------------------
pause
goto menu

:network_diagnostics
echo Network Diagnostics...
echo -----------------------------------
ping 8.8.8.8
echo -----------------------------------
route print
echo -----------------------------------
netstat -ano
echo -----------------------------------
pause
goto menu

:file_integrity_check
set /p "directory=Enter the directory to check: "
set "checksum_file=checksums.txt"
echo Generating checksums for files in %directory%...
if exist %checksum_file% del %checksum_file%

for %%f in (%directory%\*) do (
    certutil -hashfile "%%f" MD5 >> %checksum_file%
    echo %%f >> %checksum_file%
)

echo Checksums generated and saved to %checksum_file%.
pause
goto menu

:process_monitoring
echo Running Processes...
echo -----------------------------------
tasklist /v
echo -----------------------------------
pause
goto menu

:log_file_analysis
set /p "logfile=Enter the path to the log file: "
set /p "keyword=Enter the keyword to search for: "
echo Searching for "%keyword%" in %logfile%...
findstr /i "%keyword%" "%logfile%"
pause
goto menu

:check_open_ports
echo Checking Open Ports...
echo -----------------------------------
netstat -an | find "LISTENING"
echo -----------------------------------
pause
goto menu

:display_network_config
echo Displaying Network Configuration...
echo -----------------------------------
ipconfig /all
echo -----------------------------------
pause
goto menu

:check_malware
echo Checking for Malware...
echo -----------------------------------
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo -----------------------------------
pause
goto menu

:list_scheduled_tasks
echo Listing Scheduled Tasks...
echo -----------------------------------
schtasks /query /fo LIST /v
echo -----------------------------------
pause
goto menu

:check_system_uptime
echo Checking System Uptime...
echo -----------------------------------
systeminfo | find "System Boot Time"
echo -----------------------------------
pause
goto menu

:display_env_vars
echo Displaying Environment Variables...
echo -----------------------------------
set
echo -----------------------------------
pause
goto menu

:check_disk_usage
echo Checking Disk Usage...
echo -----------------------------------
wmic logicaldisk get size,freespace,caption
echo -----------------------------------
pause
goto menu

:list_user_accounts
echo Listing User Accounts...
echo -----------------------------------
net user
echo -----------------------------------
pause
goto menu

:display_firewall_status
echo Checking Firewall Status...
echo -----------------------------------
netsh advfirewall show allprofiles
echo -----------------------------------
pause
goto menu

:check_windows_updates
echo Checking Windows Updates...
echo -----------------------------------
powershell -command "Get-WindowsUpdate"
echo -----------------------------------
pause
goto menu
