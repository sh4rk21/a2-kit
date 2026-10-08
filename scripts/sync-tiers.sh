#!/usr/bin/env bash
# Copie dans tiers/ les skills externes que Paperclip ne peut pas importer depuis leur repo d'origine
# (ECC : plus de 1 000 skills à analyser ; Impeccable : fichier de plus d'1 Mo et moteur binaire).
# Usage : scripts/sync-tiers.sh [ref-ECC] [ref-Impeccable]   (par défaut : les versions figées ci-dessous)
set -euo pipefail

ECC_REF="${1:-ef648e01899ba3e8dc6371642deaaf64b4477775}"
IMPECCABLE_REF="${2:-778c8a7b71ccd5bfe3ca6ac68c15d9d872d0f87d}"
ECC_SKILLS=(database-migrations postgres-patterns prisma-patterns api-design backend-patterns error-handling coding-standards
  git-workflow docker-patterns frontend-patterns react-patterns react-testing nextjs-turbopack e2e-testing browser-qa canary-watch
  click-path-audit benchmark documentation-lookup production-audit codebase-onboarding architecture-decision-records
  intent-driven-development council product-lens make-interfaces-feel-better motion-foundations motion-patterns frontend-a11y
  brand-voice article-writing market-research competitive-platform-analysis frontend-slides)

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
echo "tiers/ synchronisé : ECC $ECC_REF, Impeccable $IMPECCABLE_REF"
