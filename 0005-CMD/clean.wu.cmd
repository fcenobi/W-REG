@echo off

net stop wuauserv
cd /d %windir%
rd /s SoftwareDistribution
net start wuauserv

PAUSE
