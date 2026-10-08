---
name: test-publicitaire
description: Prépare, cadre et analyse un test de publicité payante (Google Search en priorité, puis Meta ou LinkedIn) avec budget plafonné, règles d'arrêt et suivi des conversions. Use when on envisage de la publicité payante pour une offre ou un produit, ou quand une campagne en cours doit être analysée.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Test publicitaire

**Règle** : l'agent prépare et analyse ; **Alex valide le budget et lance** la campagne. Aucune dépense sans plafond posé dans la
plateforme elle-même.

1. **Avant** : offre et page d'atterrissage prêtes (vitesse, message identique à l'annonce, formulaire testé) ; suivi des conversions
   vérifié (Google Tag ou Meta Pixel + API Conversions, consentement cookies conforme) ; CPA cible défini (valeur client × marge).
2. **Canal** : Google Search d'abord (intention exprimée), sur des mots-clés précis en correspondance exacte ou expression ;
   Meta ou LinkedIn seulement si la cible ne cherche pas encore la solution.
3. **Budget du test** : au moins 3 × le CPA cible par variante testée, plafond journalier et plafond total posés dans la plateforme.
4. **Une variable à la fois** (message, audience ou page) ; 2 à 3 annonces par groupe.
5. **Règles d'arrêt** écrites avant le lancement : arrêter une variante à 2 × le CPA cible dépensé sans conversion ; ne pas juger avant
   ce seuil.
6. **Analyse** : coût, clics, taux de conversion, CPA, qualité des contacts obtenus (vérifiée avec le pipeline) ; conclusion :
   continuer, ajuster ou arrêter. Mots-clés négatifs ajoutés chaque semaine.
