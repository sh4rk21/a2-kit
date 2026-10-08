---
name: design-critique
description: Critique une interface rendue (captures) contre son DESIGN.md et les tics du design générique, avec des corrections précises (affiner, épurer, oser, calmer). Use when une page ou un écran est implémenté et capturé, avant de le présenter à la direction ou au client, ou quand on te demande ton avis sur un design.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: anthropics/skills frontend-design (Apache-2.0)
---

# Critique de design

À partir des captures du skill `ui-controle-visuel` (375, 768, 1440 px, clair et sombre) :
1. **Conformité** au DESIGN.md : couleurs, typographies, espacements, composants, geste fort présent à un seul endroit.
2. **Hiérarchie** : l'œil va-t-il d'abord à la tâche principale de PRODUCT.md ? Un seul appel à l'action principal par écran.
3. **Tics génériques** : passe la liste `design-direction/references/tics-generiques.md` et le détecteur automatique
   (`npx impeccable detect --json <url ou dossier>`). Chaque tic trouvé est un point à corriger.
4. **Texte** : utile, précis, dans le vocabulaire de l'utilisateur ; pas de remplissage ; boutons qui disent ce qui se passe.
5. **Responsive et états** : mobile réellement pensé ; états vide, chargement, erreur, succès dessinés.
6. **Accessibilité visible** : contrastes, focus clavier visible, tailles de clic (24 px minimum, 44 px sur mobile).
7. **Retenue** : retire un accessoire (règle de Chanel) ; tout décor sans fonction part.

**Verdict** : liste de corrections numérotées, chacune avec l'endroit, le problème et la direction (**affiner**, **épurer**, **oser**,
**calmer**). Trois boucles de correction au maximum, ensuite présentation à la direction avec les points restants.
