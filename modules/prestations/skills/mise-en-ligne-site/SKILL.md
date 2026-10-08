---
name: mise-en-ligne-site
description: Prépare et déroule la mise en ligne d'un site ou d'une application client (DNS, redirections 301, HTTPS, référencement, mesure d'audience avec consentement, mentions légales, sauvegarde, plan de retour arrière, contrôles après bascule). Use when un livrable client est réceptionné et doit être mis en production, ou pour une refonte qui remplace un site existant.
license: MIT
metadata:
  lang: fr
  module: prestations
---

# Mise en ligne d'un site client

Complète le skill `livraison-production` du socle. L'agent prépare la liste et les vérifications ; **la bascule est faite ou validée
par un humain**, à une date convenue avec le client (jamais un vendredi soir ni la veille d'un congé).

**J-7 à J-1**
1. **Inventaire des URL** de l'ancien site (plan du site, Search Console, pages qui reçoivent du trafic ou des liens) et **table de
   redirections 301** vers les nouvelles URL ; aucune page importante sans destination.
2. **DNS** : baisser le TTL à 300 s au moins 24 h avant ; noter les enregistrements actuels (dont MX et TXT : ne pas casser les e-mails).
3. **Contenu final** relu, aucun texte ni image de remplissage, formulaires testés (réception réelle).
4. **Légal** : mentions légales, politique de confidentialité, bannière de consentement conforme CNIL (refuser aussi simple
   qu'accepter), CGV si vente ; déclaration d'accessibilité si le client y est soumis.
5. **SEO** : balises title et description, `robots.txt` et `sitemap.xml` de production (retirer le `noindex` de la préproduction),
   données structurées, balise canonique.
6. **Sauvegarde** complète de l'ancien site et **plan de retour arrière** écrit (comment revenir en moins de 30 minutes).

**Jour J**
7. Bascule DNS ou déploiement ; certificat HTTPS actif, redirection HTTP vers HTTPS et vers le domaine principal (avec ou sans www).
8. Contrôles : pages clés, formulaires, paiements, redirections (échantillon et liens les plus importants), e-mails du domaine.

**J+1 à J+30**
9. Search Console : propriété validée, sitemap envoyé, erreurs 404 et de couverture suivies chaque semaine.
10. Mesure d'audience en place et respectant le consentement ; Core Web Vitals ; sauvegardes automatiques vérifiées par une restauration
    de test ; supervision de disponibilité.
11. Remettre le TTL DNS à une valeur normale ; compte rendu de mise en ligne au client.
