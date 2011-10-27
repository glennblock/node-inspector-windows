Using node-inspector on windows
===

**What is this?**

Tool for getting node-inspector working on windows and for simplifying the proces of launching the debugger. It's not rocket science, but it is (I think) useful.

**What it does**

- Gets you up and running with a windows friendly version of node-inspector
- Provides a command line tool to launch for debugging.

**Prerequisites for using**

- Windows
- [Latest npm build for windows] (http://npmjs.org/doc/README.html#Installing-on-Windows-Experimental)


**Installation**

- From the command window launch install.cmd. This will install node-inspector via npm and apply the paperboy patch described [here] (https://github.com/dannycoates/node-inspector/issues/62#issuecomment-1998429) to get node-inspector working on windows.
- From the start menu right click on Computer->Properties->Advanced Computer Settings->Environment variables. 
  -	Create 2 system variables 
    - set NODE_INSPECTOR to the folder where this repo is located i.e. "c:\node-inspector"
    - set NODE_INSPECTOR_BROWSER to the path of your webkit browser of choice i.e. Chrome, Safari. For example right clicking on Chrome on my machine gives me “C:\Users\gblock\AppData\Local\Google\Chrome\Application\chrome.exe”
-	Add %NODE_INSPECTOR% to your path.

**Using**

- In the command window, go to the folder where the node app you want to debug is.
- Type node-debug [url] e.g. node-debug http://localhost:3000

Once you run it from the app folder it will:

-	Launch node inspector
-	Launch you app in debug mode. 
-	Open the browser you specified and launch the debugger ui.
-	Launch the start url you specified.

**Known issues**
I've seen some cases where running node-debug causes a socket error. This seems to happen periodically. Closing the command windows and starting again seems to clear it.

**Acknowledgements**

- [Danny Coates] (https://github.com/dannycoates) for the excellent work on node-inspector
- [Franček Prijatelj] (https://github.com/fprijate) for his paperboy patch

**License**
- node-inspector-windows is licensed under Apache 2.
- paperboy is licensed under the "Debuggable Limited license" (see LICENSE.PAPERBOY.txt)
