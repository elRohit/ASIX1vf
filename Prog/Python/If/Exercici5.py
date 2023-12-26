n1 = int(input("Digues el primer número: "))
n2 = int(input("Digues el segon número: "))
n3 = int(input("Digues el tercer número: "))

if (n1 > n2) and (n1 > n3):
    print(f"El número más gran es {n1}")
elif (n2 > n1) and (n2 > n3):
    print(f"El número más gran es {n2}")
else: 
    print(f"El número más gran es {n3}")



