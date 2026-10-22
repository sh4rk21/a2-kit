---
name: paperclip-pratique
description: Bonnes pratiques Paperclip pour garder peu de tickets et un fil propre - un ticket par livrable, livrables posés sur le ticket (commentaire, document, pièce jointe), relecture puis validation humaine par étapes natives, retouches dans le même ticket, blocages. Use when tu crées ou découpes des tickets, quand tu rends un livrable, quand tu confies une relecture ou une validation, quand une retouche arrive, ou quand tu relis en tant que participant d'une étape ; Don't use pour le travail métier lui-même.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Paperclip au quotidien : peu de tickets, un fil propre

Complète le skill `paperclip` (monté automatiquement), qui fait foi pour le détail de l'API.

## 1. Avant de créer un ticket
- **Cherche s'il existe déjà** : `GET /api/companies/{companyId}/issues?q=<mots-clés>` (et les enfants du dossier).
- **Un ticket par livrable.** Un ticket parent seulement quand un dossier demande plusieurs livrables ou plusieurs responsables ; ses
  sous-tickets : `POST /api/companies/{companyId}/issues` avec `parentId` (et le même `projectId`).
- **Jamais** de ticket « Relire … » (voir 3), ni de ticket pour une retouche ou une correction (voir 4), ni de ticket qui ne fait que
  documenter une action déjà couverte.
- **Tout ticket créé a un responsable** (`assigneeAgentId`), le projet du repo concerné et ses étapes (section 3) : un ticket sans
  responsable ne réveille personne.

## 2. Livrables : sur le ticket, pas dans une PR
L'humain lit et valide dans Paperclip : un fichier rangé dans un repo ou un chemin du poste de travail ne lui sert à rien.

| Livrable | Où le poser |
|---|---|
| Texte court : e-mail à envoyer, réponse, avis, résumé | dans le **commentaire** final |
| Note, plan, proposition, compte rendu, devis rédigé | **document du ticket** : `PUT /api/issues/{issueId}/documents/{key}` avec `{ "title", "format": "markdown", "body", "baseRevisionId": null }` (`key` court : `proposition`, `devis`, `note`). Nouvelle version : `GET` d'abord, puis `PUT` avec `baseRevisionId` = `latestRevisionId` (l'historique reste visible) |
| Fichier : PDF, maquette HTML, capture, image | **pièce jointe** avec le script du skill `paperclip` : `bash scripts/paperclip-upload-artifact.sh <fichier> --title "<titre>"`, puis colle les liens qu'il affiche dans le commentaire final |
| Code, ou document durable du repo cerveau (fiche, skill, décision, dossier client à jour) | **PR**, ajoutée au ticket comme work product `pull_request` |

Une nouvelle version d'un fichier remplace l'ancienne sur le **même** ticket (nouvelle pièce jointe, même titre suivi de « v2 »).
Pièces jointes et documents vont sur **ton** ticket : Paperclip refuse qu'un agent modifie le ticket d'un autre agent ; cite le lien
dans le ticket concerné si besoin.
Aucune donnée personnelle de client ni PDF de client dans un repo GitHub.

## 3. Relecture puis validation : des étapes sur le ticket du livrable
C'est la méthode prévue par Paperclip (« execution policy ») : l'avis reste dans le fil du livrable, et le ticket revient tout seul à
l'auteur quand une correction est demandée.

**Poser les étapes** (Directeur, ou l'auteur du ticket), une fois, à la création du ticket :
- livrable qui part vers un humain ou un client (proposition, devis, maquette, e-mail, contenu public) : **relecture** par le
  Relecteur, puis **validation** par l'humain qui décide (son `userId` est dans les spécificités de la fiche Directeur) ;
- code ou document du repo : **relecture** seule (l'humain valide en fusionnant la PR).
```json
PATCH /api/issues/{issueId}
{ "executionPolicy": { "stages": [
  { "type": "review",   "participants": [ { "type": "agent", "agentId": "<id du Relecteur>" } ] },
  { "type": "approval", "participants": [ { "type": "user",  "userId": "<userId de l'humain>" } ] }
] } }
```

**L'auteur a fini** : livrable posé sur le ticket (section 2), commentaire final, puis `PATCH /api/issues/{issueId}`
`{ "status": "done", "comment": "…" }`. Paperclip passe le ticket en `in_review` et réveille le Relecteur.

**Le participant décide**, seulement s'il est `executionState.currentParticipant` (sinon refus 422), avec le commentaire **dans la
même requête** :
- validé : `{ "status": "done", "comment": "Validé : …" }` ; s'il reste une étape (validation humaine), Paperclip la confie à
  l'humain ;
- à corriger : `{ "status": "in_progress", "comment": "À corriger : 1. … 2. … (points localisés)" }`. Le ticket revient à l'auteur
  (`returnAssignee`), qui corrige **dans le même ticket** et le termine de nouveau : la même étape reprend.

Un seul verdict final quand tout est corrigé. Pas de ticket enfant à la place d'une étape.
- **Pas de carte de confirmation quand une étape de validation existe** : l'humain valide par l'étape. Une carte en plus fait
  doublon, et valider la carte ne termine pas l'étape.
- **« À corriger » sert seulement à demander une correction à l'auteur.** Le livrable est bon mais il reste une fusion ou un geste en
  production ? C'est « validé » (`done`) : la fusion et la mise en production ne sont pas des corrections.

## 4. Retouches
- **L'humain demande une retouche** en refusant l'étape de validation ou en commentant le ticket du livrable : le ticket revient à
  l'auteur, qui retouche **dans ce ticket**, pose la nouvelle version (section 2) et le termine. À la relecture qui suit, le Relecteur
  ne vérifie que ce qui a changé.
- **Une retouche arrive sur un autre ticket** (souvent le ticket parent du Directeur) : le Directeur ne crée pas de ticket ; il renvoie
  le ticket du livrable à son auteur : `PATCH /api/issues/{issueId du livrable}`
  `{ "status": "todo", "assigneeAgentId": "<auteur>", "comment": "Retouche demandée par <humain> : …" }`.
- **Tu es réveillé sur un ticket terminé qui ne t'appartient plus** (par exemple le Relecteur, dernier participant, rouvert par un
  commentaire humain) : tu ne fais pas la retouche toi-même. Renvoie le ticket à son auteur (`executionState.returnAssignee`, ou
  l'auteur du livrable) avec la même requête, puis arrête-toi.

- **Ne commente plus un ticket terminé** : un commentaire le rouvre. Une précision se met dans la requête qui le termine ; une
  erreur de ta part dans un verdict déjà rendu se signale dans un ticket encore ouvert du même dossier.

## 5. Bloquer et débloquer
- Bloquer : `PATCH /api/issues/{issueId}` `{ "blockedByIssueIds": ["<id>"], "status": "blocked" }`. Le tableau **remplace** la liste :
  relis `blockedBy` (`GET /api/issues/{issueId}`) avant de l'envoyer.
- Débloquer : `{ "blockedByIssueIds": [] }` (ou la liste sans l'élément), puis repasse en `todo` ou `in_progress`.
- **Jamais** de ticket terminé ou annulé laissé comme bloqueur : un bloqueur `cancelled` ne débloque pas, et un bloqueur clos laissé
  en place provoque des réveils inutiles. Retire-le.
- `parentId` seul ne bloque rien : le parent est réveillé quand tous ses enfants sont terminés (`issue_children_completed`).

## 6. Statuts qui tiennent la route
- `in_review` : seulement s'il existe un vrai chemin de relecture (étape, carte humaine en attente, approbation).
- `blocked` : seulement avec un bloqueur réel (`blockedByIssueIds`) ou un propriétaire nommé et une action précise.
- `done` : rien ne reste à faire sur ce ticket.

## 7. Si une requête échoue
Lis le message d'erreur, consulte le skill `paperclip` (références `api-reference.md`, `artifacts.md`, `workflows.md`), corrige
**une** fois. Si ça échoue encore, écris dans le ticket la requête, l'erreur et ce que tu as tenté, et passe à la suite : pas de
boucle d'essais.
