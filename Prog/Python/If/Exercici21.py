dni = input("Introdueix el DNI (sense la lletra): ")

# Comprovem que el DNI tingui 8 dígits
if len(dni) != 8:
    print("El DNI ha de tenir 8 dígits")
else:
    # Convertim el DNI a un número enter
    dni_num = int(dni)

    # Calculem la lletra del DNI
    lletres = "TRWAGMYFPDXBNJZSQVHLCKE"
    lletra = lletres[dni_num % 23]

    # Comprovem que la lletra del DNI sigui correcta
    if dni[-1] == lletra:
        print("El DNI és vàlid")
    else:
        print("El DNI no és vàlid")