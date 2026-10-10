# Équipe type d'une société A2

Six postes, identiques dans chaque société, spécialisés par les modules (Prestations, Produits) et les skills propres à la société.
Chaque fiche est un **modèle** : la société la copie dans `<societe>-core/equipe/`, remplace `<societe>` et complète la section
« Spécificités de la société ». Le texte de la fiche devient les instructions de l'agent dans Paperclip.

| Poste | Modèle | Rôle en une phrase |
|---|---|---|
| Directeur | Opus 5.5 | Découpe les objectifs, confie, suit, arbitre, rend compte |
| Développeur | Opus 5.5 | Code par ticket, avec tests et preuve, en PR |
| Relecteur | Sonnet 5 | Relit tout livrable avant un humain : conformité, qualité, sécurité |
| Designer | Opus 5.5 | Découverte, direction, DESIGN.md, critique ; jamais de design générique |
| Commercial | Sonnet 5 | Cible, prospection conforme, pipeline, propositions |
| Marketing et contenu | Sonnet 5 | Contenu SEO, LinkedIn du fondateur, études de cas, rapports |

## Modèles
- **Opus 5.5** (`claude-opus-5-5`, le plus capable) pour les postes qui décident, conçoivent ou codent : Directeur, Développeur,
  Designer, Chef de projet, Responsable produit. Le code est le cœur du travail : une erreur y coûte cher, et Opus tient mieux les
  tâches longues et difficiles (bugs subtils, architecture, migrations, code existant complexe).
- **Sonnet 5** (`claude-sonnet-5`) pour la relecture et les postes de rédaction ou d'exécution répétitive : Relecteur, Commercial,
  Marketing et contenu, Maintenance, Support. Si le Relecteur laisse passer des problèmes, passer son poste sur Opus 5.5.
- **Quota** : chaque société a son propre abonnement Claude, et Opus le consomme plus vite. Surveiller la page d'utilisation de
  claude.ai ; s'il sature, garder Opus pour le Directeur et le Développeur en priorité.
- Un changement de modèle se fait sur demande explicite d'Alex, puis le Directeur l'applique et met la fiche à jour.

## Politique d'embauche (pour le Directeur)
1. Vérifie qu'aucun agent existant ne peut faire le travail ; un poste n'est créé que pour un besoin récurrent.
2. Embauche à partir d'une fiche de `equipe/` ; demande d'embauche avec : modèle de la fiche (voir « Modèles » ci-dessous),
   max concurrent runs 1, réveil automatique désactivé, max turns 300, skills à attacher, justification en 3 lignes.
3. L'embauche est approuvée par Alex. Une modification d'agent existant se fait à partir d'un ticket validé par Alex.

**Dans Paperclip, le Directeur doit avoir le rôle `ceo`** (agent racine, sans responsable) : c'est ce rôle qui lui donne le droit de
configurer son équipe et de créer des skills. Avec un autre rôle, il ne peut ni attacher de skills ni écrire les instructions des agents.

## Skills communs à tous les postes
`regles-a2` (toujours), `rapport-statut`, `passation`, `capitaliser-lecon`, `arbitrage-escalade`.
