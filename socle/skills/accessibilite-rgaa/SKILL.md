---
name: accessibilite-rgaa
description: Vérifie et corrige l'accessibilité d'un site ou d'une application selon WCAG 2.2 AA et le RGAA (contrastes, clavier, lecteurs d'écran, formulaires, médias), avec tests automatiques et manuels. Use when une interface est prête à être livrée, quand un client est soumis à l'obligation d'accessibilité, ou quand un audit Lighthouse ou axe signale des erreurs.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Accessibilité (WCAG 2.2 AA, RGAA)

**Contexte légal** : depuis le 28 juin 2025, l'European Accessibility Act s'applique en France à de nombreux services en ligne
(commerce en ligne, services bancaires…) des entreprises de plus de 10 salariés ou 2 M€ de chiffre d'affaires. Vérifier si le client
est concerné : si oui, déclaration d'accessibilité obligatoire.

1. **Automatique** : axe (via Playwright, `@axe-core/playwright`) et l'audit accessibilité de Lighthouse, sans erreur.
2. **Clavier** : tout est utilisable au clavier seul, dans un ordre logique, focus toujours visible et jamais masqué.
3. **Contrastes** : texte 4.5:1 (3:1 pour les grands textes et les éléments d'interface).
4. **Structure** : un seul `h1`, titres hiérarchiques, repères (`header`, `nav`, `main`, `footer`), langue de la page déclarée.
5. **Formulaires** : chaque champ a une étiquette visible, erreurs décrites en texte et associées au champ.
6. **Images et médias** : texte alternatif pertinent (vide si décoratif), sous-titres pour les vidéos.
7. **Cibles** : 24 px minimum (44 px conseillé sur mobile) ; alternative aux gestes de glisser.
8. **Mouvement** : respect de `prefers-reduced-motion`, rien ne clignote.
9. **Test manuel** avec un lecteur d'écran (VoiceOver ou NVDA) sur le parcours principal.

Les outils automatiques ne trouvent qu'une partie des problèmes : le test manuel est obligatoire avant livraison pour un client concerné.
