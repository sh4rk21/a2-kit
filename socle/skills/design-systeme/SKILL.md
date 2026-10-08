---
name: design-systeme
description: Écrit et valide le DESIGN.md d'un projet au format Google (jetons YAML + justification) avec le parti pris, la typographie, les composants clés et les motifs interdits, vérifié automatiquement (contrastes, références). Use when une direction visuelle a été choisie et avant toute ligne de code d'interface, ou pour mettre à jour la charte d'un projet existant.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: anthropics/skills frontend-design (Apache-2.0)
---

# DESIGN.md

**Règle** : aucune interface ne se code sans DESIGN.md validé.

1. **En-tête YAML** (format `google-labs-code/design.md`) : `name`, `colors` (primitives puis rôles : fond, surface, texte, accent,
   états), `typography` (rôles : titres, texte, petits textes, avec famille, taille, graisse, interlignage, approche), `rounded`,
   `spacing`, `components` (bouton, champ, carte… en références de jetons).
2. **Corps en prose** :
   - le **parti pris** et pourquoi il vient du sujet ;
   - le **geste fort** et où il apparaît ;
   - la **typographie** : échelle, longueur de ligne (< 80 caractères), interlignage ;
   - le **mouvement** : quand, pourquoi, et respect de `prefers-reduced-motion` ;
   - le **ton des textes** de l'interface (verbes d'action, même mot pour la même action, messages d'erreur utiles) ;
   - **motifs interdits** pour ce projet (au minimum ceux de `design-direction/references/tics-generiques.md`).
3. **Vérification automatique** : `npx @google/design.md lint DESIGN.md` sans erreur (contrastes WCAG AA, références de jetons valides).
4. **Export** vers le code : `npx @google/design.md export --format css-tailwind DESIGN.md > theme.css`, ou `theme.json` pour WordPress.
5. **Validation** par la direction, puis le client pour un projet client. Versionner : toute évolution passe par une PR,
   comparée avec `npx @google/design.md diff`.
