---
name: sauvegarde-restauration
description: Met en place et vérifie les sauvegardes d'un produit (bases, fichiers, configuration), avec une restauration de test chaque mois et des objectifs de perte et de durée de reprise. Use when un produit est mis en ligne, que son stockage change, ou pour le contrôle mensuel des sauvegardes.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Sauvegarde et restauration

1. **Objectifs écrits** dans `produits/<produit>/technique.md` : perte de données maximale acceptable (ex. 24 heures) et durée
   maximale de remise en service (ex. 4 heures).
2. **Quoi** : bases de données, fichiers déposés par les utilisateurs, configuration ; les secrets sont sauvegardés à part, dans le
   gestionnaire de secrets.
3. **Règle 3-2-1** : trois copies, deux supports, une copie **hors du serveur** (autre fournisseur ou région), chiffrée ; une copie
   impossible à effacer depuis le serveur de production.
4. **Fréquence et conservation** adaptées aux objectifs (ex. quotidienne gardée 14 jours, hebdomadaire 8 semaines, mensuelle 12 mois),
   en cohérence avec la durée de conservation des données personnelles.
5. **Restauration de test chaque mois** dans un environnement isolé : vérifier que l'application démarre et que les données sont
   complètes ; noter la durée réelle. **Une sauvegarde jamais restaurée n'est pas une sauvegarde.**
6. **Alertes** si une sauvegarde échoue ou n'a pas eu lieu.
7. **Journal** des tests de restauration dans `produits/<produit>/technique.md`.
