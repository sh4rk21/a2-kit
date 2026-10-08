---
name: incident-postmortem
description: Gère un incident de production d'un produit (détection, rétablissement, communication aux utilisateurs, chronologie) puis rédige le retour d'expérience sans recherche de coupable avec des actions de prévention. Use when un service est indisponible ou dégradé, des données sont perdues ou exposées, ou après tout incident significatif à analyser.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Incident et retour d'expérience

**Pendant l'incident**
1. **Prévenir un humain immédiatement.** L'agent n'agit sur la production que sur instruction explicite.
2. **Rétablir d'abord** : retour à la version précédente, interrupteur de fonctionnalité éteint, mode dégradé. Comprendre ensuite.
3. **Chronologie** tenue en direct (heure, constat, action, résultat) dans le ticket de l'incident.
4. **Communication** : page d'état ou message aux utilisateurs touchés, préparé par l'agent et publié par un humain ; mises à jour
   régulières jusqu'à la résolution.
5. **Données personnelles exposées ou perdues** : c'est une **violation de données** ; la direction décide de la notification à la CNIL
   (dans les 72 heures si un risque existe) et aux personnes si le risque est élevé. Tout noter.

**Après (sous 5 jours ouvrés)**
6. **Retour d'expérience** `produits/<produit>/incidents/AAAA-MM-JJ-nom.md` : résumé, impact (durée, utilisateurs, revenu, données),
   chronologie, cause racine (cinq pourquoi), ce qui a bien marché, ce qui a manqué (détection, alerte, procédure).
7. **Sans coupable** : on corrige les systèmes et les procédures, pas les personnes.
8. **Actions** : chacune avec un responsable et une date, suivies jusqu'à leur clôture ; leçon capitalisée (skill `capitaliser-lecon`).
