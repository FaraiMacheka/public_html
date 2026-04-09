# HHI Public Site

This repository contains the static web properties served from `G:\public_html`, including the main HHI site and related location or event microsites.

## Structure

- `index.html`, `home.html`, `about.html`, `contact.html`, and related root pages power the main public site.
- `css/`, `js/`, `img/`, `video/`, and `lib/` contain shared assets.
- `conference.hhi.org.za/`, `employeePortal/`, `maboneng/`, `randburg/`, `tshwane/`, `coming/`, and other folders contain standalone sections or microsites.

## Working In This Repo

1. Keep changes scoped to the site or microsite you are updating.
2. Reuse shared assets where that keeps branding consistent.
3. Verify local asset paths after renaming or moving files.
4. Include screenshots for visible UI changes in pull requests.

## Git Workflow

This repository uses a three-tier branch model:

- `main` or `master` for the protected production branch
- `develop` as the integration branch
- `feature/*` for day-to-day implementation work

Daily workflow:

1. Pull the latest `develop`
2. Create a focused `feature/*` branch from `develop`
3. Commit often with clear messages that explain why the change was made
4. Push the feature branch
5. Open a pull request with `develop` as the base branch
6. Address review feedback on the same feature branch
7. Merge into `develop` after approval and passing checks
8. Delete the feature branch after merge

Rules:

- Never push directly to `main`, `master`, or `develop`
- Keep pull requests small and focused
- Include manual test notes and screenshots for visible UI changes

## Contact

For site ownership, content questions, or responsible disclosure, use `info@hhi.org.za`.
