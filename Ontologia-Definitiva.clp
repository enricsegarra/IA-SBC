;;; ---------------------------------------------------------
;;; Ontologia-Museu-v5-1.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology Ontologia-Museu-v5-1.ttl
;;; :Date 16/12/2024 13:39:08

(defclass Visitant
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot prefereix-epoques
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefereix-estils
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefereix-pintors
        (type INSTANCE)
        (create-accessor read-write))
    (multislot prefereix-tematiques
        (type INSTANCE)
        (create-accessor read-write))
    (slot Coneixement
        (type INTEGER)
        (create-accessor read-write))
    (slot Edat
        (type INTEGER)
        (create-accessor read-write))
    (slot Nom
        (type STRING)
        (create-accessor read-write))
)

(defclass Adolescent
    (is-a Visitant)
    (role concrete)
    (pattern-match reactive)
)

(defclass Adult
    (is-a Visitant)
    (role concrete)
    (pattern-match reactive)
)

(defclass Nen
    (is-a Visitant)
    (role concrete)
    (pattern-match reactive)
)

(defclass Visita
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot VisitaObra
        (type INSTANCE)
        (create-accessor read-write))
    (multislot formada_per
        (type INSTANCE)
        (create-accessor read-write))
    (slot Dies
        (type INTEGER)
        (create-accessor read-write))
    (slot Duracio
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Estil
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Nom
        (type STRING)
        (create-accessor read-write))
)

(defclass Obra
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot TéEstil
        (type INSTANCE)
        (create-accessor read-write))
    (multislot TéTemàtica
        (type INSTANCE)
        (create-accessor read-write))
    (multislot TéÉpoca
        (type INSTANCE)
        (create-accessor read-write))
    (slot pintada_per
        (type INSTANCE)
        (create-accessor read-write))
    (slot Sala
        (type INTEGER)
        (create-accessor read-write))
    (slot Any
        (type INTEGER)
        (create-accessor read-write))
    (slot Complexitat
        (type INTEGER)
        (create-accessor read-write))
    (slot Dimensions
        (type INTEGER)
        (create-accessor read-write))
    (slot Nom
        (type STRING)
        (create-accessor read-write))
    (slot Rellevancia
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Pintor
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot TéEstils
        (type INSTANCE)
        (create-accessor read-write))
    (multislot TéÉpoca
        (type INSTANCE)
        (create-accessor read-write))
    (slot Nacionalitat
        (type STRING)
        (create-accessor read-write))
    (slot Nom
        (type STRING)
        (create-accessor read-write))
)

(defclass Sala
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot BasadaEnEpoca
        (type INSTANCE)
        (create-accessor read-write))
    (multislot BasadaEnEstil
        (type INSTANCE)
        (create-accessor read-write))
    (multislot BasadaEnPintor
        (type INSTANCE)
        (create-accessor read-write))
    (multislot BasadaEnTematica
        (type INSTANCE)
        (create-accessor read-write))
    (multislot ContéObra
        (type INSTANCE)
        (create-accessor read-write))
    (multislot conectadaA
        (type INSTANCE)
        (create-accessor read-write))
    (slot identificador
        (type SYMBOL)
        (create-accessor read-write))
)

(defclass Tematica
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Nom
        (type STRING)
        (create-accessor read-write))
)

(defclass Època
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot Any_final
        (type INTEGER)
        (create-accessor read-write))
    (slot Any_inici
        (type INTEGER)
        (create-accessor read-write))
    (slot Nom
        (type STRING)
        (create-accessor read-write))
)


;;;;;;;;;;;;;;;;;;;
;;;	MODULOS	;;;
;;;;;;;;;;;;;;;;;;;



;;; Modulo principal de utilidades
(defmodule MAIN (export ?ALL))

;; MODUL PER OBTENIR LES PREFERENCIES
(defmodule obtencion-preferencias
	(import MAIN ?ALL)
	(export ?ALL)
)

;; MODUL PER PASSAR LES PREFERENCIES CONCRETES A ABSTRACTES
(defmodule procesado-datos
	(import MAIN ?ALL)
	(export ?ALL)
)

;; Modul per generar les solucions un cop tens les preferencies
(defmodule generacion-soluciones
	(import MAIN ?ALL)
	(export ?ALL)
)

;; MODUL PER IMPRIMIR RESULTATS
(defmodule imprimir-resultados
	(import MAIN ?ALL)
	(export ?ALL)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	FUNCIONS D'IMPRESIONS	;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;    (defmessage-handler MAIN::Cuadro imprimir ()
;;        (format t "Titulo: %s %n" ?self:Titulo)
;;        (printout t crlf)
;;        (format t "Any: %d" ?self:Any)
;;        (printout t crlf)
;;        (format t "Epoca del cuadro: %s" (send ?self:Epoca_cuadro get-Nombre_epoca))
;;        (printout t crlf)
;;        (format t "Dimensiones: %s" ?self:Dim)
;;        (printout t crlf)
;;        (format t "Sala: %d" ?self:Sala)
;;        (printout t crlf)
;;        (format t "Pintado por: %s" (send ?self:Pintado_por get-Nombre))
;;        (printout t crlf)
;;        (format t "Tematica del cuadro: %s" (send ?self:Tematica_cuadro get-Nombre_tematica))
;;        (printout t crlf)
;;    )


;;    (defmessage-handler MAIN::Recomendacion imprimir ()
;;        (printout t "-----------------------------------" crlf)
;;        (printout t (send ?self:nombre_cuadro imprimir))
;;        (printout t crlf)
;;        (format t "Nivel de recomendacion: %d %n" ?self:puntuacion)
;;        (printout t "Justificacion de la eleccion: " crlf)
;;        (progn$ (?curr-just ?self:justificaciones)
;;            (printout t ?curr-just crlf)
;;        )
;;        (printout t crlf)
;;        (printout t "-----------------------------------" crlf)
;;    )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;	TEMPLATES D'INFORMACIÓ ABSTRACTA	;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Template para los datos del grupo (no solo visitante)

(deftemplate MAIN::datos_grupo ;; Informació abstracta del grup
	(slot mitjana_nivell (type INTEGER)(default -1)) ; Mitjana de coneixement del grup
	(slot mitjana_edat (type INTEGER)(default -1)) ; Edat mitjana del grup

    (slot num_visitants (type INTEGER)(default -1)) ;Nombre de visitants
    (slot num_infants (type INTEGER)(default -1)) ; numero de nens menors a 14 anys
    (slot num_adolescents (type INTEGER)(default -1)) ; numero de nens entre 14 i 18 anys
    (slot num_adults (type INTEGER)(default -1)) ; numero d'adults majors a 18 anys

    (slot Dies (type INTEGER)(default -1)) ;; Dies de la visita
    (slot Duracio_Total (type INTEGER)(default -1)) ; Hores totals
    (slot Duracio_Actual (type INTEGER)(default -1)) ;;Duració de la solució generada

    (slot solucio_creada (type INTEGER)(default -1))
)

;;; Template per guardar totes les preferencies del grup amb la frequancia que apareixen

(deftemplate MAIN::Preferencies_Grup_Pintors
    (slot Pintor (type INSTANCE))
    (slot Freq (type INTEGER))
)

(deftemplate MAIN::Preferencies_Grup_Estils
    (slot Estil (type INSTANCE))
    (slot Freq (type INTEGER))
)

(deftemplate MAIN::Preferencies_Grup_Epoques
    (slot Epoca (type INSTANCE))
    (slot Freq (type INTEGER))
)

(deftemplate MAIN::Preferencies_Grup_Tematiques
    (slot Tematica (type INSTANCE))
    (slot Freq (type INTEGER))
)

(deftemplate MAIN::Ranking
    (slot Obra (type INSTANCE))
    (slot Puntuacio (type INTEGER))
)

(deftemplate MAIN::Ranking
    (slot Obra (type INSTANCE))
    (slot Puntuacio (type INTEGER))
)

;;; TEMPLATES DE TRANSFORMACIÓ D'Informació

(deftemplate MAIN::lista_rec_ordenada
	(multislot recomanacions (type INSTANCE))
)

(deftemplate MAIN::resultat_sense_sales
	(multislot obres (type INSTANCE))
)

(deftemplate MAIN::resultat_final
	(multislot obres (type INSTANCE))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		FUNCIONS ÚTILS			;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(deffunction MAIN::aleatori (?max)
   (return (+ 1 (mod (random 1 ?max) ?max)))
)


;;; Funcion para hacer una pregunta numerica-univalor
(deffunction MAIN::pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "%s (De %d hasta %d) " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(>= ?respuesta ?rangini)(<= ?respuesta ?rangfi))) do
		(format t "%s (De %d hasta %d) " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)


;;; Funcion para hacer pregunta con muchas opciones
(deffunction MAIN::pregunta-opciones (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escoge una opcion:" 1 (length$ ?valores-posibles)))
	?respuesta
)


;;; Funcion para hacer una pregunta de tipo si/no
(deffunction MAIN::pregunta-si-no (?question)
   (bind ?response (pregunta-opciones ?question si no))
   (if (or (eq ?response si) (eq ?response s))
       then TRUE 
       else FALSE)
)



;;; Funcion para hacer una pregunta multi-respuesta con indices
(deffunction MAIN::pregunta-multirespuesta (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (format t "%s" "Indica los numeros referentes a las preferencias separados por un espacio: ")
    (bind ?resp (readline))
    (bind ?numeros (explode$ ?resp)) ; Divideix la cadena en una llista
    (bind $?lista (create$))
    (progn$ (?var ?numeros) 
        (if (and (integerp ?var) (and (>= ?var 0) (<= ?var (length$ ?valores-posibles))))
            then 
                (if (not (member$ ?var ?lista))
                    then (bind ?lista (insert$ ?lista (+ (length$ ?lista) 1) ?var))
                )
        ) 
    )
    (if (or(member$ 0 ?lista)(= (length$ ?lista) 0)) then (bind ?lista (create$ ))) 
    ;(if (member$ 0 ?lista) then (bind ?lista (create$ 0)))
    ?lista
)

;;; Funcion para hacer pregunta con indice de respuestas posibles
(deffunction MAIN::pregunta-indice (?pregunta $?valores-posibles)
    (bind ?linea (format nil "%s" ?pregunta))
    (printout t ?linea crlf)
    (progn$ (?var ?valores-posibles) 
            (bind ?linea (format nil "  %d. %s" ?var-index ?var))
            (printout t ?linea crlf)
    )
    (bind ?respuesta (pregunta-numerica "Escoge una opcion:" 1 (length$ ?valores-posibles)))
	?respuesta
)


(deffunction MAIN::round-one-decimal (?number)
    (bind ?scaled (* ?number 10))           ; Multiplica el número por 10
    (bind ?rounded (+   (integer ?scaled)     ; Convierte a entero (trunca)
                        (if (< ?scaled (integer ?scaled)) 
                            then 0
                            else -1
                        )
                  )
    ) ; Ajusta según el signo
   (return (/ ?rounded 10.0))
) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;			    CODIGO REAL FUNCIONES          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffunction MAIN::pregunta-preferencies-tipus (?tipus)
    ;;Obtenim totes les instancies de la classe tipus
    (bind $?obj-estilos (find-all-instances ((?inst ?tipus)) TRUE))
    (bind $?nom-estilos (create$ ))
    ;;Imprimim totes les instancies de la classe tipus
    (loop-for-count (?i 1 (length$ $?obj-estilos)) do
        (bind ?curr-obj (nth$ ?i ?obj-estilos))
        (bind ?curr-nom (send ?curr-obj get-Nom))
        (bind $?nom-estilos(insert$ $?nom-estilos (+ (length$ $?nom-estilos) 1) ?curr-nom))
    )
    (bind ?escogido (pregunta-multirespuesta "Escoja sus estilos favoritos(o 0 en el caso contrario): " $?nom-estilos))
    ;;Guardem la resposta a respuesta
    (bind $?respuesta (create$ ))
    (loop-for-count (?i 1 (length$ ?escogido)) do
        (bind ?curr-index (nth$ ?i ?escogido))
        (if (= ?curr-index 0) then (assert (estilos_favoritos FALSE)))
        (bind ?curr-estilos (nth$ ?curr-index ?obj-estilos))
        (bind $?respuesta(insert$ $?respuesta (+ (length$ $?respuesta) 1) ?curr-estilos))
    )
    ;;retornem la resposta
    $?respuesta

)

;;Funció per a crear els visitants
(deffunction MAIN::preguntar-i-crear-visitants-amb-edat (?num_visitants)
    (loop-for-count (?i 1 ?num_visitants) do
        (printout t "Afegint el visitant número " ?i " de " ?num_visitants crlf)
        (printout t "Introdueix el nom del visitant: " crlf)
        (bind ?nom (read))
        (bind ?edat (pregunta-numerica "Introdueix l'edat del visitant" 1 110))
        (if (< ?edat  14) ;;SI es unn nen no ens innteresen.
            then
                (bind ?coneixement 0)
                (bind ?preferencies-pintors nil)
                (bind ?preferencies-estils nil)
                (bind ?preferencies-epoca nil)
                (bind ?preferencies-tematica nil)
            else
                (bind ?coneixement (pregunta-numerica "Introdueix el coneixement del visitant" 0 5))
                (bind ?preferencies-pintors (pregunta-preferencies-tipus Pintor))
                (bind ?preferencies-estils (pregunta-preferencies-tipus Estil))
                (bind ?preferencies-epoca (pregunta-preferencies-tipus Època))
                (bind ?preferencies-tematica (pregunta-preferencies-tipus Tematica))
        )
                
        ;; Determinem la classe del visitant segons l'edat
        (if (and (>= ?edat 0) (<= ?edat 13)) then
            (bind ?classe Nen)
        else
            (if (and (>= ?edat 14) (<= ?edat 17)) then
                (bind ?classe Adolescent)
            else
                (if (and (>= ?edat 18) (<= ?edat 150)) then
                    (bind ?classe Adult)
                else
                    (printout t "Edat no vàlida. No es pot crear el visitant." crlf)
                    (return)))
        )
        
        ;;Creem el nom de la instancia
        (bind ?nom-instancia (sym-cat "visitant-" ?nom "-" ?i))
        (printout t "Nom de la instancia: " ?nom-instancia crlf)

        ;; Creem la instància del visitant
        (bind ?instancia
            (make-instance
                ?nom-instancia
                of ?classe
                (Nom ?nom)
                (Coneixement ?coneixement)
                (Edat ?edat)
                (prefereix-pintors ?preferencies-pintors)
                (prefereix-estils ?preferencies-estils )
                (prefereix-epoques ?preferencies-epoca)
                (prefereix-tematiques ?preferencies-tematica)
            
            )
        
        
        
        )
        
        (printout t "Visitant creat: " ?instancia " (Classe: " ?classe ")" crlf)
    )
)

;; FUNCIÓ QUE CALCULA QUAN ES TRIGA EN VEURE UNA OBRA SEGONS UNS PARÀMETRES
(deffunction MAIN::calcula-F (?relevancia ?coneixement-grup ?complexitat-obra ?dimensions ?num-nens ?num-adolescents ?num-visitants)
   (bind ?R 
      (if (<= ?relevancia 3) then 0.6
          else 
             (if (<= ?relevancia 6) then 0.9
                 else 
                    (if (<= ?relevancia 8) then 1.2
                        else 1.5))))
                        
   (bind ?Z (abs (- (/ ?coneixement-grup 5) (/ ?complexitat-obra 10))))
   (bind ?Y 
      (if (<= ?Z 0.2) then 1.4
          else 
             (if (<= ?Z 0.5) then 1.2
                 else 
                    (if (<= ?Z 0.8) then 1
                        else 0.8))))

   (bind ?Naux (/ (+ ?num-nens (/ ?num-adolescents 2)) ?num-visitants))
   (bind ?N (* ?Naux 100)) ; Convertir a percentatge
   (bind ?N 
      (if (= ?N 0) then 0
          else 
             (if (< ?N 5) then 0.05
                 else 
                    (if (< ?N 15) then 0.1
                        else 
                           (if (< ?N 25) then 0.15
                               else 
                                  (if (< ?N 50) then 0.2
                                      else 0.25))))))

    (bind ?X 
      (* (- (+ (/ ?R 10) ?Y) (/ (* 2 (log10 ?dimensions)) 75) ?N) 180)
    )

   ?X
)

;;FUNCIÓ PER A VEURE SI UNA OBRA ESTÀ A UNA LLISTA (COMPARANT ELS NOMS PERQUE SINÒ PASSAVEN COSES RARES AMB LES INSTÀNCIES (NO ES PODEN COMPARAR DIRECTAMENT))

(deffunction esta_a_la_llista (?obra_act $?resultat)
    
    (bind ?esta FALSE)

    (bind ?nom_obra_que_busquem (send ?obra_act get-Nom))
    (bind ?any_obra_que_busquem (send ?obra_act get-Any))


    (foreach ?obra $?resultat
        (bind ?nom_obra (send ?obra get-Nom))ç
        (bind ?any_obra (send ?obra get-Any))
        (if (and (eq ?nom_obra_que_busquem ?nom_obra) (eq ?any_obra_que_busquem ?any_obra)) then
            (bind ?esta TRUE)
        )
    )

    ?esta
)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;			        REGLAS  		            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule MAIN::initialRule "Regla inicial"
	(declare (salience 10))
	=>
	(printout t"----------------------------------------------------------" crlf)
  	(printout t"          Personalització de visites a un museu           " crlf)
	(printout t"----------------------------------------------------------" crlf)
  	(printout t crlf)  	
	(printout t"Benvingut! A continuació se li formularà una sèrie de preguntes per a poder recomanar-li una visita adequada a les seves preferències." crlf)
	(printout t crlf)
	(focus obtencion-preferencias)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		    OBTENCIÓ DE PREFERENCIES            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defrule obtencion-preferencias:obtenir-visitants
    (declare (salience 9))
    =>
    ;;MIREM SI CAL EXECUTAR LA FUNCIÓ O NO (NO HEM TROBAT LA MANERA DE VEURE-HO EN L'ANTERIOR PAS)

    (bind ?instancies_visitants (find-all-instances ((?x Visitant)) TRUE))
    (bind ?num_visitants (length$ ?instancies_visitants))
    
    (if (eq 0 ?num_visitants) then

        (bind ?num_visitants (pregunta-numerica "¿Quants visitants hi ha al grup? " 1 500)) 
        (printout t "Iniciant el procés de creació de visitants..." crlf)
        (preguntar-i-crear-visitants-amb-edat ?num_visitants) 
    )
)

(defrule obtencion-preferencias:VISITA_VALIDA?
    (declare (salience 8))
    =>
    (bind ?instancies_nen (find-all-instances ((?x Nen)) TRUE))
    (bind ?instancies_adults (find-all-instances ((?x Adult)) TRUE))

    (bind ?num_infants (length$ ?instancies_nen))
    (bind ?num_adults (length$ ?instancies_adults))

    (if ( > ?num_infants (* 15 ?num_adults)) then
        (printout t "NO ADMETEM VISITES ON NO ES PUGUI ASSEGURAR QUE HI HA 1 ADULT PER CADA 15 NENS, TORNI A COMENÇAR" crlf)
        (reset)
    )
)


(defrule obtencion-preferencias:obtenir-dades-visita
    (declare (salience 7))
    =>

    ;;MIREM SI CAL EXECUTAR LA FUNCIÓ O NO (NO HEM TROBAT LA MANERA DE VEURE-HO EN L'ANTERIOR PAS)

    (bind ?instancies_visita (find-all-instances ((?x Visita)) TRUE))
    (bind ?num_visita (length$ ?instancies_visita))

    (if (eq 0 ?num_visita) then

        (bind ?dies (pregunta-numerica "Quants dies realitzareu la visita? "1 10)) 
        (bind ?duracio (pregunta-numerica "Quantes hores dedicareu cada dia a la visita? "1 12)) 
        (bind ?visitants (find-all-instances ((?inst Visitant)) TRUE)) ;; visitants tenia un $ devant
        ;;Creem una visita amb els valors de la Duracio de la visita
        (bind ?instancia
                (make-instance
                    Visita-Actual of Visita
                    (VisitaObra nil)    ;;NIL as com null
                    (formada_per ?visitants)
                    (Dies ?dies)
                    (Duracio ?duracio)
                )
        )
    )
    (focus procesado-datos)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		        PROCESSAT DE dades            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;Anem a crear les dades abstractes
(defrule procesado-datos::omplir-datos_grupo
    (declare (salience 8))
    (not (datos_grupo))
    =>
    ;;Calcular num infants, adolescents i adults
    (bind ?instancies_nen (find-all-instances ((?x Nen)) TRUE))
    (bind ?instancies_adolescent (find-all-instances ((?x Adolescent)) TRUE))
    (bind ?instancies_adults (find-all-instances ((?x Adult)) TRUE))

    (bind ?num_infants (length$ ?instancies_nen))
    (bind ?num_adolescents (length$ ?instancies_adolescent))
    (bind ?num_adults (length$ ?instancies_adults))

    (bind ?num_visitants (+ ?num_infants (+ ?num_adolescents ?num_adults)))
   
    ;;Guardar dins de Duracio de datos_grupo les hores totals de visita (dies*hores/dia)
    (bind ?duracio (send [Visita-Actual] get-Duracio))
    (bind ?dies (send [Visita-Actual] get-Dies))
    (bind ?duraciototal (* ?duracio ?dies) )
    
    ;;Calcular edat mitjana i nivell mitja
    (bind ?resultats (find-all-instances ((?x Visitant)) TRUE))

    (bind ?total-edats 0)
    (bind ?total-nivell 0)
    (bind ?num-instancies (length$ ?resultats))

    (foreach ?instancia ?resultats
        (bind ?total-edats (+ ?total-edats (send ?instancia get-Edat)))
        (if (< 13 (send ?instancia get-Edat)) then ;;Només contem el coneixement dels adults i adolescents
            (bind ?total-nivell (+ ?total-nivell (send ?instancia get-Coneixement)))
        )
    )
    
    (bind ?mitjana_edat (/ ?total-edats ?num-instancies))
    (bind ?mitjana_nivell (/ ?total-nivell (+ ?num_adolescents ?num_adults))) ;;ELs nens no compten pel coneixement

    (assert (datos_grupo 
                        (num_visitants ?num_visitants)
                        (num_adolescents ?num_adolescents) (num_infants ?num_infants) (num_adults ?num_adults)
                        (Dies ?dies) (Duracio_Total ?duraciototal)
                        (mitjana_edat ?mitjana_edat) (mitjana_nivell ?mitjana_nivell)
            )
    )


)

(defrule procesado-datos::actualitzar-freq-pintors
    (declare (salience 5))
    =>

    (bind ?visitants (find-all-instances ((?v Visitant)) TRUE)) ; Obtenim tots els Visitants

    (foreach ?visitant ?visitants
        ; Obtenim les preferències de PINTORS per cada visitant

        (bind ?preferencies_Pintors (send ?visitant get-prefereix-pintors)) 

        (foreach ?preferencia ?preferencies_Pintors            

            (bind ?fact-existeix FALSE)
            (do-for-all-facts ((?f Preferencies_Grup_Pintors))
                (eq ?f:Pintor ?preferencia)
                (bind ?fact-existeix TRUE)
                (modify ?f (Freq (+ ?f:Freq 1)))
            )
            (if (not ?fact-existeix)
                then
                (assert (Preferencies_Grup_Pintors (Pintor ?preferencia) (Freq 1)))
            )
        )

        ;;ESTILS
        (bind ?preferencies_Estils (send ?visitant get-prefereix-estils))
        (foreach ?preferencia ?preferencies_Estils

            (bind ?fact-existeix FALSE)
            (do-for-all-facts ((?f Preferencies_Grup_Estils))
                (eq ?f:Estil ?preferencia)
                (bind ?fact-existeix TRUE)
                (modify ?f (Freq (+ ?f:Freq 1)))
            )
            (if (not ?fact-existeix)
                then
                (assert (Preferencies_Grup_Estils (Estil ?preferencia) (Freq 1)))
            )
        )

        ;;tematica
        (bind ?preferencies_Tematica (send ?visitant get-prefereix-tematiques)) 
        (foreach ?preferencia ?preferencies_Tematica

            (bind ?fact-existeix FALSE)
            (do-for-all-facts ((?f Preferencies_Grup_Tematiques))
                (eq ?f:Tematica ?preferencia)
                (bind ?fact-existeix TRUE)
                (modify ?f (Freq (+ ?f:Freq 1)))
            )
            (if (not ?fact-existeix)
                then
                (assert (Preferencies_Grup_Tematiques (Tematica ?preferencia) (Freq 1)))
            )
        )

        ;;Època
        (bind ?preferencies_Epoca (send ?visitant get-prefereix-epoques)) 
        (foreach ?preferencia ?preferencies_Epoca

            (bind ?fact-existeix FALSE)
            (do-for-all-facts ((?f Preferencies_Grup_Epoques))
                (eq ?f:Epoca ?preferencia)
                (bind ?fact-existeix TRUE)
                (modify ?f (Freq (+ ?f:Freq 1)))
            )
            (if (not ?fact-existeix)
                then
                (assert (Preferencies_Grup_Epoques (Epoca ?preferencia) (Freq 1)))
            )
        )
    )
    (focus generacion-soluciones)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;		        GENERACIÓ DE SOLUCIÓ            ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defrule generacion-soluciones::Calcular-Ranking-Pintors
    (declare (salience 9))
    ?obra <- (object (is-a Obra) (pintada_per ?pintor_obra) (Nom ?nomObra))
    ?preferencia <- (Preferencies_Grup_Pintors (Pintor ?nomPintor) (Freq ?freq)) 
    (test (eq ?nomPintor ?pintor_obra))
    =>

    (bind ?fact-existeix FALSE)
    (do-for-all-facts ((?f Ranking))
        (eq ?f:Obra ?obra)
        (bind ?fact-existeix TRUE)
        (modify ?f (Puntuacio (+ ?f:Puntuacio ?freq)))
    )
    (if (not ?fact-existeix)
        then
        (assert (Ranking (Obra ?obra) (Puntuacio ?freq))) ;; Crear el rànquing
    )        
    
)

(defrule generacion-soluciones::Calcular-Ranking-Estils
    (declare (salience 9))
    ?obra <- (object (is-a Obra) (TéEstil ?estil) (Nom ?nomObra))
    ?preferencia <- (Preferencies_Grup_Estils (Estil ?nomEstil) (Freq ?freq)) 
    (test (eq ?nomEstil ?estil))
    =>

    (bind ?fact-existeix FALSE)
    (do-for-all-facts ((?f Ranking))
        (eq ?f:Obra ?obra)
        (bind ?fact-existeix TRUE)
        (modify ?f (Puntuacio (+ ?f:Puntuacio ?freq)))
    )
    (if (not ?fact-existeix)
        then
        (assert (Ranking (Obra ?obra) (Puntuacio ?freq))) ;; Crear el rànquing
    )        
    
)

(defrule generacion-soluciones::Calcular-Ranking-Tematica
    (declare (salience 9))
    ?obra <- (object (is-a Obra) (TéTemàtica ?tematica_obra) (Nom ?nomObra))
    ?preferencia <- (Preferencies_Grup_Tematiques (Tematica ?nomTematica) (Freq ?freq)) 
    (test (eq ?nomTematica ?tematica_obra))
    =>

    (bind ?fact-existeix FALSE)
    (do-for-all-facts ((?f Ranking))
        (eq ?f:Obra ?obra)
        (bind ?fact-existeix TRUE)
        (modify ?f (Puntuacio (+ ?f:Puntuacio ?freq)))
    )
    (if (not ?fact-existeix)
        then
        (assert (Ranking (Obra ?obra) (Puntuacio ?freq))) ;; Crear el rànquing
    )        
    
)

(defrule generacion-soluciones::Calcular-Ranking-Epoca
    (declare (salience 9))
    ?obra <- (object (is-a Obra) (TéÉpoca ?Epoca_obra) (Nom ?nomObra))
    ?preferencia <- (Preferencies_Grup_Epoques (Epoca ?nomepoca) (Freq ?freq)) 
    (test (eq ?nomepoca ?Epoca_obra))
    =>

    (bind ?fact-existeix FALSE)
    (do-for-all-facts ((?f Ranking))
        (eq ?f:Obra ?obra)
        (bind ?fact-existeix TRUE)
        (modify ?f (Puntuacio (+ ?f:Puntuacio ?freq)))
    )
    (if (not ?fact-existeix)
        then
        (assert (Ranking (Obra ?obra) (Puntuacio ?freq))) ;; Crear el rànquing
    )        
)


(defrule generacion-soluciones::crea-lista-ordenada "Se crea una lista ordenada de contenido"
	(declare (salience 5))
	=>
	(bind $?resultado (create$ ))
    (bind $?lista (find-all-facts ((?f Ranking)) TRUE))
	(while (not (eq (length$ $?lista) 0))  do

        ;;Busquem el màxim

        (bind ?maximo -1)
        (bind ?elemento nil)
        (progn$ (?curr-rec $?lista)
            
            (bind ?curr-punt (fact-slot-value ?curr-rec Puntuacio))
            (if (> ?curr-punt ?maximo)
                then 
                (bind ?maximo ?curr-punt)
                (bind ?elemento ?curr-rec)
            )
        )
        
        ;;Afegim el màxim i l'eliminem de la llista
        (bind ?obramaxima (fact-slot-value ?elemento Obra))

		(bind $?lista (delete-member$ $?lista ?elemento))
		(bind $?resultado (insert$ $?resultado (+ (length$ $?resultado) 1) ?obramaxima))
	)
	(assert (lista_rec_ordenada (recomanacions $?resultado)))
)





(defrule generacion-soluciones::generem-solucio-amb-obres-ranking
    (declare (salience 4))
    ?g <- (lista_rec_ordenada (recomanacions $?lista))
    ?f <- (datos_grupo (Duracio_Actual ?durada_actual) (Duracio_Total ?durada_hores) (mitjana_nivell ?coneixement) (num_infants ?num_nens) (num_adolescents ?num_adolescents) (num_visitants ?num_visitants))
    (not (resultat_sense_sales))
    =>
    (bind $?resultat (create$ ))
    (bind ?temps-total-segons (* 3600 ?durada_hores)) ;;ho tenim en hores a datos_grupo

    (bind ?temps-visita-actual 0)
    (progn$ (?curr-rec $?lista)
        (if (< ?temps-visita-actual ?temps-total-segons)  then

            (bind ?rellevancia (send ?curr-rec get-Rellevancia))
            (bind ?complexitat (send ?curr-rec get-Complexitat))
            (bind ?dimensions (send ?curr-rec get-Dimensions))
            
            
            (bind ?durada_obra (calcula-F ?rellevancia ?coneixement ?complexitat ?dimensions ?num_nens ?num_adolescents ?num_visitants))
            (bind ?temps-visita-actual (+ ?temps-visita-actual ?durada_obra))
            
            (bind $?resultat (insert$ $?resultat (+ (length$ $?resultat) 1) ?curr-rec))
        )
    )
    (modify ?f (Duracio_Actual ?temps-visita-actual))
    (assert (resultat_sense_sales (obres $?resultat)))
)

(defrule generacion-soluciones::AFEGIR-OBRES-SI-FALTA-TEMPS
    (declare (salience 3))
    ?h <- (resultat_sense_sales (obres $?lista))
    ?f <- (datos_grupo (Duracio_Actual ?durada_actual) (Duracio_Total ?durada_hores) (mitjana_nivell ?coneixement) (num_infants ?num_nens) (num_adolescents ?num_adolescents) (num_visitants ?num_visitants) (solucio_creada ?sol))
    (test (and (< ?durada_actual (* 3600 ?durada_hores)) (< ?sol 0))) ;; SI FALTEN OBRES
    =>
    
    

    ;;AFEGIM QUALSEVOL INSTANCIA DE OBRAS QUE NO ESTIGUI A LA LLISTA FINS QUE DURADA_ACT > durada_hores
    
    (bind $?resultat $?lista)

    (bind ?temps-visita-actual ?durada_actual)

    (bind ?obres (find-all-instances ((?o Obra)) TRUE ))

    (foreach ?obra_act ?obres

        (if (and (not (esta_a_la_llista ?obra_act $?resultat)) (< ?temps-visita-actual (* 3600 ?durada_hores)))
            then

            (bind ?rellevancia (send ?obra_act get-Rellevancia))
            (bind ?complexitat (send ?obra_act get-Complexitat))
            (bind ?dimensions (send ?obra_act get-Dimensions))
        
            (bind ?durada_obra (calcula-F ?rellevancia ?coneixement ?complexitat ?dimensions ?num_nens ?num_adolescents ?num_visitants))
            (bind ?temps-visita-actual (+ ?temps-visita-actual ?durada_obra))
            
            (bind $?resultat (insert$ $?resultat (+ (length$ $?resultat) 1) ?obra_act))
        )
    )

    (modify ?f (Duracio_Actual ?temps-visita-actual) (solucio_creada 1))
    (modify ?h (obres $?resultat))
)

(defrule generacion-soluciones::ordenar-solucio-definitiva
    (declare (salience 2))
    ?g <- (resultat_sense_sales (obres $?llista))
    =>
    (bind $?resultat (create$ ))


    (bind ?numero_sales 0)
    (do-for-all-instances  ((?instancia Sala)) TRUE
        (bind ?numero_sales (+ ?numero_sales 1))
    )
    (bind ?sala_act 1)



    (while (<= ?sala_act ?numero_sales) do
        (progn$ (?curr-rec $?llista)
            (if (eq ?sala_act (send ?curr-rec get-Sala)) then
                (bind $?resultat (insert$ $?resultat (+ (length$ $?resultat) 1) ?curr-rec))
            )
        )
        (bind ?sala_act (+ ?sala_act 1))
    )

    (assert (resultat_final (obres $?resultat)))

    (focus imprimir-resultados)
)


(defrule imprimir-resultados::impresion_por_dias
    ?g <- (datos_grupo 
                (Dies ?dies) 
                (Duracio_Actual ?durada_actual) 
                (Duracio_Total ?duraciototal) 
                (mitjana_nivell ?coneixement) 
                (num_infants ?num_nens) 
                (num_adolescents ?num_adolescents) 
                (num_visitants ?num_visitants) 
                (solucio_creada ?sol)
            )
    ?f <- (resultat_final (obres $?llista))
    (test (> ?dies 1))

    =>
    (bind ?duraciototalsegons (* 3600 ?duraciototal))

    (bind ?segons_dia_total (/ ?duraciototalsegons ?dies))

    (bind ?cont_dia 1)
    (bind ?cont_sala 0)
    (bind ?llista_obres_mostrar $?llista)

    (while (and (<= ?cont_dia ?dies) (< 0 (length$ ?llista_obres_mostrar)))
        (printout t "EL DIA "?cont_dia " VISITAREM:" crlf)

        (bind ?segons_dia_act 0)

        (progn$ (?obra_act $?llista_obres_mostrar)
            
            (if(< ?segons_dia_act ?segons_dia_total) then

                (if (or (< ?cont_sala (send ?obra_act get-Sala)) (eq ?segons_dia_act 0)) then
                (bind ?cont_sala (+ ?cont_sala 1))
                (printout t "A LA SALA " ?cont_sala " VEIEM: " crlf)
                )

                ;;CALCULEM EL TEMPS EN MIRAR L'OBRA

                (bind ?rellevancia (send ?obra_act get-Rellevancia))
                (bind ?complexitat (send ?obra_act get-Complexitat))
                (bind ?dimensions (send ?obra_act get-Dimensions))

                (bind ?durada_obra (calcula-F ?rellevancia ?coneixement ?complexitat ?dimensions ?num_nens ?num_adolescents ?num_visitants))
                (bind ?durada_obra (calcula-F ?rellevancia ?coneixement ?complexitat ?dimensions ?num_nens ?num_adolescents ?num_visitants))
                (bind ?arrodonit (round-one-decimal ?durada_obra))

                (bind ?nom_obra (send ?obra_act get-Nom))
                (bind ?segons_dia_act (+ ?segons_dia_act ?durada_obra))

                (printout t "OBRA: " ?nom_obra  ". Temps estimat per veure l'obra: " ?arrodonit "s" crlf)

                (bind ?llista_obres_mostrar (delete-member$ ?llista_obres_mostrar ?obra_act))
            )
        )
        (bind ?cont_dia (+ ?cont_dia 1))    
    )

    (bind ?obras (find-all-instances ((?o Obra)) TRUE))
    (bind ?numero_obres (length$ ?obras))

    (bind ?longitud_resultat (length$ ?llista))
    
    (bind ?duracio_hores (/ ?durada_actual 3600))
    (bind ?duracio_hores (round-one-decimal ?duracio_hores))
    
    (if (eq ?longitud_resultat ?numero_obres) then
        (printout t crlf)
        (printout t crlf)
        (printout t "Per aquest grup s'estima que el museu està pensat per a ser visitat en " ?duracio_hores " hores " crlf)
        (printout t "Al haver posat més hores que aquesta en total, la vostra visita veu tot el museu i us sobren minuts." crlf)
        (printout t "Per tant la nostra recomanació és que us preneu tot el temps que volgueu en les obres que més us agradin" crlf)
    )
)

(defrule imprimir-resultados::impresion_dia_unico
    ?g <-   (datos_grupo 
                (Dies ?dies) 
                (Duracio_Actual ?durada_actual) 
                (Duracio_Total ?duraciototal) 
                (mitjana_nivell ?coneixement) 
                (num_infants ?num_nens) 
                (num_adolescents ?num_adolescents) 
                (num_visitants ?num_visitants) 
                (solucio_creada ?sol)
            )   
    ?f <- (resultat_final (obres $?llista))
    (test (eq ?dies 1))
    =>
    (bind ?sala_act 0)

    (printout t "INICIEM LA RECOMANACIÓ DE CIRCUÏT PEL MUSEU: " crlf)

    (progn$ (?curr-rec $?llista)
        (if (< ?sala_act (send ?curr-rec get-Sala)) then
            (bind ?sala_act (+ ?sala_act 1))
            (printout t "DINS LA SALA: " ?sala_act crlf)
            (printout t "Veurem els següents quadres: " crlf)
        )

        (bind ?rellevancia (send ?curr-rec get-Rellevancia))
        (bind ?complexitat (send ?curr-rec get-Complexitat))
        (bind ?dimensions (send ?curr-rec get-Dimensions))


        (bind ?durada_obra (calcula-F ?rellevancia ?coneixement ?complexitat ?dimensions ?num_nens ?num_adolescents ?num_visitants))
          
        (bind ?arrodonit (round-one-decimal ?durada_obra))

        (bind ?nom_obra (send ?curr-rec get-Nom))
        
        (printout t "OBRA: " ?nom_obra  ". Temps estimat per veure l'obra: " ?arrodonit "s" crlf)
    )

    (bind ?obras (find-all-instances ((?o Obra)) TRUE))
    (bind ?numero_obres (length$ ?obras))

    (bind ?longitud_resultat (length$ ?llista))
    
    (bind ?duracio_hores (/ ?durada_actual 3600))
    (bind ?duracio_hores (round-one-decimal ?duracio_hores))

    (if (eq ?longitud_resultat ?numero_obres) then
        (printout t crlf)
        (printout t crlf)
        (printout t "Per aquest grup s'estima que el museu està pensat per a ser visitat en " ?duracio_hores " hores " crlf)
        (printout t "Al haver posat més hores que aquesta en total, la vostra visita veu tot el museu i us sobren minuts." crlf)
        (printout t "Per tant la nostra recomanació és que us preneu tot el temps que volgueu en les obres que més us agradin" crlf)
    )
)