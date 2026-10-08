---
name: ui-integration
description: Intègre une interface à partir du DESIGN.md (jetons vers Tailwind v4 @theme et variables shadcn, ou theme.json WordPress), avec des composants issus du MCP shadcn ou du registre interne, toujours restylés. Use when tu codes une page, un écran ou un composant d'interface dans un projet qui a un DESIGN.md validé.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Intégration d'interface

1. **Pas de DESIGN.md validé, pas d'interface** : demande-le (skill `design-systeme`).
2. **Jetons d'abord** : exporte le DESIGN.md (`theme.css` pour Tailwind v4 `@theme` et variables shadcn ; `theme.json` pour
   WordPress). Aucune couleur, taille ou ombre en dur ; **aucune classe de palette Tailwind brute** (`blue-500`…).
3. **Composants** : cherche-les via le MCP shadcn (registres shadcn, Magic UI, Aceternity ou registre interne de la société),
   installe, puis **restyle chaque composant** aux jetons du projet. Un composant laissé dans son style d'origine est un défaut.
4. **Polices** auto-hébergées (sous-ensemble utile, `font-display: swap`) ; licence vérifiée.
5. **Icônes** : seulement si elles aident à comprendre ; bibliothèque unique du projet (`lucide-react` ou Iconify), taille et trait cohérents.
6. **États** : vide, chargement, erreur, succès, désactivé, pour chaque composant interactif.
7. **Accessibilité dès le code** : éléments natifs (`button`, `a`, `label`), focus visible, ordre de tabulation logique, textes
   alternatifs, `prefers-reduced-motion`.
8. **Textes** de l'interface selon le ton du DESIGN.md ; aucun texte de remplissage en production.
9. Ensuite : skill `ui-controle-visuel`, puis les règles d'interface Vercel (`web-design-guidelines`) avant la PR.
