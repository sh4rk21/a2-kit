---
name: preuve-avant-fin
description: Interdit d'annoncer qu'un travail est fini, corrigé ou fonctionnel sans avoir lancé la vérification et lu son résultat. Use when tu es sur le point d'écrire « c'est fait », « corrigé », « les tests passent », de faire un commit, d'ouvrir une PR ou de fermer un ticket.
license: MIT
metadata:
  lang: fr
  module: socle
  adapted-from: obra/superpowers verification-before-completion (MIT)
---

# Preuve avant de dire « fini »

**Loi** : aucune affirmation de réussite sans preuve fraîche.

Avant toute affirmation :
1. **Identifie** la commande ou le contrôle qui prouve ce que tu vas dire.
2. **Lance-le** maintenant, en entier (pas un résultat d'avant).
3. **Lis** toute la sortie : code de retour, nombre d'échecs, avertissements.
4. **Compare** au critère de fin du ticket.
5. **Seulement alors**, affirme, en citant la preuve (commande et résultat) dans le récap.

| Affirmation | Preuve exigée | Ne suffit pas |
|---|---|---|
| Les tests passent | Sortie de la suite : 0 échec | « Ça devrait passer » |
| Le build marche | Commande de build : code 0 | Le linter est vert |
| Le bug est corrigé | Le symptôme d'origine ne se reproduit plus | Le code a changé |
| L'écran est conforme | Captures aux 3 tailles relues (skill `ui-controle-visuel`) | Le composant compile |
| Les critères sont remplis | Liste cochée point par point | Les tests passent |
| Un autre agent a fini | Le diff ou le fichier existe | Son message dit « réussi » |

Mots interdits sans preuve : « devrait », « probablement », « normalement », « parfait », « terminé ».
