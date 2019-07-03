echo off
	
	echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo   "    ___  ____  ____  _____    ____  ___  ____ ____  __  ________  _  _    "
    echo   "   / _ \/ _  \/ _  \/_  _/_  / / / / / \/ / //_/\ \/ / / __/ _  \/ \/ \   "
    echo   "  / , _/ |_| / |_| / / / / // / /_/ /    /  <    \  /_/ /_/ |_| / ,  , \  "
    echo   " /_/|_|\____/\____/ /_/  \___/\____/_/\_/_/\_/   /_/_/___/\____/_/ \/ \_\ "
    echo   "                                                                          "
    echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo ------------------------------------------------------------------------------
	echo [*] Welcome to Motorola xml to bat converter for windows
	echo [*] please rename your xml file to firmwareflash.xml
	echo ------------------------------------------------------------------------------
    pause
	echo echo off > firmwareflash.bat
	findstr "\<step\>" firmwareflash.xml > step.txt
	for /F delims^=^"^ Tokens^=2^,4^,6^* %%G in (step.txt) DO @echo fastboot %%G %%H %%I >> firmwareflash.bat
	echo echo ------------------------------------------------------------------------- >> firmwareflash.bat
	echo echo please scroll up and check your flash for any errors >> firmwareflash.bat
	echo echo ------------------------------------------------------------------------- >> firmwareflash.bat
	echo pause >> firmwareflash.bat
	echo fastboot reboot >> firmwareflash.bat
	echo exit >> firmwareflash.bat
	echo [*] The firmwareflash.xml has been converted to a firmwareflash.bat
	echo [*] press any key to exit then double click the firmwareflash.bat
	echo [*] to start your firmware restore on your motorola device.
	echo [*] make sure your device is in fastboot mode first before you start
	echo ------------------------------------------------------------------------------
	del step.txt
	pause 
exit