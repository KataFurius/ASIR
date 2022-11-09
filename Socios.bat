@echo off
setlocal enabledelayedexpansion

cls
if exist socios.txt (
	echo Listado > socios.txt
	echo El listado se ha vaciado
)
if not exist socios.txt (
	echo Listado > socios.txt
	echo El archivo se ha creado
)
	
set /p x=Cuantos socios quieres incluir? 

for /l %%i in (1,1,%x%) do (
	set /p nombre=Nombre del integrante %%i: 
	echo !nombre! >> socios.txt
)

echo El listado de socios es:
type socios.txt