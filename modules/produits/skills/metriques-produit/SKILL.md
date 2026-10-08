---
name: metriques-produit
description: Suit les indicateurs d'un produit chaque semaine (étoile polaire, entonnoir acquisition-activation-rétention-revenu-recommandation, revenu récurrent, attrition) à partir de données réelles. Use when il faut le point hebdomadaire d'un produit, définir les indicateurs d'un nouveau produit, ou expliquer une variation de croissance ou de revenu.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Indicateurs produit

**Règle** : uniquement des chiffres mesurés, avec source et période ; « non mesuré » plutôt qu'une estimation silencieuse.

1. **Étoile polaire** : un seul indicateur qui mesure la valeur reçue par les utilisateurs (ex. « flux publiés par semaine »), défini
   dans `produits/<produit>/indicateurs.md` avec sa formule exacte.
2. **Entonnoir** (une définition écrite pour chaque étape) :
   - **acquisition** : visiteurs, inscriptions, par source ;
   - **activation** : part des inscrits qui atteignent le premier moment de valeur dans un délai donné ;
   - **rétention** : cohortes hebdomadaires ou mensuelles (part encore active à S1, S4, S12) ;
   - **revenu** : conversions vers le payant, revenu récurrent mensuel (MRR) nouveau, d'expansion, perdu, net ; revenu moyen par client ;
   - **recommandation** : parrainages, avis, score de recommandation si mesuré.
3. **Attrition** : clients et revenu perdus sur la période, raisons d'annulation classées.
4. **Point hebdomadaire** `produits/<produit>/rapports/AAAA-SS.md` : les chiffres, leur évolution, une explication pour chaque variation
   notable, une décision proposée.
5. Instrumentation : événements nommés de façon stable, consentement respecté pour la mesure d'audience, pas de donnée personnelle
   inutile dans les événements.
