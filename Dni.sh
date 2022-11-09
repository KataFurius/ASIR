#!/bin/bash
y=0
dni=$1
if [ $# = 0 ]
then
  echo "Introduce tu DNI como parametro."
else
  until [ $y = 1 ]
  do
    lon=${#dni}
      if [ $lon != 9 ]
      then
         echo "El DNI no tiene el formato correcto."
         read -p "¿Quieres probar otra vez? S/N " x
         if [[ $x = N || $x = n ]]
         then
            echo "Saliendo del programa..."
            y=1
         else
            read -p "Cual es tu DNI: " dni
            y=0
         fi
       else
    numero=${dni:0:8}

    letra=${dni:8:1}

    let resto=$numero%23

    cadenaLetras=TRWAGMYFPDXBNJZSQVHLCKEO

    letraCorrecta=${cadenaLetras:$resto:1}

    if [ $letraCorrecta == $letra ]
    then
	y=1
	echo "El DNI es correcto"
    else
	echo "El DNI es incorrecto"
	read -p "¿Quieres probar otra vez? S/N " x
	if [[ $x = N || $x = n ]]
	then
	   echo "Saliendo del programa..."
	   y=1
	else
	   read -p "Cual es tu DNI: " dni
	   y=0
	fi
    fi
    fi
  done
fi
