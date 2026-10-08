---
name: decouverte-produit
description: Organise la découverte produit continue (entretiens utilisateurs, retours classés, enquête d'adéquation produit-marché à 40 %) pour décider quoi construire à partir de preuves. Use when il faut comprendre les besoins des utilisateurs d'un produit, trier des retours, mesurer l'adéquation au marché ou valider une idée de fonctionnalité avant de la construire.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Découverte produit

1. **Collecter en continu** : retours du support, e-mails, avis, annulations (raison demandée à chaque départ), entretiens.
   Tout retour va dans `produits/<produit>/retours.md` avec la date, la source, le type d'utilisateur et **la citation exacte**.
2. **Entretiens** (un à deux par semaine) : sur le passé réel, pas sur des intentions (« Racontez-moi la dernière fois que… », pas
   « Utiliseriez-vous… ? ») ; pas de présentation de solution pendant l'entretien. Résumé dans `produits/<produit>/entretiens/`.
3. **Classer** les retours par problème (pas par solution demandée) ; compter les occurrences et le poids des utilisateurs concernés
   (payants, cible, revenu).
4. **Enquête d'adéquation** (méthode Sean Ellis) auprès des utilisateurs actifs : « Comment vous sentiriez-vous si vous ne pouviez plus
   utiliser le produit ? » (très déçu, un peu déçu, pas déçu). **40 % de « très déçu »** est le seuil indicatif d'adéquation. Demander
   aussi : pour qui est le produit, son principal bénéfice, ce qui l'améliorerait. Au moins 40 réponses pour conclure.
5. **Opportunités** : chaque problème fréquent devient une opportunité notée (skill `priorisation-produit`), jamais directement un
   ticket de développement.
6. Données personnelles minimales ; citations anonymisées dans les documents partagés.
