---
name: onboarding-activation
description: Améliore l'activation des nouveaux utilisateurs d'un produit (premier moment de valeur, parcours d'accueil dans le produit, séquence d'e-mails d'activation déclenchés par le comportement). Use when les inscrits n'utilisent pas ou peu le produit, quand on conçoit le premier parcours d'un nouveau produit, ou pour écrire les e-mails d'accueil et d'activation.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Accueil et activation

1. **Moment de valeur** : l'action après laquelle un utilisateur a de bonnes chances de rester (ex. « premier flux connecté et premier
   article reçu »), trouvée dans les données de rétention ; défini dans `produits/<produit>/indicateurs.md`.
2. **Mesurer** l'entonnoir d'activation étape par étape et repérer la plus grosse perte.
3. **Raccourcir le chemin** : retirer les champs et étapes inutiles à l'inscription, données d'exemple, valeurs par défaut utiles,
   un seul objectif par écran d'accueil, liste de démarrage courte (3 à 5 étapes) qui se coche.
4. **E-mails d'activation** déclenchés par le comportement (pas par le calendrier seul) : bienvenue avec une seule action ; aide ciblée
   si l'étape clé n'est pas faite à J+1 ou J+3 ; félicitation et étape suivante quand elle est faite ; fin d'essai annoncée à l'avance.
   Courts, un lien, expéditeur humain identifiable, désinscription des e-mails non essentiels.
5. **Consentement** : les e-mails liés au service sont permis ; les e-mails promotionnels aux particuliers demandent un accord préalable.
6. **Tester** un changement à la fois et mesurer l'activation à 7 jours des cohortes avant et après.
