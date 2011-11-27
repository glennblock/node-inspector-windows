@ECHO off
SET PORT=8080
SET COFFEEDEBUG=0
SET RUNENVBAT=0
IF EXIST "%NODE_INSPECTOR%\environmentvars.bat" SET RUNENVBAT=1

IF "%1"=="" GOTO APPSTART
:GETOPTS
 IF /I %1 == -c SET COFFEEDEBUG=1&
 IF /I %1 == -p SET PORT=%2& SHIFT
 SHIFT
IF NOT (%1)==() GOTO GETOPTS

:APPSTART

START "" "cmd" "/k cd %NODE_INSPECTOR%\node_modules\node-inspector\bin&&node inspector --web-port=%PORT%&"
ECHO started node-inspector on port:%PORT%
IF %COFFEEDEBUG% == 1 IF %RUNENVBAT% == 1 (
	START "" "cmd" "/k %NODE_INSPECTOR%\environmentvars.bat&&coffee --nodejs --debug app.coffee" 
	ECHO applied environmentvars.bat
	ECHO started coffee --nodejs --debug app.coffee
)
IF %COFFEEDEBUG% == 1 IF %RUNENVBAT% == 0 (
	START "" "cmd" "/k coffee --nodejs --debug app.coffee" 
	ECHO started coffee --nodejs --debug app.coffee
)
IF %COFFEEDEBUG% == 0 IF %RUNENVBAT% == 1 ( 
	START "" "cmd" "/k %NODE_INSPECTOR%\environmentvars.bat&&node --debug-brk app.js" 
	ECHO applied environmentvars.bat
	ECHO started node --debug-brk app.js
)
IF %COFFEEDEBUG% == 0 IF %RUNENVBAT% == 0 (
	START "" "cmd" "/k node --debug-brk app.js"
	ECHO started node
)
