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

1. **Lance** le projet dans ta copie de travail (serveur de développement en arrière-plan, sur un port libre) ou utilise l'URL
   d'aperçu ou de production indiquée dans le ticket. Le navigateur est installé sur le poste des agents (section ci-dessous).
2. **Captures** à 375, 768 et 1440 px de large, en clair et en sombre si le projet a les deux ; avec contenu réel, et dans les états
   vide, erreur et chargement quand ils existent.
3. **Regarde vraiment les captures** et compare au DESIGN.md (skill `design-critique`).
4. **Audits** : Lighthouse (performance, accessibilité, bonnes pratiques, SEO) ; console sans erreur ; aucune requête en échec ;
   détecteur `npx impeccable detect --json` sans alerte non justifiée.
5. **Corrige et recommence**, trois boucles au maximum.
6. **Joins à la PR** : les captures finales, les scores Lighthouse, la sortie du détecteur, et les points restants s'il y en a.
7. **Non-régression** : si le projet a des captures de référence (Playwright `toHaveScreenshot`), mets-les à jour seulement pour
   un changement voulu, en le signalant.

## Le navigateur des agents (installé sur le serveur)
Chromium, Playwright 1.64.0 et Lighthouse 13.5.0 sont disponibles en ligne de commande, y compris pour une application lancée en
local (`http://localhost:<port>`). Les serveurs MCP de navigateur ne sont pas branchés : on travaille avec ces commandes.
- **Captures** (puis ouvre chaque image avec l'outil de lecture de fichiers pour la regarder vraiment) :
  `playwright screenshot --viewport-size=375,812 --full-page <url> captures/375.png`, idem `768,1024` et `1440,900` ;
  mode sombre : ajouter `--color-scheme=dark`.
- **Parcours** (clics, formulaires, erreurs de console) : un script `parcours.js` qui utilise `require('playwright')`
  (`chromium.launch()`, `page.goto`, `page.click`, `page.on('console')`, `page.on('pageerror')`, `page.screenshot`),
  lancé avec `node parcours.js`. Dans un projet qui a déjà des tests Playwright : `npx playwright test`.
- **Lighthouse** : `lighthouse <url> --quiet --chrome-flags="--headless=new --no-sandbox" --output=json --output-path=lighthouse.json`
  (ajouter `--preset=desktop` pour la version ordinateur). Lire les scores dans `categories` du fichier.
- **Accessibilité automatique** : `@axe-core/playwright` dans les tests du projet (skill `accessibilite-rgaa`).
- Les captures et rapports ne sont pas commités : ils vont dans le compte rendu du ticket et la description de la PR (scores,
  constats, chemins des captures dans la copie de travail).

