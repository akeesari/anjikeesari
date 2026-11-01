# CLAUDE.md

Personal portfolio and technical blog for anjikeesari.com. Material for MkDocs, Markdown content, deployed to GitHub Pages by GitHub Actions. There is no application code; "not breaking it" means the site builds and links resolve.

Content conventions (article/research/cheat-sheet layout, image and code-block syntax, admonitions) live in @.github/copilot-instructions.md. Follow them.

## Commands

```powershell
python -m pip install -r requirements.txt   # versions are pinned; bump deliberately
python -m mkdocs serve                      # http://127.0.0.1:8000/
python -m mkdocs build --strict             # must pass before every commit; this is what CI runs
```

- On this Windows machine plain `python` is the Store shim; use `py -m ...` or a venv.
- Set `NO_MKDOCS_2_WARNING=1` to silence the Material end-of-life banner.
- Never run `mkdocs gh-deploy` by hand; CI deploys on push to `main`.

## Operating principles

- **No silent assumptions.** If scope, a requirement or an acceptance criterion is ambiguous, ask before proceeding. Never present a guess as settled. In docs, an undecided point is a `TODO:`, not an invented default (the license choice is an example).
- **Stay in scope.** Don't touch unrelated files or do adjacent cleanup nobody asked for. Prefer the smallest change that solves the problem, and add no dependency, plugin or script without a demonstrated need.
- **Work through to the end.** Treat the request as a goal and keep going until it's done and verified, or a real blocker stops you (an action needing the user's go-ahead such as deleting something you didn't create or rewriting published history, information only the user has, or a failure you can't fix). Then state the blocker, what you tried and what's needed. Do what's clearly part of the task, such as fixing a failure you caused or updating affected docs, without asking, and report it.
- **Verify before claiming.** Never say the site builds or a check passes unless a run in this session showed it. Show real command output rather than a summary of it. Run the narrowest check first.

## Workflow rules

- Personal repo: commit directly to `main`, no branches or PRs. A push to `main` deploys the live site, so run `mkdocs build --strict` locally first; if it passes, push without asking. CI repeats it plus gitleaks and a link check (`ci.yml`, `checks.yml`).
- Navigation is hand-curated in `mkdocs.yml`. A new page is invisible until added under `nav:`. Many pages in `docs/` are deliberately unlisted; do not add or delete them without asking.
- Preserve the author's voice when editing prose. Fix errors and structure, don't rewrite style.
- Don't commit large binaries (PDFs, videos) or `.DS_Store`.
- Don't add external scripts to `extra_javascript` without vetting (polyfill.io was removed for supply-chain reasons). Review `docs/overrides/` HTML changes for injected scripts.
- No secrets, tokens or private data in content or config. Use obvious placeholders like `<PAT>`.

## Keeping docs in sync

When behavior, structure or tooling changes, update every affected document in the same task and list them in the reply:

- `README.md` when usage, prerequisites or structure change.
- `.github/copilot-instructions.md`, `mkdocs_setup.md` and `helper.ps1` when dev workflow or CI changes.
- This file when layout, standards or workflow rules change.

## Commits

- One logical change per commit. Stage by path (`git add <paths>`), never `git add -A`, and never commit `.env` or other gitignored files.
- Message: `type: summary` (`feat`, `fix`, `docs`, `chore`, `ci`, ...), imperative, under about 70 characters, with a body when the why isn't obvious.
- Commit directly to `main` once the work is done and `mkdocs build --strict` passes, then push to `main` in the same task without asking. Don't leave finished work unpushed.
- Ask first only for force-pushes or history rewrites, and never push while `mkdocs build --strict` fails or other sessions' uncommitted changes are mixed into the work.

## Working alongside other sessions

Treat uncommitted changes you didn't make as another session's work. Don't revert or overwrite them, build on them when editing the same file, and ask before editing around something that looks unfinished.

## Writing style for docs

Applies to docs, README and commit messages (not to the author's articles, whose voice is preserved): condensed, each thing said once, tables and bullets over prose, current facts rather than edit history.

## Next steps

Anything that follows from the current task is part of the task: build, commit, push, doc sync, fixing what you broke. Do it and report it; never list it as a next step.

End every development response with **Next steps**: 2–4 numbered suggestions for *separate, future* work, grounded in a real remaining gap (see Known gaps). Mark one **(Recommended)** and list it first. They are recommendations, not approval requests for finishing this task. If there is nothing worth suggesting, say so in one line.

## Known gaps

- No LICENSE file yet; copyright wording differs between README and footer.
- `.github/copilot-instructions.md` is partly stale (it still lists glightbox/pdf plugins in requirements and describes the old CI).
- `docs/overrides/` contains an 8 MB book PDF that doesn't belong there.
- Material for MkDocs reaches end of life on 2027-05-05; a Zensical migration will be needed eventually.
