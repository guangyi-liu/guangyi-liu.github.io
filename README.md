# jemdoc Website Starter

This is a minimal starter to build a personal site with **jemdoc** and host it on **GitHub Pages**.

## Quick Start (local build → push to Pages)
1. Create a repo named **`<your-username>.github.io`** on GitHub (user site).
2. Clone **this folder** into that repo (or copy its contents there).
3. Install Python 3.
4. Get jemdoc:
   - Simple: `git clone https://github.com/wsshin/jemdoc_mathjax.git vendor/jemdoc` (MathJax-enabled fork), or
   - Vanilla: `git clone https://github.com/jem/jemdoc.git vendor/jemdoc`
5. Build locally:
   ```bash
   # from repo root
   export JEMDOC=vendor/jemdoc/jemdoc.py   # path to jemdoc.py
   make
   ```
   This generates `index.html` (and others) at the repo root.
6. Commit and push to GitHub:
   ```bash
   git add .
   git commit -m "Initial jemdoc site"
   git push origin main
   ```
7. Visit `https://<your-username>.github.io` after the push finishes.

> GitHub Pages serves the **root** of the `main` branch for user sites. We include `.nojekyll` so Jekyll doesn’t interfere with static output.

## Adding pages
- Create another `*.jemdoc` under `src/` (e.g., `projects.jemdoc`).
- Add the page name (without extension) to the `PAGES` list in the `Makefile`.
- Run `make` again and commit/push.

## MathJax (LaTeX) support
If you cloned the MathJax fork above (`wsshin/jemdoc_mathjax`), MathJax will be injected automatically in the HTML. If you used vanilla jemdoc, you won’t get MathJax without customizing templates. The included config is compatible with the MathJax fork out of the box.

## Project Pages (optional alternative)
If you prefer a **project** site instead of a **user** site:
- Use any repo name, then in GitHub → Settings → Pages, set:
  - **Source:** `Deploy from a branch`
  - **Branch:** `main` and **folder:** `/root`
- The rest stays the same.

## GitHub Actions (optional CI build)
This starter ships a workflow `.github/workflows/deploy.yml` that builds the HTML on every push to `main`. It **does not** publish to a second branch; it just builds so you can catch build errors. GitHub Pages still serves the built files you commit to root.

If you want a separate `gh-pages` branch deployment, replace this workflow with a publish action like `peaceiris/actions-gh-pages` and output to that branch.

## Common gotchas
- **“File not found”** on your Pages URL: ensure an `index.html` exists at the repo root (user site) and `.nojekyll` is present.
- **Wrong output path**: the `Makefile` writes HTML to the **repo root**, not `public/`. If you change `OUT`, create the folder first or GitHub Pages won’t see files.
- **Math not rendering**: confirm you used the MathJax fork and that `JEMDOC` points to `vendor/jemdoc/jemdoc.py` from that fork.

