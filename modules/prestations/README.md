# Module Prestations

Pour les sociétés qui travaillent **pour des clients** (agence, conseil, développement sur mesure). S'ajoute au socle.

## Cycle d'un projet client
| Étape | Skill | Responsable |
|---|---|---|
| Demande entrante | `qualification-demande`, `dossier-client` | Commercial |
| Appels et échanges | `compte-rendu-client` | Commercial, puis Chef de projet |
| Découverte | `cahier-des-charges` (devoir de conseil) | Chef de projet |
| Chiffrage | `estimation-projet`, `devis-prestation` | Chef de projet + Commercial |
| Contrat | `contrat-prestation` (cession de droits, RGPD art. 28) | Commercial |
| Démarrage | `lancement-projet`, `facturation-prestation` (acompte) | Chef de projet |
| Production | skills du socle (design, développement, relecture) ; `point-client-hebdo` ; `demande-de-changement` | Équipe, Chef de projet |
| Recette | `recette-client` | Chef de projet + Relecteur |
| Mise en ligne | `mise-en-ligne-site` (+ `livraison-production` du socle) | Développeur, validé par un humain |
| Remise | `remise-projet` | Chef de projet |
| Après | `maintenance-sla`, `fin-de-mission` | Maintenance, Chef de projet |
| Projet avec IA | `ia-chez-le-client` (AI Act art. 50) | Chef de projet + Développeur |

## Postes ajoutés
- `equipe/chef-de-projet.md` : du cahier des charges à la remise ; interlocuteur du client (via les humains).
- `equipe/maintenance.md` : clients sous contrat de maintenance.

## Skills à ajouter aux postes du socle
- **Directeur** : `qualification-demande`, `demande-de-changement`.
- **Commercial** : `qualification-demande`, `dossier-client`, `compte-rendu-client`, `devis-prestation`, `contrat-prestation`.
- **Développeur** : `mise-en-ligne-site`, `ia-chez-le-client`, `demande-de-changement` (savoir reconnaître un hors périmètre).
- **Relecteur** : `recette-client`, `devis-prestation`, `contrat-prestation` (vérifier la conformité au modèle).
- **Designer** : `cahier-des-charges` (lecture), `recette-client`.

## Ce que la société doit fournir dans son repo `<societe>-core`
`societe/presentation.md`, `societe/tarification.md`, `societe/mentions-legales.md`, `charte/modeles/` (devis, proposition,
conditions générales et annexe RGPD **relues par un avocat**), `templates/client/`. Les skills de la société précisent le format
de référence des devis, le style et les particularités (exemple : `proposition-devis` chez DIGIMEDIA).
