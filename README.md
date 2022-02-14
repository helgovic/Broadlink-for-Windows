# Broadlink-for-Windows
Windows app for Broadlink WiFi remotes

With this app you can control a Broadlink WiFi universal remote. Add devices and buttons. Create macros. 
Teach IR and RF codes. Send codes or macros from app or use the command line interface. Data is stored in SQLite database.

The app uses [python-broadlink](https://github.com/mjg59/python-broadlink), so python has to be installed. Download from [here](https://www.python.org/downloads/).

Install Python and be sure to add python to your path variable. Install python-broadlink by issuing this command in a commandopromt "pip3 install broadlink".
Install win32 "pip install pypiwin32"

Run Setup.exe from the Install directory.

How to use the commandline interface.

   OBS. The gui app (WinBroadlink.exe) has to be started.

   Run <Your install directory (e.g C:\Program Files (x86)\WinBroadlink)>\SendBLCommand.exe.
   
   Parameters:

      --help Get parameterinfo
      --sendcmd "Your Broadlink device name (e.g. "MyBLDevice")" "Device name" "Button name" 
      --sendmacro "Your Broadlink device name (e.g. "MyBLDevice")" "Macro name"
