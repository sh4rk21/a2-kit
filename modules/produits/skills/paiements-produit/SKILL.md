---
name: paiements-produit
description: Choisit, intègre et surveille la solution de paiement d'un produit (vendeur officiel ou paiement direct, TVA, factures, abonnements, webhooks) derrière une couche d'abstraction, avec veille sur les changements des fournisseurs. Use when on met en place ou change les paiements d'un SaaS, d'un plugin ou d'un template vendu en direct, ou quand un fournisseur de paiement annonce un changement.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Paiements d'un produit

1. **Choix** :
   - **Vendeur officiel** (merchant of record : Paddle, Lemon Squeezy, Stripe Managed Payments…) : il encaisse en son nom, gère la TVA
     de chaque pays et les factures ; plus cher (souvent autour de 5 % par transaction), beaucoup moins de charge administrative ;
   - **Paiement direct** (Stripe Billing…) : moins cher, mais la société gère la TVA (guichet unique OSS pour les ventes aux
     particuliers de l'Union européenne), les factures et la facture électronique.
2. **Veille** : Lemon Squeezy, racheté par Stripe, fonctionne encore mais évolue peu ; Stripe Managed Payments (préversion publique
   depuis février 2026) propose un chemin de migration. Vérifier l'état chaque trimestre et avant tout nouveau produit ; noter la date
   de vérification dans `produits/<produit>/technique.md`.
3. **Couche d'abstraction** : le code du produit appelle une interface interne (créer un paiement, gérer un abonnement, recevoir un
   événement), jamais le fournisseur directement ; changer de fournisseur ne touche qu'un adaptateur.
4. **Webhooks** : signature vérifiée, traitement idempotent (un même événement reçu deux fois ne crée rien en double), journalisé ;
   l'état d'abonnement en base suit les événements, jamais seulement la page de retour du client.
5. **Tests** en mode test du fournisseur : paiement accepté, refusé, authentification forte (3-D Secure), remboursement, changement de
   formule, annulation, échec de renouvellement.
6. **Clés** dans le gestionnaire de secrets ; aucune donnée de carte ne transite par nos serveurs (formulaires du fournisseur).
