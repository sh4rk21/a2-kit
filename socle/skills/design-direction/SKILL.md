---
name: design-direction
description: Propose 2 ou 3 directions visuelles contrastées et ancrées dans le sujet, vérifiées contre les réflexes du design généré par IA, pour que la direction ou le client en choisisse une. Use when les références sont prêtes et qu'il faut fixer le parti pris visuel d'un site, d'une application, d'un thème ou d'un document.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: anthropics/skills frontend-design (Apache-2.0)
---

# Directions visuelles

Travaille comme le directeur artistique d'un studio connu pour donner à chaque client une identité qu'on ne confond avec aucune autre ;
ce client a déjà refusé des propositions qui faisaient « template ».

Pour **chaque direction** (2 ou 3, réellement différentes) :
- **Parti pris** en une phrase (ex. « précision d'atelier », « chaleur artisanale », « densité éditoriale ») et pourquoi il vient du sujet.
- **Palette** : 4 à 6 couleurs nommées en hexadécimal ou OKLCH, dérivées de la marque, contrastes AA visés.
- **Typographie** : une ou deux familles nettement distinctes, choisies pour ce projet (licence vérifiée), avec leur rôle.
- **Mise en page** : une phrase et un schéma ASCII de l'écran principal ; alignement choisi.
- **Le geste fort** : l'unique élément mémorable ; tout le reste reste calme.
- **Ce qu'on s'interdit** pour ce projet.

**Revue avant de présenter** : pour chaque direction, demande-toi si tu l'aurais proposée pour n'importe quel brief similaire. Si oui,
change la partie concernée et dis ce que tu as changé. Vérifie l'absence des tics listés dans `references/tics-generiques.md`.

**Validation** : la direction (et le client pour un projet client) choisit une direction. Pas de DESIGN.md avant ce choix.
Ensuite : skill `design-systeme`.
