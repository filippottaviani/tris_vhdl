from graphicEngine import *
from commandReader import *
import serial

# AVVIO INTERFACCIA
#init()

# PROVA ANIMAZIONI
#prova()

# PROVA LETTURA CODIFICA
#provaCod()

# PROVA ACCENSIONE
#command = [0,0,0,1,1,0,0,1,0,0,0,1,0,0,1,0,0,1,1,1,0,1,0,0] # scenario da testbench

# ISTANZIAZIONE SERIALE
ser = serial.Serial('COM10', 9600, timeout=1)
print("connesso a: " + ser.portstr)
bits_list = []

while True:
    dati = ser.read(3)
    #print(dati)
    for byte in dati:
        for i in range(8):
            bit_value = (byte >> i) & 1
            bits_list.append(int(bit_value))
    if dati:
        print(bits_list)
    bits_list.clear()


    # mi interessano solo comandi nuovi
    if new_command != command: # se c'è un comando nuovo
        command = new_command
        print("Nuovo comando:" + str(command))
        decoder(command)
    else:
        pass

# istanzia finestra
window.mainloop()

if __name__ == "main":
    window.mainloop()


