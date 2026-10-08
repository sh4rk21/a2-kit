---
name: securite-owasp
description: Contrôle de sécurité d'un changement de code selon l'OWASP Top 10 (injections, authentification, contrôle d'accès, données sensibles, SSRF, configuration, dépendances) et l'OWASP Top 10 des applications IA. Use when tu écris ou relis du code qui touche à l'authentification, aux droits, aux entrées utilisateur, aux appels réseau, aux fichiers, aux paiements ou à un agent IA.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Sécurité (OWASP)

Pour chaque changement, vérifie :
1. **Contrôle d'accès** : chaque route et chaque requête vérifie que l'utilisateur a le droit (côté serveur, jamais seulement dans l'interface).
2. **Injections** : requêtes paramétrées ou ORM, jamais de concaténation SQL ; échappement des sorties HTML ; jamais d'exécution dynamique de code ou de commande construite à partir d'une entrée utilisateur.
3. **Validation des entrées** côté serveur (schéma Zod ou équivalent) : type, taille, format.
4. **Authentification et sessions** : mots de passe hachés (bcrypt, argon2, scrypt), jetons à durée limitée, cookies `HttpOnly`,
   `Secure`, `SameSite`.
5. **SSRF** : toute URL fournie par un utilisateur et appelée par le serveur passe par un contrôle (pas d'adresse interne ni de
   redirection vers une adresse interne).
6. **Données sensibles** : chiffrées en transit (HTTPS) ; jamais dans les logs ; minimum de données collectées.
7. **Configuration** : pas de mode debug en production, en-têtes de sécurité, erreurs sans détail interne pour l'utilisateur.
8. **Dépendances** : skill `secrets-et-dependances`.
9. **Webhooks et paiements** : signature vérifiée, idempotence, jamais de confiance dans le montant envoyé par le client.
10. **Agents IA** (OWASP LLM) : le contenu externe ne peut pas déclencher d'action ; outils en liste blanche ; aucune donnée d'un
    client dans le contexte d'un autre ; action irréversible soumise à validation humaine ; chatbot qui annonce être une IA
    (AI Act, art. 50).

Tout point non conforme est **bloquant** en relecture.
