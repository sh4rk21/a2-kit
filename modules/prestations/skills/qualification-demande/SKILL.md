---
name: qualification-demande
description: Qualifie une demande entrante ou un prospect (besoin réel, budget, décideur, échéance, adéquation avec nos offres) et recommande d'y aller ou non, avant tout travail de proposition. Use when une nouvelle demande de client arrive (formulaire, e-mail, recommandation, appel) ou qu'un prospect répond positivement.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Qualifier une demande

Objectif : ne passer du temps de découverte et de devis que sur les demandes qu'on peut gagner et bien servir.

1. **Besoin** : quel problème, dans les mots du client ; pourquoi maintenant (élément déclencheur) ; ce qui se passe si rien n'est fait.
2. **Budget** : fourchette annoncée ou ordre de grandeur des montants comparables ; à défaut, la valeur du problème (temps perdu,
   ventes manquées) avec les chiffres du client.
3. **Décideur** : qui signe, qui influence, qui utilise ; processus de décision (comité, appel d'offres, devis concurrents).
4. **Échéance** : date souhaitée et la raison de cette date (événement, saison, fin de contrat).
5. **Adéquation** : correspond-il à nos offres (`societe/presentation.md`) et à l'ICP (`marketing/cible.md`) ? Avons-nous la
   compétence et la disponibilité ?
6. **Signaux d'alerte** : budget très bas pour le périmètre, demande de travail gratuit (maquettes avant signature), délai impossible,
   client qui a déjà changé plusieurs fois de prestataire, exigences juridiques inhabituelles.

**Verdict** dans `clients/<client>/fiche.md` : **y aller**, **y aller sous conditions** (lesquelles) ou **décliner** (réponse polie
et, si possible, une orientation). Les questions manquantes deviennent la trame de l'appel de découverte (skill `cahier-des-charges`).
La décision finale revient à la direction.
