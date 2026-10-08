---
name: spec-avant-code
description: Transforme une demande vague en spécification validée avant d'écrire la moindre ligne de code. Use when un ticket demande une fonctionnalité, une page, une automatisation ou un changement de comportement dont le résultat attendu n'est pas déjà décrit précisément ; Don't use pour une correction de bug déjà comprise (voir debogage-methodique).
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers brainstorming (MIT)
---

# Spécification avant le code

**Règle** : pas de code tant que la spécification n'est pas écrite et validée.

1. **Comprendre** : relis le ticket, le dossier client ou produit, le code existant concerné et la mémoire A2. Note ce qui est sûr et ce
   qui est supposé.
2. **Questions** : s'il manque une information décisive, pose-les **regroupées en un seul commentaire**, chacune avec ta proposition par
   défaut, pour que la réponse soit rapide.
3. **2 ou 3 approches** avec leurs compromis (effort, risque, maintenance) et ta recommandation.
4. **Spécification** (document sur le ticket ou `docs/specs/AAAA-MM-JJ-sujet.md` dans le repo) :
   - objectif et critère de réussite mesurable ;
   - comportement attendu, cas limites, erreurs et messages ;
   - données touchées (schéma, migrations, données personnelles) ;
   - **hors périmètre** ;
   - critères d'acceptation testables (ils deviendront les tests).
5. **Validation** : demande l'accord dans le ticket (Directeur, ou direction si la décision lui revient). Pas de code avant.
6. Ensuite : skill `plan-de-travail`.

Erreurs courantes : coder « pour voir », spécifier la solution au lieu du besoin, oublier les cas d'erreur et le hors périmètre.
