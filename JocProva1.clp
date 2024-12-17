(definstances Visitants
([Xavi] of Adult (Nom "Xavi") (Edat 25) (Coneixement 3) (prefereix-pintors [Monet] [Munch] [Hopper]) (prefereix-estils [Impressionisme] [Realisme] [Romanticisme]) (prefereix-epoques [Moderna]) (prefereix-tematiques [Paisatge] [Natura] [Amor]))
)

(definstances Visites
([Visita-Actual] of Visita (Dies 1) (Duracio 3) (formada_per [Xavi]) (VisitaObra nil))
)

