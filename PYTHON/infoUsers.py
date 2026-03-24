#Entregable INFOUSERS.PY
#AUTOR: JUAN PARRA
#FECHA: 24/03/2026

import os
import cpuinfo

#Comprobamos si el usuario es root
if os.getuid() != 0:
    print("Error: El script solo lo puede ejecutar el root.")
    exit()

opcion = 0

while opcion != 4:
    print("\n--- MENÚ PRINCIPAL ---")
    print("1. Informacion del SSOO y CPU")
    print("2. Buscar o crear usuario")
    print("3. Comprobar o crear directorio")
    print("4. Salir")

    opcion = int(input("Seleccione una opcion: "))

    if opcion == 1:
        print("\n--- INFORMACION DEL SISTEMA ---")
        info = os.uname()
        print("Sistema operativo:", info.sysname)
        print("Versión:", info.release)

        print("\n--- INFORMACION DE LA CPU ---")
        cpu = cpuinfo.get_cpu_info()
        print("Modelo:", cpu.get("brand_raw"))
        print("Arquitectura:", cpu.get("arch"))
        print("Bits:", cpu.get("bits"))
        print("Frecuencia:", cpu.get("hz_advertised_friendly"))

    elif opcion == 2:
        usuario = input("Introduzca un usuario: ")
        ruta_home = "/home/" + usuario

        if os.path.exists(ruta_home):
            print("El usuario existe.")
            print("Home:", ruta_home)
        else:
            print("El usuario no existe. Creándolo...")
            os.system(f"useradd -m {usuario}")
            print("Usuario creado.")

    elif opcion == 3:
        ruta_dir = input("Introduzca el directorio: ")

        if os.path.exists(ruta_dir):
            if os.path.isdir(ruta_dir):
                print("El directorio existe.")
            else:
                print("Existe, pero NO es un directorio.")
        else:
            print("No existe. Creándolo...")
            os.mkdir(ruta_dir)
            print("Directorio creado.")

    elif opcion == 4:
        print("Saliendo del programa ...")

    else:
        print("Opción no válida.")
