---
name: rapport-croissance
description: Produit le rapport de croissance hebdomadaire ou mensuel (acquisition, conversion, pipeline, revenus, contenus, campagnes) à partir de données réelles, avec décisions proposées. Use when c'est le moment du rapport périodique, ou quand la direction demande comment se portent les ventes et le marketing.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Rapport de croissance

Pour la mise en place du suivi (GA4, événements, conversions) et l'attribution, voir `analytics` et `attribution` (marketingskills).

**Règle** : uniquement des chiffres mesurés, avec leur source et leur période. Un chiffre indisponible s'écrit « non mesuré »,
jamais estimé en silence.

1. **Résumé en 3 lignes** : ce qui progresse, ce qui recule, la décision à prendre.
2. **Acquisition** : visites et sources (Analytics), impressions et clics Search Console, abonnés, réponses à la prospection.
3. **Conversion** : contacts entrants, rendez-vous, propositions envoyées, signatures (ou inscriptions, activations, abonnements pour
   un produit).
4. **Pipeline** : montant par étape, prévision du mois, opportunités bloquées (skill `pipeline-crm`).
5. **Revenus** : chiffre signé ou MRR, nouveaux, perdus.
6. **Actions de la période** : contenus publiés, séquences envoyées, campagnes (dépense, CPA), avec leur résultat.
7. **Comparaison** avec la période précédente et l'objectif.
8. **Décisions proposées** (3 au plus) : quoi arrêter, quoi doubler, quoi tester ; chacune avec son coût et la mesure de succès.

Livrable dans `rapports/croissance/AAAA-MM(-SS).md` du repo cerveau, résumé envoyé à la direction.
