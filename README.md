# Anji Keesari — Personal Website

[![CI](https://github.com/akeesari/anjikeesari/actions/workflows/ci.yml/badge.svg)](https://github.com/akeesari/anjikeesari/actions/workflows/ci.yml)
[![Checks](https://github.com/akeesari/anjikeesari/actions/workflows/checks.yml/badge.svg)](https://github.com/akeesari/anjikeesari/actions/workflows/checks.yml)
[![MkDocs Material](https://img.shields.io/badge/MkDocs-Material-526CFE?style=flat&logo=materialformkdocs&logoColor=white)](https://squidfunk.github.io/mkdocs-material/)
[![Website](https://img.shields.io/badge/Website-anjikeesari.com-blue)](https://anjikeesari.com/)

Source for [anjikeesari.com](https://anjikeesari.com): a portfolio and technical blog on Azure, Kubernetes, DevOps and software architecture. Built with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) from Markdown and deployed to GitHub Pages by GitHub Actions.

## About the author

**Anji Keesari** is a Cloud Architect with 20+ years of experience in software architecture, full-stack development and Microsoft Azure.

- **Focus**: Azure · Kubernetes · Microservices · Terraform · .NET · DevOps · AI Engineering
- **Books**:
  - *Building Microservices with Containers: A Practical Guide*
  - *Building Scalable Kubernetes Infrastructure for Microservices*

## Run locally

Prerequisite: Python 3.12 (matches CI).

```powershell
python -m pip install -r requirements.txt   # versions are pinned
python -m mkdocs serve                      # http://127.0.0.1:8000/
python -m mkdocs build --strict             # same build CI runs
```

On Windows, plain `python` may be the Store shim; use `py -m ...` or a virtual environment. Setup details are in [mkdocs_setup.md](mkdocs_setup.md) and command shortcuts in [helper.ps1](helper.ps1).

## Repository layout

| Path | Purpose |
|------|---------|
| `docs/` | All site content (Markdown, images, stylesheets, scripts) |
| `docs/overrides/` | Material theme template overrides |
| `mkdocs.yml` | Site config and hand-curated navigation |
| `requirements.txt` | Pinned Python dependencies |
| `CNAME` | Custom domain for GitHub Pages |
| `.github/workflows/` | CI (`ci.yml`) and scheduled checks (`checks.yml`) |
| `.github/copilot-instructions.md` | Content conventions (article layout, images, admonitions) |

A new page does not appear on the site until it is added under `nav:` in `mkdocs.yml`.

## CI and deployment

| Workflow | Trigger | What it does |
|----------|---------|--------------|
| `ci.yml` | Push to `main`, pull requests | `mkdocs build --strict`; deploys to GitHub Pages on `main` |
| `checks.yml` | Push to `main`, pull requests, weekly (Monday 06:00 UTC), manual | gitleaks secret scan on push and PRs; link check weekly and on demand only |

Every push to `main` deploys the live site, so run `python -m mkdocs build --strict` locally first. Do not run `mkdocs gh-deploy` by hand.

## Connect

- LinkedIn: [linkedin.com/in/anjikeesari](https://www.linkedin.com/in/anjikeesari)
- Medium: [medium.com/@anjkeesari](https://medium.com/@anjkeesari)
- GitHub: [github.com/akeesari](https://github.com/akeesari)

---

*© 2026 Anji Keesari. All rights reserved.*
