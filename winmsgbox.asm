; Linker directives
    AREA	|.drectve|, DRECTVE
    IMPORT	|__imp_MessageBoxA|
    EXPORT	WinMain

; Read-only initialized data - i.e. constants
    AREA	|.rdata|, DATA, READONLY
hello_world_string DCB "Hello, World!", 0x0
hi_string DCB "Hi!", 0x0

; Executable code (free format)
    AREA	|.text|, CODE, ARM64
WinMain PROC
    ; Function prologue
    ; See https://devblogs.microsoft.com/oldnewthing/20220824-00/?p=107043
	stp         fp,lr,[sp,#-0x10]!
	mov         fp,sp

    ; Set up parameters for MessageBoxA function:
    ; int MessageBox(HWND hWnd, LPCTSTR lpText, LPCTSTR lpCaption, UINT uType);

    ; hWnd (NULL) to x0
	mov         x0,#0
    ; lpText to x1
	adrp        x8,hello_world_string
	add         x1,x8,hello_world_string
    ; lpCaption to x2
	adrp        x8,hi_string
	add         x2,x8,hi_string
    ; __imp_MessageBoxA address to x8
	adrp        x8,__imp_MessageBoxA
	ldr         x8,[x8,__imp_MessageBoxA]
    ; uType = MB_OK (i.e. 0) to x3
	mov         w3,#0
    ; Call the function
	blr         x8

    ; Return 0
	mov         w0,#0
    ; Function epilogue
	ldp         fp,lr,[sp],#0x10
    ; Return from the function
	ret

    ENDP  ; WinMain

    END
