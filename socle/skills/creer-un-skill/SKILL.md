---
name: creer-un-skill
description: Crée ou améliore un skill d'agent à partir d'un besoin réel constaté (format Agent Skills, déclenchement précis, exemples de test, contrôle de sécurité, PR relue), au lieu d'improviser des consignes. Use when une tâche a révélé un savoir-faire qui manque ou une erreur qui se répète, quand Alex demande un nouveau skill, ou pour relire un skill proposé.
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
  (chercher d'abord dans la bibliothèque et dans `a2-kit` ; améliorer plutôt que dupliquer).

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
