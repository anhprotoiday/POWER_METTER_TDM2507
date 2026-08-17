@echo off
title Tool Nap Code ESP32-C3 (Khong can ESP-IDF)

:: ==========================================
:: CHỈNH SỬA CỔNG COM Ở ĐÂY (Trên máy tính mới)
:: ==========================================
set COM_PORT=COM22
set BAUD_RATE=921600

echo.
echo ==========================================================
echo [ START ] DANG NAP CODE VAO MACH ESP32-C3 QUA CONG %COM_PORT%
echo ==========================================================
echo.

:: Goi esptool.exe de nap 3 file bin cung thu muc
esptool.exe --chip esp32c3 --port %COM_PORT% --baud %BAUD_RATE% --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect ^
0x0 bootloader.bin ^
0x8000 partition-table.bin ^
0x10000 Power_Metter_Module.bin

:: Kiem tra loi
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ==========================================================
    echo [ THANH CONG ] Nap code hoan tat! Mach dang khoi dong lai.
    echo ==========================================================
) else (
    echo.
    echo ==========================================================
    echo [ THAT BAI ] Co loi xay ra! Vui long kiem tra lai:
    echo 1. Cong %COM_PORT% co dung khong? Co bi phan mem khac chiem khong?
    echo 2. Day cap ket noi co bi long khong?
    echo 3. Da co du 3 file .bin va esptool.exe nam cung thu muc chua?
    echo ==========================================================
)

pause