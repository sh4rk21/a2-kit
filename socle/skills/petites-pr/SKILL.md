---
name: petites-pr
description: Prépare des commits et une pull request petits, lisibles et vérifiables (commits conventionnels, description avec preuves). Use when tu termines un ticket de code ou de contenu versionné et que tu t'apprêtes à committer et ouvrir une PR.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Petites PR

1. **Branche** partie de la dernière version de `main` (copie isolée de la tâche), nommée `<type>/<ticket>-<sujet-court>`.
2. **Commits conventionnels** : `feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`, en français, au présent, un sujet par commit.
3. **Taille** : viser moins de 400 lignes modifiées. Au-delà, découper en PR successives.
4. **Avant d'ouvrir** : vérifie que la branche ne contient que tes commits (`git log --oneline origin/main..HEAD`), tests verts,
   linter propre, aucun secret (`git diff` relu).
5. **Description** :
   - le ticket et le pourquoi en 2 lignes ;
   - ce qui change pour l'utilisateur ;
   - **preuves de vérification** (commandes et résultats, captures pour une interface) ;
   - effets au déploiement (migration, variable à ajouter) et retour arrière ;
   - points à regarder en priorité par le Relecteur.
6. La PR est relue (Relecteur) puis fusionnée **par un humain**. Tu ne fusionnes jamais.
