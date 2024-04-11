@echo OFF

:: Prompt the user to enter the name of the text file to be created
set /p nome_arquivo=Enter the name of the text file to be created (include the .txt extension): 

echo Collecting information...

:: Get the student code entered by the user
set codigo_estudante=%username%

:: Get the computer name
:: Use the 'hostname' command to obtain the computer name and store it in the 'nome_computador' variable
for /f "tokens=1 " %%A in ('hostname') do set nome_computador=%%A

:: Get the computer's IP address
:: Use the 'ipconfig' command to obtain the computer's IPv4 address and store it in the 'ip_computador' variable
for /f "tokens=2 delims=:" %%B in ('ipconfig ^| find "IPv4"') do set ip_computador=%%B

:: Get the current time
:: Use the 'time /t' command to get the current time and store it in the 'hora_atual' variable
for /f "tokens=1-3 delims=: " %%C in ('time /t') do set hora_atual=%%C:%%D %%E

:: Write the collected information to the text file specified by the user
echo Student code: %codigo_estudante% >> %nome_arquivo%
echo Computer name: %nome_computador% >> %nome_arquivo%
echo Computer IP: %ip_computador% >> %nome_arquivo%
echo Current time: %hora_atual% >> %nome_arquivo%

:: Inform the user that the information has been saved to the file
echo The information has been saved to the file %nome_arquivo%.

:: Wait for the user to press a key before ending the script
pause