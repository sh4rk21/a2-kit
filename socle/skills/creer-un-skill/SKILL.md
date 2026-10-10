---
name: creer-un-skill
description: Trouve un skill existant de qualité ou, à défaut, crée ou améliore un skill d'agent à partir d'un besoin réel constaté (recherche dans l'écosystème, format Agent Skills, déclenchement précis, exemples de test, contrôle de sécurité, PR relue), au lieu d'improviser des consignes ou d'installer un skill sans contrôle. Use when une tâche a révélé un savoir-faire qui manque ou une erreur qui se répète, quand on cherche s'il existe un skill pour une tâche, quand Alex demande un nouveau skill, ou pour relire un skill proposé.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Créer un skill

**Pourquoi tant de soin** : un skill écrit à la va-vite par un agent pour lui-même dégrade la qualité (consignes trop générales).
Ce qui marche : un savoir-faire précis tiré d'un cas réel, relu et testé comme du code.

## Quand créer un skill
- Une erreur ou un détour **revient** (au moins deux fois), ou une tâche demande un savoir **propre à la société** (règles d'un produit,
  d'un client, d'un outil).
- **Pas** de skill pour une consigne d'une ligne (elle va dans la fiche ou le `CLAUDE.md`), ni pour ce qu'un skill existant couvre déjà
  (voir la section suivante ; améliorer plutôt que dupliquer).

## D'abord, chercher s'il existe déjà
1. Dans la bibliothèque Paperclip de la société et dans `sh4rk21/a2-kit` (`INSTALLER.md` liste les sources déjà retenues).
2. Dans l'écosystème public : `npx skills find <sujet>` (recherche seulement) et le classement de skills.sh. Critères de qualité :
   plus de 1 000 installations, source reconnue (éditeur officiel, auteur connu), repo de plus de 100 étoiles, licence libre
   (MIT, Apache-2.0), mis à jour récemment. Lire le SKILL.md en entier : il ne doit rien installer, télécharger ni exécuter
   sans contrôle, ni contredire nos règles.
3. **Ne jamais installer un skill soi-même** (`npx skills add`, `-g`, copie dans `.claude/skills`) : le serveur est partagé par
   toutes les sociétés et l'installation contournerait la relecture, le contrôle de sécurité et la bibliothèque Paperclip.
4. Un bon skill existe : le proposer par une PR qui ajoute sa source et les dossiers à cocher dans `INSTALLER.md` du kit (utile à
   toutes les sociétés) ou dans le `README.md` du repo cerveau (propre à la société), avec les critères vérifiés. Après relecture et
   fusion, le Directeur l'ajoute dans Paperclip **par URL** et l'active sur les agents concernés.
5. Rien d'existant ne convient : créer le skill, selon la suite de ce document.

## Où
- Propre à une société : `skills/<nom>/SKILL.md` du repo cerveau `<societe>-core`.
- Utile à toutes les sociétés : PR sur `sh4rk21/a2-kit` (socle ou module).

## Format (spécification Agent Skills)
1. Dossier et `name` identiques, en minuscules avec des tirets, en français pour nos skills.
2. `description` : **ce que fait le skill + « Use when … »** avec les situations qui doivent le déclencher. Ne pas y résumer les étapes.
3. Corps de moins de 300 lignes : étapes numérotées, règles qui priment, pièges réels, exemple concret. Les détails longs vont
   dans `references/`.
4. Écrire des consignes vérifiables (« la PR liste les variables d'environnement ajoutées ») plutôt que des vœux (« sois rigoureux »).
5. Aucun secret, aucune donnée de client, aucune commande dangereuse. Paperclip refuse tout skill dont le texte contient un motif
   d'exécution dynamique (évaluation d'une chaîne de code, interpréteur lancé avec du code en ligne, script téléchargé puis exécuté
   directement), même cité pour l'interdire : décrire le risque avec des mots, sans écrire la commande. Fichiers de 1 Mo au plus.

## Tester avant de proposer
- Écrire **3 demandes de test** dans la PR : deux qui doivent déclencher le skill, une qui ne doit pas.
- Rejouer le cas réel qui a motivé le skill : le résultat est-il meilleur qu'avant ? Noter la différence dans la PR.

## Circuit
PR (avec le cas réel, les demandes de test et le résultat) → relecture par le Relecteur (format, sécurité, utilité, doublons) →
fusion par Alex → le Directeur rafraîchit la source dans Paperclip et active le skill sur les agents concernés, puis met à jour
leurs fiches (section « Skills ») par une PR.
