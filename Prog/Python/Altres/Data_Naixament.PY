from datetime import *
dia = int(input("Dia: "))
mes= int(input("Mes: "))
anny = int(input("Any: "))
dataNaixament = datetime(anny,mes,dia)
diaSetmana = f"{dataNaixament:%A}"
diesVida = (datetime.now() - dataNaixament).days
print(f"Vas neixer en {diaSetmana}")
print(f"Portes en aquest món {diesVida} dies")