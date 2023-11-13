edat = int(input("Digues la teva edat: "))


if edat >19:
    dif = edat - 18
    print(f"Hace {dif} años que eres mayor de edad")
elif edat == 18:
    print("Te acabas de estrenar en la mayoria de edad")
elif edat ==17:
    print("Te fata un año para ser mayor de edad")
elif edat == 19:
    print(f" Hace un año que eres mayor de edad")
    
else: 
    print(f"Te faltan {dif} años para ser mayor de edad")
    