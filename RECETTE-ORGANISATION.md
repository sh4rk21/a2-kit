# Recette : mettre en place une organisation

Méthode éprouvée sur FLOW (octobre 2026), Paperclip 2026.1005.0. Elle s'applique à chaque société (DIGIMEDIA, ELDORADO, les
suivantes) et à la remise à niveau d'une organisation existante. Libellés d'interface exacts : guide Paperclip d'A2 OS.

Trois acteurs, chacun dans son rôle :
- **Base (Claude)** : serveur, A2 OS, accès techniques, configuration des agents et gestes de mise en production. Intervient aux étapes marquées « Base ».
- **Alex** : ce qui demande l'interface ou un compte humain (secrets, connexions, repo privé, approbations, fusions).
- **Directeur** : tout le reste, par tickets ; il propose les fiches de son équipe par PR, la Base les applique.

## Étape 1 · Socle technique (Base)
1. Organisation GitHub de la société (`<SOCIETE>-DEV`) et repo cerveau privé `<societe>-core`, créé **à partir du modèle
   `templates/societe-core/` du kit** (copier tout le dossier, remplacer `<societe>`/`<SOCIETE>`, compléter `CLAUDE.md`, `societe/`,
   l'organigramme ; garder `clients/` pour une société de prestation, `produits/` pour une société de produits, ou les deux).
2. A2 OS : société déclarée dans le registre (`repo:` du repo cerveau) et jeton `paperclip-<societe>` limité à la société, avec les
   droits `memory:read` et `memory:write` (les notes des agents arrivent dans « À valider », jamais directement en mémoire).

## Étape 2 · Organisation Paperclip (Alex)
1. Créer l'organisation. Le premier agent est le **Directeur**.
2. Menu du compte → « Settings » → « General » :
   - « Hiring » : activer **« Require board approval for new hires »** ;
   - « Interaction governance » : « Cap » sur **« Human only »** pour les cinq types, **y compris « Ask user questions »** (par
     défaut « Anyone ») : sinon un autre agent peut répondre à une question posée à Alex (un prix, une décision).
3. « Settings » → « Secrets » → « New secret » (« Organization », « Managed value ») :
   - `CLAUDE_CODE_OAUTH_TOKEN` : le jeton Claude **du compte de la société** (jamais celui d'Alex), généré par `claude setup-token` ;
   - `GITHUB_TOKEN` : jeton GitHub fine-grained, « Resource owner » = l'organisation GitHub de la société, « All repositories »,
     Contents et Pull requests en « Read and write ».
4. « Connectors » :
   - ligne « GitHub » → « Personal access token (advanced) » → même jeton → « Shared organization GitHub account (advanced) ».
     Puis « Which agents can use this connection? » → **« Just agents I pick », sans aucun agent** (sinon Paperclip s'en sert pour
     cloner et échoue). Elle sert uniquement au choix des repos et à la source privée du repo cerveau ;
   - « Connect your own MCP server » : mémoire A2 OS (`https://os.a2cloud.link/mcp`, en-tête `Authorization: Bearer <jeton de
     l'étape 1>`), « Any human in the organization », « Any agent » ;
   - « Connect your own MCP server » : Inspo (`https://inspomcp.dev/api/mcp`, sans authentification), réservé au Designer et au
     Développeur (à régler après leur embauche). Refero si la société a l'abonnement.
5. « Projects » → un projet par repo (repo cerveau, chaque produit ou client) :
   - « Env » : `GITHUB_TOKEN` et `GH_TOKEN` en **« Organization secret »** (icône « T ⌄ »), jamais en texte ;
   - « Execution Workspaces » : copie isolée par tâche (réglage par défaut de l'instance).
6. « Skills » → « Sources » → « Import from GitHub » : **seulement le repo cerveau privé** (`<societe>-core`), via la connexion
   GitHub, en **excluant les dossiers `clients` et `templates`** (aucun fichier d'un client ne doit remonter dans la bibliothèque).
   Tant que `skills/` ne contient aucun skill (cas d'une société neuve), Paperclip n'a rien à importer (« 0 of 0 selected ») :
   ajouter cette source au premier skill propre à la société, après sa fusion. Rafraîchir cette source reste un geste d'Alex (« ⋮ » → « Refresh ») : un agent ne peut pas lire un repo privé par là.

## Étape 3 · Directeur (Alex, puis Base)
1. Créer le Directeur avec le rôle **`ceo`** (agent racine ; l'interface ne permet pas de changer un rôle après création), modèle
   Opus 5.5, variable `CLAUDE_CODE_OAUTH_TOKEN` en « Organization secret ».
2. **Base** : instructions = `equipe/directeur.md` écrites par l'API (ne **jamais coller** une fiche dans l'éditeur « Instructions »,
   il abîme le texte), puis les réglages communs de l'étape 4.3.
3. **Le premier ticket du Directeur se limite à prendre connaissance de la société** et à proposer l'équipe. Les chantiers qu'il
   repère restent en « backlog » : **aucun chantier ne démarre sans une demande explicite d'Alex**.

## Étape 4 · Équipe (fiches par PR, configuration par la Base)
**Règle d'or** : un ticket qui lit ou modifie un repo est rattaché au projet de ce repo ; sinon la copie est périmée et `git fetch`
échoue.
1. **Fiches** (PR dans le repo cerveau, fusionnée par Alex) : copier dans `equipe/` les fiches utiles du kit (`socle/equipe/`,
   `modules/prestations/equipe/`, `modules/produits/equipe/`), remplacer `<SOCIETE>`, compléter « Spécificités » (dont la **liste des
   technologies de tous les projets**) et, dans la fiche Directeur, les identifiants du Relecteur et de l'humain qui valide. Modèle et
   skills dans `equipe/configuration.md` (départ : `templates/societe-core/equipe/configuration.md`).
2. **Sources de skills publiques** (kit `sh4rk21/a2-kit` et sources externes d'`INSTALLER.md`) : les ajouter **par « ... or add
   public repo by URL »**, jamais en choisissant le repo dans la liste de la connexion GitHub. Cocher **uniquement** les dossiers
   d'`INSTALLER.md` (pour le kit : `socle/skills`, le ou les modules utiles, `tiers/ecc`, `tiers/impeccable`, `tiers/taste`, et
   `tiers/wordpress` pour une société WordPress). Un rafraîchissement par la clé board relie la source à la connexion : la Base remet
   `connection_id` à null.
3. **Base, après chaque fusion de fiches** : instructions (`PUT /api/agents/<id>/instructions-bundle/file` avec `baseRevisionId`),
   skills alignés sur `configuration.md` (`POST /api/agents/<id>/skills/sync`), et réglages communs : 1 exécution à la fois, réveil
   automatique désactivé, réveil à la demande activé, 300 tours, `timeoutSec` 3600, `runtimeConfig.heartbeat.sessionCompaction`
   `{enabled: true, maxSessionRuns: 10, maxSessionAgeHours: 24}`, `canCreateAgents`/`canCreateSkills` à false sauf pour le Directeur.
   Routine « Point hebdomadaire » (lundi 9 h, Europe/Paris) confiée au Directeur, sur le projet du repo cerveau.
4. **Embauches** : une demande par poste, à partir de la fiche (instructions exactes) et de `configuration.md`, avec une
   justification en 3 lignes. Alex approuve chaque embauche (« Approvals ») ; la Base applique ensuite les réglages de l'étape 4.3.
5. **Mémoire** : tout fait durable constaté par un agent est proposé avec `write_note` (validation d'Alex dans A2 OS).
6. **Pas d'objectif (goal) ni de budget** : les objectifs viennent des demandes d'Alex ; les budgets Paperclip ne comptent que
   l'argent facturé, toujours nul avec un abonnement Claude.

## Étape 5 · Contrôles finaux (Base : `~/a2-checkup.py`)
Pour chaque agent :
- [ ] instructions identiques à la fiche, caractère par caractère ;
- [ ] skills : aucun manquant, aucun hors `configuration.md`, aucun introuvable dans la bibliothèque ;
- [ ] modèle de `configuration.md`, réglages communs de l'étape 4.3 ;
- [ ] rattachement hiérarchique conforme à `equipe/organigramme.md`, organigramme à jour (statuts « en poste »).

Et pour l'organisation :
- [ ] repo cerveau conforme au modèle `templates/societe-core/` (mêmes dossiers et fichiers de base, `.gitignore` compris) ;
- [ ] chaque dossier `clients/<client>/` ou `produits/<produit>/` correspond à un identifiant du registre A2 ;
- [ ] connexion GitHub attribuée à aucun agent ; mémoire A2 OS à toute l'équipe ; Inspo (et Refero) au Designer et au Développeur ;
- [ ] chaque projet pointe vers le bon repo de l'organisation GitHub de la société, avec `GITHUB_TOKEN`/`GH_TOKEN` en secret ;
- [ ] sources de skills : repo cerveau via la connexion, toutes les autres par URL ; aucune source inutile ; bibliothèque sans doublon ;
- [ ] approbation des embauches activée ; gouvernance des interactions en « Human only » ; routine hebdomadaire active ; aucun secret
  en clair nulle part.

## Ensuite : vivre avec l'organisation
- **Un skill change** (kit, repo cerveau ou source externe) : PR → relecture → fusion par Alex → rafraîchissement de la source
  (par le Directeur pour les sources publiques, par Alex pour le repo cerveau). Les agents qui ont le skill reçoivent la nouvelle version.
- **Un nouveau skill** : skill `creer-un-skill`. D'abord chercher s'il en existe un de qualité (bibliothèque, kit, `npx skills find`) et
  le proposer par PR ; sinon le créer (besoin réel, demandes de test, PR). Le Directeur met à jour `configuration.md` par PR ; après
  fusion, la Base le coche dans la source et l'active sur les agents concernés. **Aucun agent n'installe de skill lui-même** (`npx skills add`).
- **Une nouvelle technologie** dans un projet : le Directeur ajoute ses skills dans `configuration.md` par PR ; s'il n'y en a pas
  dans le kit, il le signale à Alex.
- **Toute modification d'agent** passe par une PR fusionnée par Alex, puis la Base l'applique ; l'historique est dans l'onglet
  « Revisions » de l'agent.

## Pièges connus
| Symptôme | Cause | Parade |
|---|---|---|
| « Invalid username or token » au clonage | une connexion GitHub est attribuée à l'agent | « Just agents I pick » sans agent ; refuser « Directeur needs GitHub » |
| `git fetch` : « could not read Username » | ticket non rattaché au projet du repo | rattacher le ticket au projet |
| « No GitHub identity connected » au rafraîchissement d'une source | source privée, ou publique ajoutée via la connexion | privée : Alex rafraîchit ; publique : l'ajouter par URL |
| Le Directeur ne peut pas modifier un agent | rôle autre que `ceo` | Base : rôle `ceo` puis redémarrage de Paperclip |
| Instructions dans un bloc de code, premières lignes perdues | collage dans l'éditeur | écrire par l'API |
| Skill « Invalid » à l'import | motif d'exécution dynamique dans le texte, ou fichier de plus d'1 Mo | ne pas l'importer, ou copie nettoyée dans `tiers/` (Base) |
| Skill présent sur le serveur mais absent de la bibliothèque | installé par `npx skills add -g` (skill `find-skills` par exemple) | ne jamais installer soi-même ; proposer la source par PR |
| Erreur 422 « INSTRUCTION_BASE_REQUIRED » | écriture d'instructions sans `baseRevisionId`/`baseHash` | lire le fichier juste avant et les fournir |
