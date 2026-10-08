---
name: point-client-hebdo
description: Rédige le point d'avancement hebdomadaire envoyé au client (état par feu tricolore, fait, à venir, décisions et contenus attendus du client, risques). Use when c'est le jour du point hebdomadaire d'un projet client en cours, ou quand le client demande où en est son projet.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Point client hebdomadaire

Court (lisible en une minute), factuel, sans jargon. Préparé par l'agent, envoyé par un humain.

1. **État global** : vert (dans les temps), orange (risque identifié, plan en place), rouge (glissement ou blocage, décision nécessaire),
   avec une phrase d'explication.
2. **Fait cette semaine** : livrables concrets, avec un lien d'aperçu quand il existe.
3. **Semaine prochaine** : ce qui sera fait.
4. **Attendu du client**, avec une date : validations, contenus, accès, réponses. C'est la partie la plus importante.
5. **Risques et décisions** : impact chiffré (jours, euros) et options.
6. **Avancement** par rapport au planning et, pour un forfait en régie, temps consommé sur le temps vendu.

Ne jamais masquer un retard : le signaler dès qu'il est connu. Ranger chaque point dans
`clients/<client>/documents/4-echanges/AAAA-MM-JJ-point.md`.
