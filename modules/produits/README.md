# Module Produits

Pour les sociétés qui **vendent leurs propres produits** : SaaS, plugins, thèmes et templates. S'ajoute au socle.

## Cycle d'un produit
| Étape | Skill | Responsable |
|---|---|---|
| Comprendre | `decouverte-produit` (entretiens, retours, enquête à 40 %) | Responsable produit |
| Choisir | `priorisation-produit` (RICE, feuille de route) | Responsable produit, validé par le Directeur |
| Cadrer | `spec-produit` (une page) | Responsable produit + Designer |
| Construire | skills du socle (design, développement, relecture) | Développeur, Relecteur |
| Livrer | `release-produit`, `changelog-version` | Développeur, validé par un humain |
| Mesurer | `metriques-produit` | Responsable produit |
| Faire adopter | `onboarding`, `signup`, `launch`, `directory-submissions` (marketingskills) | Responsable produit + Marketing |
| Monétiser | `paiements-produit`, `vente-en-ligne-conforme`, `pricing` et `paywalls` (marketingskills) | Responsable produit + Développeur |
| Garder | `retention-paiements`, `support-produit` | Support, Responsable produit |
| Fiabilité | `incident-postmortem`, `sauvegarde-restauration` | Développeur, validé par un humain |
| Distribution WordPress | `publication-wordpress-org`, `vente-marketplace` | Développeur + Support |

Les skills marqués (marketingskills) sont externes (voir `INSTALLER.md`) ; `marketing-garde-fous` et `vente-en-ligne-conforme` priment.

## Postes ajoutés
- `equipe/responsable-produit.md` : découverte, priorités, specs, indicateurs, lancements.
- `equipe/support.md` : réponses aux utilisateurs, base d'aide, remontée des bugs et des retours.

## Skills à ajouter aux postes du socle
- **Directeur** : `priorisation-produit`, `metriques-produit`, `incident-postmortem`.
- **Développeur** : `release-produit`, `changelog-version`, `paiements-produit`, `sauvegarde-restauration`, `incident-postmortem`, et
  selon le produit `publication-wordpress-org`, `vente-marketplace`.
- **Relecteur** : `release-produit`, `vente-en-ligne-conforme`, `publication-wordpress-org`, `vente-marketplace`.
- **Designer** : `spec-produit`, `onboarding`.
- **Commercial** : `pricing` (lecture), `retention-paiements`.
- **Marketing et contenu** : `launch`, `onboarding`, `metriques-produit`.

## Ce que la société doit fournir dans son repo `<societe>-core`
Un dossier `produits/<produit>/` par produit : `fiche.md`, `indicateurs.md`, `feuille-de-route.md`, `retours.md`, `technique.md`,
`specs/`, `entretiens/`, `support/`, `incidents/`, `rapports/`. Plus les CGV, CGU et politique de confidentialité **relues par un
avocat**, et les skills propres à chaque produit (par exemple les règles de contenu de FlowPublish).
