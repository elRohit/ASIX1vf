import random
pals=['Bastos','Copes','Espases','Oros']
valors=['1','2','3','4','5','6','7','Sota','Cavall','Rei']
baralla=[]
for pal in pals:
    for valor in valors:
        baralla.append(f"{valor} : {pal}")


# baralla 
random.shuffle(baralla)
cartes_jugador=[]
descartes=[]
for i in range(3):
    cartes_jugador.append(baralla.pop())
while baraja:
    print(cartes_jugador)
    descarte = input("Quina carta vols descartar?(1,2,3): ")
    cartes_jugador.pop(descarte -1)
    descartes.append(baralla.pop())