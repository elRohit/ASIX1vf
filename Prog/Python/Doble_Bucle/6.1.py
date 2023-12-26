cuantasP = int(input("Cuantas personas hay: "))
contadorP = 0
personas = []
personaN = ""
while contadorP < cuantasP:
    personaN = input("Introduce el nombre de la persona " + str(contadorP + 1) + ": ")
    personas.append(personaN)
    contadorP += 1
notas = []
for persona in personas:
    if persona != "fin":
        cuantasNotas = int(input("Cuantas notas tiene " + persona + ": "))
        contadorN = 0
        while contadorN < cuantasNotas:
            nota = int(input("Introduce la nota " + str(contadorN + 1) + ": "))
            notas.append(nota)
            contadorN += 1
            if contadorN == cuantasNotas:
                print(f"La nota media de persona es {sum(notas)/len(notas):0.2f}")
                print("La nota mas alta de " + persona + " es " + str(max(notas)))
                print("La nota mas baja de " + persona + " es " + str(min(notas)))
                print("La diferencia entre la nota mas alta y la mas baja de " + persona + " es " + str(max(notas) - min(notas)))
                print("Ha suspendido " + str(len([nota for nota in notas if nota < 5])) + " asignaturas")
                print("Ha aprobado " + str(len([nota for nota in notas if nota >= 5])) + " asignaturas")
            notas = []
