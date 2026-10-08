---
name: decision-architecture
description: Consigne une décision technique importante dans un ADR (Architecture Decision Record) du repo. Use when tu choisis une technologie, une structure de données, un service externe, un mode d'authentification ou toute option difficile à défaire, ou quand tu remplaces une décision précédente.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Décision d'architecture (ADR)

Fichier `docs/adr/NNNN-titre-court.md` (numéro croissant) :
- **Statut** : proposée, acceptée, remplacée par NNNN.
- **Contexte** : le problème et les contraintes (2 à 5 lignes).
- **Options** étudiées, avec avantages et inconvénients.
- **Décision** et **pourquoi**.
- **Conséquences** : ce que ça implique, ce que ça interdit, ce qu'il faudra surveiller.

Une décision qui engage un coût, un fournisseur ou les données des clients est **proposée** dans le ticket et acceptée par la direction
avant d'être marquée « acceptée ». On ne modifie pas un ADR accepté : on en écrit un nouveau qui le remplace.
