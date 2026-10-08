---
name: pipeline-crm
description: Tient le pipeline commercial à jour (étapes, prochaine action datée, montant, probabilité) et produit la prévision et les relances. Use when un prospect ou une opportunité change d'état, quand tu prépares la revue commerciale hebdomadaire, ou quand on te demande où en sont les ventes.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Pipeline commercial

Pour les processus de cycle de vie des contacts et le passage marketing vers ventes, voir aussi `revops` (marketingskills).

**Étapes** (critère de passage entre parenthèses) :
1. Prospect (correspond à l'ICP) ; 2. Contacté (premier message envoyé) ; 3. Échange (réponse positive) ;
4. Qualifié (besoin, budget, décideur et échéance connus) ; 5. Proposition envoyée ; 6. Négociation ; 7. Gagné / Perdu (raison notée).

**Chaque opportunité** : société, contact, source, montant estimé, **prochaine action avec une date**, étape, date d'entrée dans
l'étape. Une opportunité sans prochaine action datée est à traiter en priorité.

**Revue hebdomadaire** :
- opportunités sans action ou sans mouvement depuis 14 jours (relancer ou clôturer) ;
- prévision du mois = somme des montants × probabilité de l'étape (probabilités réelles mesurées dès qu'il y a assez d'historique) ;
- taux de conversion par étape, raisons de perte, sources qui convertissent.

**Où** : le CRM de la société s'il existe ; sinon `commercial/pipeline.md` dans le repo cerveau (tableau). Les données personnelles
restent minimales (pas de notes sur la vie privée).
