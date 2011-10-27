@echo off
start "" "cmd" "/k cd %NODE_INSPECTOR%\node_modules\node-inspector\bin&&node inspector &"
start "" "cmd" "/k node --debug-brk app.js"
start "" %NODE_INSPECTOR_BROWSER% "http://localhost:8080"
echo start "" %NODE_INSPECTOR_BROWSER% "%1%"