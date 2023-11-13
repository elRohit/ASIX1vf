# Inputs
nom = input("Introdueix el teu nom: ")
pes = float(input("Introdueix el teu pes : "))
alçada = float(input("Introdueix la teva alçada : "))
# Calculs
imc = pes / alçada**2
# Outputs
print(f"Hola {nom} el teu índex de massa corporal és {imc:.2f}")

# Millora
if imc < 18.5:
    print("Vigila! Segurament hagis de menjar més")
elif imc >= 25:
    print("Vigila! Segurament tinguis sobrepès")
else:
    print("Molt bé! Estàs en el teu pes ideal")

# Millora 2
#Sobrepeso o delgadez exacta
