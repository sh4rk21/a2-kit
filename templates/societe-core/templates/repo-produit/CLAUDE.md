# <Produit>

Repo du produit <Produit> de <SOCIETE>. Fiche, feuille de route et décisions : `<societe>-core/produits/<produit>/`.

## Avant toute chose
1. Lire `<societe>-core/produits/<produit>/fiche.md` et le dernier état du ticket.
2. Pour toute interface : `DESIGN.md` du produit d'abord.

## Invariants
| Invariant | Détail |
|---|---|
| Production | <Pas de préproduction : la fusion déploie ?> Chaque PR liste variables, migration, vérification après déploiement, retour arrière |
| Base de données | Migrations versionnées uniquement, jamais de commande destructive (skill `database-migrations`) |
| Isolation | Toute requête sur une ressource utilisateur est filtrée par utilisateur ; limites de plan côté serveur |
| Paiement | <fournisseur>, derrière une interface interne (skill `paiements-produit`) |
| Secrets | Variables d'environnement de l'hébergeur uniquement |
<Invariants propres au produit.>
