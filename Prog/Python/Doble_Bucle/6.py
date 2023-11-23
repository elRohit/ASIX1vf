a = " "
romperAfUERZA = False
while romperAfUERZA == False:
    a = input("Introduce el nombre del alumno y sus datos: ").split(",")
    Notas = []
    
    for i in a:
        if i.isnumeric():
            Notas.append(int(i))
    nombre_alumno = a[0]
    num_materias = len(Notas)
    suma_notas = sum(Notas)
    media_notas = suma_notas // num_materias
    num_suspendidas = len([nota for nota in Notas if nota < 5])
    porcentaje_suspendidas = (num_suspendidas / num_materias) * 100

    print("Alumno:", nombre_alumno)
    print("Media de notas:", media_notas)
    print("Número de materias evaluadas:", num_materias)
    print("Número de asignaturas suspendidas:", num_suspendidas)
    print("porcentaje de asignaturas suspendidas:", porcentaje_suspendidas)
    if input("¿Desea continuar? (S/n): ") == "n":
        romperAfUERZA = True

