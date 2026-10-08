---
name: livraison-production
description: Checklist bloquante avant toute mise en production (site, application, automatisation, agent IA), pour un client ou un produit maison. Use when tu prépares ou valides une mise en ligne, une fusion qui déploie, ou la remise d'un livrable en production ; un agent prépare, un humain déploie.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Livraison en production

Chaque point : **fait, avec preuve**, ou **bloquant**.
1. **Santé** : point de contrôle (healthcheck) vérifié ; erreurs gérées explicitement, aucune erreur silencieuse.
2. **Surveillance et alertes** branchées ; quelqu'un est prévenu en cas de panne.
3. **Sauvegardes** automatiques actives et **restauration testée**.
4. **HTTPS**, domaine au bon nom (celui du client quand c'est prévu), redirections 301 si l'adresse change.
5. **Secrets** uniquement chez l'hébergeur ; nouvelles variables ajoutées avant la fusion.
6. **Isolation** : données, accès et serveur propres à chaque client ou produit (skill `isolation-donnees`).
7. **Sécurité** : skill `securite-owasp` passé ; aucune action irréversible automatique sans décision écrite.
8. **Interface** : contrôle visuel et accessibilité passés (skills `ui-controle-visuel`, `accessibilite-rgaa`).
9. **Mentions légales**, politique de confidentialité, consentement cookies si nécessaire.
10. **Agent IA en production** : outils en liste blanche, validation humaine des actions irréversibles, journal d'audit, budget,
    arrêt d'urgence documenté, tests y compris malveillants, période d'observation, mention « vous parlez à une IA ».
11. **Documentation** à jour : architecture, accès (sans secret), arrêt d'urgence, restauration.
12. **Retour arrière** décrit et possible ; **vérification après déploiement** décrite (URL ou commande publique).

L'agent prépare, le Relecteur valide point par point, **un humain déploie**.
