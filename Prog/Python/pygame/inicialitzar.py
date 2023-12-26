import pygame as pg 









pg.init()
timer = pg.time.Clock()

midaPantalla = 500
midaSerp = 20
delay = 10 

colors = { "blau": (0, 0, 255), "vermell": (255, 0, 0), "verd": (0, 255, 0), "negre": (0, 0, 0), "blanc": (255, 255, 255) }

estilFont = pg.font.SysFont("Arial", 20)
msgFormatat = estilFont.render("Eres botardo tio", True, colors["blau"])

mig = midaPantalla // 2

x= mig
y= mig
incX = midaSerp
incY = 0

pantalla = pg.display.set_mode((midaPantalla, midaPantalla))
pg.display.set_caption("Nokia_Snake")
pantalla.fill((255, 0, 0))  # Set screen color to red
pg.display.update()



# Finalitzar el joc
fiJoc=False

while not fiJoc:
    for event in pg.event.get(): # get() AGAFAR INFORMACIÓ
        if event.type == pg.QUIT:
            fiJoc=True
        if event.type == pg.KEYDOWN:
            if event.key == pg.K_LEFT:
                incX = -midaSerp
                incY = 0
            elif event.key == pg.K_RIGHT:
                incX = +midaSerp
                incY = 0
            elif event.key == pg.K_UP:
                incX = 0
                incY = -midaSerp
            elif event.key == pg.K_DOWN:
                incX = 0
                incY = +midaSerp
            elif event.key == pg.K_SPACE:
                incX = 0
                incY = 0
        
        pg.draw.rect(pantalla, (0,0,255) , [x,y,midaSerp,midaSerp])
        pg.display.update()

        if x < 0 or x > midaPantalla or y < 0 or y > midaPantalla:
            pantalla.blit(msgFormatat, (mig - msgFormatat.get_width() // 2, mig - msgFormatat.get_height() // 2))
        x = x + incX
        y = y + incY

        timer.tick(delay)
                
                