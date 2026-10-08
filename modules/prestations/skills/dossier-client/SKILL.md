---
name: dossier-client
description: Ouvre et tient le dossier d'un prospect ou client dans le repo cerveau (clients/<client>/ : fiche, besoins, décisions, technique, appels, documents) à partir du modèle de la société. Use when un nouveau prospect apparaît, avant toute proposition, ou quand des informations d'un client doivent être rangées.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Dossier client

1. **Identifiant** : minuscules, tirets, sans accents (ex. `vcm-agency`). Il doit correspondre à l'identifiant ou à un alias du client
   dans le registre A2 ; sinon le signaler (A2 OS ne le rangera pas).
2. **Créer** `clients/<client>/` depuis `templates/client/` : `MEMORY.md` (index), `fiche.md`, `besoins.md`, `decisions.md`,
   `technique.md`, `appels/`, `documents/`.
3. **`fiche.md`** : société, secteur, contact (nom et rôle seulement), apporteur, site actuel, statut (`prospect`, `qualifié`,
   `devis envoyé`, `signé`, `en production`, `maintenance`, `terminé`).
4. **Documents** : `1-contrat/`, `2-livrables-client/`, `3-analyses/`, `4-echanges/`, `5-recu-du-client/` (exclu de git, données
   personnelles et fichiers bruts du client), `9-archive/`. Vérifier avec `git check-ignore -v` avant de déplacer un fichier reçu.
5. **Ne rien inventer** : une case inconnue reste « à préciser ».
6. **Pas de repo de livrable avant la signature**, pas de prix à ce stade.
7. Une PR « Nouveau client : <nom> », récap avec les questions ouvertes.
