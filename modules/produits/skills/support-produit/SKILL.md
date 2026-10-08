---
name: support-produit
description: Organise le support des utilisateurs d'un produit (gravité S1 à S4, délais, réponses types, base d'aide, remontée des bugs et des retours). Use when un utilisateur pose une question ou signale un problème, quand il faut écrire ou mettre à jour des réponses types et articles d'aide, ou analyser les demandes de support.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Support produit

**Les réponses aux utilisateurs sont préparées par l'agent et envoyées par un humain**, tant que la direction n'a pas autorisé
explicitement l'envoi direct pour un type de demande.

1. **Gravité** :
   - **S1** : service indisponible, perte de données, faille de sécurité, paiements cassés : prévenir un humain immédiatement
     (skill `incident-postmortem`) ;
   - **S2** : fonction importante cassée sans contournement ;
   - **S3** : gêne avec contournement, question d'usage ;
   - **S4** : suggestion, demande de fonctionnalité.
2. **Réponse** : reformuler le problème, donner la solution ou le contournement, dire ce qui va se passer et quand ; ton humain, clair,
   sans jargon ; jamais de promesse de date de fonctionnalité.
3. **Réponses types** `produits/<produit>/support/reponses-types.md` pour les questions fréquentes ; **base d'aide** publique mise à
   jour dès qu'une question revient trois fois.
4. **Bug** : reproduit, puis ticket avec étapes, résultat attendu et obtenu, version, captures ; l'utilisateur est prévenu de la
   correction.
5. **Suggestion** : notée dans les retours (skill `decouverte-produit`) avec la citation.
6. **Données** : ne jamais demander de mot de passe ; accès au compte d'un utilisateur seulement avec son accord et tracé.
7. **Analyse mensuelle** : volume par catégorie, délais, sujets qui reviennent (ce sont des défauts du produit ou de l'aide).
