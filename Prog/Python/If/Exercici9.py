paraula1 = input("Ingresa una palabra: ")
paraula2 = input("Ingresa una 2a palabra: ")   

if paraula1[-3:] == paraula2[-3:]:
    print(f"Las palabras tienen sentido")
else:
    print(f"Las palabras no tienen sentido")