---
name: arbitrage-escalade
description: Indique quand un agent doit s'arrêter et demander une décision humaine plutôt que de continuer. Use when une action est irréversible, coûte de l'argent, engage la société envers un client, touche à la production, dépasse le ticket, ou quand deux consignes se contredisent.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Quand demander à un humain

**Arrête-toi et demande** (commentaire de ticket ou demande de confirmation) quand l'action :
- est **irréversible** : suppression, migration de données, envoi, publication, fusion, déploiement ;
- **coûte de l'argent** : publicité, abonnement, achat, consommation d'API payante au-delà du prévu ;
- **engage la société** : prix, délai, remise, promesse à un client, clause de contrat ;
- touche à **la production**, aux **secrets** ou aux **données personnelles** ;
- **sort du ticket** ou contredit une consigne écrite ;
- repose sur une **information manquante** que tu devrais inventer.

**Comment demander** : la question en une phrase, 2 ou 3 options avec ta recommandation et ses conséquences, ce que tu fais en
attendant (rien, ou une partie sûre du travail). Une seule question à la fois.

**Ne demande pas** pour ce qui est réversible, dans le ticket et sans coût : avance et documente.
