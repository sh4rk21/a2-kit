---
name: estimation-projet
description: Estime la charge, le délai et le prix d'un projet client à partir du cahier des charges (découpage en tâches, estimation en trois points, risques, marge), avec une fourchette honnête. Use when un cahier des charges est validé et qu'il faut chiffrer, ou pour estimer une demande de changement ou une évolution.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Estimer un projet

1. **Découper** le cahier des charges en tâches de 0,5 à 3 jours, y compris ce qu'on oublie : gestion de projet (10 à 15 %), design,
   intégration des contenus, recette, corrections, mise en ligne, formation, documentation.
2. **Trois points** par tâche : optimiste (O), probable (P), pessimiste (Pe). Estimation = (O + 4P + Pe) / 6.
   Une tâche avec un grand écart signale une inconnue : la lever (question au client, prototype) ou la traiter comme risque.
3. **Comparer** avec les projets passés de la société (`memoire/`, temps réels notés) : c'est la meilleure source.
4. **Risques** : réserve de 15 à 25 % selon le niveau d'inconnu (nouvelle technologie, client peu disponible, contenus non prêts).
5. **Prix** : selon `societe/tarification.md` (jour, forfait, valeur). Quand la valeur pour le client est chiffrée (chiffres de
   `besoins.md`), le prix peut s'appuyer dessus ; ne jamais descendre sous le coût estimé + marge minimale de la société.
6. **Délai** : charge ÷ capacité réelle + temps d'attente du client (validations, contenus) + marge.
7. **Livrable** : `documents/3-analyses/estimation.md` (tableau des tâches, hypothèses, risques, fourchette). Les montants
   définitifs sont décidés par la direction.
