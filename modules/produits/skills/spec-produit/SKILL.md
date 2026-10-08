---
name: spec-produit
description: Rédige la spécification d'une page d'une fonctionnalité produit (problème, preuves, utilisateurs, solution, hors périmètre, mesure de succès, risques, déploiement). Use when une opportunité est priorisée et doit être cadrée avant le développement, ou quand une demande de fonctionnalité arrive sans spécification.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Spécification produit d'une page

Fichier `produits/<produit>/specs/AAAA-MM-nom.md`, **une page au maximum** :

1. **Problème** : en une phrase, du point de vue de l'utilisateur.
2. **Preuves** : citations, nombre de demandes, données d'usage, effet sur le revenu ou l'abandon.
3. **Pour qui** : segment concerné (et part des utilisateurs ou du revenu).
4. **Solution proposée** : parcours principal en quelques étapes, maquette ou croquis si visuel (avec le Designer).
5. **Hors périmètre** : ce qu'on ne fait pas dans cette version.
6. **Mesure de succès** : un indicateur et une cible datée (ex. « taux d'activation à 7 jours de 30 % à 40 % en 6 semaines »).
7. **Risques** : technique, juridique, effet sur les clients existants, coût d'exploitation.
8. **Déploiement** : derrière un interrupteur de fonctionnalité ? pour quels utilisateurs d'abord ? migration de données ?
   communication (changelog, e-mail) ?

Validée par la direction, puis transformée en tickets (skill `spec-avant-code` du socle pour le détail technique).
