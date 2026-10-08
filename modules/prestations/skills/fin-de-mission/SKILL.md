---
name: fin-de-mission
description: Clôt une mission ou un contrat client proprement (livrables et paiements soldés, accès révoqués, données restituées ou supprimées, archivage, rétrospective, leçons). Use when un projet sans maintenance est terminé, quand un contrat de maintenance prend fin ou quand un client part.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Fin de mission

1. **Soldes** : tous les livrables remis, PV signés, toutes les factures payées (sinon relances, skill `facturation-prestation`).
2. **Accès** : révoquer tous les accès de la société et de ses agents aux outils du client (hébergement, DNS, CMS, analytics, dépôts) et
   supprimer les secrets correspondants du gestionnaire de secrets. Liste vérifiée et datée.
3. **Données personnelles** du client (article 28 du RGPD) : restituer ou supprimer selon son choix, y compris les sauvegardes, copies
   locales et `documents/5-recu-du-client/` ; confirmer par écrit.
4. **Archivage** : dossier client passé au statut `terminé`, documents déplacés dans `9-archive/` si besoin ; le repo du livrable est
   archivé ou transféré au client.
5. **Rétrospective** interne : estimé contre réel (temps, marge), ce qui a bien marché, ce qui a coûté, ce qu'on change dans nos
   modèles ou nos skills (skill `capitaliser-lecon`).
6. **Relation** : demander un avis ou une recommandation, proposer une étude de cas (accord écrit), noter une date de relance commerciale
   si pertinent.
