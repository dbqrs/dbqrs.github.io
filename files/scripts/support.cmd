@echo off
mkdir C:\support
cd C:\support
del *.exe /q

curl -o TeamViewerQS_x64.exe https://dl.teamviewer.com/download/TeamViewerQS_x64.exe
start TeamViewerQS_x64.exe

