#!/bin/bash

function crearPueblos()
{
x=5
until [ $x = 0 ]
do
   echo
   read -p "Nombre del pueblo: " pueblo
   echo $pueblo >> pueblos.txt
   echo
   read -p "Pulsa 1 para introducir mas pueblos o 0 para finalizar " x
   if [ $x = 1 ]
   then
      echo
      echo "Continuamos con el programa"
   else
      echo
      echo "Saliendo del programa"
   fi
done
clear
echo "Listado de pueblos en el archivo pueblos.txt"
cat pueblos.txt
}

function calcularResto()
{
if [ $# = 2 ]
then
   echo
   echo "Se va a calcular el resto de $1 entre $2"
   sleep 2
   let R=$(($1%$2))
   return $R
else
   echo
   echo "Tienes que introducir los dos numeros como parametros"
fi
}

op=5

while  [ $op != 4 ]
do
   clear
   echo "1.- Crear archivo pueblos.txt"
   echo "2.- Listar pueblos que empiecen por A ordenados"
   echo "3.- Calcular el resto"
   echo "4.- Salir"
   read -p "Opcion elegida: " op

   case $op in
      1) crearPueblos;;
      2) echo
         echo "Los pueblos que empiezan por A son: "
         sort pueblos.txt | grep ^[A,a];;
      3) calcularResto $*
         echo
         echo "El resto es $R";;
      4) echo
         echo "Salimos del programa";;
   esac
   if [ $op != 4 ]
   then
      echo
      read -p "Pulsa intro para seguir" intro
   fi
done