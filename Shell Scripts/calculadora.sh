#!/bin/bash
#Juan Parra
#05/02/2026
#Entregable 2 calculadora


clear

echo "Autor: Juan Parra "

if [ $# -ne 2 ]; then
	echo "Error: Número de parámetros incorrecto."
	exit
fi

if [ -s $1 ]; then
	echo "El archivo no existe"
	exit
fi


echo
echo "---OPERACIONES--- "
echo "SUMA: S"
echo "RESTA: R"
echo "DIVISION: D"
echo "MULTIPLICACIÓN: M"
echo "SALIR: X"
echo


for ((i=0; i<$2; i++)); do

	read -p "Operación Op1 Op2: " op op1 op2

case $op in

	"S")
		res=$(($op1 + $op2))
		echo $res
		echo "$op $op1 $op2" >> $1
		echo
	;;


	"R")
		res=$(($op1 - $op2))
                echo $res
                echo "$op $op1 $op2" >> $1
                echo

	;;


	"D")
                res=$(($op1 / $op2))
                echo $res
                echo "$op $op1 $op2" >> $1
                resto=$((op1 % op2))
		echo $resto
		echo "Resto: $resto" >> $1

        ;;


	"M")
                res=$(($op1 * $op2))
                echo $res
                echo "$op $op1 $op2" >> $1
                echo

        ;;


	"X")
		echo "Saliendo..."
		break

	;;


	"*")
		echo "Opción incorrecta"
		echo

	;;

esac
done

pwd $1
cat $1
