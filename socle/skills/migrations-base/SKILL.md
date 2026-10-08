---
name: migrations-base
description: Modifie le schéma d'une base de données en production sans perte de données (migrations versionnées, étapes expand/contract, sauvegarde, retour arrière). Use when un ticket touche à schema.prisma, à une table, une colonne, un index, une politique RLS ou à des données existantes ; Don't use pour du code sans changement de schéma.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Migrations de base de données

**Interdits** : `prisma db push`, `--accept-data-loss`, `--force-reset`, toute modification manuelle d'une base de production par un agent.

1. **Migration versionnée** générée en local (`prisma migrate dev --name <nom-explicite>`, ou fichier SQL de migration Supabase).
2. **Relis le SQL généré** : aucun `DROP`, aucun changement de type qui perd de l'information, aucun verrou long sur une grosse table.
3. **Changement destructif** (renommer, supprimer, changer un type) en plusieurs déploiements **expand → migrate → contract** :
   ajouter la nouvelle structure, écrire dans les deux, copier les données par lots, basculer la lecture, supprimer l'ancienne
   structure plus tard dans une autre PR.
4. **Description de la PR** : ce qui se passe au déploiement, durée estimée, **sauvegarde à faire avant** (par un humain),
   vérification après, **retour arrière exact**.
5. **Signale explicitement** toute migration qui touche des données existantes : la direction fait une sauvegarde et fusionne.
6. **Test** : la migration s'applique sur une base vide et sur une copie de données réalistes ; l'application fonctionne avant et après.

Le redéploiement du code précédent n'annule pas une migration déjà appliquée : seul le retour arrière écrit dans la PR fait foi.
