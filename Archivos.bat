@echo off
set /p archivo=Nombre del archivo: 
if not exist %archivo% (
	set /p elemento1=Primer elemento: 
	set /p elemento2=Segundo elemento: 
	echo %elemento1% >> %archivo% && echo %elemento2% >> %archivo%
	type %archivo%
)else (
	echo el archivo existe
	set /p respuesta=Borrarlo? S/N
	if %respuesta%==S (erase %archivo% && echo el archivo se ha eliminado))