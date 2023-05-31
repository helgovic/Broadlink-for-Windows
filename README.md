# Broadlink-for-Windows
Windows app for Broadlink WiFi remotes

With this app you can control Broadlink WiFi devices.

   Manage IR and RF devices and buttons.
   Create macros that executes commands from any device.
   Create timers (Repeat every x days/hours/minutes/seconds, Every day x hours/minutes before/after sunrise/sunset)
   
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
      --sendwificmd "Your Broadlink device name (e.g. "Dinnertable light")" "ButtonName"

Sharing of device codes:

I have created a cloud database, to share device codes.
If you want to utilize the shared database from another platform/app, you can see database information in "Database Specs"
