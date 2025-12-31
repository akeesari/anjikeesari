# AI Agent Instructions for Anji Keesari Personal Website

## Project Overview

This is a **static documentation website** built with **Material for MkDocs** (Python-based static site generator). The site serves as a personal portfolio, technical blog, and learning resource hub covering Azure Cloud, Kubernetes, DevOps, .NET, React, and AI engineering topics.

**Key Technologies**: MkDocs Material theme, Python 3.14+, GitHub Actions, Markdown

**Live URLs**:
- Primary: https://anjikeesari.com/
- GitHub Pages: https://akeesari.github.io/anjikeesari/
- Local dev: http://127.0.0.1:8000/anjikeesari/

## Architecture & Content Organization

### Content Structure Pattern
```
docs/
├── articles/          # Technical blog posts (date-prefixed: YYYYMMDD.#-topic.md)
├── research/          # Research papers & academic publications
│   └── publications/  # Long-form research papers (subdirectory per paper)
├── developertools/    # Developer guides, cheat sheets, AI engineering
├── resources/         # Books, presentations, video tutorials
├── about/            # Personal profile and accomplishments
├── personal/          # Personal content (recipes, travel)
├── overrides/        # Custom HTML templates (404, home, main)
└── stylesheets/      # Custom CSS (extra.css)
```

**Content Type Conventions**:
- **Articles**: Use format `YYYYMMDD.#-descriptive-name.md` for dated articles (e.g., `20251113.1-aks-workload-identity.md`). Template available at `articles/1-article-template.txt`.
- **Research Papers**: Create subdirectory under `research/publications/` with `index.md` for long-form academic content (e.g., `research/publications/ai-agent-microservices-integration/index.md`).

**Navigation**: All site navigation is centrally controlled in `mkdocs.yml` under the `nav:` section. New content must be manually added here to appear in the site menu.

**Navigation Structure** (from mkdocs.yml):
- `Home` - Landing page (index.md)
- `About` - Personal bio and accomplishments
- `Research` - Academic publications (subdirectory-based papers)
- `Awards` - Professional achievements
- `Articles` - Technical blog posts (date-prefixed articles)
- `Tools` - Developer resources, cheat sheets, AI engineering guides
- `Resources` - Books, presentations, curated learning content
- `Tech Stack` - Technology-specific reference pages
- `Personal` - Non-technical content (recipes, travel)

## Critical Developer Workflows

### Local Development Setup
```powershell
# Windows - Install Python dependencies
python -m pip install -r requirements.txt

# macOS - Install Python dependencies
pip3 install -r requirements.txt

# Windows - Start local development server
python -m mkdocs serve

# macOS - Start local development server
mkdocs serve

# Access at http://127.0.0.1:8000/anjikeesari/

# If port 8000 is in use (macOS/Linux):
sudo lsof -i :8000
kill -9 <PID>

# If port 8000 is in use (Windows PowerShell):
Get-Process -Id (Get-NetTCPConnection -LocalPort 8000).OwningProcess | Stop-Process -Force
```

**Important for Windows**: 
- Use `python -m pip` and `python -m mkdocs` commands (not direct `pip` or `mkdocs`)
- Python Scripts folder may not be in PATH by default
- Ensure "Add Python to PATH" is checked during Python installation
- Quick reference commands available in `helper.ps1` at project root

### Build & Deployment
- **CI/CD**: GitHub Actions workflow at `.github/workflows/ci.yml` automatically deploys to GitHub Pages on push to `main`
- **Build command**: 
  - Windows: `python -m mkdocs gh-deploy --force`
  - macOS: `mkdocs gh-deploy --force`
- **No manual build required** - push to main triggers automatic deployment

## Content Creation Patterns

### Adding New Articles
1. Create markdown file in `docs/articles/` with date prefix (e.g., `20251215.1-new-topic.md`)
2. Add entry to `mkdocs.yml` under `nav: → Articles:` section
3. Include frontmatter and standard structure (see `articles/1-article-template.txt`)
4. Images go in `docs/articles/images/<topic-folder>/`

**Article Structure Template** (from `1-article-template.txt`):
- Introduction - Overview of the topic and problem statement
- Technical Scenario - Real-world context and use cases
- Objective - Clear list of goals and learning outcomes
- Prerequisites - Required setup and knowledge
- Key Concepts (optional) - Fundamental concepts explained with examples
- Implementation Details - Step-by-step instructions
- Conclusion - Summary and next steps
- Reference - External links and resources

### Adding New Research Papers
Research papers are long-form, academic-style publications stored separately from articles:

1. Create subdirectory under `docs/research/publications/<paper-slug>/`
2. Create `index.md` in the subdirectory for the paper content
3. Images and supplementary files go in same subdirectory or nested folders
4. Add navigation entry in `mkdocs.yml` under `Research: → Publications:`
5. Optional: Use frontmatter to hide navigation with `hide: - navigation` for cleaner long-form reading

**Example**: `docs/research/publications/ai-agent-microservices-integration/index.md`

**Structure**: Research papers typically include abstract, sections, subsections, references, and extensive code examples

### Code Block Formatting
Material for MkDocs uses PyMdown Extensions for enhanced code blocks:

```markdown
# With line numbers
``` py linenums="1"
def example():
    pass
```

# With title
``` py title="script.py"
code here
```

# Supported languages: python, c#, tf (Terraform), bash, yaml, powershell, javascript, json
```

### Admonitions (Callout Boxes)
Use admonitions for notes, warnings, and tips:

```markdown
!!! note
    This is a note callout

!!! warning
    This is a warning callout

!!! tip
    This is a tip callout
```

### Cheat Sheets Pattern
Location: `docs/developertools/cheatsheets/`
Format: `<tool>-cheat-sheet.md` (e.g., `kubectl-cheat-sheet.md`, `docker-cheat-sheet.md`)
Each must be registered in `mkdocs.yml` navigation under `Tools → Cheat Sheets`

## MkDocs Configuration Essentials

### Theme Customization (`mkdocs.yml`)
- **Logo**: `theme.logo` points to `assets/images/ak-logo.png`
- **Favicon**: `theme.favicon` for browser tab icon
- **Custom overrides**: `theme.custom_dir: docs/overrides` for HTML template customization
- **Color scheme**: Light/dark mode toggle enabled via `palette` configuration
- **Navigation features**: Tabs, sections, footer, instant loading, search all enabled

### Markdown Extensions
Critical extensions enabled:
- `pymdownx.highlight` + `pymdownx.snippets` for code blocks
- `admonition` + `pymdownx.details` for callout boxes
- `pymdownx.superfences` with mermaid support for diagrams
- `attr_list` + `md_in_html` for image styling
- `tables`, `footnotes`, `abbr` for rich content

### Image Styling Pattern
```markdown
[![alt text](images/folder/image.png){:style="border: 1px solid black; border-radius: 10px;"}](images/folder/image.png){:target="_blank"}
```
This pattern adds border styling and enables lightbox viewing.

## Project-Specific Conventions

1. **No automated table of contents generation** - Navigation is manually curated in `mkdocs.yml`
2. **PowerShell scripts** (`.ps1` files) are used for content templates and examples (see `terraform/`, `developertools/`)
3. **Custom 404 and home pages** in `docs/overrides/` - don't modify generated HTML directly
4. **Google Analytics** integrated via `extra.analytics` in mkdocs.yml (property: G-LJDPP0N88G)
5. **Social links** configured in `extra.social` - update there for footer changes
6. **Helper script** - `helper.ps1` at project root contains quick-reference commands for common tasks
7. **Dependencies** - Only 4 required packages in `requirements.txt`: mkdocs-material, mkdocs-glightbox, mkdocs-pdf-export-plugin, mkpdfs-mkdocs

## Common Tasks

**Add new cheat sheet**:
1. Create `docs/developertools/cheatsheets/<tool>-cheat-sheet.md`
2. Add to `mkdocs.yml` nav under `Tools → Cheat Sheets`

**Add new article**:
1. Create `docs/articles/YYYYMMDD.#-topic.md`
2. Create image folder `docs/articles/images/<topic>/` if needed
3. Add navigation entry in `mkdocs.yml` under `Articles:`
4. Use article template structure from `articles/1-article-template.txt`

**Add new research paper**:
1. Create `docs/research/publications/<paper-slug>/index.md`
2. Add subdirectory for images/supplementary files if needed
3. Add navigation entry in `mkdocs.yml` under `Research: → Publications:`
4. Consider using `hide: - navigation` in frontmatter for long-form content

**Modify site theme/colors**:
- Edit `mkdocs.yml` theme section for structural changes
- Edit `docs/stylesheets/extra.css` for CSS overrides

**Test before deployment**:
- Windows: Run `python -m mkdocs serve` locally
- macOS: Run `mkdocs serve` locally
- Verify navigation, formatting, and links before pushing to main
- Access site at http://127.0.0.1:8000/anjikeesari/

## Repository Metadata
- **Owner**: akeesari
- **Repo**: anjikeesari  
- **Live Site**: https://akeesari.github.io/anjikeesari/
- **Primary Branch**: main
