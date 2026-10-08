---
name: recevoir-une-revue
description: Traite les retours d'une relecture avec rigueur technique : vérifier chaque point, corriger ce qui est juste, contester avec arguments ce qui est faux. Use when tu reçois un verdict « à corriger » ou « bloquant » du Relecteur, des commentaires de PR ou des retours de la direction sur ton travail.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers receiving-code-review (MIT)
---

# Recevoir une relecture

1. **Lis tous les points** avant de corriger quoi que ce soit ; regroupe ceux qui ont la même cause.
2. **Vérifie chaque point** dans le code ou les sources : est-il juste ? Ne corrige pas « pour faire plaisir ».
3. **Point juste** : corrige, avec un test si c'est un comportement, puis vérifie (skill `preuve-avant-fin`).
4. **Point discutable** : réponds avec des faits (fichier, ligne, test, source) et une proposition ; laisse décider celui qui a l'autorité
   (Directeur ou direction).
5. **Point hors périmètre** : propose un ticket séparé plutôt que de grossir la PR.
6. **Réponse** : un commentaire par point, « corrigé (commit x) », « contesté parce que… » ou « reporté au ticket y ».

Pas de remerciements de façade ni d'accord automatique : la qualité du produit passe avant la politesse.
