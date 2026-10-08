---
name: tests-d-abord
description: Développement piloté par les tests : écrire un test qui échoue avant tout code de production, puis le minimum pour le faire passer, puis nettoyer. Use when tu implémentes une fonctionnalité, corriges un bug ou modifies un comportement dans un projet qui a (ou doit avoir) des tests automatisés.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers test-driven-development (MIT)
---

# Tests d'abord

**Loi** : aucun code de production sans un test qui a d'abord échoué.

Cycle, pour chaque comportement :
1. **Rouge** : écris un seul test qui décrit le comportement attendu. Lance-le et **vérifie qu'il échoue pour la bonne raison** (pas une
   faute de frappe ni un import manquant).
2. **Vert** : écris le code **minimal** qui le fait passer. Lance-le : il passe, et les autres tests aussi.
3. **Nettoyage** : améliore le code et les tests sans changer le comportement, tests toujours verts.
4. Recommence pour le comportement suivant.

Bug : écris d'abord le test qui **reproduit** le bug (il échoue), puis corrige.

Rationalisations à refuser :
| Excuse | Réalité |
|---|---|
| « C'est trop simple pour un test » | Les bugs simples existent ; le test prend une minute. |
| « J'écrirai les tests après » | Un test écrit après passe d'emblée : il ne prouve rien. |
| « Je teste à la main » | Un test manuel ne se rejoue pas à la prochaine modification. |
| « Le code existe déjà, je le garde » | Du code écrit avant le test se jette et se réécrit depuis le test. |

Exceptions acceptées, à signaler dans la PR : prototype jetable explicitement demandé, contenu purement éditorial, configuration sans logique.
