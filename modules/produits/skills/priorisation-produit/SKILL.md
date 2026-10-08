---
name: priorisation-produit
description: Priorise les opportunités et fonctionnalités d'un produit avec la méthode RICE (portée, impact, confiance, effort) et tient une feuille de route en trois horizons. Use when il faut choisir quoi construire ensuite, arbitrer entre des demandes, ou mettre à jour la feuille de route d'un produit.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Priorisation produit

1. **Score RICE** pour chaque opportunité :
   - **Portée** : nombre d'utilisateurs concernés par trimestre (chiffre réel ou estimé, à dire) ;
   - **Impact** : 3 (énorme), 2 (fort), 1 (moyen), 0,5 (faible), 0,25 (minime) sur la mesure de succès choisie ;
   - **Confiance** : 100 % (données solides), 80 % (quelques preuves), 50 % (intuition) ;
   - **Effort** : personnes-semaines ;
   - score = portée × impact × confiance ÷ effort.
2. Le score aide, il ne décide pas : ajuster pour la stratégie (cible prioritaire, dette technique bloquante, obligation légale,
   sécurité) et **écrire la raison** de chaque écart.
3. **Feuille de route** `produits/<produit>/feuille-de-route.md` en trois horizons : **maintenant** (en cours), **ensuite** (prochain
   cycle), **plus tard** (idées validées). Pas de dates promises au public pour « ensuite » et « plus tard ».
4. Dire non est une décision : les demandes écartées sont notées avec la raison, pour pouvoir répondre aux utilisateurs.
5. Revue chaque mois, ou dès qu'une nouvelle preuve change la confiance.
