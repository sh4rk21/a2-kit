# Équipe type d'une société A2

Six postes, identiques dans chaque société, spécialisés par les modules (Prestations, Produits) et les skills propres à la société.
Chaque fiche est un **modèle** : la société la copie dans `<societe>-core/equipe/`, remplace `<societe>` et complète la section
« Spécificités de la société ». Le texte de la fiche devient les instructions de l'agent dans Paperclip.

| Poste | Modèle | Rôle en une phrase |
|---|---|---|
| Directeur | Opus | Découpe les objectifs, confie, suit, arbitre, rend compte |
| Développeur | Sonnet | Code par ticket, avec tests et preuve, en PR |
| Relecteur | Sonnet | Relit tout livrable avant un humain : conformité, qualité, sécurité |
| Designer | Opus | Découverte, direction, DESIGN.md, critique ; jamais de design générique |
| Commercial | Sonnet | Cible, prospection conforme, pipeline, propositions |
| Marketing et contenu | Sonnet | Contenu SEO, LinkedIn du fondateur, études de cas, rapports |

## Politique d'embauche (pour le Directeur)
1. Vérifie qu'aucun agent existant ne peut faire le travail ; un poste n'est créé que pour un besoin récurrent.
2. Embauche à partir d'une fiche de `equipe/` ; demande d'embauche avec : modèle (Opus pour décider ou concevoir, Sonnet pour exécuter),
   max concurrent runs 1, réveil automatique désactivé, max turns 300, skills à attacher, justification en 3 lignes.
3. L'embauche est approuvée par Alex. Une modification d'agent existant se fait à partir d'un ticket validé par Alex.

**Dans Paperclip, le Directeur doit avoir le rôle `ceo`** (agent racine, sans responsable) : c'est ce rôle qui lui donne le droit de
configurer son équipe et de créer des skills. Avec un autre rôle, il ne peut ni attacher de skills ni écrire les instructions des agents.

## Skills communs à tous les postes
`regles-a2` (toujours), `rapport-statut`, `passation`, `capitaliser-lecon`, `arbitrage-escalade`.
