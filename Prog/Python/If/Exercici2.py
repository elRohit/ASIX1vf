edad1 = int(input("Ingrese su edad: "))
falt1 = 18 - edad1
if edad1 >= 18:
    print("Eres mayor de edad")
    if edad1 == 18:
        print("Te acabas de estrenar en la mayoria de edad")
else:
    print("Eres18 menor de edad")
    print(f"Te faltan {falt1} años para ser mayor de edad")


#RESULTAT
'''
edat = int(input("Ingrese su edad: "))
if edat > 18:
    dif = edat - 18
    print(f"Hace {dif} años que eres mayor de edad")
    elif edat == 18:
        print("Te acabas de estrenar en la mayoria de edad")
    else:
        print(f"Te faltan {dif} años para ser mayor de edad")'''