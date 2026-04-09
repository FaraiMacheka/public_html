# Contributing

## Branch Strategy

- Start from `develop`
- Create short, descriptive `feature/*` branches
- Keep each branch focused on one feature or fix
- Do not push directly to `main`, `master`, or `develop`

## Daily Workflow

1. `git checkout develop`
2. `git pull origin develop`
3. `git checkout -b feature/my-feature`
4. Make your change and commit with a clear message that explains why
5. `git push origin feature/my-feature`
6. Open a pull request with `develop` as the base branch
7. Address review feedback on the same branch
8. Delete the feature branch after merge

## Pull Requests

- Explain what changed and why.
- Use `develop` as the base branch.
- List the pages or folders affected.
- Include manual verification notes.
- Attach before and after screenshots for visible UI changes.

## Content and Frontend Changes

- Preserve existing URLs unless the change is intentional.
- Keep asset paths relative and valid for static hosting.
- Prefer small edits over broad reformatting of legacy pages.

## Before Opening A PR

1. Review the changed pages in a browser.
2. Confirm that local links, images, stylesheets, and scripts still resolve.
3. Confirm contact details, dates, and event copy when editing public content.

## Commit Messages

- Keep messages short and specific
- Explain why the change exists, not only what files changed
