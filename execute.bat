@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:: config settings
call config.cmd

:: DDL
SET /P IMPORT_DDL=Import DDL (Y/[N])?
IF /I "%IMPORT_DDL%" == "Y" (
	echo importing ddl
	echo sql_host=%sql_host%
	echo sql_database=%sql_database%
	echo sql_user=%sql_user%
	echo sql_password=%sql_password%
	echo ddl_path=%ddl_path%
	call ddl.cmd
)

:: Import dtsx
echo ======================================
echo DTExec_path=%DTExec_path%
echo dtsx_path=%dtsx_path%
"%DTExec_path%" /Conf E:\TO_LDW\IFRS_LDS_Config.dtsConfig /File "%dtsx_path%"
:: /User sa /Password P@ssw0rd

pause