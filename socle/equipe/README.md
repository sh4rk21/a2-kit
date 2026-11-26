# Équipe type d'une société A2

Sept postes, identiques dans chaque société, spécialisés par les modules (Prestations, Produits) et les skills propres à la société.
Chaque fiche est un **modèle**, écrit sur le modèle officiel de Paperclip (`paperclip-create-agent`, *baseline role guide*) : la
société la copie dans `<societe>-core/equipe/`, remplace `<SOCIETE>` et complète la section « Spécificités ». Le texte de la fiche
devient **exactement** les instructions de l'agent dans Paperclip. Le modèle et les skills de chaque poste ne sont pas dans la fiche
mais dans `equipe/configuration.md` (modèle de départ : `templates/societe-core/equipe/configuration.md`).

| Poste | Modèle | Rôle en une phrase |
|---|---|---|
| Directeur | Opus 5.5 | Découpe les objectifs, confie, suit, arbitre, rend compte |
| Développeur | Opus 5.5 | Code par ticket, avec tests et preuve, en PR |
| Relecteur | Opus 5.5 | Relit tout livrable avant un humain : conformité, qualité, sécurité |
| Designer | Opus 5.5 | Découverte, direction, DESIGN.md, critique ; jamais de design générique |
| Commercial | Sonnet 5.5 | Cible, prospection conforme, pipeline, propositions |
| Marketing et contenu | Sonnet 5.5 | Contenu SEO, LinkedIn du fondateur, études de cas, rapports |
| Sécurité | Opus 5.5 | Relecture sécurité bloquante des PR sensibles, scanners, registre ; rend compte à Alex |

## Modèles
- **Opus 5.5** (`claude-opus-5-5`, le plus capable) pour les postes qui décident, conçoivent ou codent : Directeur, Développeur,
  Designer, Chef de projet, Responsable produit, **Relecteur**, **Sécurité**. Le code est le cœur du travail : une erreur y coûte cher, et Opus
  tient mieux les tâches longues et difficiles. Le Relecteur fusionne lui-même les PR de classe 1 et 2 : une erreur de relecture
  n'a plus de second filet, d'où Opus (décidé le 16 novembre 2026).
- **Sonnet 5.5** (`claude-sonnet-5-5`) pour les postes de rédaction ou d'exécution répétitive : Commercial, Marketing et contenu,
  Maintenance, Support.
- **Effort de réflexion** : élevé pour le Relecteur, la Sécurité, le Responsable produit et le Chef de projet ; moyen pour les
  autres.
- **Quota** : chaque société a son propre abonnement Claude, et Opus le consomme plus vite. Surveiller la page d'utilisation de
  claude.ai ; s'il sature, garder Opus pour le Directeur et le Développeur en priorité.
- Un changement de modèle se fait sur demande explicite d'Alex : PR sur `configuration.md`, puis la Base l'applique.

## Politique d'embauche (pour le Directeur)
1. Vérifie qu'aucun agent existant ne peut faire le travail ; un poste n'est créé que pour un besoin récurrent, sur demande d'Alex.
2. Embauche à partir d'une fiche de `equipe/` et de `configuration.md` : demande d'embauche avec les instructions (contenu exact de la
   fiche), le modèle, les skills et une justification en 3 lignes.
3. L'embauche est approuvée par Alex. Toute modification d'un agent existant passe par une PR sur sa fiche ou sur `configuration.md`,
   fusionnée par Alex, puis **appliquée par la Base** (instructions, skills, réglages) : le Directeur ne configure pas les agents.

Le Directeur garde le rôle `ceo` (agent racine, sans responsable) : c'est ce qui lui permet de demander des embauches.

## Skills communs à tous les postes
`regles-a2` (toujours), `rapport-statut`, `passation`, `capitaliser-lecon`, `arbitrage-escalade`.

## Poste Sécurité (décidé par Alex le 26 novembre 2026)
- **Un agent Sécurité dans chaque société**, indépendant de l'équipe : il rend compte directement à Alex, pas au Directeur.
- **Bloquant** : son étape « Sécurité » suit celle du Relecteur sur tout ticket de PR sensible (skill `audit-securite`, section 1).
  Une faille critique ou haute renvoie la PR à son auteur ; seul Alex peut passer outre.
- Il installe Gitleaks, Trivy et Semgrep dans la CI des dépôts, tient le registre des vulnérabilités et rend un rapport chaque
  semaine. Les scans OWASP ZAP des environnements de test sont lancés par la Base, jamais contre une production.
- Il ne corrige pas le code : il ouvre des tickets pour le Développeur.
