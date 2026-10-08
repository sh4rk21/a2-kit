---
name: demande-de-changement
description: Traite une demande qui sort du périmètre signé (analyse d'impact sur charge, délai, prix et risques, avenant à faire accepter) avant toute réalisation. Use when un client demande une fonctionnalité, une modification ou un ajout non prévu au devis, ou quand un ticket dépasse le périmètre contractuel.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Demande de changement

**Règle** : rien hors périmètre n'est réalisé sans avenant accepté par écrit, même « petit ». Le périmètre signé est dans le devis et le
cahier des charges du dossier client.

1. **Constater** : citer la ligne du devis ou du cahier des charges, et expliquer en quoi la demande en sort.
2. **Analyser l'impact** (skill `estimation-projet`) : charge, délai (et décalage des autres étapes), prix, risques, effet sur la recette
   et la maintenance.
3. **Proposer des options** : réaliser maintenant (avenant), remplacer une fonctionnalité de même charge, reporter en phase 2, ne pas faire
   (avec le conseil associé).
4. **Rédiger l'avenant** (référence du devis initial, description, prix, nouveau planning) ; relecture ; envoi par un humain.
5. **Journal** `clients/<client>/documents/1-contrat/changements.md` : date, demande, décision, montant, référence de l'avenant.
6. Le ticket de réalisation n'est créé qu'**après** l'acceptation écrite.
