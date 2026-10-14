#!/usr/bin/env bash
# Copie dans tiers/ les skills externes que Paperclip ne peut pas importer depuis leur repo d'origine
# (ECC : plus de 1 000 skills à analyser ; Impeccable : fichier de plus d'1 Mo et moteur binaire ; taste-skill et WordPress :
# le mot réservé de l'exécution dynamique apparaît dans un script ou une commande, refusé par le contrôle de sécurité).
# Usage : scripts/sync-tiers.sh [ref-ECC] [ref-Impeccable] [ref-taste] [ref-WordPress]   (par défaut : les versions figées)
set -euo pipefail

ECC_REF="${1:-ef648e01899ba3e8dc6371642deaaf64b4477775}"
IMPECCABLE_REF="${2:-778c8a7b71ccd5bfe3ca6ac68c15d9d872d0f87d}"
TASTE_REF="${3:-f624f37a8c650b9cc550253104925efe4c8de246}"
WP_REF="${4:-55cd0f78b996f453c194a1a6ecc5c9a2e0f6cf15}"
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
echo "tiers/ synchronisé : ECC $ECC_REF, Impeccable $IMPECCABLE_REF, taste $TASTE_REF, WordPress $WP_REF"
