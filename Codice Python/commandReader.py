from graphicEngine import *

def decoder(command):
    if command[0] == 1:  # controllo speciale
        animationStart()
        refresh()
        turnChange(command[19])


    else:  # controllo normale (stato)

        # aggiornamento griglia X
        for i in range(1, 10, 1):
            if command[i] == 1:
                placeX(i- 1)
            else:
                pass

        # aggiornamento griglia O
        for i in range(10, 19, 1):
            if command[i] == 1:
                placeO(i - 10)
            else:
                pass

        # controllo del turno
        turnChange(command[19])

        # controllo del risultato
        endGame([command[20], command[21]])

        if (command[20] != 0 or command[21] != 0):
            t.sleep(5)
            animationFinish()
        else:
            pass


def provaCod():
    data1 = [1, 0, 0, 0, 0, 0, 0, 0]
    data2 = [0, 0, 0, 0, 0, 0, 0, 0]
    data3 = [0, 0, 0, 0, 0, 0, 0, 0]

    decoder(data1 + data2 + data3) # turn ON

    t.sleep(3)

    data1 = [0, 0, 0, 0, 0, 0, 0, 0]
    data2 = [0, 0, 1, 0, 0, 0, 0, 0]
    data3 = [0, 0, 0, 1, 0, 0, 0, 0]

    decoder(data1 + data2 + data3) # O in 0

    t.sleep(1)

    data1 = [0, 0, 1, 0, 0, 0, 0, 0]
    data2 = [0, 0, 1, 0, 0, 0, 0, 0]
    data3 = [0, 0, 0, 0, 0, 0, 0, 0]

    decoder(data1 + data2 + data3) # X in 1

    t.sleep(1)

    data1 = [0, 0, 1, 0, 0, 0, 0, 0]
    data2 = [0, 0, 1, 0, 0, 1, 0, 0]
    data3 = [0, 0, 0, 1, 0, 0, 0, 0]

    decoder(data1 + data2 + data3) # O in 3

    t.sleep(1)

    data1 = [0, 0, 1, 0, 0, 1, 0, 0]
    data2 = [0, 0, 1, 0, 0, 1, 0, 0]
    data3 = [0, 0, 0, 0, 0, 0, 0, 0]

    decoder(data1 + data2 + data3) # X in 4

    t.sleep(1)

    data1 = [0, 0, 1, 0, 0, 1, 0, 0]
    data2 = [0, 0, 1, 0, 0, 1, 0, 0]
    data3 = [1, 0, 0, 1, 0, 1, 0, 0]

    decoder(data1 + data2 + data3) # O in 6

    t.sleep(1)

    data1 = [1, 0, 0, 0, 0, 0, 0, 0]
    data2 = [0, 0, 0, 0, 0, 0, 0, 0]
    data3 = [0, 0, 0, 0, 0, 0, 0, 0]

    decoder(data1 + data2 + data3)  # reset

    t.sleep(1)

    data1 = [0, 0, 0, 0, 0, 0, 0, 0]
    data2 = [0, 0, 0, 0, 0, 0, 0, 0]
    data3 = [0, 1, 0, 1, 0, 0, 0, 0]

    decoder(data1 + data2 + data3)  # O in 7

    t.sleep(10)


