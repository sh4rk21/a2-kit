---
name: debogage-methodique
description: Trouve la cause racine d'un bug avant de corriger, en 4 phases (investigation, comparaison, hypothèse, correction). Use when un test échoue, une erreur apparaît en production, un comportement est inattendu, un build casse ou une correction précédente n'a pas marché ; Don't use pour une nouvelle fonctionnalité.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers systematic-debugging (MIT)
---

# Débogage méthodique

**Loi** : pas de correction sans cause racine identifiée.

1. **Investigation** : lis le message d'erreur en entier ; reproduis le problème de façon fiable ; regarde ce qui a changé récemment
   (commits, dépendances, configuration, données) ; remonte la chaîne d'appels jusqu'à l'origine de la mauvaise valeur.
2. **Comparaison** : trouve un cas qui fonctionne (autre environnement, version précédente, exemple de la documentation) et liste
   toutes les différences, même celles qui semblent sans importance.
3. **Hypothèse** : une seule à la fois, formulée (« X provoque Y parce que Z »), testée par le plus petit changement possible.
   Si elle est fausse, reviens à l'étape 1 avec ce que tu as appris ; n'empile pas les corrections.
4. **Correction** : un test qui reproduit le bug (skill `tests-d-abord`), puis la correction de la cause, puis vérification complète
   (skill `preuve-avant-fin`).

**Signal d'arrêt** : après 3 tentatives de correction infructueuses, arrête et remets en question l'architecture ou ta compréhension ;
écris ce que tu sais dans le ticket et demande un second regard (skill `arbitrage-escalade`).

En production : on ne débogue jamais directement sur le serveur. On constate, on revient à la version précédente si besoin (décision
humaine), puis on reproduit en local.
