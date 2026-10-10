# Recette : mettre en place une organisation

Méthode éprouvée sur FLOW (octobre 2026), Paperclip 2026.1005.0. Elle s'applique à chaque société (DIGIMEDIA, ELDORADO, les
suivantes) et à la remise à niveau d'une organisation existante. Libellés d'interface exacts : guide Paperclip d'A2 OS.

Trois acteurs, chacun dans son rôle :
- **Base (Claude)** : serveur, A2 OS, accès techniques. Intervient seulement aux étapes marquées « Base ».
- **Alex** : ce qui demande l'interface ou un compte humain (secrets, connexions, repo privé, approbations, fusions).
- **Directeur** : tout le reste, par tickets, dont la configuration de son équipe.

## Étape 1 · Socle technique (Base)
1. Organisation GitHub de la société (`<SOCIETE>-DEV`) et repo cerveau privé `<societe>-core` à la structure standard
   (`CLAUDE.md`, `societe/`, `charte/`, `equipe/`, `skills/`, `memoire/`, `clients/` ou `produits/`, `templates/`).
2. A2 OS : société déclarée dans le registre (`repo:` du repo cerveau) et jeton `paperclip-<societe>` limité à la société, avec les
   droits `memory:read` et `memory:write` (les notes des agents arrivent dans « À valider », jamais directement en mémoire).

## Étape 2 · Organisation Paperclip (Alex)
1. Créer l'organisation. Le premier agent est le **Directeur**.
2. Menu du compte → « Settings » → « General » :
   - « Hiring » : activer **« Require board approval for new hires »** ;
   - « Interaction governance » : « Cap » sur **« Human only »** pour les décisions.
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
   GitHub. Rafraîchir cette source reste un geste d'Alex (« ⋮ » → « Refresh ») : un agent ne peut pas lire un repo privé par là.

## Étape 3 · Directeur (Alex, puis Base si besoin)
1. Réglages : modèle Opus, « Max concurrent runs » 1, réveil automatique désactivé, « Wake on demand » activé, « Max turns per
   run » 300, variable `CLAUDE_CODE_OAUTH_TOKEN` en « Organization secret ».
2. **Rôle `ceo` obligatoire** (visible dans « Overview » → « Role »). C'est ce rôle qui donne au Directeur le droit de configurer son
   équipe et de créer des skills. S'il a un autre rôle, il ne pourra rien configurer : demander à la Base de le corriger (l'interface
   ne permet pas de changer un rôle après création).
3. Instructions : ne **jamais coller** une fiche dans l'éditeur « Instructions » → « Edit » (il abîme le texte). Premier ticket du
   Directeur, rattaché au projet du repo cerveau : écrire ses propres instructions à partir de `equipe/directeur.md` par l'API.

## Étape 4 · Équipe (Directeur, tickets rattachés au projet du repo cerveau)
**Règle d'or** : un ticket qui lit ou modifie un repo est rattaché au projet de ce repo ; sinon la copie est périmée et `git fetch`
échoue.
1. **Fiches** : copier dans `equipe/` les fiches utiles du kit (`socle/equipe/`, `modules/prestations/equipe/`,
   `modules/produits/equipe/`), remplacer `<societe>`, compléter « Spécificités de la société » (dont la **liste des technologies de
   tous les projets**). Skills propres à la société dans `skills/`. Par PR, relue par le Relecteur dès qu'il existe, fusionnée par Alex.
2. **Sources de skills publiques** (kit `sh4rk21/a2-kit` et sources externes d'`INSTALLER.md`) : les ajouter **par « ... or add
   public repo by URL »**, jamais en choisissant le repo dans la liste de la connexion GitHub. Une source publique liée à la
   connexion devient impossible à rafraîchir par un agent. Cocher **uniquement** les dossiers d'`INSTALLER.md` (pour le kit :
   `socle/skills`, le ou les modules utiles, `tiers/ecc`, `tiers/impeccable`).
3. **Embauches** : une demande par poste, à partir de la fiche, avec dans la demande les **instructions** (contenu exact de la fiche)
   et les **skills** (section « Skills », plus les technologies de tous les projets), les réglages de l'étape 3.1 et une justification
   en 3 lignes. Alex approuve chaque embauche (« Approvals »).
4. **Agents existants** (remise à niveau) : instructions écrites par l'API (`PUT /api/agents/<id>/instructions-bundle/file`, avec
   `baseRevisionId` et `baseHash` lus juste avant) et skills alignés sur la fiche. Les skills de plateforme Paperclip déjà présents
   restent (`paperclip`, `paperclip-board`, `paperclip-create-agent`…).
5. **Mémoire** : tout fait durable constaté par un agent est proposé avec `write_note` (validation d'Alex dans A2 OS).

## Étape 5 · Contrôles finaux (Directeur, vérifiés par la Base)
Le Directeur rend un compte rendu avec le **hash du commit** du repo cerveau utilisé comme référence, et pour chaque agent :
- [ ] instructions identiques à la fiche, caractère par caractère ;
- [ ] skills : aucun manquant, aucun hors fiche (hors skills de plateforme), aucun introuvable dans la bibliothèque ;
- [ ] modèle, 1 exécution à la fois, réveil automatique désactivé, 300 tours, secret Claude de la société ;
- [ ] rattachement hiérarchique conforme à `equipe/organigramme.md`, organigramme à jour (statuts « en poste »).

Et pour l'organisation :
- [ ] connexion GitHub attribuée à aucun agent ; mémoire A2 OS à toute l'équipe ; Inspo (et Refero) au Designer et au Développeur ;
- [ ] chaque projet pointe vers le bon repo de l'organisation GitHub de la société, avec `GITHUB_TOKEN`/`GH_TOKEN` en secret ;
- [ ] sources de skills : repo cerveau via la connexion, toutes les autres par URL ; aucune source inutile ; bibliothèque sans doublon ;
- [ ] approbation des embauches activée ; aucun secret en clair nulle part.

## Ensuite : vivre avec l'organisation
- **Un skill change** (kit, repo cerveau ou source externe) : PR → relecture → fusion par Alex → rafraîchissement de la source
  (par le Directeur pour les sources publiques, par Alex pour le repo cerveau). Les agents qui ont le skill reçoivent la nouvelle version.
- **Un nouveau skill** : skill `creer-un-skill`. D'abord chercher s'il en existe un de qualité (bibliothèque, kit, `npx skills find`) et
  le proposer par PR ; sinon le créer (besoin réel, demandes de test, PR). Le Directeur le coche ensuite dans la source, l'active sur les
  agents concernés et met à jour leurs fiches par PR. **Aucun agent n'installe de skill lui-même** (`npx skills add`).
- **Une nouvelle technologie** dans un projet : le Directeur ajoute ses skills (catalogue de la fiche Développeur) ; s'il n'y en a
  pas dans le kit, il le signale à Alex.
- **Toute modification d'agent** part d'un ticket validé par Alex ; l'historique est dans l'onglet « Revisions » de l'agent.

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
