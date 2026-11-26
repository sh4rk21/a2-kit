---
name: audit-securite
description: Méthode de l'agent Sécurité - relecture sécurité bloquante d'une PR sensible dans l'étape « Sécurité », mise en place de Gitleaks, Trivy et Semgrep dans la CI, rapport hebdomadaire (scanners, OWASP ZAP, dépendances) et registre des vulnérabilités. Use when tu es l'agent Sécurité et que tu relis une PR, installes ou ajustes des scanners, rédiges le rapport de la semaine ou mets à jour le registre ; Don't use pour corriger du code applicatif (c'est le Développeur) ni pour une relecture de conformité (c'est le Relecteur).
license: MIT
metadata:
  lang: fr
  module: socle
---

# Audit de sécurité

## 1. Qu'est-ce qu'une PR sensible
Une PR est sensible, et son ticket porte l'étape « Sécurité », si elle touche **un seul** de ces points :
- connexion, sessions, comptes, droits, cloisonnement entre comptes ou entre clients ;
- secrets, clés, jetons, variables d'environnement, chiffrement ;
- fichiers reçus (téléversements, imports) ou appels sortants vers une adresse fournie par un utilisateur (risque SSRF) ;
- paiement, facturation, licences ;
- migration ou schéma de base de données, requêtes construites à partir d'une saisie ;
- infrastructure, déploiement, CI, dépendances ajoutées ou mises à jour ;
- tout ce qui est classe 3 pour le Relecteur.

## 2. Relecture d'une PR (étape « Sécurité »)
1. **Lire le contexte** : le ticket, l'encadré « En clair », la section « Mise en production », puis le diff **entier** (pas
   seulement les fichiers annoncés). Noter le commit relu.
2. **Lire les scanners de la PR** : `gh pr checks <numéro>`, puis `gh run view <id> --log-failed` pour un échec. Une alerte est
   soit une faille (gravité, endroit), soit un faux positif écarté avec sa raison.
3. **Modéliser la menace en trois lignes** : qui peut appeler ce code (anonyme, client connecté, administrateur, site tiers) ; quelle
   donnée ou quel argent il touche ; ce qu'un attaquant gagnerait.
4. **Contrôler par thème**, avec les skills du kit :
   - `securite-owasp` : injections, contrôle d'accès, authentification, SSRF (adresses IP écrites en clair, redirections, résolution
     DNS), téléversements (type réel, taille, nom de fichier, analyse), désérialisation, en-têtes de sécurité ;
   - `isolation-donnees` : chaque requête filtre par le compte ou le client propriétaire ; un identifiant d'un autre compte rend 404 ;
   - `secrets-et-dependances` : aucun secret dans le dépôt ni dans un journal ou une réponse d'erreur ; dépendances nouvelles
     justifiées, maintenues, sans faille connue ;
   - migrations : pas de perte de données, droits de la base inchangés, retour arrière décrit.
5. **Vérifier par toi-même** ce qui peut l'être sans toucher à la production : relancer les tests de sécurité de la PR, écrire un
   test qui reproduit l'attaque dans une copie de travail (sans le pousser), lancer l'audit des dépendances du gestionnaire de paquets
   (`npm audit --omit=dev`, `pip-audit`, `composer audit`).
6. **Décider** (fiche, section « Gravité ») : critique ou haute = **à corriger** ; sinon **validé**, avec les points moyens et bas
   listés et inscrits au registre.

**Verdict à corriger** : un point par faille, sous la forme `fichier:ligne` · gravité · scénario d'attaque en une phrase ·
correction attendue · test qui doit le prouver.
**Verdict validé** : commit relu, scanners lus, ce que tu as vérifié toi-même, points non bloquants inscrits au registre.

## 2 bis. Grilles de test
Méthode adaptée des skills de Strix (`tiers/strix`, Apache-2.0) : `owasp-top-10-testing`, `api-security-testing`,
`web-app-penetration-testing`, `find-security-vulnerabilities-in-code`. Tant que Strix ne tourne pas (décision d'Alex), tu appliques
cette méthode toi-même, par la lecture du code et par des tests écrits dans une copie de travail.

**OWASP Top 10:2025** (édition en vigueur ; l'écrire dans le verdict) : pour chaque catégorie, dis ce que tu as vérifié, ce que tu as
prouvé, et ce qui n'est **pas** vérifiable depuis le code.

| Catégorie | Ce que tu cherches | Couverture par la relecture |
|---|---|---|
| A01 Contrôle d'accès (SSRF compris) | accès d'un compte aux objets d'un autre, élévation de droits, IDOR, SSRF | forte : test avec deux comptes |
| A02 Mauvaise configuration | routes de débogage, erreurs bavardes, CORS trop large, identifiants par défaut | forte |
| A03 Chaîne d'approvisionnement | dépendances vulnérables ou non épinglées, actions de CI non épinglées | partielle : Trivy, audit des paquets |
| A04 Cryptographie | secrets ou jetons dans les réponses, hachage des mots de passe, transport | partielle |
| A05 Injection | SQL, NoSQL, commande, gabarit, XSS | forte |
| A06 Conception | contournement d'étape, prix ou quantité modifiés, courses | partielle : modéliser la menace |
| A07 Authentification | contournement, sessions, réinitialisation du mot de passe, verrouillage | forte |
| A08 Intégrité | désérialisation, mises à jour non signées, confiance de la CI | partielle |
| A09 Journalisation et alertes | ce qui est journalisé, sans secret ni donnée sensible | non testable de l'extérieur : le dire |
| A10 Cas d'erreur | comportement « ouvert » sur erreur, fuites dans les erreurs, délais | partielle |

**API (OWASP API Security Top 10:2023)** : partir du schéma (OpenAPI) pour lister toutes les routes. Les failles d'une API sont surtout
des failles de droits :
- **API1, objets** : le jeton du compte B sur l'identifiant d'un objet du compte A doit rendre 404, sur chaque route ;
- **API3, propriétés** : un `PATCH` qui accepte un champ interdit (affectation en masse), une liste qui renvoie trop de champs ;
- **API5, fonctions** : un compte simple sur une route d'administration ;
- **API4, consommation** : limites de taille, de pagination et de débit.

**Ce qu'il faut pour prouver** : deux comptes (dans deux sociétés clientes différentes), un compte à droits élevés, des identifiants
d'objets réels, et la liste de ce qui est hors périmètre (paiement, envois en masse, actions destructrices). Tu ne fabriques jamais un
jeton et tu ne testes jamais un système qui n'appartient pas à la société.

**Vérifier avant de signaler** : un refus vide (200 sans données) n'est pas une fuite ; une alerte d'outil sans scénario n'est pas
une faille. Un résultat propre ne prouve pas l'absence de faille : il prouve seulement que **ce qui a été analysé** n'en a pas montré.
Le dire.

## 3. Scanners dans la CI
Un fichier `.github/workflows/securite.yml` par dépôt, déclenché sur chaque PR et chaque poussée sur la branche principale, plus une
fois par semaine. Trois tâches, chacune bloquante sur une gravité haute ou critique :
- **Gitleaks** (secrets dans tout l'historique de la PR) : image officielle `zricethezav/gitleaks`, commande
  `gitleaks detect --source . --redact --no-banner`. Un fichier `.gitleaksignore` liste les faux positifs, chacun avec sa raison.
- **Trivy** (dépendances, configuration, Dockerfile) : action officielle `aquasecurity/trivy-action`, mode `fs`, gravités
  `HIGH,CRITICAL`, `ignore-unfixed: true`. Un fichier `.trivyignore` liste les exceptions, avec leur raison et leur date de fin.
- **Semgrep** (code) : image officielle `semgrep/semgrep`, commande `semgrep scan --config p/default --error --metrics=off`.

Règles :
- **Épingler chaque action et chaque image** sur une version précise, et les actions sur le SHA de leur commit : une action non
  épinglée est elle-même une faille de chaîne d'approvisionnement.
- Droits minimaux du workflow : `permissions: contents: read`.
- Aucun secret nécessaire : si un outil en demande un, tu t'arrêtes et tu demandes à Alex.
- PR de classe 3, avec dans « Mise en production » : « Activer la vérification `securite` comme obligatoire sur la branche
  principale (Alex) ».
- Premier passage sur un dépôt existant : les failles déjà présentes vont au registre et en tickets de correctif, pas dans la PR des
  scanners. Pour ne pas bloquer toute l'équipe, la PR peut démarrer en mode avertissement, avec la date de passage en bloquant écrite.

## 4. Rapport hebdomadaire
Routine « Sécurité hebdomadaire <SOCIETE> ». Le rapport est posé en document `rapport` du ticket de la routine :
1. **Scanners** : dernier passage planifié de chaque dépôt ; nouvelles alertes.
2. **OWASP ZAP** : rapport de scan de référence (passif) des environnements de test, déposé par la Base ; nouvelles alertes moyennes et
   plus. Tu ne lances jamais toi-même un scan actif.
3. **Dépendances** : nouvelles failles publiées sur les versions utilisées.
4. **Registre** : failles ouvertes par gravité, ancienneté de la plus vieille, correctifs fusionnés dans la semaine.
5. **Ce qu'il faut à Alex** : décisions ou gestes, chacun avec ta réponse recommandée.
Rien de nouveau : un rapport de trois lignes suffit.

## 5. Registre des vulnérabilités
Document `registre` du ticket permanent « Registre des vulnérabilités », assigné à toi. Une ligne par faille :

| N° | Date | Dépôt | Gravité | Faille (sans aucune valeur de secret) | Source | Ticket correctif | État |
|---|---|---|---|---|---|---|---|

États : `ouverte`, `corrigée` (avec le commit), `acceptée` (seulement par Alex, avec sa raison et une date de revue).
Une faille critique ou haute ouverte depuis plus de 7 jours remonte dans le rapport hebdomadaire, en tête.

## 6. Limites
- Jamais de test actif contre une production, un site client ou un système tiers ; seulement les environnements de test de la
  société, et seulement par la Base.
- Aucun service payant sans l'accord écrit d'Alex.
- Aucune valeur de secret recopiée, même partiellement : fichier, ligne et nom de variable suffisent.
