---
name: conformite-rgpd
description: Vérifie qu'un projet, une fonctionnalité ou un traitement respecte le RGPD (base légale, minimisation, durée de conservation, sous-traitants, droits des personnes, information). Use when un projet collecte ou traite des données personnelles (formulaires, CRM, comptes utilisateurs, prospection, IA qui lit des e-mails ou des appels), ou avant une mise en ligne.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Conformité RGPD

1. **Quelles données**, de qui, pourquoi : chaque donnée a une finalité ; on ne collecte que le nécessaire (minimisation).
2. **Base légale** de chaque traitement : contrat, intérêt légitime (avec mise en balance écrite), consentement, obligation légale.
3. **Information** des personnes : qui traite, pourquoi, combien de temps, leurs droits, à qui écrire ; en français, au moment de la collecte.
4. **Durées de conservation** définies et appliquées (suppression ou anonymisation automatique) ; prospects : 3 ans après le dernier
   contact actif.
5. **Sous-traitants** (hébergeur, base de données, API d'IA, outil d'e-mails, n8n…) : listés, avec un accord de sous-traitance
   (art. 28) ; transferts hors UE identifiés et encadrés.
6. **Quand l'agence traite les données de son client** : contrat de sous-traitance (DPA) avec le client.
7. **Droits des personnes** : accès, rectification, effacement, opposition possibles et traités sous un mois.
8. **Sécurité** : skills `securite-owasp` et `isolation-donnees`.
9. **Registre des traitements** de la société mis à jour (`memoire/` ou document dédié).
10. **Cookies** : consentement préalable pour tout traceur non essentiel (publicité, mesure hors exemption CNIL).

Ce skill aide à vérifier ; les modèles de contrats et le cas d'un doute sérieux relèvent d'un avocat ou d'un DPO.
