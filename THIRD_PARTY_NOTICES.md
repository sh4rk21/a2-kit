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

## usestrix/strix — `tiers/strix/*` et `socle/skills/audit-securite` (§ 2 bis)
- Source : https://github.com/usestrix/strix (commit `9ed84f9`), dossier `skills/`, licence Apache-2.0 (`tiers/strix/LICENSE`).
- `tiers/strix/*` : 8 skills sur 9 (`managed-pentesting-with-strix`, qui pilote l'offre cloud payante, n'est pas copié ; d'autres
  skills y renvoient encore). Modifications (Apache-2.0, section 4) : l'installation par script téléchargé et passé au shell est
  remplacée par `pipx install strix-agent` (motif refusé par le contrôle de sécurité de Paperclip) ; note « Version A2 (modifiée) » en
  tête de chaque SKILL.md. **Non activés** sur les agents tant qu'Alex n'a pas choisi le modèle d'IA de Strix.
- `audit-securite` § 2 bis : grilles OWASP Top 10:2025 et API Security Top 10:2023 et méthode de preuve, adaptées et traduites de
  `owasp-top-10-testing`, `api-security-testing`, `web-app-penetration-testing` et `find-security-vulnerabilities-in-code`, réécrites
  pour une relecture sans l'outil Strix.

