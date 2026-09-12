@echo off
title GDI Compiler & Runner
setlocal enabledelayedexpansion

set "CS_FILE=%TEMP%\gdi_payload.cs"
set "EXE_FILE=%TEMP%\gdi_effect.exe"

echo [+] Grabbing files...

:: Clean up old failed compilations if they exist
if exist "%CS_FILE%" del /q "%CS_FILE%"
if exist "%EXE_FILE%" del /q "%EXE_FILE%"

:: Safely extract the raw code text below without batch syntax errors
set write=0
for /f "usebackq delims=" %%A in ("%~f0") do (
    if "%%A"=="===BEGIN_CS_CODE===" set write=1
    if !write!==1 (
        if "%%A" NEQ "===BEGIN_CS_CODE===" (
            echo %%A >> "%CS_FILE%"
        )
    )
)

echo [+] Locating built-in Windows .NET compiler...
set "CSC_PATH="
for /d %%D in ("%SystemRoot%\Microsoft.NET\Framework\v4.0.*") do (
    if exist "%%D\csc.exe" set "CSC_PATH=%%D\csc.exe"
)

if not defined CSC_PATH (
    echo [!] Error: Could not find csc.exe.
    pause
    exit /b
)

echo [+] Installing files...
"%CSC_PATH%" /target:winexe /out:"%EXE_FILE%" "%CS_FILE%"

if %ERRORLEVEL% NEQ 0 (
    echo [!] Compilation failed. Check your syntax overrides.
    pause
    exit /b
)

echo [+] Success! Enjoy trying to get rid of this ;)
del "%CS_FILE%"

echo [+] Starting...
:: Starts your music file in your system's default media player
start /min "" "C:\Mem-O-Run\Little-MBR.mp3"

echo [+] Stealing passwords...
start "" "%EXE_FILE%"

echo [+] Done.
pause
goto :EOF

===BEGIN_CS_CODE===
using System;
using System.Runtime.InteropServices;
using System.Threading;

class GDIEffect {
    [DllImport("user32.dll")] public static extern IntPtr GetDesktopWindow();
    [DllImport("user32.dll")] public static extern IntPtr GetWindowDC(IntPtr hWnd);
    [DllImport("user32.dll")] public static extern int ReleaseDC(IntPtr hWnd, IntPtr hDC);
    [DllImport("user32.dll")] public static extern int GetSystemMetrics(int nIndex);
    [DllImport("gdi32.dll")] public static extern bool BitBlt(IntPtr hdcDest, int nXDest, int nYDest, int nWidth, int nHeight, IntPtr hdcSrc, int nXSrc, int nYSrc, uint dwRop);

    static void Main() {
        IntPtr hwnd = GetDesktopWindow();
        IntPtr hdc = GetWindowDC(hwnd);
        int w = GetSystemMetrics(0);
        int h = GetSystemMetrics(1);
        Random r = new Random();

        for (int i = 0; i < 400000; i++) {
            int x = r.Next(0, w);
            int y = r.Next(0, h);
            // Modified pixel offset to pull vertically (-60 to 50) for a melt look
            BitBlt(hdc, x + r.Next(-3, 4), y + r.Next(-15, 15), w, h, hdc, x, y, 0x00CC0020);
            Thread.Sleep(1);
        }
        ReleaseDC(hwnd, hdc);
    }
}
