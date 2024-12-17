# Treball Sistemes Basats en el Coneixement (SBC)

Aquest treball és una pràctica de l'assignatura de Intel·ligència Artificial de la Facultat d'Informàtica de Barcelona (FIB) de la Universitat Politècnica de Catalunya (UPC), el Q1 del curs 2024/2025.
El treball consisteix a crear un sistema basat en el coneixement (SBC) que recomani uns quadres d'un museu segons les preferències dels visitants. Més informació es pot trobar tant a l'enunciat de la pràctica com a la documentació d'aquesta. El treball ha sigut realitzat per un grup de tres persones:

Per a l'execució del programa es necessita CLIPS, el llenguatge funcional amb el qual s'ha programat. Es recomana l'ús del visualitzador CLIPSIDE (ve integrat amb la descàrrega de CLIPS).

- Pablo Calomardo
- Diego Moreno
- Enric Segarra

Aquesta pràctica està dividida en 3 mòduls i té 2 maneres d'operar: la manual i la dels jocs de prova.

Passos obligatoris:

1. Ontologia-Definitiva.clp és el codi del programa i és el primer que s'ha de carregar a clips fent (load Ontologia-Definitiva.clp)
2. DistribucioEpoques.clp i DistribucioVariada.clp són dues distribucions diferents de les obres d'un museu (es poden considerar museus diferents) cal que per l'execució es faci només load d'un d'aquests.

A partir d'aquí pots triar si introduir els visitants manualment o en un fitxer clp, si vols executar jocs de prova només cal que facis (load JocProvaX.clp) (reset) (run) en aquest ordre
En cas que vulguis afegir els visitants manualment cal fer (reset) (run) i seguir les instruccions que es mostren en pantalla.

En cas de voler definir un Joc de prova propi, cal:
1. Crear un fitxer .clp on estiguin definides les instàncies de la classe visitant i visita tal com als Jocs de prova d'exemple
2. Seguir els passos per a executar jocs de prova (carregar l'ontologia, la distribució, el teu joc de prova i fer (reset) i (run)).
