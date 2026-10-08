---
name: recette-client
description: Organise la recette d'un livrable avec le client (cahier de recette issu des critères d'acceptation, tests, classement des anomalies, procès-verbal de réception avec ou sans réserves). Use when un livrable est prêt à être validé par le client, ou quand le client remonte des anomalies pendant la recette.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Recette client

1. **Cahier de recette** `documents/2-livrables-client/recette.md` : un cas de test par critère d'acceptation du cahier des charges
   (étapes, résultat attendu), plus les parcours principaux, sur les navigateurs et tailles d'écran convenus.
2. **Recette interne d'abord** : tous les cas passés par l'équipe (Relecteur, `ui-controle-visuel`, `accessibilite-rgaa`) avant
   d'ouvrir au client. On ne livre pas en recette quelque chose qu'on sait cassé.
3. **Ouvrir la recette** au client : lien de préproduction, cahier de recette, façon de remonter une anomalie, durée (souvent 5 à
   10 jours ouvrés, selon le contrat).
4. **Classer chaque retour** : **bloquante** (empêche l'usage), **majeure**, **mineure** ou **évolution** (hors périmètre, traitée par
   `demande-de-changement`). Une évolution n'est pas une anomalie.
5. **Corriger**, puis re-tester les cas concernés.
6. **Procès-verbal de réception** : réception **sans réserve**, ou **avec réserves** listées (avec délai de correction) ; une réserve
   mineure n'empêche pas la mise en ligne. La réception tacite prévue au contrat s'applique sans retour du client dans le délai.
7. Le PV signé déclenche la facture d'étape prévue et la mise en ligne (skill `mise-en-ligne-site`).
