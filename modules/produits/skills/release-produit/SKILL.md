---
name: release-produit
description: Met en production une version d'un produit en continu et sans risque (interrupteurs de fonctionnalité, déploiement progressif, sauvegarde avant, migrations compatibles, retour arrière prêt, surveillance après). Use when une fonctionnalité ou une correction d'un produit en ligne est prête à être livrée aux utilisateurs.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Livrer une version d'un produit

Complète `livraison-production` du socle ; le déploiement est validé par un humain.

1. **Interrupteur de fonctionnalité** pour tout changement visible et risqué : livré éteint, allumé d'abord pour l'équipe, puis une
   partie des utilisateurs, puis tous. Retirer l'interrupteur quand la fonctionnalité est stable (dette notée).
2. **Base de données** : migrations compatibles avec l'ancienne et la nouvelle version (étendre, migrer, puis contracter dans une version
   ultérieure ; skill `database-migrations`). Jamais de suppression de colonne dans la même version que le code qui cesse de l'utiliser.
3. **Sauvegarde vérifiée** juste avant toute migration de données.
4. **Retour arrière** écrit et possible en quelques minutes (version précédente de l'image, interrupteur éteint).
5. **Après le déploiement** (30 minutes puis 24 heures) : erreurs, temps de réponse, inscriptions, paiements et parcours clés ;
   comparer avec avant. Au moindre doute : retour arrière d'abord, analyse ensuite.
6. **Communiquer** : entrée de changelog (skill `changelog-version`), aide mise à jour, e-mail aux utilisateurs concernés si leur usage
   change.
7. Éviter les livraisons la veille d'un week-end ou d'une absence de l'équipe.
