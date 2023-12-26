costat1 = int(input("Introdueix el valor del 1r costat del triangle: "))
costat2 = int(input("Introdueix el valor del 2n costat del triangle: "))
costat3 = int(input("Introdueix el valor del 3r costat del triangle: "))

if costat1 <= 0 or costat2 <= 0 or costat3 <= 0:
    print("Posa un valor superior a 0")
else:
    if costat1 == costat2 and costat2 != costat3:
        if costat1 + costat2 > costat3:
            print("El triangle és isòsceles")
        else:
            print("No es pot formar un triangle amb aquests costats")
    elif costat1 == costat3 and costat3 != costat2:
        if costat1 + costat3 > costat2:
            print("El triangle és isòsceles")
        else:
            print("No es pot formar un triangle amb aquests costats")
    elif costat2 == costat3 and costat3 != costat1:
        if costat2 + costat3 > costat1:
            print("El triangle és isòsceles")
        else:
            print("No es pot formar un triangle amb aquests costats")
    else:
        print("No es pot formar un triangle isòsceles amb aquests costats")