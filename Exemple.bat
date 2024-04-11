@echo OFF

:: Prompt the user to enter the name of the text file to be created
set /p fileName=Enter the name of the text file to be created (include the .txt extension): 

echo Collecting information...

:: Get the student code entered by the user
set UserName=%username%

:: Get the computer name
:: Use the 'hostname' command to obtain the computer name and store it in the 'computer_name' variable
for /f "tokens=1 " %%A in ('hostname') do set computer_name=%%A

:: Get the computer's IP address
:: Use the 'ipconfig' command to obtain the computer's IPv4 address and store it in the 'computer_ip' variable
for /f "tokens=2 delims=:" %%B in ('ipconfig ^| find "IPv4"') do set computer_ip=%%B

:: Get the current time
:: Use the 'time /t' command to get the current time and store it in the 'date' variable
for /f "tokens=1-3 delims=: " %%C in ('time /t') do set date=%%C:%%D %%E

:: Write the collected information to the text file specified by the user
echo Username: %UserName% >> %fileName%
echo Computer name: %computer_name% >> %fileName%
echo Computer IP: %computer_ip% >> %fileName%
echo Current time: %date% >> %fileName%

:: Inform the user that the information has been saved to the file
echo The information has been saved to the file %fileName%.

:: Wait for the user to press a key before ending the script
pause