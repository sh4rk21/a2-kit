---
name: passation
description: Écrit une passation pour qu'un autre agent ou une nouvelle session reprenne un travail sans rien perdre. Use when un ticket change de responsable, quand une tâche s'arrête en cours (limite d'actions, attente d'une décision), ou avant de fermer un ticket non terminé.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Passation

Commentaire de ticket (ou document lié) contenant :
1. **Objectif** du ticket et critère de fin, en une phrase.
2. **État exact** : ce qui est fait (avec preuves : branche, commit, PR, fichiers), ce qui est en cours, ce qui n'est pas commencé.
3. **Décisions prises** et pourquoi ; décisions **en attente** et de qui.
4. **Pièges rencontrés** : ce qui a échoué, ce qu'il ne faut pas retenter.
5. **Prochaine action précise**, avec la commande ou le fichier de départ.
6. **Où est l'information** : liens vers la mémoire, les fichiers, les tickets liés.

Teste ta passation : un agent qui ne connaît rien du ticket pourrait-il reprendre en moins de 5 minutes ? Sinon, complète.
