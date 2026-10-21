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
2. **Un ticket par livrable**, sous un ticket parent seulement si le dossier demande plusieurs livrables ou plusieurs responsables.
   Pas de ticket pour une relecture ni pour une retouche (skill `paperclip-pratique`). Cherche d'abord si un ticket existe déjà.
   À la création, pose les étapes : **relecture** par le Relecteur, et **validation** par l'humain qui décide quand le livrable part
   vers un humain ou un client.
3. **Découpe en tranches verticales** (« tracer bullets ») : chaque ticket livre un résultat utilisable de bout en bout, pas une couche
   technique isolée. Taille cible : faisable en moins de 2 heures d'agent ; sinon redécoupe.
4. **Pour chaque ticket** : titre à l'infinitif, contexte (liens vers les fichiers et la mémoire), **critère de fin vérifiable**,
   responsable (le rôle le plus adapté), dépendances bloquantes, et ce qui est **hors périmètre**.
5. **Ordonne** : d'abord ce qui débloque les autres, puis ce qui réduit le plus le risque, puis le reste.
6. **Validation** : une demande explicite de l'humain vaut feu vert, crée les tickets directement, sans carte de confirmation. Un
   chantier que tu repères toi-même reste en « backlog » avec ta recommandation, jusqu'à son accord.
7. **Suivi** : une fois les tickets créés et confiés, **arrête-toi** ; Paperclip te réveille quand les enfants sont terminés
   (`issue_children_completed`). Une retouche demandée sur le parent est renvoyée au ticket du livrable, jamais transformée en
   nouveau ticket. Ferme le parent quand tous les enfants sont terminés ou explicitement abandonnés.

Erreurs courantes : tickets flous (« améliorer le site »), tickets trop gros, tickets qui supposent une décision non prise, oubli du
critère de fin.
