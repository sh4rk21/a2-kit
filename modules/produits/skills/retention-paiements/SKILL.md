---
name: retention-paiements
description: Réduit l'attrition d'un produit payant (raisons de départ, parcours d'annulation honnête, paiements échoués et relances, offres de rétention) en respectant la résiliation simple. Use when l'attrition augmente, quand des paiements échouent, ou pour concevoir le parcours d'annulation et les relances de paiement d'un produit.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Rétention et paiements échoués

Complète le skill `churn-prevention` (marketingskills) ; **ces règles priment** : annulation toujours simple (résiliation en quelques clics), au plus une offre clairement refusable.

1. **Distinguer** l'attrition **volontaire** (le client part) de l'attrition **involontaire** (carte expirée, paiement refusé) :
   cette dernière représente souvent une part importante et se corrige mieux.
2. **Paiements échoués** : nouvelles tentatives automatiques de la plateforme de paiement ; mise à jour automatique des cartes si
   disponible ; e-mails de relance (le jour même, J+3, J+7) avec un lien direct de mise à jour ; avertissement avant suspension ; période
   de grâce définie.
3. **Annulation** : toujours **simple et accessible**. En France, pour les contrats conclus en ligne avec des particuliers, la
   résiliation doit pouvoir se faire en quelques clics depuis une fonctionnalité dédiée (« résiliation en trois clics ») ; pas de
   parcours piège, pas d'obligation d'appeler. Une seule question facultative sur la raison du départ, et au plus une offre
   (pause, formule inférieure, remise) clairement refusable.
4. **Raisons de départ** classées chaque mois et transmises à la découverte produit.
5. **Prévention** : repérer les comptes qui n'utilisent plus le produit (baisse d'usage) et leur proposer de l'aide utile, pas une
   promotion.
6. **Mesure** : attrition mensuelle en clients et en revenu, part involontaire, revenu récupéré par les relances.
