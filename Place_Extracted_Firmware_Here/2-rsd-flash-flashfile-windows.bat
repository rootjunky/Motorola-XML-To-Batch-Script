echo off
	
	echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo   "    ___  ____  ____  _____    ____  ___  ____ ____  __  ________  _  _    "
    echo   "   / _ \/ _  \/ _  \/_  _/_  / / / / / \/ / //_/\ \/ / / __/ _  \/ \/ \   "
    echo   "  / , _/ |_| / |_| / / / / // / /_/ /    /  <    \  /_/ /_/ |_| / ,  , \  "
    echo   " /_/|_|\____/\____/ /_/  \___/\____/_/\_/_/\_/   /_/_/___/\____/_/ \/ \_\ "
    echo   "                                                                          "
    echo   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    echo ------------------------------------------------------------------------------
	echo [*] Welcome to Motorola flashfile.xml to batch converter for windows
	echo ------------------------------------------------------------------------------
    pause
	echo echo off > flashfile.bat
	echo fastboot getvar max-sparse-size >> flashfile.bat
	echo fastboot oem fb_mode_set >> flashfile.bat
	findstr "\<filename\>" flashfile.xml > filename.txt
	findstr "\<erase\>" flashfile.xml > erase.txt
	findstr "\<mbn\>" flashfile.xml > mbn.txt
	findstr "\<BTFM\>" flashfile.xml > BTFM.txt
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (filename.txt) DO @echo fastboot %%H %%I %%G >> flashfile.bat
	for /F delims^=^"^ Tokens^=2^,4^,6^* %%G in (erase.txt) DO @echo fastboot %%G %%H >> flashfile.bat
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (mbn.txt) DO @echo fastboot %%H %%I %%G >> flashfile.bat
	for /F delims^=^"^ Tokens^=4^,6^,8^* %%G in (BTFM.txt) DO @echo fastboot %%H %%I %%G >> flashfile.bat
	echo fastboot oem fb_mode_clear >> flashfile.bat
	echo echo ------------------------------------------------------------------------- >> flashfile.bat
	echo echo please scroll up and check your flash for any errors >> flashfile.bat
	echo echo ------------------------------------------------------------------------- >> flashfile.bat
	echo pause >> flashfile.bat
	echo fastboot reboot >> flashfile.bat
	echo exit >> flashfile.bat
	echo [*] The flashfile.xml has been converted to a flashfile.bat
	echo [*] press any key to exit then double click the flashfile.bat
	echo [*] to start your firmware restore on your motorola device. 
	echo [*] make sure your device is in fastboot mode first before you start
	echo ------------------------------------------------------------------------------
	del BTFM.txt
	del mbn.txt
	del erase.txt
	del filename.txt
	pause 
exit