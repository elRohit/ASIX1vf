cip = input("CIP: ")
nom = input("Nom: ")
cognom1 = input("1r Cognom: ")
cognom2 = input("2n Cognom: ")
dNaix = input("Data naixement DD/MM/YYYY: ")

cog1 = cip[0:2].upper()
cog2 = cip[2:4].upper()
sexe = cip[4]
Any = cip[5:7]
mes = cip[7:9]
dia = cip[9:11]

if sexe == "1":
    print("Sexe: Dona")   
else:
    print("Sexe: Home")

if (Any == dNaix[8:] and
    mes == dNaix[3:5] and
    dia == dNaix[0:2]):
    
    print("Data Correcta")
    dataOK=True
else:
    print("Data Incorrecta")
    dataOK=False

if (cog1 == cognom1[:2].upper() and
    cog2 == cognom2[:2].upper()):
    print("Cognoms correctes")
    cognomsOK=True
else:
    print("Cognoms incorrectes")
    cognomsOK=False

if dataOK and cognomsOK:
    print("La tarja té bona pinta")
else:
    print("La tarja sembla incorrecta")