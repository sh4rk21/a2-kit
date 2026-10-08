# a2-kit

Kit commun des équipes d'agents des sociétés A2 (Paperclip + Claude) : des **skills** (compétences au format
[Agent Skills](https://agentskills.io)) et des **fiches de poste**, en français, pour travailler avec la rigueur d'une grande agence.

## Organisation en 3 couches
1. **Socle** (`socle/`) : pour toutes les sociétés. Direction, développement, relecture et qualité, design, commercial et marketing.
2. **Modules** : [`modules/prestations/`](modules/prestations/README.md) (travail pour des clients : 17 skills, du premier contact
   à la fin de mission, et les postes Chef de projet et Maintenance) et [`modules/produits/`](modules/produits/README.md) (SaaS, plugins, thèmes : 14 skills, de la découverte au support, et
   les postes Responsable produit et Support).
3. **Spécialités de chaque société** : dans son propre repo `<societe>-core/skills/`, plus des bibliothèques spécialisées
   (par exemple les skills officiels WordPress).

## Contenu du socle
| Famille | Skills |
|---|---|
| Direction | `regles-a2`, `decomposer-objectif`, `rapport-statut`, `passation`, `capitaliser-lecon`, `arbitrage-escalade` |
| Développement | `spec-avant-code`, `petites-pr`, `secrets-et-dependances` |
| Relecture et qualité | `relecture`, `securite-owasp`, `isolation-donnees`, `livraison-production`, `conformite-rgpd` |
| Design | `design-decouverte`, `design-references`, `design-direction`, `design-systeme`, `design-critique`, `ui-integration`, `ui-controle-visuel`, `accessibilite-rgaa` |
| Commercial et marketing | `marketing-garde-fous`, `prospection`, `email-prospection`, `pipeline-crm`, `linkedin-fondateur`, `etude-de-cas`, `rapport-croissance` |

Fiches de poste : `socle/equipe/` (Directeur, Développeur, Relecteur, Designer, Commercial, Marketing et contenu).
Modèles : `templates/` (charte de marque client).

## Skills externes
Le kit **ne réinvente pas** ce qui existe déjà en mieux : la méthode de développement (superpowers, Karpathy, ECC), l'exécution du
design (Impeccable, Anthropic, Vercel) et la méthode marketing (marketingskills) sont importées directement depuis leurs dépôts
d'origine (liste exacte dans [INSTALLER.md](INSTALLER.md)). Le kit apporte ce qu'on ne trouve nulle part ailleurs : les règles et
validations A2, la démarche de design validée par le client, le droit français et européen (RGPD, CNIL, contrats, facturation,
AI Act, accessibilité), le cycle d'agence et la vente de produits (WordPress.org, marketplaces). Ses règles priment sur les skills externes.

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
