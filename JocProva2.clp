(definstances Visitants
([Laia] of Adult (Nom "Laia") (Edat 32) (Coneixement 1) (prefereix-pintors [Dali]) (prefereix-estils [Surrealisme]) (prefereix-epoques [Contemporanea]) (prefereix-tematiques [Temps]))
)

(definstances Visites
([Visita-Actual] of Visita (Dies 1) (Duracio 5) (formada_per [Laia]) (VisitaObra nil))
)