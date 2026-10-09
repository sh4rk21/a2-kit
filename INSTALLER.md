# Installer le kit dans une organisation Paperclip

Libellés d'interface : Paperclip 2026.1005.0. Chaque source s'ajoute par « Skills » → « Sources » → « Import from GitHub » →
« ... or add public repo by URL » → URL → « Find skills » → cocher **uniquement** les dossiers indiqués → « Import N skills ».
Les skills s'activent ensuite agent par agent (page de l'agent → onglet « Skills ») selon la section « Skills » de sa fiche.

Les skills externes sont **importés depuis leur repo d'origine, jamais copiés ici** : ils se mettent à jour avec « Select skills » /
rafraîchissement de la source. En cas d'écart, les skills du kit (`regles-a2`, `marketing-garde-fous`, `prospection`,
`email-prospection`, `vente-en-ligne-conforme`…) **priment**.

## 1. Le kit
`https://github.com/sh4rk21/a2-kit` : cocher `socle/skills`, plus `modules/prestations/skills` et/ou `modules/produits/skills` selon
la société, et **`tiers/ecc` et `tiers/impeccable`**. Ne pas cocher `templates`.

`tiers/` contient des copies de skills externes que Paperclip ne peut pas importer depuis leur repo d'origine : **ECC** (le repo
dépasse la limite de 1 000 skills analysés ; 47 skills retenus, dont un catalogue de technologies) et **Impeccable** (fichier de plus d'1 Mo et moteur binaire ; copié
sans son dossier `scripts/`, le détecteur passe par `npx impeccable@4.1.0`). Licences d'origine incluses. Mise à jour :
`scripts/sync-tiers.sh <ref-ECC> <ref-Impeccable>` puis PR.

## 2. Sources externes (licences MIT ou Apache-2.0, toutes vérifiées contre le contrôle de sécurité de Paperclip)

| Source | URL | Dossiers à cocher |
|---|---|---|
| Karpathy | `https://github.com/multica-ai/andrej-karpathy-skills` | `skills/karpathy-guidelines` |
| superpowers | `https://github.com/obra/superpowers` | `skills/` : `test-driven-development`, `systematic-debugging`, `writing-plans`, `verification-before-completion`, `receiving-code-review` |
| Anthropic | `https://github.com/anthropics/skills` | `skills/` : `frontend-design`, `webapp-testing` |
| Vercel | `https://github.com/vercel-labs/agent-skills` | `skills/` : `web-design-guidelines`, `react-best-practices`, `composition-patterns` |
| taste-skill | `https://github.com/Leonxlnx/taste-skill` | `skills/taste-skill` (nommé `design-taste-frontend`), `skills/redesign-skill` (nommé `redesign-existing-projects`) |
| Web quality (Addy Osmani) | `https://github.com/addyosmani/web-quality-skills` | `skills/performance`, `skills/core-web-vitals`, `skills/web-quality-audit` |
| marketingskills | `https://github.com/coreyhaines31/marketingskills` | `skills/` : `product-marketing`, `customer-research`, `content-strategy`, `copywriting`, `copy-editing`, `seo-audit`, `ai-seo`, `schema`, `site-architecture`, `cro`, `signup`, `onboarding`, `emails`, `lead-magnets`, `social`, `ads`, `ad-creative`, `analytics`, `attribution`, `ab-testing`, `competitors`, `competitor-profiling`, `public-relations`, `community-marketing`, `marketing-plan`, `marketing-psychology`, `offers`, `pricing`, `paywalls`, `launch`, `directory-submissions`, `churn-prevention`, `prospecting`, `cold-email`, `sales-enablement`, `revops` |
| WordPress (sociétés WordPress) | `https://github.com/WordPress/agent-skills` | les skills `wp-*` utiles (`wp-plugin-development`, `wp-block-development`, `wp-block-themes`, `wp-rest-api`, `wp-interactivity-api`, `wp-plugin-directory-guidelines`, `wp-performance`, `wp-phpstan`, `wp-env`, `wp-playground`, `wp-wpcli-and-ops`) |

**Catalogue Paperclip** (« Skills » → « Discover ») : `task-planning`, `summarize-status`, `github-pr-workflow`, `qa-acceptance`,
`wireframe`, `agent-browser`. **Ne pas installer** `design-critique` du catalogue : il porte le même nom que celui du kit.

## 3. Écartés volontairement
- ECC `lead-intelligence`, `connections-optimizer`, `social-graph-ranker` (pilotent LinkedIn : risque CNIL), `social-publisher`,
  `crosspost`, `x-api` (publication sans validation humaine), `data-scraper-agent`.
- ECC `security-review`, `tdd-workflow`, `deployment-patterns`, `santa-method`, `redis-patterns` et Anthropic `skill-creator` : refusés par le contrôle
  de sécurité de Paperclip (motifs d'exécution dynamique). Le kit couvre ces sujets (`securite-owasp`, superpowers, `livraison-production`).
- marketingskills `programmatic-seo` (contenu en masse, risque « scaled content abuse »), `marketing-loops` (boucles autonomes),
  `sms`, `video`, `image`, `aso` (hors besoin).
- superpowers `brainstorming` (dialogue interactif : remplacé par `spec-avant-code`), `using-superpowers`.
- UI UX Pro Max et `theme-factory` : catalogues de styles qui produisent un look générique.
- taste-skill `soft-skill`, `minimalist-skill`, `brutalist-skill`, `gpt-tasteskill` (styles imposés), `imagegen-*`, `image-to-code-skill`,
  `brandkit` (génération d'images), Addy Osmani `best-practices` (refusé par le contrôle de sécurité de Paperclip).
- MCP non officiels qui aspirent Mobbin, Dribbble, Behance ou Refero ; Mobbin et Nicely Done (payants) tant que Refero n'est pas pris.

## 4. Fiches de poste
Copier les fiches utiles de `socle/equipe/` et `modules/*/equipe/` dans `<societe>-core/equipe/`, remplacer `<societe>`, compléter
« Spécificités de la société ». Le texte devient les instructions de l'agent (page de l'agent → « Instructions » → « Edit »).

## 5. Outils en ligne de commande (versions figées)
- `npx impeccable@4.1.0 detect --json <dossier ou url>` : détecteur de design générique. Ne pas lancer `npx impeccable install`.
- `npx @google/design.md@0.4.0 lint DESIGN.md` (aussi `diff`, `export --format css-tailwind`).
- `@axe-core/playwright@4.13.0` en dépendance de test du projet pour l'accessibilité.
- `npx dembrandt@0.38.0 <url>` : extraction des jetons de design d'un site (site actuel du client avant une refonte).
Monter de version uniquement par une PR sur ce fichier.

## 6. Serveurs MCP
« Connectors » → « Connect your own tool » → « Paste a config » (ou « Connect your own MCP server » pour une URL) :
| MCP | Usage | Configuration |
|---|---|---|
| Chrome DevTools | captures, Lighthouse, console | `npx -y chrome-devtools-mcp@1.10.1 --headless --isolated` |
| Playwright | captures, parcours, tests | `npx -y @playwright/mcp@0.0.83 --headless` |
| shadcn | recherche et installation de composants | `npx -y shadcn@4.21.4 mcp` |
| Inspo (gratuit) | 832 sites réels, DESIGN.md par site (skill `design-references`) | URL `https://inspomcp.dev/api/mcp`, sans authentification |
| Refero (abonnement Pro, optionnel) | écrans et parcours de produits réels (skill `design-references`) | URL `https://api.refero.design/mcp`, connexion OAuth (« Sign in ») |
| Context7 | documentation à jour des bibliothèques (skill `documentation-lookup`) | serveur distant Context7 |
| Mémoire A2 | contexte des projets | voir le guide Paperclip d'A2 OS |

Chrome DevTools et Playwright ont besoin d'un navigateur Chromium dans l'environnement d'exécution des agents (réglage « Enable Chrome »
de l'agent dans « Harness / Runtime ») : le vérifier avant de les activer. Régler ensuite les actions de chaque connexion dans
l'onglet « Permissions ».

## 7. Mise à jour
Le kit évolue par PR sur ce repo. Les organisations resynchronisent leurs sources depuis « Skills » → « Sources » ; un skill retiré
d'une source reste installé et doit être retiré de la bibliothèque à part.
