# a2-kit

Kit commun des équipes d'agents des sociétés A2 (Paperclip + Claude) : des **skills** (compétences au format
[Agent Skills](https://agentskills.io)) et des **fiches de poste**, en français, pour travailler avec la rigueur d'une grande agence.

## Organisation en 3 couches
1. **Socle** (`socle/`) : pour toutes les sociétés. Direction, développement, relecture et qualité, design, commercial et marketing.
2. **Modules** : [`modules/prestations/`](modules/prestations/README.md) (travail pour des clients : 17 skills, du premier contact
   à la fin de mission, et les postes Chef de projet et Maintenance) et `modules/produits/` (à venir : SaaS, templates, plugins).
3. **Spécialités de chaque société** : dans son propre repo `<societe>-core/skills/`, plus des bibliothèques spécialisées
   (par exemple les skills officiels WordPress).

## Contenu du socle
| Famille | Skills |
|---|---|
| Direction | `regles-a2`, `decomposer-objectif`, `rapport-statut`, `passation`, `capitaliser-lecon`, `arbitrage-escalade` |
| Développement | `spec-avant-code`, `plan-de-travail`, `tests-d-abord`, `debogage-methodique`, `preuve-avant-fin`, `recevoir-une-revue`, `petites-pr`, `decision-architecture`, `secrets-et-dependances` |
| Relecture et qualité | `relecture`, `securite-owasp`, `isolation-donnees`, `migrations-base`, `livraison-production`, `conformite-rgpd` |
| Design | `design-decouverte`, `design-references`, `design-direction`, `design-systeme`, `design-critique`, `ui-integration`, `ui-controle-visuel`, `accessibilite-rgaa` |
| Commercial et marketing | `cible-et-personas`, `prospection`, `email-prospection`, `pipeline-crm`, `contenu-seo`, `linkedin-fondateur`, `etude-de-cas`, `test-publicitaire`, `rapport-croissance` |

Fiches de poste : `socle/equipe/` (Directeur, Développeur, Relecteur, Designer, Commercial, Marketing et contenu).
Modèles : `templates/` (charte de marque client).

## Principes
- **Validation humaine** avant tout ce qui sort : e-mail, devis, publication, publicité, mise en production.
- **Preuve avant affirmation** : tests, captures, mesures ; jamais de chiffre inventé.
- **Design jamais générique** : PRODUCT.md, références réelles, directions contrastées, DESIGN.md (format Google) vérifié,
  contrôle visuel des captures et détecteur anti-générique.
- **Conformité française et européenne** : RGPD, CNIL (prospection), RGAA et European Accessibility Act, AI Act.

## Installation
Voir [INSTALLER.md](INSTALLER.md).

## Licence
MIT (voir [LICENSE](LICENSE)). Certains skills sont adaptés d'œuvres tierces : voir [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
