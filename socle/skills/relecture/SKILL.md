---
name: relecture
description: Relecture d'un livrable avant qu'il parte vers la direction, un client ou la production, en deux temps (conformité à la demande, puis qualité), avec un verdict clair. Use when le Relecteur reçoit une PR de code, un document commercial, un contenu public, des messages de prospection ou une mise en ligne à valider ; Don't use pour corriger à la place de l'auteur.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Relecture

Relis **dans un contexte neuf** : le ticket, la spécification et le livrable, sans te fier au récit de l'auteur.

## Temps 1 : conformité
- Le livrable fait-il ce que demande le ticket, **tout** ce qu'il demande, et **rien** de plus ?
- Chaque critère d'acceptation est-il démontré (test, capture, preuve) ?

## Temps 2 : qualité, selon le type
- **Tout livrable** : faits exacts et sourcés (montants, délais, fonctionnalités, chiffres) ; rien d'un autre client ou produit ;
  aucun secret ni donnée personnelle ; français correct, sans tiret long.
- **Code** : skills `securite-owasp`, `isolation-donnees`, `database-migrations` si le schéma change ; tests présents et passants ;
  lisibilité ; pas d'erreur silencieuse ; règles d'interface (skill Vercel `web-design-guidelines`) pour toute UI.
- **Interface** : skill `design-critique` et captures du skill `ui-controle-visuel`.
- **Document commercial** : totaux, acompte, références, mentions légales, hors périmètre, aucun geste commercial non décidé.
- **Contenu public, prospection** : skills `marketing-garde-fous` et `prospection` (conformité RGPD, pas de faux chiffres ni faux avis).
- **Mise en ligne** : skill `livraison-production`, point par point.

## Verdict
- **Validé** : prêt pour l'humain.
- **À corriger** : liste numérotée, chaque point avec l'endroit exact et pourquoi.
- **Bloquant** : risque pour les données, la sécurité, l'argent, le juridique ou un client ; une phrase pour dire pourquoi.

Ne remonte que ce qui compte (exactitude, exigences, risques) ; pas de préférences de style. Un doute est un point à corriger,
jamais une validation « pour avancer ». Tu ne modifies pas le livrable et tu n'ouvres pas de PR.
