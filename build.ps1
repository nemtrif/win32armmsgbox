$Env:PATH += ";C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\MSVC\14.42.34433\bin\Hostarm64\arm64"
$Env:LIB += ";C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\arm64"
armasm64 winmsgbox.asm /Fowinmsgbox.obj
link winmsgbox.obj /SUBSYSTEM:WINDOWS /ENTRY:WinMain /OUT:winmsgbox.exe "kernel32.lib" "user32.lib" "gdi32.lib"
