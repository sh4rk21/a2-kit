---
name: maintenance-sla
description: Organise la maintenance d'un client sous contrat (niveaux de gravité, délais de prise en charge, mises à jour de sécurité, sauvegardes testées, supervision, rapport mensuel, heures consommées). Use when un client est en maintenance ou en garantie, quand il signale un incident, ou pour préparer le rapport mensuel de maintenance.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Maintenance et engagements de service

**Engagements** : ceux du contrat du client (délais de prise en charge et de résolution, heures incluses, horaires couverts). À
défaut de contrat, aucune promesse de délai.

1. **Gravité** de chaque demande :
   - **S1 bloquant** : site hors ligne, paiements ou formulaires cassés, faille de sécurité ;
   - **S2 majeur** : fonction importante dégradée, pas de contournement ;
   - **S3 mineur** : gêne avec contournement ;
   - **S4 demande** : évolution ou question (hors maintenance corrective : devis ou heures incluses).
2. **Incident S1** : prévenir un humain immédiatement ; rétablir d'abord (retour arrière, désactivation), comprendre ensuite ; informer
   le client à chaque étape ; compte rendu après incident (cause, correction, prévention).
3. **Préventif mensuel** : mises à jour (cœur, extensions, dépendances) testées en préproduction avant production ; alertes de sécurité
   des composants utilisés ; sauvegardes vérifiées par une **restauration de test** ; certificats et nom de domaine (échéances) ;
   supervision de disponibilité et de performance.
4. **Journal** des interventions avec le temps passé, dans `clients/<client>/documents/4-echanges/maintenance.md`.
5. **Rapport mensuel** au client : disponibilité, interventions, mises à jour, sauvegardes testées, heures consommées et restantes,
   recommandations. Envoyé par un humain.
