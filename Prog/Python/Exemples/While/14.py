# Fes un programa que llegeixi una string i que generi 2 noves strings, 1 amb tots els caràcters que ocupen posicions parells, i altra amb tots els que ocupen posicions senars.

string = input("Introdueix una string: ")

while string != "":
    parell = ""
    senar = ""
    for i in range(len(string)):
        if i % 2 == 0:
            parell += string[i]
        else:
            senar += string[i]
    print("Parell: " + parell)
    print("Senar: " + senar)
    string = input("Introdueix una string: ")