---
name: plan-de-travail
description: Découpe une spécification validée en plan d'exécution en petites étapes vérifiables (fichiers, tests, commandes). Use when une spécification est validée et avant d'écrire le code d'une fonctionnalité ou d'un changement de plus de quelques lignes.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers writing-plans (MIT)
---

# Plan de travail

Écris le plan comme pour quelqu'un de compétent qui ne connaît ni le projet ni le contexte.

1. **En-tête** : lien vers la spécification, branche, ce qui sera livré, comment on saura que c'est fini.
2. **Étapes de 2 à 10 minutes**, numérotées. Pour chacune :
   - fichiers exacts à créer ou modifier ;
   - le test à écrire d'abord (skill `tests-d-abord`) et la commande pour le lancer ;
   - le code minimal attendu ;
   - la commande de vérification et le résultat attendu.
3. **Ordre** : du plus risqué au plus simple, chaque étape laissant le projet dans un état qui compile et dont les tests passent.
4. **Points de contrôle** : toutes les 3 à 5 étapes, relance la suite de tests complète et fais un commit.
5. **Risques** listés en fin de plan (migration, données, sécurité, performance) avec la parade prévue.

Exécute ensuite le plan dans l'ordre. Si la réalité contredit le plan, arrête-toi, mets le plan à jour et note pourquoi.
