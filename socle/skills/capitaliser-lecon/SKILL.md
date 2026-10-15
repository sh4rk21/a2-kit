---
name: capitaliser-lecon
description: Écrit une leçon durable ou une décision dans la mémoire de la société pour que l'équipe ne refasse pas la même erreur. Use when un ticket se termine après une difficulté, une erreur évitée de justesse, un retour de relecture important ou une décision de la direction ; Don't use pour du journal d'activité.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Capitaliser une leçon

1. **Test contrefactuel** : la leçon est-elle déjà retrouvable dans le code, les tests, la documentation ou la mémoire ? Si oui, ne
   l'écris pas ; améliore plutôt l'endroit existant.
2. **Où l'écrire** : décision de la société → `memoire/AAAA-MM-JJ-sujet.md` + une ligne dans `memoire/MEMORY.md` ; décision client ou
   produit → `decisions.md` du dossier concerné ; règle de travail → proposer une modification du skill concerné (par PR, relue).
   **Fait qui n'a pas sa place dans un repo** (réponse d'Alex dans un ticket, fait constaté sur un serveur ou un service externe,
   information utile à une autre société) → `write_note` dans la mémoire A2, avec le projet concerné : la note arrive dans
   « À valider » et Alex l'approuve. Une décision écrite dans le repo n'a pas besoin de `write_note` : la mémoire A2 lit le repo.
3. **Format** : contexte (2 lignes), décision ou leçon (1 phrase), pourquoi, comment l'appliquer, date et qui a décidé.
4. **Une leçon = un fichier**, sans dupliquer ; mets à jour plutôt que d'ajouter.
5. **Purge** : une leçon contredite par une décision plus récente est mise à jour ou supprimée, jamais laissée en contradiction.

**En fin de ticket, pose-toi toujours la question** : ai-je appris un fait durable (décision, piège, valeur de configuration sans
secret, préférence d'Alex) ? Si oui, capitalise-le ici, dans le repo ou avec `write_note`.

Ne capitalise que des faits vérifiés. Une intuition reste une question dans le ticket.
