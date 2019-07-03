echo off
	
	echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo   "    ___  ____  ____  _____    ____  ___  ____ ____  __  ________  _  _    "
    echo   "   / _ \/ _  \/ _  \/_  _/_  / / / / / \/ / //_/\ \/ / / __/ _  \/ \/ \   "
    echo   "  / , _/ |_| / |_| / / / / // / /_/ /    /  <    \  /_/ /_/ |_| / ,  , \  "
    echo   " /_/|_|\____/\____/ /_/  \___/\____/_/\_/_/\_/   /_/_/___/\____/_/ \/ \_\ "
    echo   "                                                                          "
    echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo ------------------------------------------------------------------------------
	echo [*] Welcome to Motorola servicefile.xml to batch converter for windows
	echo ------------------------------------------------------------------------------
    pause
	echo echo off > servicefile.bat
	echo fastboot getvar max-sparse-size >> servicefile.bat
	echo fastboot oem fb_mode_set >> servicefile.bat
	findstr "\<filename\>" servicefile.xml > filename.txt
	findstr "\<erase\>" servicefile.xml > erase.txt
	findstr "\<mbn\>" servicefile.xml > mbn.txt
	findstr "\<BTFM\>" servicefile.xml > BTFM.txt
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (filename.txt) DO @echo fastboot %%H %%I %%G >> servicefile.bat
	for /F delims^=^"^ Tokens^=2^,4^,6^* %%G in (erase.txt) DO @echo fastboot %%G %%H >> servicefile.bat
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (mbn.txt) DO @echo fastboot %%H %%I %%G >> servicefile.bat
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (BTFM.txt) DO @echo fastboot %%H %%I %%G >> servicefile.bat
	echo fastboot oem fb_mode_clear >> servicefile.bat
	echo echo ------------------------------------------------------------------------- >> servicefile.bat
	echo echo please scroll up and check your flash for any errors >> servicefile.bat
	echo echo ------------------------------------------------------------------------- >> servicefile.bat
	echo pause >> servicefile.bat
	echo fastboot reboot >> servicefile.bat
	echo exit >> servicefile.bat
	echo [*] The Servicefile.xml has been converted to a Servicefile.bat
	echo [*] press any key to exit then double click the servicefile.bat
	echo [*] to start your firmware restore on your motorola device.
	echo [*] make sure your device is in fastboot mode first before you start
	echo ------------------------------------------------------------------------------
	del BTFM.txt
	del mbn.txt
	del erase.txt
	del filename.txt
	pause 
exit