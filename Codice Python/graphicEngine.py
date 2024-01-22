import tkinter as tk
from PIL import ImageTk, Image
import time as t

# crea una finestra
window = tk.Tk()
window.configure(background="black")

# dimensioni finestra
window.geometry("640x480")
window.resizable(False, False)

# titolo finestra
window.title("Tris")

# immagini usate
blank_grid = tk.PhotoImage(file="griglia_vuota.png")
Owins = tk.PhotoImage(file="O_wins2.png")
Xwins = tk.PhotoImage(file="X_wins2.png")
draw = tk.PhotoImage(file="draw2.png")
X = tk.PhotoImage(file="SimboloX.png")
O = tk.PhotoImage(file="SimboloO.png")
tX = tk.PhotoImage(file="turnX.png")
tO = tk.PhotoImage(file="turnO.png")

# animazione in ingresso
en1 = ImageTk.PhotoImage(file="ingresso/1.png")
en2 = ImageTk.PhotoImage(file="ingresso/2.png")
en3 = ImageTk.PhotoImage(file="ingresso/3.png")
en4 = ImageTk.PhotoImage(file="ingresso/4.png")
en5 = ImageTk.PhotoImage(file="ingresso/5.png")
en6 = ImageTk.PhotoImage(file="ingresso/6.png")
en7 = ImageTk.PhotoImage(file="ingresso/7.png")
en8 = ImageTk.PhotoImage(file="ingresso/8.png")
en9 = ImageTk.PhotoImage(file="ingresso/9.png")
en10 = ImageTk.PhotoImage(file="ingresso/10.png")
en11 = ImageTk.PhotoImage(file="ingresso/11.png")
en12 = ImageTk.PhotoImage(file="ingresso/12.png")
en13 = ImageTk.PhotoImage(file="ingresso/13.png")

# animazione in uscita
ex1 = ImageTk.PhotoImage(file="uscita/1.png")
ex2 = ImageTk.PhotoImage(file="uscita/2.png")
ex3 = ImageTk.PhotoImage(file="uscita/3.png")
ex4 = ImageTk.PhotoImage(file="uscita/4.png")
ex5 = ImageTk.PhotoImage(file="uscita/5.png")
ex6 = ImageTk.PhotoImage(file="uscita/6.png")
ex7 = ImageTk.PhotoImage(file="uscita/7.png")
ex8 = ImageTk.PhotoImage(file="uscita/8.png")
ex9 = ImageTk.PhotoImage(file="uscita/9.png")
ex10 = ImageTk.PhotoImage(file="uscita/10.png")
ex11 = ImageTk.PhotoImage(file="uscita/11.png")

def init():
    # schermata iniziale
    background = tk.Label(window, image=blank_grid)
    background.place(x=0, y=0, relwidth=1, relheight=1)
    print("Schermata iniziale")
    window.update()

def placeX(cell):
    if cell == 0:
        symbolX0 = tk.Label(window, image=X, borderwidth=0)
        symbolX0.place(x=170, y=90)  # posiziono X sulla casella 0
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 1:
        symbolX1 = tk.Label(window, image=X, borderwidth=0)
        symbolX1.place(x=274, y=90)  # posiziono X sulla casella 1
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 2:
        symbolX2 = tk.Label(window, image=X, borderwidth=0)
        symbolX2.place(x=375, y=90)  # posiziono X sulla casella 2
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 3:
        symbolX3 = tk.Label(window, image=X, borderwidth=0)
        symbolX3.place(x=170, y=194)  # posiziono X sulla casella 3
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 4:
        symbolX4 = tk.Label(window, image=X, borderwidth=0)
        symbolX4.place(x=274, y=194)  # posiziono X sulla casella 4
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 5:
        symbolX5 = tk.Label(window, image=X, borderwidth=0)
        symbolX5.place(x=375, y=194)  # posiziono X sulla casella 5
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 6:
        symbolX6 = tk.Label(window, image=X, borderwidth=0)
        symbolX6.place(x=170, y=294)  # posiziono X sulla casella 6
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 7:
        symbolX7 = tk.Label(window, image=X, borderwidth=0)
        symbolX7.place(x=274, y=294)  # posiziono X sulla casella 7
        #print("Nuova X sulla casella " + str(cell))

    elif cell == 8:
        symbolX8 = tk.Label(window, image=X, borderwidth=0)
        symbolX8.place(x=375, y=294)  # posiziono X sulla casella 8
        #print("Nuova X sulla casella " + str(cell))
    else:
            print("Errore: comando non riconosciuto")
    window.update()


def placeO(cell):
    if cell == 0:
        symbolO0 = tk.Label(window, image=O, borderwidth=0)
        symbolO0.place(x=170, y=90)  # posiziono O sulla casella 0
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 1:
        symbolO1 = tk.Label(window, image=O, borderwidth=0)
        symbolO1.place(x=274, y=90)  # posiziono O sulla casella 1
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 2:
        symbolO2 = tk.Label(window, image=O, borderwidth=0)
        symbolO2.place(x=375, y=90)  # posiziono O sulla casella 2
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 3:
        symbolO3 = tk.Label(window, image=O, borderwidth=0)
        symbolO3.place(x=170, y=194)  # posiziono O sulla casella 3
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 4:
        symbolO4 = tk.Label(window, image=O, borderwidth=0)
        symbolO4.place(x=274, y=194)  # posiziono O sulla casella 4
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 5:
        symbolO5 = tk.Label(window, image=O, borderwidth=0)
        symbolO5.place(x=375, y=194)  # posiziono O sulla casella 5
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 6:
        symbolO6 = tk.Label(window, image=O, borderwidth=0)
        symbolO6.place(x=170, y=294)  # posiziono O sulla casella 6
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 7:
        symbolO7 = tk.Label(window, image=O, borderwidth=0)
        symbolO7.place(x=274, y=294)  # posiziono O sulla casella 7
        #print("Nuova O sulla casella " + str(cell))

    elif cell == 8:
        symbolO8 = tk.Label(window, image=O, borderwidth=0)
        symbolO8.place(x=375, y=294)  # posiziono O sulla casella 8
        #print("Nuova O sulla casella " + str(cell))
    else:
        print("Errore: comando non riconosciuto")
    window.update()


def turnChange(turn):  # va inizializzato il turno fuori dalla funzione
    if turn == 0:
        turnO = tk.Label(window, image=tO, borderwidth=0)
        turnO.place(x=212, y=410)
        print("Turno: O")

    elif turn == 1:
        turnX = tk.Label(window, image=tX, borderwidth=0)
        turnX.place(x=212, y=410)
        print("Turno: X")

    else:
        print("Errore: comando non riconosciuto")
    window.update()

def endGame(result):
    if result[0] == 1 and result[1] == 1:  # pareggio
        drawL = tk.Label(window, image=draw, borderwidth=0)
        drawL.place(x=212, y=410)
        print("Pareggio")

    elif result[0] == 0 and result[1] == 1:  # vince O
        OwinsL = tk.Label(window, image=Owins, borderwidth=0)
        OwinsL.place(x=212, y=410)
        print("Vince O")

    elif result[0] == 1 and result[1] == 0:  # vince X
        XwinsL = tk.Label(window, image=Xwins, borderwidth=0)
        XwinsL.place(x=212, y=410)
        print("Vince X")

    else:
        print("Non ha ancora vinto nessuno")
    window.update()

def refresh():  # metto sopra un nuovo background
    background_new = tk.Label(window, image=blank_grid)
    background_new.place(x=0, y=0, relwidth=1, relheight=1)
    init()
    window.update()
    print("Nuova partita")

def animationStart():
    print("Animazione d'entrata")
    enter1 = tk.Label(window, image=en1)
    enter2 = tk.Label(window, image=en2)
    enter3 = tk.Label(window, image=en3)
    enter4 = tk.Label(window, image=en4)
    enter5 = tk.Label(window, image=en5)
    enter6 = tk.Label(window, image=en6)
    enter7 = tk.Label(window, image=en7)
    enter8 = tk.Label(window, image=en8)
    enter9 = tk.Label(window, image=en9)
    enter10 = tk.Label(window, image=en10)
    enter11 = tk.Label(window, image=en11)
    enter12 = tk.Label(window, image=en12)
    enter13 = tk.Label(window, image=en13)

    enter1.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter2.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter3.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter4.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter5.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter6.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter7.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter8.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter9.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter10.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter11.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter12.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    enter13.place(x=0, y=0, relwidth=1, relheight=1)
    window.update()
    init()


def animationFinish():
    print("Animazione d'uscita")
    exit1 = tk.Label(window, image=ex1)
    exit2 = tk.Label(window, image=ex2)
    exit3 = tk.Label(window, image=ex3)
    exit4 = tk.Label(window, image=ex4)
    exit5 = tk.Label(window, image=ex5)
    exit6 = tk.Label(window, image=ex6)
    exit7 = tk.Label(window, image=ex7)
    exit8 = tk.Label(window, image=ex8)
    exit9 = tk.Label(window, image=ex9)
    exit10 = tk.Label(window, image=ex10)
    exit11 = tk.Label(window, image=ex11)

    exit1.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit2.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit3.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit4.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit5.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit6.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit7.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit8.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit9.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit10.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    exit11.place(x=0, y=0, relwidth=1, relheight=1)
    t.sleep(0.3)
    window.update()
    print("Spegnimento interfaccia grafica")


def prova():
    # sequenza di prova
    animationStart()
    init()
    t.sleep(1)
    turnChange(1)
    t.sleep(2)
    placeO(0)
    t.sleep(1)
    turnChange(0)
    placeX(1)
    t.sleep(1)
    turnChange(1)
    placeO(2)
    t.sleep(1)
    turnChange(0)
    placeX(3)
    t.sleep(1)
    turnChange(1)
    placeO(4)
    t.sleep(1)
    turnChange(0)
    placeX(5)
    t.sleep(1)
    turnChange(1)
    placeO(6)
    t.sleep(1)
    turnChange(0)
    placeX(7)
    t.sleep(1)
    turnChange(1)
    placeO(8)
    t.sleep(1)
    endGame([0, 1])
    animationFinish()



