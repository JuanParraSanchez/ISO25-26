#!/bin/bash
#Autor: Juan Parra
#Fecha: 29/01/2026
#Agenda


clear



while true; do

	echo
	echo "---AGENDA---"
	echo "a)Añadir una entrada."
	echo "b)Buscar por DNI."
	echo "c)Ver la agenda completa."
	echo "d)Eliminar todas las entradas de la agenda"
	echo "e)Finalizar"
	read -p "Elija una opción: " opc

	case $opc in
		a)

			read -p "Introduzca un DNI: " dni
				if grep "$dni" "agenda.txt" >/dev/null ; then
					echo "Este DNI ya esta dado de alta."
				else
					read -p "Introduzca el nombre de usuario: " nom
					read -p "Introduzca los apellidos: " ape
					read -p "Introduzca la localidad: " loc
					echo "$dni:$nom$ape:$loc" >> agenda.txt
					echo "El usuario se ha dado de alta. "
				fi
		;;


		b)

			read -p "Introduzca un DNI: " dni
				nombre=$(grep "$dni" "agenda.txt" | cut -d ":" -f 2)
				apellidos=$(grep "$dni" "agenda.txt" | cut -d ":" -f 3)
				localidad=$(grep "$dni" "agenda.txt" | cut -d ":" -f 4)
				if [ grep "$dni" "agenda.txt" ]; then
					echo "Este DNI: $dni corresponde a: $nombre $apellidos, el cual reside en $localidad"
				else
					echo "Error: EL USUARIO NO EXISTE."
				fi
		;;



		c)
			if [ -s "agenda.txt" ]; then
				cat "agenda.txt"
			else
				echo "Agenda vacía."
			fi
		;;


		d)
			 > "agenda.txt"

		;;


		e)
			echo "Saliendo..."
				exit

		;;


		*)

			echo "Error: OPCIÓN INCORRECTA"
		;;


	esac

done
