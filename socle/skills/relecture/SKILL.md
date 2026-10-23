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

La relecture se fait **dans le ticket du livrable** (étape de relecture Paperclip, skill `paperclip-pratique`) : pas de ticket
« Relire … » séparé, pas de ticket correctif pour un défaut. Le livrable est sur le ticket (commentaire, document, pièce jointe) ou
dans la PR liée. Les corrections se font dans le même ticket ; tu rends **un seul verdict final** quand tout est corrigé. À une
nouvelle relecture après correction ou retouche, ne vérifie que ce qui a changé et les points que tu avais demandés.

## Temps 1 : conformité
- Le livrable fait-il ce que demande le ticket, **tout** ce qu'il demande, et **rien** de plus ?
- Chaque critère d'acceptation est-il démontré (test, capture, preuve) ?

## Temps 2 : qualité, selon le type
- **Tout livrable** : faits exacts et sourcés (montants, délais, fonctionnalités, chiffres) ; rien d'un autre client ou produit ;
  aucun secret ni donnée personnelle ; français correct, sans tiret long.
- **Code** : skills `securite-owasp`, `isolation-donnees`, `database-migrations` si le schéma change ; tests présents et passants ;
  lisibilité ; pas d'erreur silencieuse ; règles d'interface (skill Vercel `web-design-guidelines`) pour toute UI. Et :
  - lis aussi les fonctions qui appellent le code modifié : une signature, une valeur de retour ou un comportement changé peut casser
    un appelant que la PR ne touche pas ;
  - un cas concret par constat (« telle entrée ou telle situation donne tel mauvais résultat ») ; sans cas concret, pas de constat.
    Cela écarte les inquiétudes vagues ; un doute précis que tu ne peux pas lever reste un point à corriger, avec le cas à vérifier ;
  - tiens compte de la charge attendue (README, configuration de déploiement) et dis laquelle tu as supposée : courses entre une
    vérification et une écriture (deux requêtes passent la même vérification puis écrivent toutes les deux), une requête par élément
    d'une liste ;
  - un raccourci marqué `shortcut: <limite>, <déclencheur>` (fiche Développeur) est accepté si la charge attendue reste sous la limite
    et si le test existe ; sans déclencheur ou sans test, c'est un point à corriger ;
  - chaque constat en 4 parties, une ou deux phrases chacune : ce que c'est, le problème, la correction, le risque si on ne fait rien.
- **Interface** : skill `design-critique` et captures du skill `ui-controle-visuel`.
- **Document commercial** : totaux, acompte, références, mentions légales, hors périmètre, aucun geste commercial non décidé.
- **Contenu public, prospection** : skills `marketing-garde-fous` et `prospection` (conformité RGPD, pas de faux chiffres ni faux avis).
- **Mise en ligne** : skill `livraison-production`, point par point.

## Verdict
- **Validé** : prêt pour l'humain.
- **À corriger** : liste numérotée, chaque point avec l'endroit exact et pourquoi (pour du code, au format en 4 parties ci-dessus).
- **Bloquant** : risque pour les données, la sécurité, l'argent, le juridique ou un client ; une phrase pour dire pourquoi.

Ne remonte que ce qui compte (exactitude, exigences, risques) ; pas de préférences de style. Un doute est un point à corriger,
jamais une validation « pour avancer ». Tu ne modifies pas le livrable et tu n'ouvres pas de PR. Rouvert sur un
ticket déjà validé par un commentaire humain : renvoie-le à l'auteur (skill `paperclip-pratique`, section « Retouches »).
