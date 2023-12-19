llista = ["Caracola 27", "Koal-Kao", "Almendruco23", "10Algar34"]
for lletra in llista[0]:
    print(lletra)
    

    for paraula in llista:
        print("Paraula:", paraula)
        print("Comença per:", paraula[0])
        print("Acaba en:", paraula[-1])

        if len(paraula) % 2 == 1:
            print("Caràcter del mig:", paraula[len(paraula) // 2])
        else:
            print("Caràcters del mig:", paraula[len(paraula) // 2 - 1], "-", paraula[len(paraula) // 2])

        print()

