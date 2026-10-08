---
name: facturation-prestation
description: Prépare l'échéancier de facturation et les factures d'un projet client (acompte, étapes, solde, mentions obligatoires, facture électronique, relances d'impayés). Use when un devis est signé, qu'une étape est réceptionnée, qu'une échéance de facturation arrive ou qu'un paiement est en retard.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Facturation d'une prestation

L'agent prépare ; **un humain émet et envoie** les factures dans l'outil de facturation de la société.

1. **Échéancier** dès la signature : acompte (souvent 30 à 50 %), factures d'étape liées à des jalons vérifiables (PV de recette), solde
   à la réception ; maintenance mensuelle ou annuelle. Noté dans `documents/1-contrat/facturation.md`.
2. **Mentions** d'une facture entre professionnels : numéro unique et chronologique, date, identité et SIREN des deux parties, n° de
   TVA, date de la prestation, désignation, quantités, prix HT, taux et montant de TVA, total TTC, date d'échéance, **taux des
   pénalités de retard** et **indemnité forfaitaire de 40 €** pour frais de recouvrement, conditions d'escompte, référence du devis.
3. **Facture électronique** : depuis le 1er septembre 2026, toute entreprise doit pouvoir **recevoir** des factures électroniques via
   une plateforme agréée ; l'**émission** est obligatoire depuis cette date pour les grandes entreprises et ETI, et le sera au 1er
   septembre 2027 pour les PME et micro-entreprises. Vérifier que l'outil de la société est raccordé à une plateforme agréée.
4. **Délai de paiement** : celui du contrat, dans la limite légale (60 jours après la facture ou 45 jours fin de mois).
5. **Relances** : rappel courtois à l'échéance + 3 jours, relance ferme à + 15 jours, mise en demeure préparée à + 30 jours (envoyée
   par la direction) ; suspension des travaux si le contrat le prévoit. Journal des relances.
