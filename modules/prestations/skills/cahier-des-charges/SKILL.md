---
name: cahier-des-charges
description: Mène la découverte et rédige le cahier des charges d'un projet client (objectifs, utilisateurs, fonctionnalités priorisées, contenus, contraintes, critères d'acceptation, hors périmètre) en exerçant le devoir de conseil. Use when une demande est qualifiée et qu'il faut préciser le besoin avant d'estimer et de chiffrer, ou quand le client fournit son propre cahier des charges à analyser.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Cahier des charges

**Devoir de conseil** (obligation du professionnel en France) : on doit informer le client, le mettre en garde et le conseiller, y
compris contre sa demande si elle ne sert pas son objectif. Chaque alerte et chaque recommandation refusée par le client est écrite et
datée dans `decisions.md`.

1. **Préparer l'appel de découverte** : questions issues de la qualification, site et concurrents étudiés, hypothèses à vérifier.
2. **Rédiger** `clients/<client>/documents/3-analyses/cahier-des-charges.md` :
   - contexte et **objectifs mesurables** (ex. « 20 demandes de visite par mois via le site ») ;
   - **utilisateurs** et parcours principaux ;
   - **fonctionnalités** classées MoSCoW (indispensable, important, souhaitable, pas maintenant) ;
   - **contenus** : qui les fournit, quand, sous quelle forme (le retard de contenus est la première cause de glissement) ;
   - **contraintes** : technique, hébergement, intégrations, RGPD, accessibilité, langues, délai ;
   - **critères d'acceptation** vérifiables pour chaque fonctionnalité indispensable (ils serviront à la recette) ;
   - **hors périmètre** explicite ;
   - **hypothèses** et **risques** ;
   - **conseils** donnés (et réponse du client).
3. **Cahier des charges fourni par le client** : relever les manques, les contradictions, les exigences risquées ou disproportionnées,
   et proposer des alternatives.
4. **Validation** par le client (écrite) avant l'estimation définitive.
