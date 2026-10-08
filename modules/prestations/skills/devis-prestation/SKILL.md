---
name: devis-prestation
description: Rédige un devis ou une proposition commerciale de prestation (contexte, solution, options, périmètre et hors périmètre, livrables, planning, prix, conditions) à la charte de la société, avec les mentions obligatoires. Use when une estimation est validée et qu'il faut produire un devis, une proposition, un avenant ou une nouvelle version de devis.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Devis et proposition

**Sources** : dossier client, cahier des charges, estimation, `societe/tarification.md`, `societe/mentions-legales.md`, modèles de
`charte/modeles/`. Les skills de la société précisent la référence, le modèle et le style.

1. **Structure** : la situation du client (dans ses mots) ; la solution proposée et pourquoi ; **2 ou 3 options** (essentiel,
   recommandée, complète) quand c'est pertinent ; livrables ; planning par étapes ; prix ; conditions.
2. **Périmètre et hors périmètre explicites** ; nombre de **tours de révision** inclus ; ce que le client doit fournir et quand ;
   critères d'acceptation ; ce qui déclenche une demande de changement.
3. **Chaque ligne de prix = un livrable**. Vérifier les totaux, la TVA et l'acompte à la main.
4. **Mentions** : identité complète (raison sociale, SIREN, adresse, n° de TVA), date, référence, **durée de validité**, désignation
   précise, prix unitaires et totaux HT, taux et montant de TVA, TTC, conditions et échéancier de paiement, pénalités de retard et
   indemnité forfaitaire de recouvrement (40 €), mention de l'acceptation (« bon pour accord », date, signature).
5. **Aucune remise ni geste commercial** non décidé par la direction ; une valeur manquante est marquée « à confirmer ».
6. **Conditions générales** et, si des données personnelles sont traitées pour le client, **annexe sous-traitance RGPD**
   (skill `contrat-prestation`).
7. Relecture par le Relecteur ; **l'envoi est fait par un humain**. Chaque version est conservée (`-01`, `-02`).
