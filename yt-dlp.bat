@echo off
chcp 65001 >nul

cd /d "%~dp0"
if not exist "video" mkdir "video"
cd "video"

echo.
echo =========================================
echo   yt-dlp 手动选择 Format（专业版）
echo =========================================
echo.

set /p URL=请输入视频链接：
if "%URL%"=="" exit /b

echo.
echo ========= 可用格式 =========
echo.

yt-dlp --proxy http://127.0.0.1:10808 --js-runtimes node -F "%URL%"

echo.
echo =========================================
echo  输入要下载的视频 format_id
echo =========================================
echo.

set /p VID=视频 format_id：
if "%VID%"=="" exit /b

echo.
echo 开始下载...
echo.

yt-dlp ^
  --proxy http://127.0.0.1:10808 ^
  --js-runtimes node ^
  --console-title ^
  --sleep-requests 2 ^
  -f "%VID%+bestaudio/best" ^
  --merge-output-format mkv ^
  --write-thumbnail ^
  --write-description ^
  -o "%%(upload_date)s_%%(title)s.%%(ext)s" ^
  "%URL%"

echo.
echo 下载完成
pause
