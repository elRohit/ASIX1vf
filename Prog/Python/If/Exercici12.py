fechaNa = input("Ingrese las fechas de nacimiento en formato DD/MM/YYYY: ").split("/")
fechaAc = input ("Ingrese la fecha actual en formato DD/MM/YYYY: ").split("/")

if int(fechaNa[1]) > int(fechaAc[1]):
    if int(fechaNa[0]) >= int(fechaAc[0]):
        print(f"El teu cumple fue el {int(fechaNa[0])}/{int(fechaNa[1])}/{int(fechaAc[2])}")

if int(fechaNa[1]) == int(fechaAc[1]):
    if int(fechaNa[0]) > int(fechaAc[0]):
        print(f"El teu cumple será el {int(fechaNa[0])}/{int(fechaNa[1])}/{int(fechaAc[2])}")
    if int(fechaNa[0]) == int(fechaAc[0]):
        print(f"FELICIDADES TU CUMPLEAÑOS ES HOY")
    if int(fechaNa[0]) < int(fechaAc[0]):
        print(f"El teu cumple fue el {int(fechaNa[0])}/{int(fechaNa[1])}/{int(fechaAc[2])}")
        
if int(fechaNa[1]) < int(fechaAc[1]):
    if int(fechaNa[0]) <= int(fechaAc[0]):
        print(f"El teu cumple fue el {int(fechaNa[0])}/{int(fechaNa[1])}/{int(fechaAc[2])}")