---
name: lancement-projet
description: Organise le lancement d'un projet client signé (réunion de lancement, rôles et responsabilités, accès, planning, canaux de communication, repo et environnements). Use when un devis est signé et l'acompte reçu, avant le début de la production.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Lancement de projet

1. **Vérifier** : devis signé, acompte reçu, contrat et annexe RGPD signés si prévus. Sans cela, pas de production.
2. **Rôles (RACI)** : pour chaque étape, qui réalise, qui valide, qui est consulté, qui est informé, côté société et côté client ;
   **un interlocuteur unique** chez le client pour les validations.
3. **Planning** par étapes avec jalons, dates de livraison des contenus par le client, dates de validation (délai de retour convenu).
4. **Accès** demandés en une seule liste : hébergement, nom de domaine, DNS, outils, comptes analytics, réseaux. Ranger les identifiants
   **dans le gestionnaire de secrets** de la société, jamais dans le repo ni dans un ticket. Comptes au nom du client quand c'est
   possible.
5. **Technique** : repo du livrable (organisation GitHub de la société), environnements (local, préproduction), `technique.md` du
   dossier client.
6. **Communication** : canal, rythme du point hebdomadaire (skill `point-client-hebdo`), délai de réponse.
7. **Compte rendu de lancement** dans le dossier client, envoyé par un humain ; tickets créés pour la première étape.
