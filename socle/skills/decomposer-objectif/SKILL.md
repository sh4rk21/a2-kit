---
name: decomposer-objectif
description: Transforme une demande ou un objectif en tickets Paperclip clairs, chacun avec un résultat vérifiable, un responsable et ses dépendances. Use when le Directeur reçoit une demande de la direction, un objectif mensuel, un plan validé ou un projet à lancer ; Don't use pour exécuter le travail lui-même.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Décomposer un objectif en tickets

**Résultat** : une liste de tickets prêts à être assignés, validée par la direction si elle crée du travail nouveau.

1. **Reformule l'objectif** en une phrase avec un critère de réussite mesurable. S'il manque une information décisive, pose une
   seule question claire avant de découper.
2. **Un ticket parent par dossier**, des sous-tickets seulement pour un **livrable distinct** ou un **responsable différent**. Pas de
   ticket pour une relecture (elle se pose en étape sur le ticket du livrable), ni pour une correction (elle se fait dans le ticket
   et la PR du livrable). Cherche d'abord si un ticket existe déjà.
3. **Découpe en tranches verticales** (« tracer bullets ») : chaque ticket livre un résultat utilisable de bout en bout, pas une couche
   technique isolée. Taille cible : faisable en moins de 2 heures d'agent ; sinon redécoupe.
4. **Pour chaque ticket** : titre à l'infinitif, contexte (liens vers les fichiers et la mémoire), **critère de fin vérifiable**,
   responsable (le rôle le plus adapté), dépendances bloquantes, et ce qui est **hors périmètre**.
5. **Ordonne** : d'abord ce qui débloque les autres, puis ce qui réduit le plus le risque, puis le reste.
6. **Validation** : les nouveaux tickets passent par une proposition à la direction (gouvernance « Human only ») ; n'en crée pas en
   dehors du périmètre demandé.
7. **Suivi** : un ticket parent garde la liste et l'état ; ferme-le quand tous les enfants sont terminés ou explicitement abandonnés.

Erreurs courantes : tickets flous (« améliorer le site »), tickets trop gros, tickets qui supposent une décision non prise, oubli du
critère de fin.
