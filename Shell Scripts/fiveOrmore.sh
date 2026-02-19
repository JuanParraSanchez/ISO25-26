#!/bin/bash
# Autor: Juan Parra
# Fecha: 19/02/2026
# Entregable 3: FiveOrMore

clear

function comp_errores (){

	if [ $# -ne 2 ]; then
		echo "Error: Número de parámetros incorrecto. Deben ser 2."
		exit
	fi

	if [ -s $1 ]; then
		echo "Error: El fichero $1 existe."
		exit
	fi

	if [ ! -e $2 ]; then
		echo "El directorio $2 no existe."
		exit
	fi

	dir=$(ls $2)
	if [ -z $dir ]; then
		echo "El directorio $dir está vacío."
		exit
	fi

}

comp_errores $1 $2
echo "---Autor: JUAN PARRA---"

ficheros=0
function extension(){

	for i in $2/*; do

		lineas=$(wc -l < "$i")
		if [[ "$i" == *.txt && $lineas -ge 5 ]]; then
			echo "El fichero $i tiene 5 líneas o más."
			echo "$i" >> "$1"
			ficheros=$(($ficheros + 1))
			echo "El fichero original tiene $(wc -w < $i) palabras." | cat - "$i" > temp.txt && mv temp.txt "$i.q"
			echo
		fi
	done
	echo "$ficheros" >> $1
	total=$(tail -1 $1)
	echo "Número total de ficheros: $total"
}

extension $1 $2

