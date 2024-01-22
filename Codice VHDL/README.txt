------------------------------------------------

INDICAZIONI IMPORTANTI PER IL TESBENCH DEL TRIS 

------------------------------------------------

Per poter apprezzare l'uscita della UART ed il 
sincronismo tra le entity si suggerisce di uti-
lizzare un clock con un periodo di 10 ns e un 
periodo di simulazione di 350 ms (se si usa il
testbench).Per una simulazione più scorrevole 
si suggerisce di usare la versione senza deboun-
cing.

Per poter comprendere appieno il significato 
dell'uscita si consiglia di leggere il segnale 
data_in dal grafico della simulazione che ripor-
ta i 24 bit in uscita dal tris.

A causa del debouncing l'uscita relativa ad ogni
pulsante premuto avrà riscontro solo dopo 10 ms 
che il suo valore logico è alto.