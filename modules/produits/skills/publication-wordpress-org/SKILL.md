---
name: publication-wordpress-org
description: Prépare un plugin ou un thème pour le répertoire officiel WordPress.org (licence GPL, règles du répertoire, Plugin Check ou Theme Check, readme.txt, sécurité, versions, gestion SVN). Use when un plugin ou un thème doit être soumis, mis à jour ou corrigé sur WordPress.org, ou quand l'équipe de revue de WordPress.org signale un problème.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Publication sur WordPress.org

À utiliser avec les skills officiels WordPress (`wp-plugin-development`, `wp-plugin-directory-guidelines`, `wp-block-themes`…).

1. **Licence** : code et ressources sous GPL v2 ou ultérieure, ou compatibles ; bibliothèques tierces compatibles et créditées.
2. **Règles du répertoire** (lire `wp-plugin-directory-guidelines`), notamment :
   - **pas de version d'essai bridée** (« trialware ») : aucune fonctionnalité incluse dans le code ne doit être bloquée en attente de
     paiement ; une version premium distincte ou un service externe réel sont permis ;
   - **aucun suivi des utilisateurs sans leur accord explicite** (opt-in), et aucune donnée envoyée à un service externe sans
     information claire ;
   - pas de code obfusqué, pas de code exécutable chargé depuis l'extérieur, pas de liens ou crédits imposés sur le site public,
     notifications d'administration discrètes et refermables ;
   - nom et identifiant sans marque d'autrui en premier mot.
3. **Contrôles automatiques** : **Plugin Check** (plugin officiel « Plugin Check (PCP) ») ou **Theme Check** sans erreur ; PHPStan
   (`wp-phpstan`) ; tests sur la version minimale déclarée de PHP et de WordPress, et sur la dernière.
4. **Sécurité** : nonces et contrôles de droits sur chaque action, validation des entrées, échappement des sorties, requêtes préparées.
5. **`readme.txt`** : en-têtes à jour (`Requires at least`, `Tested up to`, `Requires PHP`, `Stable tag`, `License`), description,
   FAQ, captures, changelog (skill `changelog-version`) ; services externes déclarés.
6. **Publication** via SVN (`trunk`, puis étiquette `tags/X.Y.Z`) ou action GitHub de déploiement ; contrôlée par un humain.
7. **Support** : forum du plugin suivi, réponses préparées par l'agent, envoyées par un humain.
