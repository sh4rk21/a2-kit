---
name: ui-controle-visuel
description: Fait vérifier par l'agent le rendu réel de son interface : captures aux tailles clés en clair et sombre via le MCP Chrome DevTools ou Playwright, audit Lighthouse, détecteur anti-générique, puis corrections en boucle limitée. Use when une page ou un écran est codé ou modifié, avant d'ouvrir la PR ou de dire que c'est fini.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Contrôle visuel

Outils associés : `agent-browser` (catalogue Paperclip), `browser-qa` et `click-path-audit` (ECC), `webapp-testing` (Anthropic).

1. **Lance** le projet en local (ou un aperçu) et ouvre la page avec le MCP Chrome DevTools (en mode headless) ou Playwright.
2. **Captures** à 375, 768 et 1440 px de large, en clair et en sombre si le projet a les deux ; avec contenu réel, et dans les états
   vide, erreur et chargement quand ils existent.
3. **Regarde vraiment les captures** et compare au DESIGN.md (skill `design-critique`).
4. **Audits** : Lighthouse (performance, accessibilité, bonnes pratiques, SEO) ; console sans erreur ; aucune requête en échec ;
   détecteur `npx impeccable detect --json` sans alerte non justifiée.
5. **Corrige et recommence**, trois boucles au maximum.
6. **Joins à la PR** : les captures finales, les scores Lighthouse, la sortie du détecteur, et les points restants s'il y en a.
7. **Non-régression** : si le projet a des captures de référence (Playwright `toHaveScreenshot`), mets-les à jour seulement pour
   un changement voulu, en le signalant.
