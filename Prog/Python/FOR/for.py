# Bucles amb una frase
'''
frase = "Hola que tal"
for letra in frase:
    print(f"Lletra: {letra}") 

# Bucles amb input
frase2 = input("Escriu una frase: ")
print(f"El for s'executarà {len(frase2)} vegades")
for lletra in frase2:
    print(f"Lletra: {lletra}")
#print(list(range(1,5)))
#Repetir 4 vegades
for n in range(1,5):
    print(f"El valor de n és {n}")

#Repetir 20 vegades
for n in range(1,21):
    print(f"El valor de n és {n}")
#Repetir valors amb input 5 vegades
for n in range(1,6):
    valor = input("Escriu un valor: ")
    print(f"El valor de n és {valor}")

fruites = ("traonja", "poma", "pera", "maduixa")

for fruita in fruites:
    print(f"Fruita: {fruita} té un alongitud de {len(fruita)} caràcters")

#Convertir strings a llistes
h = "Hola"
lista = list(h)
h[0:2] #primeros dos caràcteres
h[-2:] #últims dos caràcters
l = 1,2,3,4,6,7,8
#girar una llista
l[::-1]
#agafar parells
l[::2]
#agafar imparells
l[1::2]

#generar numeros llista amb range
list(range(3,101,3))
'''
#saber el numeor de mes amb llistes
nomMesos=("Gener", "Febrer", "Març", "Abril", "Maig", "Juny", "Juliol", "Agost", "Setembre", "Octubre", "Novembre", "Desembre")
numeroMes = int(input("Escriu un número de mes: "))
print(f"El mes {numeroMes} és {nomMesos[numeroMes-1]}")