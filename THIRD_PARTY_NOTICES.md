# Notices tierces

Certains skills de ce dépôt sont **adaptés** (traduits en français, réécrits pour des agents Paperclip autonomes, complétés) à partir
d'œuvres tierces. Les licences d'origine sont reproduites dans `licenses/`.

| Skill(s) de ce dépôt | Source | Auteur | Licence | Modifications |
|---|---|---|---|---|
| `spec-avant-code` (adapté de `brainstorming`) | [obra/superpowers](https://github.com/obra/superpowers) | Jesse Vincent | MIT (`licenses/MIT-obra-superpowers.txt`) | Traduction, condensation, validations humaines interactives remplacées par les approbations et commentaires de tickets Paperclip |
| `design-direction`, `design-critique`, `design-systeme` (liste des tics de design générique, processus plan → revue → construction → critique) | [anthropics/skills, `frontend-design`](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Anthropic | Apache-2.0 (`licenses/APACHE-2.0-anthropic-frontend-design.txt`) | Traduction, fusion avec des règles maison, ajout RGAA, DESIGN.md au format Google, contrôles automatiques |

| `tiers/ecc/*` (47 skills, copies non modifiées) | [affaan-m/ECC](https://github.com/affaan-m/ECC) | Affaan Mustafa | MIT (`tiers/ecc/LICENSE`) | Aucune ; sélection de dossiers |
| `tiers/impeccable/impeccable` | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | Paul Bakaus | Apache-2.0 (`tiers/impeccable/LICENSE`, `tiers/impeccable/NOTICE.md`) | Dossier `scripts/` retiré ; note « Version A2 (modifiée) » ajoutée en tête de SKILL.md |

Ressources **non copiées**, importées directement depuis leur dépôt d'origine (voir `INSTALLER.md`) : obra/superpowers,
multica-ai/andrej-karpathy-skills, anthropics/skills, vercel-labs/agent-skills, coreyhaines31/marketingskills,
WordPress/agent-skills, blader/humanizer, DietrichGebert/ponytail, catalogue Paperclip, linter `@google/design.md`.

## anthropics/skills — `tiers/anthropic/claude-api`
- Source : https://github.com/anthropics/skills (commit `dbd4588`), skill `claude-api`, licence Apache-2.0 (`tiers/anthropic/LICENSE`).
- Modifications (Apache-2.0, section 4) : copie réduite (SKILL.md, `typescript/claude-api/`, `curl/examples.md`, références communes de
  `shared/` sauf Managed Agents et CLI `ant`) ; le mot réservé de l'exécution dynamique, employé au sens d'évaluation, est écrit
  « evaluation » ; deux formulations d'exemple de commande reprises ; note « Version A2 (modifiée) » en tête du SKILL.md. Script :
  `scripts/sync-tiers.sh`.

## tt-a1i/archify — `tiers/archify/archify`
- Source : https://github.com/tt-a1i/archify (commit `25cf370`), dossier `archify/`, licence MIT (`tiers/archify/LICENSE`).
- Modifications : exemples rendus en HTML retirés (les exemples JSON restent) ; dans `explainer/parse.mjs`, un commentaire qui cite le
  mot réservé de l'exécution dynamique est reformulé ; dans `renderers/shared/diagnostics.mjs`, deux octets NUL écrits tels quels
  sont remplacés par leur écriture échappée `\u0000` (même valeur) ; note « Version A2 (modifiée) » en tête du SKILL.md. Script :
  `scripts/sync-tiers.sh`.

## firecrawl/anydoc — `tiers/anydoc/convert-documents-to-markdown`
- Source : https://github.com/firecrawl/anydoc (commit `3b6d4cd`), skill `convert-documents-to-markdown`, licence MIT
  (`tiers/anydoc/LICENSE`).
- Modifications : version de l'outil figée (`@firecrawl/anydoc@0.2.4`) ; la règle sur l'OCR hébergé est remplacée par son
  interdiction (envoi du document à un service externe) ; note « Version A2 (modifiée) » en tête du SKILL.md. Script :
  `scripts/sync-tiers.sh`.
