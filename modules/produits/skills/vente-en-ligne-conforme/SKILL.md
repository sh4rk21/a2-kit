---
name: vente-en-ligne-conforme
description: Vérifie la conformité juridique de la vente en ligne d'un produit (CGV et CGU, mentions, prix, droit de rétractation, résiliation, médiateur, données personnelles, accessibilité) selon que la clientèle est professionnelle ou particulière. Use when un produit est mis en vente, que ses conditions, son tunnel d'achat ou ses prix changent, ou avant un lancement.
license: MIT
metadata:
  lang: fr
  module: produits
---

# Vente en ligne conforme

**Les textes juridiques sont rédigés à partir de modèles validés et relus par un avocat** ; l'agent vérifie, signale les manques et
prépare les mises à jour.

1. **Mentions légales** : identité de l'éditeur, SIREN, adresse, contact, hébergeur, directeur de la publication.
2. **CGV / CGU** : prix et modalités de paiement, durée et reconduction, résiliation, niveau de service, responsabilité, propriété des
   contenus de l'utilisateur, suspension, évolution des conditions (prévenir à l'avance), droit applicable.
3. **Particuliers (B2C)** en plus :
   - prix **TTC** affichés, récapitulatif avant paiement, bouton « commande avec obligation de paiement » ou formule équivalente ;
   - **droit de rétractation de 14 jours** : l'information est obligatoire ; pour un contenu numérique ou un service que le client
     veut utiliser tout de suite, recueillir son **accord exprès** et sa reconnaissance de la perte ou de la limitation de ce droit ;
   - **résiliation en quelques clics** en ligne pour les contrats souscrits en ligne ;
   - **médiateur de la consommation** désigné et indiqué ;
   - information sur la reconduction tacite des abonnements.
4. **Données personnelles** : politique de confidentialité, registre, sous-traitants (paiement, e-mail, hébergement, IA), consentement
   des cookies non essentiels (skill `conformite-rgpd`).
5. **Accessibilité** : services de commerce en ligne soumis à l'European Accessibility Act depuis le 28 juin 2025 (hors
   micro-entreprises) : skill `accessibilite-rgaa`.
6. **IA dans le produit** : transparence (AI Act, article 50).
