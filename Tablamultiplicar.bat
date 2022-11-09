@echo off
setlocal EnableDelayedExpansion 
for %%x in (%1,%2,%3) do (
	for /l %%y in (0,1,4) do (
		set /a i=%%x*%%y
		echo %%x*%%y=!i!
))
