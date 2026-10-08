# Installer le kit dans une organisation Paperclip

Libellés d'interface : Paperclip 2026.1005.0.

## 1. Skills du kit
« Skills » (barre latérale) → « Sources » → importer depuis GitHub le repo `sh4rk21/a2-kit`, puis cocher les skills de `socle/skills/`
(et plus tard du module utile : `modules/prestations/`, `modules/produits/`). Activer ensuite chaque skill sur les agents concernés :
page de l'agent → onglet « Skills » → « Available from the library ». La liste par poste est dans chaque fiche de `socle/equipe/`.

## 2. Fiches de poste
Copier les fiches utiles de `socle/equipe/` dans `<societe>-core/equipe/`, remplacer `<societe>`, compléter « Spécificités de la
société ». Le texte devient les instructions de l'agent (page de l'agent → « Instructions » → « Edit »).

## 3. Skills tiers (non copiés ici, à installer depuis leur source)
| Pour | Skill(s) | Source |
|---|---|---|
| Toutes | `task-planning`, `issue-triage`, `summarize-status`, `github-pr-workflow`, `qa-acceptance` | Catalogue Paperclip (« Skills » → « Discover ») |
| Toutes (interface) | `web-design-guidelines` | `vercel-labs/agent-skills` |
| Toutes (tests web) | `webapp-testing` | `anthropics/skills` |
| Écriture de skills | `skill-creator` | `anthropics/skills` |
| WordPress (ELDORADO, projets WordPress) | `wp-plugin-development`, `wp-block-development`, `wp-block-themes`, `wp-rest-api`, `wp-interactivity-api`, `wp-plugin-directory-guidelines`, `wp-performance`, `wp-phpstan`, `wp-env`, `wp-playground`, `wp-wpcli-and-ops`… | `WordPress/agent-skills` |

## 4. Outils en ligne de commande (versions figées)
Lancés par les agents dans le projet, sans installation globale :
- `npx impeccable@4.1.0 detect --json <dossier ou url>` : détecteur de design générique. Ne pas lancer `npx impeccable install`.
- `npx @google/design.md@0.4.0 lint DESIGN.md` (aussi `diff`, `export --format css-tailwind`).
- `@axe-core/playwright@4.13.0` en dépendance de test du projet pour l'accessibilité.
Monter de version uniquement par une PR sur ce fichier.

## 5. Serveurs MCP
« Connectors » → « Connect your own tool » → « Paste a config » (ou « Connect your own MCP server » pour une URL) :
| MCP | Usage | Configuration |
|---|---|---|
| Chrome DevTools | captures, Lighthouse, console | `npx -y chrome-devtools-mcp@1.10.1 --headless --isolated` |
| Playwright | captures, parcours, tests | `npx -y @playwright/mcp@0.0.83 --headless` |
| shadcn | recherche et installation de composants | `npx -y shadcn@4.21.4 mcp` |
| Refero (abonnement Pro) | références de produits réels | URL et jeton du compte Refero, en en-tête `Authorization` |
| Mémoire A2 | contexte des projets | voir le guide Paperclip d'A2 OS |

Les deux premiers ont besoin d'un navigateur Chromium dans l'environnement d'exécution des agents : le vérifier avant de les activer.
Régler ensuite les actions de chaque connexion dans l'onglet « Permissions ».

## 6. Mise à jour
Le kit évolue par PR sur ce repo. Les organisations resynchronisent leurs skills depuis « Skills » → « Sources ».
