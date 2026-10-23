---
name: convert-documents-to-markdown
description: Convert Word (.doc, .docx), PowerPoint (.ppt, .pptx), Excel (.xls, .xlsx), OpenDocument (.odt, .ods, .odp), RTF, EPUB, CSV, and PDF files to GitHub-Flavored Markdown. Use when a task needs the contents of an office document, spreadsheet, presentation, ebook, or PDF you cannot read directly.
license: MIT
metadata:
  author: firecrawl
---

> **Version A2 (modifiée)** : copie de `firecrawl/anydoc` (MIT), version de l'outil figée à 0.2.4 ; l'OCR hébergé, qui envoie le document à un service externe, est interdit.

# Convert documents to Markdown

Run the anydoc CLI. It needs Node 20+ and no install:

```bash
npx -y @firecrawl/anydoc@0.2.4 <file>              # Markdown to stdout
npx -y @firecrawl/anydoc@0.2.4 <file> -o out.md    # write to a file
npx -y @firecrawl/anydoc@0.2.4 - --format csv < f  # read stdin
```

Rules:

1. Supported inputs: `.doc`, `.docx`, `.docm`, `.odt`, `.rtf`, `.epub`, `.pdf`, `.ppt`, `.pps`, `.pot`, `.pptx`, `.pptm`, `.ppsx`, `.ppsm`, `.odp`, `.xls`, `.xlsx`, `.xlsm`, `.xlsb`, `.ods`, `.csv`.
2. The format is detected from the file content. Pass `--format <name>` only when detection cannot work: CSV from stdin, or a missing or wrong extension.
3. Exit codes: 0 success, 1 the document could not be converted, 2 usage error, 3 pages of a PDF need OCR. Failures print one `anydoc: <message>` line to stderr. The CLI never prompts.
4. For a large document, write to a file with `-o` and read the parts you need instead of streaming everything into context.
5. Scanned and image-only pages need OCR, which anydoc does not do, so the document exits 3. **Never use `--ocr hosted`, `--api-key` or `FIRECRAWL_API_KEY`**: they send the document to an outside service, which is forbidden for client documents (GDPR). Report the pages that could not be read in the ticket and ask for a text version.
6. Inside a Node, Python, or Rust codebase, prefer the library over shelling out: `@firecrawl/anydoc@0.2.4` on npm (exact version), `firecrawl-anydoc` on PyPI, `anydoc` on crates.io. Each exposes the same `to_markdown` / `toMarkdown` API.
