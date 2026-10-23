---
name: prospection
description: Construit et qualifie des listes de prospects B2B conformes au RGPD et aux règles de la CNIL (sources autorisées, information article 14, opposition, durée de conservation), sans automatisation LinkedIn. Use when il faut trouver de nouveaux prospects, préparer une campagne de prospection ou enrichir une liste de contacts.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Prospection B2B conforme

Complète le skill `prospecting` (marketingskills) pour la méthode ; **ces règles françaises priment** : pas d'outils d'enrichissement qui collectent des données sans base légale, jamais LinkedIn par automatisation ni Sales Navigator extrait.

**Interdits absolus** : scraping ou automatisation de LinkedIn (connexions, messages, visites, extraction) ; achat de fichiers sans
preuve de conformité ; adresses personnelles (gmail…) pour du B2B ; deviner des adresses en masse. La CNIL a sanctionné KASPR de
240 000 € pour l'extraction de contacts LinkedIn. **Apollo, ZoomInfo, Clay** (et les outils d'enrichissement du même type) et
**tout export de Sales Navigator** sont interdits sauf décision écrite d'Alex, même si le skill `prospecting` les dit acceptables.

1. **Partir de l'ICP** (`marketing/cible.md`, skill `customer-research`, `product-marketing`).
2. **Sources autorisées** : sites des entreprises (page contact, mentions légales), annuaires professionnels publics, registres
   (annuaire des entreprises, data.gouv.fr), événements et salons, recommandations, inbound. Noter la **source** de chaque contact.
3. **Qualification** : critères de l'ICP + un **signal d'achat** concret et daté par prospect ; sans signal, pas de contact. Chaque
   critère et chaque signal a sa **preuve** (un ou deux liens vers la source) ; rien n'est affirmé sans preuve.
   - **Confiance** : élevée (deux sources indépendantes ou la page officielle de l'entreprise), moyenne (une source fiable et des
     recherches concordantes), faible (preuve incomplète : dire ce qui reste incertain).
   - **Score** : chaud (ICP net, signal clair, décideur joignable, adresse vérifiée), tiède (ICP, signal plus faible ou plus ancien,
     adresse vérifiable), froid (ICP approximatif, pas de signal clair ou adresse non vérifiée), écarté (hors ICP, doublon, société
     fermée, confiance faible). Seuls les prospects chauds et tièdes sont contactés.
4. **Fiche prospect** dans le CRM (skill `pipeline-crm`) : société, rôle, adresse professionnelle, source, date de collecte, signal,
   liens de preuve, confiance, score, date de vérification de l'adresse.
5. **RGPD** (B2B, intérêt légitime) : message en lien avec la fonction du contact ; au **premier message**, information article 14
   (qui nous sommes, source des données, finalité, droit d'opposition) ; désinscription en un clic ; liste d'opposition tenue et
   respectée dans toutes les sociétés ; suppression 3 ans après le dernier contact actif.
6. **Volume** : préférer 30 prospects bien choisis à 500 contacts génériques.

Les messages sont écrits avec le skill `email-prospection`. L'envoi est fait ou validé par Alex.
