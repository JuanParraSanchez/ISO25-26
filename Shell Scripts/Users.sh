#!/bin/bash
# Autor: Juan Parra
# Fecha: 19/02/2026
# Entregable 4: Users.sh

clear

if [ $# -eq 1 ]; then
	ref=$1
else
	ref=1000
fi
if [ $UID -ne 0 ]; then
	echo "NO ERES ROOT."
	exit
fi

fecha=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")


echo "------------------------------"
echo
echo "Informe de usuarios el dia $fecha a las $hora"
echo

lineas=$(cat /etc/passwd)
total=0
for l in $lineas; do
	u=$(echo $l | cut -d ":" -f 3)
	user=$(echo $l | cut -d ":" -f 1)
	if [ $u -ge $ref 2>/dev/null ]; then
		echo "$user - $u"
		total=$(($total + 1))
	fi
echo "$fecha - $hora - El usuario $USER ha solicitado un informe de usuarios" >> /tmp/logeventos
done

echo "Total: $total usuarios"
echo
echo "---------------------------------------"
