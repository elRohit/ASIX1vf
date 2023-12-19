import pygame as pg
import random
random.seed()

def missatge():
    estilFont = pg.font.SysFont("arialblack",30)
    msgFormatat = estilFont.render("La cagaste",True,colors["vermell"])
    pantalla.blit(msgFormatat,[10,10])
    pg.display.update()
    temporitzador.tick(1)

def nouMenjar():
    x = random.randint(0,amplada-mida)//mida*mida
    y = random.randint(0,alcada-mida)//mida*mida
    return {"x":x,"y":y}

def mostrarSerp():
    for x,y in serp:
        pg.draw.rect(pantalla,colors["blau"],[x,y,mida,mida])

def foraPantalla():
    if x<0 or x>amplada or y<0 or y>alcada:
        return True
    else:
        return False
    #return x<0 or x>amplada or y<0 or y>alcada

def serpMenjaSerp():
    if (x,y) in serp:
        return True
    else:
        return False
    
    
mida=20
amplada= 600
alcada =400
x=amplada//2
y=alcada//2
incX=-mida
incY=0
serp=[]
longitud=40

pg.init()
temporitzador = pg.time.Clock()

pantalla = pg.display.set_mode((amplada,alcada))
pg.display.set_caption("La víbora")
pg.display.update()
fiJoc=False

colors = {"blau" : (0,0,255),
          "vermell": (255,0,0),
          "blanc" : (255,255,255),
          "verd"    : (0,255,0)
    }

direccions={pg.K_LEFT: {"x":-mida,"y":0},
          pg.K_RIGHT: {"x":+mida,"y":0},
          pg.K_UP   : {"x":0,"y":-mida},
          pg.K_DOWN : {"x":0,"y":+mida}
    }


menjar = nouMenjar()
while not fiJoc:
    for event in pg.event.get():
        if event.type == pg.QUIT:
            fiJoc = True
        if event.type == pg.KEYDOWN:
            if event.key in direccions:
                incX=direccions[event.key]["x"]
                incY=direccions[event.key]["y"]

    serp.append((x,y))
    if len(serp)>longitud:
        serp.pop(0)
    
    x = x + incX
    y = y + incY

        
    pantalla.fill(colors["blanc"])

    mostrarSerp()
    
    pg.draw.rect(pantalla,colors["verd"],[menjar["x"],menjar["y"],mida,mida])

    if foraPantalla() or serpMenjaSerp():
        missatge()      
        fiJoc = True


    if x == menjar["x"] and y == menjar["y"]:
        menjar=nouMenjar()
        longitud+=1
        
        
    pg.display.update()
    temporitzador.tick(10)

pg.quit()   