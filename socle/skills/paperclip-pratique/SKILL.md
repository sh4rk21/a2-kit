---
name: paperclip-pratique
description: Bonnes pratiques Paperclip pour garder peu de tickets et un fil propre - un ticket parent par dossier, sous-tickets, relecture par étape native sur le ticket du livrable, blocages et déblocages. Use when tu crées ou découpes des tickets, quand tu confies une relecture, quand un ticket doit attendre un autre, ou quand tu relis en tant que participant d'une étape ; Don't use pour le travail métier lui-même.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Paperclip au quotidien : peu de tickets, un fil propre

Complète le skill `paperclip` (monté automatiquement), qui fait foi pour le détail de l'API.

## 1. Avant de créer un ticket
- **Cherche s'il existe déjà** : `GET /api/companies/{companyId}/issues?q=<mots-clés>` (et les enfants du dossier).
- **Un ticket parent par dossier** (client, produit, objectif). Un sous-ticket seulement pour un **livrable distinct** ou un
  **responsable différent** : `POST /api/companies/{companyId}/issues` avec `parentId` (et le même `projectId`).
- **Jamais** de ticket « Relire … » (voir 2), ni de ticket correctif pour un défaut trouvé en relecture (la correction se fait dans le
  ticket et la PR du livrable), ni de ticket qui ne fait que documenter une action déjà couverte.

## 2. La relecture : une étape sur le ticket du livrable
C'est la méthode prévue par Paperclip (« Cross-Agent Review Gates ») : l'avis reste dans le fil du livrable.

**Poser l'étape** (Directeur, ou l'auteur du ticket), une fois, sur le ticket du livrable :
```json
PATCH /api/issues/{issueId}
{ "executionPolicy": { "stages": [ { "type": "review", "participants": [ { "type": "agent", "agentId": "<id du Relecteur>" } ] } ] } }
```

**L'auteur a fini** : il passe le ticket en `in_review` (avec la PR et les preuves en commentaire). Paperclip réveille le Relecteur.

**Le Relecteur décide**, seulement s'il est `executionState.currentParticipant` (sinon refus 422), par la route normale :
- validé : `PATCH /api/issues/{issueId}` `{ "status": "done", "comment": "Validé : …" }` ;
- à corriger : `PATCH /api/issues/{issueId}` `{ "status": "in_progress", "comment": "À corriger : … (points localisés)" }`.
  Le ticket revient à l'auteur (`returnAssignee`), qui corrige **dans la même PR** puis repasse en `in_review`.

Un seul verdict final quand tout est corrigé. Pas de carte de confirmation, pas de ticket enfant, pas de « commentaire sur le parent »
à la place de l'étape.

## 3. Bloquer et débloquer
- Bloquer : `PATCH /api/issues/{issueId}` `{ "blockedByIssueIds": ["<id>"], "status": "blocked" }`. Le tableau **remplace** la liste :
  relis `blockedBy` (`GET /api/issues/{issueId}`) avant de l'envoyer.
- Débloquer : `{ "blockedByIssueIds": [] }` (ou la liste sans l'élément), puis repasse en `todo` ou `in_progress`.
- **Jamais** de ticket terminé ou annulé laissé comme bloqueur : un bloqueur `cancelled` ne débloque pas, et un bloqueur clos laissé
  en place provoque des réveils inutiles. Retire-le.
- `parentId` seul ne bloque rien : le parent est réveillé quand tous ses enfants sont terminés (`issue_children_completed`).

## 4. Statuts qui tiennent la route
- `in_review` : seulement s'il existe un vrai chemin de relecture (étape de relecture, carte humaine en attente, approbation).
- `blocked` : seulement avec un bloqueur réel (`blockedByIssueIds`) ou un propriétaire nommé et une action précise.
- `done` : rien ne reste à faire sur ce ticket.

## 5. Si une requête échoue
Lis le message d'erreur, consulte le skill `paperclip` (références `api-reference.md`, `workflows.md`), corrige **une** fois. Si ça
échoue encore, écris dans le ticket la requête, l'erreur et ce que tu as tenté, et passe à la suite : pas de boucle d'essais.
