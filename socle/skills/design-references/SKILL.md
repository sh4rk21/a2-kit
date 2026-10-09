---
name: design-references
description: Construit une planche de références réelles et commentées pour un projet (sites et produits existants via les MCP Inspo ou Refero, galeries, monde physique du client), avec ce qu'on prend et ce qu'on évite de chacune. Use when PRODUCT.md est validé et avant de proposer des directions visuelles, ou pour analyser le site actuel d'un client avant une refonte.
license: MIT
metadata:
  lang: fr
  module: socle
---

# Références de design

## Sources, par ordre de préférence
1. **MCP Refero** (si la société a l'abonnement Pro) : écrans, parcours et styles de produits réels. Quota partagé : chercher par tâche
   et par secteur, pas en rafale.
2. **MCP Inspo** (gratuit, `https://inspomcp.dev/api/mcp`) : 832 sites réels capturés sur ordinateur et mobile, avec palette, polices,
   analyse de chaque section et un DESIGN.md par site. Commencer par `recommend` avec le brief, puis affiner (sections, composants,
   sites similaires).
3. **Bibliothèques de styles gratuites**, consultées avec le navigateur : Refero Styles (`styles.refero.design`), collection
   `VoltAgent/awesome-design-md`. Elles montrent comment des marques organisent couleurs, typographie et composants : on s'en
   inspire pour une **idée précise**, jamais pour reprendre une identité.
4. **Galeries de sites**, consultées avec le navigateur (`agent-browser`, Chrome DevTools ou Playwright) : Land-book, Lapa Ninja,
   SaaS Landing Page, One Page Love, Godly, Siteinspire. Quelques pages ciblées, à la vitesse d'une lecture humaine.
5. **Le monde du client** : vitrines, signalétique, emballages, imprimés, lieux, matériaux de son métier (photos fournies, visites,
   site actuel).
6. **Hors du secteur** : une ou deux références d'un autre domaine qui résolvent le même problème.

## Méthode
1. **10 à 20 références**, d'au moins trois sources différentes, choisies pour la **tâche** (page d'accueil SaaS, fiche produit,
   tableau de bord…) et la **cible** de PRODUCT.md, pas parce qu'elles sont « jolies ».
2. **Pour chaque référence** : lien, **ce qu'on prend** (une idée précise : une hiérarchie, un rythme, un traitement typographique,
   un motif de mise en page) et **ce qu'on évite**.
3. **Site actuel du client** (refonte) : extraire ses jetons existants avec `npx dembrandt@0.38.0 <url>` (couleurs, typographie,
   espacements, composants) pour partir de sa marque réelle. Sur un concurrent, Dembrandt sert seulement à **analyser**, jamais à copier.
4. **Livrable** : `design/references.md` (liens, commentaires, extraits de jetons utiles). Pas d'images protégées copiées dans le dépôt :
   des liens et, au besoin, des captures gardées hors du dépôt.

## Interdits
- Outils non officiels qui aspirent Mobbin, Dribbble, Behance, Pinterest ou Refero (contraire à leurs conditions d'utilisation).
- Copier une interface, reprendre l'identité d'une marque ou d'un concurrent, réutiliser un DESIGN.md de marque tel quel.
- Aspirer une galerie en masse.

Ensuite : skill `design-direction`.
