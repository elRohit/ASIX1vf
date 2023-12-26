# Bucle Infinito
'''
while 5 > 3:
    print("Hola Mundo!")
'''
# Repetir el bucle fins que posi la paraula correcta
'''
s= input("Paraula per sortir: ")
while s != "sortir":
    s= input("Paraula per sortir: ")
'''

# Menú amb While
'''
resposta= ""
while resposta != "4":
    print("1. Saluda")
    print("2. Insulta")
    print("3. Halagar")
    print("4. Sortir")
    resposta = input("Indrodueix una opció: ")  
    if resposta == "1":
        print("Hola!")
    elif resposta == "2":
        print("Ets un idiota!")
    elif resposta == "3":
        print("Que bé ho fas!")
    elif resposta == "4":
        print("Adéu!")
    elif resposta != "4":
        print("Apren a llegir ciego!")
'''         
# ....
'''
paraula= input("Paraula:")
while not(paraula == "fi" or paraula == "acaba"):
    paraula= input("Paraula:")
'''
# Sumar xifres ( SUMADOR)ç
'''
suma= 0
numero= int(input("Numero: "))
strNumero= str(numero)
for xifra in strNumero:
    suma= suma + int(xifra)
    print(xifra)
'''
# Sumar tots els elements d'una llista
llista= [1,2,3,4,5,6,7,8,9,10]
sum = 0
i=0
while i<len(llista) :
    element = llista[i]
    sum = sum + element
    i= i+1
    
print(sum)

