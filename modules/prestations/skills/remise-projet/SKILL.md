---
name: remise-projet
description: Prépare la remise d'un projet au client (registre de propriété des comptes et licences, accès transférés, documentation d'exploitation, formation, garantie) pour qu'il soit autonome ou passe en maintenance. Use when un projet client est mis en ligne et réceptionné, ou quand un client reprend son projet ou change de prestataire.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Remise du projet

1. **Registre de propriété** `documents/2-livrables-client/registre.md` : nom de domaine, hébergement, DNS, dépôts de code, outils,
   licences (thème, extensions, polices, photos), comptes analytics et Search Console, avec pour chacun le **titulaire** (le client
   de préférence), l'échéance de renouvellement et le coût.
2. **Accès** : transférer ceux qui doivent l'être ; retirer ceux dont la société n'a plus besoin. Aucun identifiant dans le document :
   il dit où le trouver.
3. **Documentation d'exploitation** (runbook) : architecture en une page, comment déployer, sauvegarder et restaurer, mettre à jour,
   où regarder en cas de panne, contacts.
4. **Guide utilisateur** du client (modifier un contenu, ajouter une page, gérer les formulaires), court et illustré, et une
   **formation** enregistrée si prévue au devis.
5. **Garantie** : rappeler sa durée et ce qu'elle couvre (anomalies du périmètre livré), et la différence avec la maintenance.
6. **Code et droits** : dépôt à jour, licences tierces listées, cession de droits effective au paiement complet.
7. Proposer la maintenance (skill `maintenance-sla`) et demander un retour ou un témoignage (skill `etude-de-cas`, avec accord écrit).
