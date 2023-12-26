a = int(input("Introdueix un any en format AAAA: "))

#modul

#condicions
if a % 400 == 0:
    print(f"{a} es BISIESTO")
else:
    if a % 4 == 0 and a % 100 != 0:
        print(f"{a} es BISIESTO")
    else:
        print(f"{a} NO es BISIESTO")