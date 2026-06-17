# Copilot Instructions — Anji Keesari Personal Website

## Project

Static portfolio and technical blog built with **Material for MkDocs**, deployed to GitHub Pages via GitHub Actions.

| | |
|---|---|
| **Stack** | MkDocs Material, Python 3.x, GitHub Actions, Markdown |
| **Live site** | https://anjikeesari.com/ |
| **GitHub Pages** | https://akeesari.github.io/anjikeesari/ |
| **Local dev** | http://127.0.0.1:8000/anjikeesari/ |
| **Repo** | `akeesari/anjikeesari` · branch `main` → deploys to `gh-pages` |

## Directory Layout

```
docs/
├── articles/                        # Blog posts — YYYYMMDD.#-topic.md
├── research/publications/<slug>/    # Long-form papers — index.md per paper
├── developertools/                  # Cheat sheets, AI guides, tools
├── resources/                       # Books, presentations
├── about/                           # Bio, accomplishments
├── personal/                        # Recipes, travel
├── overrides/                       # Custom HTML (404, home, main) — edit with care
└── stylesheets/extra.css            # CSS overrides
```

## Dev Workflow

```powershell
# Install dependencies
python -m pip install -r requirements.txt

# Start local server
python -m mkdocs serve
# → http://127.0.0.1:8000/anjikeesari/

# If port 8000 is busy (Windows)
Get-Process -Id (Get-NetTCPConnection -LocalPort 8000).OwningProcess | Stop-Process -Force

# Manual deploy (CI handles this automatically — rarely needed)
python -m mkdocs gh-deploy --force
```

> On Windows use `python -m pip` / `python -m mkdocs` if `pip`/`mkdocs` are not on PATH.  
> macOS equivalent: `pip3` / `mkdocs` directly.  
> Quick-reference commands: `helper.ps1` at project root.

**CI/CD**: `.github/workflows/ci.yml` runs `mkdocs gh-deploy --force` on every push to `main`. No manual deploy needed.

## Content Patterns

### Navigation rule
All navigation is **manually curated** in `mkdocs.yml` under `nav:`. A new file is invisible on the site until added there.

### Articles
```
docs/articles/YYYYMMDD.#-topic.md          # e.g. 20251215.1-new-topic.md
docs/articles/images/<topic>/              # images for that article
```
- Register under `nav: → Articles:` in `mkdocs.yml`
- Follow structure in `docs/articles/1-article-template.txt`:  
  Introduction → Technical Scenario → Objective → Prerequisites → Key Concepts → Implementation → Conclusion → Reference

### Research Papers
```
docs/research/publications/<slug>/index.md
docs/research/publications/<slug>/images/
```
- Register under `nav: → Research: → Publications:`
- Use frontmatter `hide: [navigation]` for distraction-free long-form reading

### Cheat Sheets
```
docs/developertools/cheatsheets/<tool>-cheat-sheet.md
```
- Register under `nav: → Tools: → Cheat Sheets:`

## Markdown Reference

**Images** — border + lightbox:
```markdown
[![alt](images/folder/img.png){:style="border: 1px solid black; border-radius: 10px;"}](images/folder/img.png){:target="_blank"}
```

**Code blocks** — always specify a language:
````markdown
``` py linenums="1" title="example.py"
def hello():
    pass
```
````
Supported: `py`, `c#`, `tf`, `bash`, `yaml`, `powershell`, `javascript`, `json`

**Admonitions**:
```markdown
!!! note "Optional title"
    Content here.
```
Types: `note` `tip` `warning` `info` `danger` `success`

**Mermaid diagrams**: enabled via `pymdownx.superfences` — use ` ```mermaid ` fenced blocks.

## Key Files

| File | Purpose |
|------|---------|
| `mkdocs.yml` | Main config — theme, nav, plugins, extensions, analytics |
| `requirements.txt` | Python deps (mkdocs-material, mkdocs-glightbox, pdf plugins) |
| `.github/workflows/ci.yml` | CI/CD — deploys on push to main |
| `helper.ps1` | Quick-reference dev commands |
| `docs/stylesheets/extra.css` | Custom CSS |
| `docs/overrides/` | Custom HTML templates (404, home, main) |

## Review Checklist

When reviewing or generating changes:

- [ ] `mkdocs.yml` YAML is valid; every `nav:` entry maps to a real file
- [ ] New files are registered in `nav:`
- [ ] No broken internal links or missing images
- [ ] Images have descriptive alt text
- [ ] Code blocks specify a language
- [ ] Headings are hierarchical — don't skip levels (h1 → h2 → h3)
- [ ] Writing is clear and professional; preserve the author's voice
- [ ] No secrets, tokens, API keys, or private data in content or config
- [ ] No untrusted external scripts in `extra_javascript` (see Security)
- [ ] `mkdocs build --strict` passes without warnings

## Security

- **Never add unvetted CDN scripts** to `extra_javascript` in `mkdocs.yml`.  
  `polyfill.io` was a supply-chain attack vector — it was in this project and has been removed (June 2026). MathJax 3 works without it.
- Vet all external JS/CSS sources before adding.
- Do not commit API keys, analytics property IDs, or tokens in content.
- Review `docs/overrides/` HTML carefully when modifying templates — check for injected scripts.
