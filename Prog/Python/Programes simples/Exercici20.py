import math
H1 = int(input("Altura de la paret: "))
A1 = int(input("Puja aquests metres x dia: "))
B1 = int(input("Baixa aquests metres x nit: "))

diasN = ((H1 - A1) + (A1 - B1) -1) // (A1 - B1) + 1

print(f"El cargol tardará {diasN} dies per pujar la paret de {H1} metres. ")

# -----------------------------------------------------------------------------------

# Act - José Moreno
dies = math.ceil((H1-B1) // (A1-B1))
dies2 = (H1-B1) // (A1-B1) + bool((H1-B1) % (A1-B1))
dies3 = (H1-B1 -1) // (A1-B1) + 1
print(f"El cargol tardarà {dies} dies per pujar els {H1} metres en pujar la paret")
print(f"El cargol tardarà {dies2} dies per pujar els {H1} metres en pujar la paret")
print(f"El cargol tardarà {dies3} dies per pujar els {H1} metres en pujar la paret")