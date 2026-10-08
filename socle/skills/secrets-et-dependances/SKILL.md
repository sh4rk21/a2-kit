---
name: secrets-et-dependances
description: Hygiène des secrets et des dépendances d'un projet (aucun secret dans le dépôt, dépendances justifiées, auditées et à jour). Use when tu ajoutes une variable d'environnement, une clé, une bibliothèque, ou quand un audit de sécurité ou une alerte de dépendance apparaît.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Secrets et dépendances

## Secrets
- Jamais dans le code, les commits, les tests, les logs ou la documentation. Seulement dans les variables d'environnement de l'hébergeur.
- `.env.example` contient les **noms** et une description, jamais de valeur réelle.
- Toute nouvelle variable est listée dans la PR pour qu'un humain l'ajoute chez l'hébergeur **avant** la fusion.
- Secret trouvé dans l'historique git : le signaler (nom, fichier, commit) pour qu'un humain le change ; ne jamais réécrire l'historique seul.
- Logs : jamais de jeton, mot de passe, en-tête d'authentification ni donnée personnelle complète.

## Dépendances
- Avant d'ajouter une bibliothèque : est-elle nécessaire, maintenue (dernière version récente), populaire, de licence compatible
  (MIT, Apache, BSD ; GPL seulement si le projet l'est) ? Justifie-la dans la PR.
- Fichier de verrouillage toujours commité ; versions exactes pour la production.
- `npm audit` / `pnpm audit` (ou équivalent) avant la PR ; une faille haute ou critique est corrigée ou signalée.
- Mises à jour par petites PR séparées, testées, jamais mélangées à une fonctionnalité.
