#!/usr/bin/env bash
# Copie dans tiers/ les skills externes que Paperclip ne peut pas importer depuis leur repo d'origine
# (ECC : plus de 1 000 skills à analyser ; Impeccable : fichier de plus d'1 Mo et moteur binaire ; taste-skill et WordPress :
# le mot réservé de l'exécution dynamique apparaît dans un script ou une commande, refusé par le contrôle de sécurité).
# archify : fichiers de plus d'1 Mo, octets NUL et mot réservé ; anydoc : option qui envoie les documents à un service externe.
# Usage : scripts/sync-tiers.sh [ref-ECC] [ref-Impeccable] [ref-taste] [ref-WordPress] [ref-anthropics-skills] [ref-archify] [ref-anydoc]
#   (par défaut : les versions figées)
set -euo pipefail

ECC_REF="${1:-ef648e01899ba3e8dc6371642deaaf64b4477775}"
IMPECCABLE_REF="${2:-778c8a7b71ccd5bfe3ca6ac68c15d9d872d0f87d}"
TASTE_REF="${3:-f624f37a8c650b9cc550253104925efe4c8de246}"
WP_REF="${4:-55cd0f78b996f453c194a1a6ecc5c9a2e0f6cf15}"
ANTH_REF="${5:-dbd4588f9e1033efb41dad4bef2f7947c8993d44}"
ARCHIFY_REF="${6:-25cf37080fc8b1dbe758a4efc3935b55f3327083}"
ANYDOC_REF="${7:-3b6d4cda16631d2e83b5a0b9a4ddec35d40d3462}"
ANYDOC_NPM="0.2.4"
ECC_SKILLS=(database-migrations postgres-patterns prisma-patterns api-design backend-patterns error-handling coding-standards
  git-workflow docker-patterns frontend-patterns react-patterns react-testing nextjs-turbopack e2e-testing browser-qa canary-watch
  click-path-audit benchmark documentation-lookup production-audit codebase-onboarding architecture-decision-records
  intent-driven-development council product-lens make-interfaces-feel-better motion-foundations motion-patterns frontend-a11y
  brand-voice article-writing market-research competitive-platform-analysis frontend-slides
  vite-patterns mysql-patterns python-patterns python-testing fastapi-patterns django-patterns vue-patterns nuxt4-patterns
  nestjs-patterns laravel-patterns laravel-security laravel-tdd react-native-patterns)

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

fetch() { git -C "$TMP" init -q "$2"; git -C "$TMP/$2" remote add origin "$1"; git -C "$TMP/$2" fetch -q --depth 1 origin "$3"; git -C "$TMP/$2" checkout -q FETCH_HEAD; }

fetch https://github.com/affaan-m/ECC.git ecc "$ECC_REF"
rm -rf "$ROOT/tiers/ecc"; mkdir -p "$ROOT/tiers/ecc"
for s in "${ECC_SKILLS[@]}"; do cp -R "$TMP/ecc/skills/$s" "$ROOT/tiers/ecc/$s"; done
cp "$TMP/ecc/LICENSE" "$ROOT/tiers/ecc/LICENSE"

fetch https://github.com/pbakaus/impeccable.git impeccable "$IMPECCABLE_REF"
rm -rf "$ROOT/tiers/impeccable"; mkdir -p "$ROOT/tiers/impeccable"
SRC="$TMP/impeccable/.claude/skills/impeccable"
mkdir -p "$ROOT/tiers/impeccable/impeccable"
cp "$SRC/SKILL.md" "$ROOT/tiers/impeccable/impeccable/SKILL.md"
cp -R "$SRC/reference" "$ROOT/tiers/impeccable/impeccable/reference"
cp "$TMP/impeccable/LICENSE" "$TMP/impeccable/NOTICE.md" "$ROOT/tiers/impeccable/"
# Modification (Apache-2.0, section 4) : le moteur binaire n'est pas disponible dans Paperclip.
python3 - "$ROOT/tiers/impeccable/impeccable/SKILL.md" <<'PY'
import sys,re
p=sys.argv[1]; t=open(p).read()
note=("\n> **Version A2 (modifiée)** : copie sans le dossier `scripts/` (moteur binaire et index de polices), que Paperclip ne peut pas "
"importer. Les commandes `scripts/impeccable <verbe>` ne sont pas disponibles : lis toi-même PRODUCT.md, DESIGN.md et les fichiers "
"`reference/` correspondant à la commande demandée (critique, audit, polish, typeset, colorize, layout, animate…). Pour le détecteur "
"automatique, lance `npx impeccable@4.1.0 detect --json <dossier ou url>`. Source : pbakaus/impeccable, licence Apache-2.0.\n")
t=re.sub(r'(\n---\n)', r'\1'+note.replace('\\','\\\\'), t, count=1)
open(p,'w').write(t)
PY

# taste-skill (MIT) : design-taste-frontend seulement. Modification : méthode CDP renommée (eval -> evaluate), evals/ retiré.
fetch https://github.com/Leonxlnx/taste-skill.git taste "$TASTE_REF"
rm -rf "$ROOT/tiers/taste"; mkdir -p "$ROOT/tiers/taste"
cp -R "$TMP/taste/skills/taste-skill" "$ROOT/tiers/taste/design-taste-frontend"
rm -rf "$ROOT/tiers/taste/design-taste-frontend/evals"
sed -i -E 's/\.eval\(/.evaluate(/g; s/async eval\(/async evaluate(/; s/page eval:/page evaluate:/' \
  "$ROOT/tiers/taste/design-taste-frontend/scripts/inspect.mjs" "$ROOT/tiers/taste/design-taste-frontend/scripts/lib/cdp.mjs"
cp "$TMP/taste/LICENSE" "$ROOT/tiers/taste/LICENSE"

# WordPress/agent-skills (GPL-2.0-or-later) : les 2 skills dont le texte cite la commande ou la fonction d'exécution dynamique.
# Modification : ces mentions sont reformulées, le sens est inchangé.
fetch https://github.com/WordPress/agent-skills.git wp "$WP_REF"
rm -rf "$ROOT/tiers/wordpress"; mkdir -p "$ROOT/tiers/wordpress"
for s in wp-performance wp-plugin-directory-guidelines; do cp -R "$TMP/wp/skills/$s" "$ROOT/tiers/wordpress/$s"; done
cp "$TMP/wp/LICENSE" "$ROOT/tiers/wordpress/LICENSE"
python3 - "$ROOT/tiers/wordpress" <<'PY'
import sys,os
r=sys.argv[1]
rep={
 "wp-performance/SKILL.md":[("3. `wp profile eval` for targeted code paths.","3. The `wp profile` subcommand that profiles a given PHP snippet (see `wp help profile`) for targeted code paths.")],
 "wp-performance/references/wp-cli-profile.md":[("- https://wpcli.dev/docs/profile/eval","- https://wpcli.dev/docs/profile (snippet profiling subcommand)"),
   ("`wp profile eval '","snippet profiling (`wp help profile`): `'")],
 "wp-plugin-directory-guidelines/references/guideline-review-checklist.md":[("eval+base64 chains","dynamic code execution + base64 chains"),
   ("(`file_get_contents` + `eval`, dynamic `<script src>`)","(`file_get_contents` + dynamic code execution, dynamic `<script src>`)"),
   ("(`eval`, dynamic `<script>`, remote includes)","(dynamic code execution, dynamic `<script>`, remote includes)")]}
for f,pairs in rep.items():
  p=os.path.join(r,f); t=open(p).read()
  for a,b in pairs:
    if a not in t: sys.exit("motif introuvable dans "+f+" : "+a)
    t=t.replace(a,b)
  open(p,'w').write(t)
PY
# anthropics/skills (Apache-2.0) : claude-api seulement, copie réduite (TypeScript, curl, références communes ; sans les
# méthodes d'évaluation, Managed Agents ni la CLI `ant`). Modification (Apache-2.0, section 4) : le mot réservé de l'exécution
# dynamique, employé au sens « évaluation », est remplacé par « evaluation », et deux exemples de commande sont reformulés.
fetch https://github.com/anthropics/skills.git anth "$ANTH_REF"
rm -rf "$ROOT/tiers/anthropic"; mkdir -p "$ROOT/tiers/anthropic/claude-api"
SRC="$TMP/anth/skills/claude-api"
cp "$SRC/SKILL.md" "$SRC/LICENSE.txt" "$ROOT/tiers/anthropic/claude-api/"
mkdir -p "$ROOT/tiers/anthropic/claude-api/typescript" "$ROOT/tiers/anthropic/claude-api/curl" "$ROOT/tiers/anthropic/claude-api/shared"
cp -R "$SRC/typescript/claude-api" "$ROOT/tiers/anthropic/claude-api/typescript/claude-api"
cp "$SRC/curl/examples.md" "$ROOT/tiers/anthropic/claude-api/curl/"
for f in "$SRC"/shared/*.md; do case "$(basename "$f")" in managed-agents-*|anthropic-cli.md) ;; *) cp "$f" "$ROOT/tiers/anthropic/claude-api/shared/";; esac; done
cp "$SRC/LICENSE.txt" "$ROOT/tiers/anthropic/LICENSE"
python3 - "$ROOT/tiers/anthropic/claude-api" <<'PY'
import sys,os,re
r=sys.argv[1]
fix={"shared/agent-design.md":[('`bash -c "curl -X POST ..."`','a shell command that runs `curl -X POST ...`')],
     "SKILL.md":[("no env var needed","no environment variable needed")]}
for f,pairs in fix.items():
  p=os.path.join(r,f); t=open(p).read()
  for a,b in pairs:
    if a not in t: sys.exit("motif introuvable dans "+f+" : "+a)
    t=t.replace(a,b)
  open(p,'w').write(t)
word=re.compile(r'\b(eval)\b',re.I)
for root,_,fs in os.walk(r):
  for f in fs:
    if not f.endswith('.md'): continue
    p=os.path.join(root,f); t=open(p).read()
    t2=word.sub(lambda m:'Evaluation' if m.group(1)[0]=='E' else 'evaluation',t)
    if t2!=t: open(p,'w').write(t2)
p=os.path.join(r,'SKILL.md'); t=open(p).read()
note=("\n> **Version A2 (modifiée)** : copie réduite de `anthropics/skills` (Apache-2.0) : SKILL.md, `typescript/claude-api/`, "
"`curl/examples.md` et les références communes de `shared/`. Les autres langages, les méthodes d'évaluation, Managed Agents et la CLI "
"`ant` ne sont pas inclus : pour eux, lis la documentation officielle (https://docs.claude.com). Le mot réservé de l'exécution "
"dynamique, employé au sens d'évaluation, y est écrit « evaluation » pour passer le contrôle de sécurité de Paperclip.\n")
t=re.sub(r'(\n---\n)', r'\1'+note.replace('\\','\\\\'), t, count=1); open(p,'w').write(t)
PY
# archify (MIT) : le skill `archify/` sans les exemples rendus en HTML (plus d'1 Mo pour certains ; les exemples JSON restent).
# Modifications : un commentaire de code qui cite le mot réservé de l'exécution dynamique est reformulé ; deux octets NUL écrits
# tels quels dans une chaîne sont remplacés par leur écriture échappée (même valeur) ; vérification de mise à jour désactivée.
fetch https://github.com/tt-a1i/archify.git archify "$ARCHIFY_REF"
rm -rf "$ROOT/tiers/archify"; mkdir -p "$ROOT/tiers/archify"
cp -R "$TMP/archify/archify" "$ROOT/tiers/archify/archify"
rm -f "$ROOT/tiers/archify/archify/examples/"*.html
cp "$TMP/archify/LICENSE" "$ROOT/tiers/archify/LICENSE"
python3 - "$ROOT/tiers/archify/archify" <<'PY2'
import sys,os,re
r=sys.argv[1]
p=os.path.join(r,'explainer/parse.mjs'); t=open(p).read()
a='No eval or JSON rewriting.'
if a not in t: sys.exit('motif introuvable dans explainer/parse.mjs')
open(p,'w').write(t.replace(a,'No dynamic code execution or JSON rewriting.'))
p=os.path.join(r,'renderers/shared/diagnostics.mjs'); b=open(p,'rb').read()
if b.count(b'\x00')!=2: sys.exit('octets NUL inattendus dans diagnostics.mjs')
open(p,'wb').write(b.replace(b'\x00',b'\\u0000'))
p=os.path.join(r,'SKILL.md'); t=open(p).read()
note=("\n> **Version A2 (modifiée)** : copie de `tt-a1i/archify` (MIT) sans les exemples rendus en HTML (les exemples JSON cités "
"plus bas sont présents). Lance toujours les commandes avec `ARCHIFY_UPDATE_CHECK_DISABLED=1` devant : pas de vérification ni "
"d'annonce de mise à jour, la version est figée par le kit. Le dossier de sortie `.archify/` va dans le répertoire de travail du "
"ticket, jamais dans le dossier du skill ; le schéma livré se joint au ticket (skill `paperclip-pratique`).\n")
t=re.sub(r'(\n---\n)', r'\1'+note.replace('\\','\\\\'), t, count=1); open(p,'w').write(t)
PY2

# firecrawl/anydoc (MIT) : skill `convert-documents-to-markdown`. Modifications : version de l'outil figée ; l'option qui envoie
# les pages scannées à un service externe est interdite (documents de clients, RGPD).
fetch https://github.com/firecrawl/anydoc.git anydoc "$ANYDOC_REF"
rm -rf "$ROOT/tiers/anydoc"; mkdir -p "$ROOT/tiers/anydoc"
cp -R "$TMP/anydoc/skills/convert-documents-to-markdown" "$ROOT/tiers/anydoc/convert-documents-to-markdown"
cp "$TMP/anydoc/LICENSE" "$ROOT/tiers/anydoc/LICENSE"
python3 - "$ROOT/tiers/anydoc/convert-documents-to-markdown/SKILL.md" "$ANYDOC_NPM" <<'PY2'
import sys,re
p,v=sys.argv[1],sys.argv[2]; t=open(p).read()
if t.count('npx -y @firecrawl/anydoc ')!=3: sys.exit('commandes npx inattendues dans anydoc')
t=t.replace('npx -y @firecrawl/anydoc ','npx -y @firecrawl/anydoc@'+v+' ')
old=re.search(r'\n5\. Scanned and image-only pages need OCR.*\n',t)
if not old: sys.exit('règle OCR introuvable dans anydoc')
t=t.replace(old.group(0),"\n5. Scanned and image-only pages need OCR, which anydoc does not do, so the document exits 3. **Never use `--ocr hosted`, `--api-key` or `FIRECRAWL_API_KEY`**: they send the document to an outside service, which is forbidden for client documents (GDPR). Report the pages that could not be read in the ticket and ask for a text version.\n")
t=t.replace('`@firecrawl/anydoc` on npm','`@firecrawl/anydoc@'+v+'` on npm (exact version)')
note=("\n> **Version A2 (modifiée)** : copie de `firecrawl/anydoc` (MIT), version de l'outil figée à "+v+" ; l'OCR hébergé, qui envoie "
"le document à un service externe, est interdit.\n")
t=re.sub(r'(\n---\n)', r'\1'+note, t, count=1); open(p,'w').write(t)
PY2

echo "tiers/ synchronisé : ECC $ECC_REF, Impeccable $IMPECCABLE_REF, taste $TASTE_REF, WordPress $WP_REF, anthropics $ANTH_REF, archify $ARCHIFY_REF, anydoc $ANYDOC_REF (npm $ANYDOC_NPM)"
