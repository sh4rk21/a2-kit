# <societe>-core · le cerveau de <SOCIETE>

Référentiel central de <SOCIETE> : qui nous sommes, comment nous travaillons, nos clients ou nos produits, notre équipe d'agents.
Il ne contient **jamais de code livrable** : chaque livrable ou produit a son propre repo dans l'organisation GitHub `<SOCIETE>-DEV`.

Ce repo suit le **standard de structure A2**, le même pour chaque société : mêmes dossiers, mêmes noms, pour que les humains,
les agents Paperclip et A2 OS s'y retrouvent sans rien réapprendre. Modèle d'origine : `sh4rk21/a2-kit/templates/societe-core`.

| Dossier | Contenu |
|---|---|
| `CLAUDE.md` | Règles absolues de la société, lues par tous les agents |
| `societe/` | Présentation, tarification, mentions légales |
| `charte/` | Identité visuelle (`DESIGN.md`) et modèles de documents (`modeles/`) |
| `equipe/` | Organigramme et une fiche de poste par agent (texte exact de ses instructions Paperclip) |
| `skills/` | Skills propres à la société (les skills communs viennent du kit `sh4rk21/a2-kit`) |
| `memoire/` | Décisions de la société, datées `AAAA-MM-JJ-sujet.md`, index `MEMORY.md` |
| `clients/<client>/` | Sociétés de prestation : fiche, besoins, décisions, technique, `appels/`, `documents/` |
| `produits/<produit>/` | Sociétés de produits : fiche, indicateurs, feuille de route, retours, décisions, technique… |
| `templates/` | Squelettes : dossier client, dossier produit, repo client, repo produit |

## A2 OS
Le nom du dossier `clients/<client>/` ou `produits/<produit>/` est l'identifiant (ou un alias) du client ou du produit dans le
registre A2 (`a2-os/projects/registry.yaml`) : A2 OS range alors automatiquement son contenu dans la bonne mémoire, et le
cloisonnement entre clients s'applique. Un nouveau client ou produit est donc aussi déclaré dans le registre (demande à la base).

## Données personnelles
Les fichiers reçus des clients vont dans `documents/5-recu-du-client/`, **exclu de git** par `.gitignore`. Avant de renommer un
dossier qui en contient : `git check-ignore -v <un fichier dedans>`.

## Paperclip
- Ce repo est le projet de travail de l'organisation ; tout ticket qui le lit ou le modifie est rattaché à ce projet.
- Source de skills privée : ajoutée par Alex via la connexion GitHub, avec le dossier **`clients` exclu** (et `templates`).
- Mise en place complète : `sh4rk21/a2-kit/RECETTE-ORGANISATION.md`.
