---
name: contrat-prestation
description: Prépare le contrat ou les conditions d'une prestation (objet, livrables, délais, recette, prix, propriété intellectuelle avec cession de droits détaillée, sous-traitance RGPD, changements, responsabilité, résiliation) à partir des modèles de la société. Use when un devis est accepté ou sur le point de l'être et qu'il faut le cadre contractuel, ou quand un client envoie son propre contrat à analyser.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Contrat de prestation

**Règle** : les agents préparent à partir des **modèles validés** de la société (`charte/modeles/CONDITIONS-*`,
`ANNEXE-RGPD-*`), relus une fois par un avocat. On n'invente pas de clause juridique nouvelle : tout écart au modèle est signalé à la
direction. Un contrat envoyé par le client est analysé clause par clause (risques, clauses manquantes, propositions de modification).

**Clauses à vérifier** (détails dans `references/`) :
1. **Objet et documents contractuels** : devis, cahier des charges, conditions, annexe RGPD ; ordre de priorité entre eux.
2. **Livrables, planning** et **obligations du client** (contenus, accès, validations sous X jours ; un retard du client décale le
   planning).
3. **Recette** : procédure, délai de vérification, réserves, réception tacite après X jours sans retour (skill `recette-client`).
4. **Prix et paiement** : acompte, échéancier, délai (au plus 60 jours après la facture ou 45 jours fin de mois), pénalités de retard,
   indemnité de 40 €, suspension possible en cas d'impayé.
5. **Propriété intellectuelle** : `references/cession-droits.md`. Sans cession écrite et détaillée, les droits restent au prestataire.
6. **Données personnelles** : `references/sous-traitance-rgpd.md` (article 28 du RGPD).
7. **Demandes de changement** : toute évolution du périmètre fait l'objet d'un avenant chiffré (skill `demande-de-changement`).
8. **Responsabilité** : obligation de moyens, plafond (souvent le montant payé sur 12 mois), exclusion des dommages indirects.
9. **Confidentialité**, **référence commerciale** (droit de citer le client, avec son accord), **sous-traitance** à des tiers.
10. **Durée, résiliation, réversibilité** (restitution des données et des accès en fin de contrat).
11. **Droit applicable et tribunal compétent**.
