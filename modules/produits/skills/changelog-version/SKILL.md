---
name: changelog-version
description: Tient le journal des modifications et la numérotation des versions d'un produit (Keep a Changelog, versionnage sémantique), lisibles par les utilisateurs. Use when une version est publiée, qu'une pull request change un comportement visible, ou pour préparer les notes de version d'un plugin, d'un thème ou d'un SaaS.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Changelog et versions

1. **Fichier** `CHANGELOG.md` à la racine du repo du produit, format Keep a Changelog : section `[Non publié]` en haut, puis une section
   par version `[X.Y.Z] - AAAA-MM-JJ`, avec les rubriques **Ajouté**, **Modifié**, **Déprécié**, **Supprimé**, **Corrigé**, **Sécurité**.
2. **Chaque PR** qui change un comportement visible ajoute sa ligne dans `[Non publié]`, écrite pour l'utilisateur (ce qui change pour
   lui), pas pour le développeur.
3. **Versionnage sémantique** : MAJEUR si un changement casse la compatibilité (API, données, réglages), MINEUR pour un ajout compatible,
   CORRECTIF pour une correction. Une version majeure s'accompagne d'un guide de migration.
4. **Produits WordPress** : même numéro dans l'en-tête du plugin ou `style.css`, dans `readme.txt` (`Stable tag`) et dans la section
   `== Changelog ==` ; mention « Testé jusqu'à » à jour.
5. **SaaS** : page publique des nouveautés alimentée par le changelog ; les correctifs de sécurité sont mentionnés sans détail exploitable.
6. Étiquette git `vX.Y.Z` sur le commit publié.
