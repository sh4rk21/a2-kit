---
name: isolation-donnees
description: Garantit que les données d'un utilisateur, d'un client ou d'un tenant ne sont jamais visibles par un autre (filtrage côté serveur, RLS Postgres, tests croisés). Use when tu écris ou relis une requête, une route, une politique RLS, un export, un cache ou une recherche dans une application multi-utilisateurs ou multi-clients.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Isolation des données

1. **Chaque requête** sur une ressource appartenant à quelqu'un est filtrée par son identifiant (utilisateur, organisation, client),
   pris dans la **session côté serveur**, jamais dans un paramètre envoyé par le navigateur.
2. **Supabase ou Postgres** : RLS activée sur toutes les tables, jamais contournée par une clé de service côté client ;
   politiques testées.
3. **Identifiants** : un identifiant deviné ou modifié dans l'URL ne donne jamais accès à la ressource d'un autre (test obligatoire).
4. **Listes, recherches, exports, caches, fichiers** : mêmes filtres que la lecture unitaire ; clés de cache incluant le propriétaire ;
   fichiers privés derrière une URL signée.
5. **Tests croisés** : pour chaque nouvelle route, un test avec deux comptes vérifie que A ne voit ni ne modifie rien de B.
6. **Logs et erreurs** : jamais la donnée d'un autre dans un message d'erreur.
7. **Agents IA** : le contexte et les outils d'un agent ne voient que les données du client concerné.

Une fuite potentielle entre utilisateurs ou clients est toujours **bloquante**.
