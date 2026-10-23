# Configuration des agents de <SOCIETE>

Les fiches de ce dossier sont **le texte exact des instructions** de chaque agent. Ce fichier donne le reste de leur configuration :
modèle et skills. Les deux changent par une PR relue et fusionnée par Alex ; **la Base applique** ensuite la configuration aux
agents, en une fois, et le note dans le ticket. Le Directeur ne modifie pas les agents lui-même.

Réglages communs : adaptateur `claude_local`, 1 exécution à la fois, réveil automatique désactivé, réveil à la demande activé,
300 tours au plus et 60 minutes au plus par exécution, nouvelle session après 10 réveils ou 24 heures sur un même ticket, secret
`CLAUDE_CODE_OAUTH_TOKEN` de la société. Seul le Directeur peut demander une embauche ou créer un skill.

Garder seulement les postes de l'organigramme ; ajouter les skills propres à la société et ceux des technologies de ses projets.

## Directeur · Opus 5.5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `decomposer-objectif`, `rapport-statut`, `arbitrage-escalade`, `passation`, `capitaliser-lecon`, `creer-un-skill`.
- **Externes** (voir `INSTALLER.md`) : `architecture-decision-records`, `council` (ECC) ; `task-planning`, `summarize-status` (catalogue Paperclip).

## Relecteur · Sonnet 5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `relecture`, `securite-owasp`, `isolation-donnees`, `secrets-et-dependances`, `conformite-rgpd`, `livraison-production`, `design-critique`, `accessibilite-rgaa`, `marketing-garde-fous`, `creer-un-skill`, `prospection`, `email-prospection`.
- **Externes** (voir `INSTALLER.md`) : `karpathy-guidelines`, `verification-before-completion` (superpowers) ; `database-migrations`, `production-audit`, `click-path-audit` (ECC) ; `impeccable` (commandes `critique` et `audit`) ; `web-design-guidelines` (Vercel) ; `copy-editing` (marketingskills) ; `qa-acceptance` (catalogue Paperclip) ; `web-quality-audit`, `core-web-vitals` (Addy Osmani).

## Développeur · Opus 5.5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `spec-avant-code`, `petites-pr`, `secrets-et-dependances`, `isolation-donnees`, `securite-owasp`, `ui-integration`, `ui-controle-visuel`, `accessibilite-rgaa`, `livraison-production`, `passation`.
- **Externes** (voir `INSTALLER.md`) : `karpathy-guidelines` ; `test-driven-development`, `systematic-debugging`, `writing-plans`, `verification-before-completion`, `receiving-code-review` (superpowers) ; `database-migrations`, `architecture-decision-records`, `error-handling`, `coding-standards`, `api-design`, `git-workflow`, `e2e-testing`, `browser-qa`, `canary-watch`, `click-path-audit`, `benchmark`, `documentation-lookup`, `production-audit`, `codebase-onboarding`, `make-interfaces-feel-better`, `frontend-a11y` (ECC) ; `impeccable` ; `frontend-design`, `webapp-testing` (Anthropic) ; `web-design-guidelines` (Vercel) ; `github-pr-workflow`, `qa-acceptance`, `agent-browser` (catalogue Paperclip) ; `design-taste-frontend` (taste-skill) ; `performance`, `core-web-vitals`, `web-quality-audit` (Addy Osmani) ; `archify` (schémas d'architecture, de base de données, de déroulé) ; `convert-documents-to-markdown` (anydoc, documents fournis par le client).
- **Technologies** : activer les skills de **toutes les technologies utilisées par les projets de la société** (liste tenue dans
  « Spécificités de la société »), et ceux d'une nouvelle technologie dès qu'un projet l'adopte. Catalogue disponible :
  React : `vercel-react-best-practices`, `vercel-composition-patterns` (Vercel), `react-patterns`, `react-testing`, `frontend-patterns` ;
  Next.js : `nextjs-turbopack` ; Vite : `vite-patterns` ; Vue / Nuxt : `vue-patterns`, `nuxt4-patterns` ; animations : `motion-foundations`,
  `motion-patterns` ; mobile : `react-native-patterns` ; Node : `backend-patterns`, `nestjs-patterns` ; Python : `python-patterns`,
  `python-testing`, `fastapi-patterns`, `django-patterns` ; PHP : `laravel-patterns`, `laravel-security`, `laravel-tdd` ; bases de données :
  `postgres-patterns`, `mysql-patterns`, `prisma-patterns` ; Docker : `docker-patterns` (ECC) ; WordPress : skills officiels
  `WordPress/agent-skills`. Pas de skill disponible pour une technologie (exemple : Redis) : `documentation-lookup` (Context7).

## Designer · Opus 5.5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `design-decouverte`, `design-references`, `design-direction`, `design-systeme`, `design-critique`, `accessibilite-rgaa`, `ui-controle-visuel`, `passation`.
- **Externes** (voir `INSTALLER.md`) : `impeccable` ; `frontend-design` (Anthropic) ; `web-design-guidelines` (Vercel) ; `make-interfaces-feel-better`, `motion-foundations`, `frontend-a11y`, `brand-voice`, `competitive-platform-analysis`, `frontend-slides` (ECC) ; `wireframe`, `agent-browser` (catalogue Paperclip) ; `copywriting` (marketingskills) pour les textes d'interface ; `design-taste-frontend`, `redesign-existing-projects` (taste-skill).

## Commercial · Sonnet 5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `prospection`, `email-prospection`, `pipeline-crm`, `etude-de-cas`, `conformite-rgpd`, `marketing-garde-fous`, `rapport-statut`.
- **Externes** (voir `INSTALLER.md`) : `customer-research`, `product-marketing`, `prospecting`, `cold-email`, `sales-enablement`, `competitor-profiling`, `offers`, `revops`, `marketing-psychology` (marketingskills) ; `market-research` (ECC) ; `humanizer` (relecture du style des textes) ; `convert-documents-to-markdown` (anydoc, appels d'offres et documents des prospects).

## Marketing et contenu · Sonnet 5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `marketing-garde-fous`, `linkedin-fondateur`, `etude-de-cas`, `rapport-croissance`, `conformite-rgpd`.
- **Externes** (voir `INSTALLER.md`) : `product-marketing`, `customer-research`, `content-strategy`, `copywriting`, `copy-editing`, `seo-audit`, `ai-seo`, `schema`, `site-architecture`, `cro`, `emails`, `lead-magnets`, `social`, `ads`, `ad-creative`, `analytics`, `attribution`, `ab-testing`, `competitors`, `public-relations`, `community-marketing`, `marketing-plan` (marketingskills) ; `brand-voice`, `article-writing` (ECC) ; `humanizer` (relecture du style des textes).

## Chef de projet · Opus 5.5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `cahier-des-charges`, `estimation-projet`, `devis-prestation`, `lancement-projet`, `point-client-hebdo`, `demande-de-changement`, `recette-client`, `mise-en-ligne-site`, `remise-projet`, `fin-de-mission`, `facturation-prestation`, `compte-rendu-client`, `ia-chez-le-client`, `decomposer-objectif`, `rapport-statut`, `arbitrage-escalade`, `capitaliser-lecon`.
- **Externes** (voir `INSTALLER.md`) : `writing-plans` (superpowers) ; `intent-driven-development`, `frontend-slides` (ECC) ; `sales-enablement` (marketingskills) ; `humanizer` (comptes rendus et textes aux clients) ; `archify` (schémas pour les clients) ; `convert-documents-to-markdown` (anydoc, documents des clients).

## Maintenance · Sonnet 5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `maintenance-sla`, `livraison-production`, `secrets-et-dependances`, `securite-owasp`, `demande-de-changement`, `rapport-statut`, `fin-de-mission`.
- **Externes** (voir `INSTALLER.md`) : `systematic-debugging`, `verification-before-completion` (superpowers) ; `canary-watch`, `browser-qa`, `production-audit`, `database-migrations` (ECC) ; `agent-browser` (catalogue Paperclip).

## Responsable produit · Opus 5.5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `decouverte-produit`, `priorisation-produit`, `spec-produit`, `metriques-produit`, `paiements-produit`, `retention-paiements`, `vente-en-ligne-conforme`, `marketing-garde-fous`, `decomposer-objectif`, `rapport-statut`, `arbitrage-escalade`, `capitaliser-lecon`.
- **Externes** (voir `INSTALLER.md`) : `product-marketing`, `customer-research`, `onboarding`, `signup`, `pricing`, `launch`, `directory-submissions`, `churn-prevention`, `paywalls`, `analytics`, `ab-testing`, `competitor-profiling` (marketingskills) ; `product-lens`, `intent-driven-development`, `council` (ECC) ; `archify` (schémas de parcours et d'architecture) ; `convert-documents-to-markdown` (anydoc).

## Support · Sonnet 5
- **Kit A2** : `regles-a2`, `paperclip-pratique`, `support-produit`, `retention-paiements`, `decouverte-produit`, `incident-postmortem`, `publication-wordpress-org`, `vente-marketplace`, `conformite-rgpd`, `rapport-statut`.
- **Externes** (voir `INSTALLER.md`) : `churn-prevention`, `copy-editing` (marketingskills) ; `humanizer` (réponses aux clients) ; `convert-documents-to-markdown` (anydoc, fichiers joints par les clients).
