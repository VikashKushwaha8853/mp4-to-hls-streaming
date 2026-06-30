@echo off
setlocal

:: ============================
:: PROJECT PATHS
:: ============================

set ROOT=C:\Users\Asus\OneDrive\Desktop\mp4-to-hls-streaming
set INPUT=%ROOT%\input\sample.mp4
set OUTPUT=%ROOT%\output
set LOG=%ROOT%\logs\pipeline.log

echo =============================================== > "%LOG%"
echo          MP4 TO HLS STREAMING PIPELINE          >> "%LOG%"
echo =============================================== >> "%LOG%"
echo Start Time : %DATE% %TIME% >> "%LOG%"
echo Input File : %INPUT% >> "%LOG%"
echo Output     : %OUTPUT% >> "%LOG%"
echo. >> "%LOG%"

echo Starting HLS Conversion...

:: ============================
:: 360P
:: ============================

echo Creating 360p...
echo 360p Conversion >> "%LOG%"

ffmpeg -y -i "%INPUT%" ^
-vf scale=640:360 ^
-c:v libx264 -b:v 800k ^
-c:a aac -b:a 128k ^
-f hls ^
-hls_time 6 ^
-hls_playlist_type vod ^
-hls_segment_filename "%OUTPUT%\360p\segment_%%03d.ts" ^
"%OUTPUT%\360p\index.m3u8"

if errorlevel 1 (
    echo 360p FAILED >> "%LOG%"
) else (
    echo 360p SUCCESS >> "%LOG%"
)

:: ============================
:: 720P
:: ============================

echo Creating 720p...
echo 720p Conversion >> "%LOG%"

ffmpeg -y -i "%INPUT%" ^
-vf scale=1280:720 ^
-c:v libx264 -b:v 2500k ^
-c:a aac -b:a 128k ^
-f hls ^
-hls_time 6 ^
-hls_playlist_type vod ^
-hls_segment_filename "%OUTPUT%\720p\segment_%%03d.ts" ^
"%OUTPUT%\720p\index.m3u8"

if errorlevel 1 (
    echo 720p FAILED >> "%LOG%"
) else (
    echo 720p SUCCESS >> "%LOG%"
)

:: ============================
:: 1080P
:: ============================

echo Creating 1080p...
echo 1080p Conversion >> "%LOG%"

ffmpeg -y -i "%INPUT%" ^
-vf scale=1920:1080 ^
-c:v libx264 -b:v 5000k ^
-c:a aac -b:a 192k ^
-f hls ^
-hls_time 6 ^
-hls_playlist_type vod ^
-hls_segment_filename "%OUTPUT%\1080p\segment_%%03d.ts" ^
"%OUTPUT%\1080p\index.m3u8"

if errorlevel 1 (
    echo 1080p FAILED >> "%LOG%"
) else (
    echo 1080p SUCCESS >> "%LOG%"
)

echo. >> "%LOG%"
echo End Time : %DATE% %TIME% >> "%LOG%"
echo Status : COMPLETED >> "%LOG%"

echo.
echo ==========================================
echo Pipeline Completed Successfully
echo Log File : %LOG%
echo ==========================================
pause