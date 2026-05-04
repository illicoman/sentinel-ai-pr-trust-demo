# Capture Screenshots

The screenshots should make the demo understandable without a call.

## Screenshot Set

### 1. PR 1 Sentinel Comment

Capture the Sentinel comment for:

```txt
AI change modifies production deploy workflow
```

Frame:

- PR title;
- changed file `.github/workflows/deploy.yml` if visible;
- Sentinel comment.

Caption:

```txt
An AI PR changed the production deploy workflow. Sentinel surfaced the protected deployment surface and the release-owner next action.
```

### 2. PR 2 Scope Drift

Capture the Sentinel comment for:

```txt
AI invoice UI fix touches authorization rules
```

Frame:

- PR title showing invoice UI task;
- Sentinel protected surface section;
- scope drift reason if present.

Caption:

```txt
The requested task was invoice copy, but the PR also touched authorization rules. Sentinel makes that review question visible.
```

### 3. PR 5 Clear

Capture the Sentinel comment for:

```txt
AI updates invoice copy only
```

Frame:

- PR title;
- Sentinel `clear` decision.

Caption:

```txt
Normal PRs stay quiet: no protected surface was touched.
```

### 4. GitHub Actions Step Summary

Capture the Action run summary.

Frame:

- workflow name;
- job result;
- Sentinel step summary.

Caption:

```txt
Sentinel also writes a structured Action summary and a JSON artifact for audit-friendly demos.
```

### 5. Repository README

Capture the repository README first viewport.

Frame:

- repository name;
- headline;
- first Sentinel comment example.

Caption:

```txt
Know when AI pull requests touch sensitive files.
```

## Screenshot Rules

- Hide browser bookmarks and personal accounts.
- Do not show token values or repository secrets.
- Do not show private ADP URLs.
- Do not include customer names.
- Do not imply Sentinel blocked the PR.
- Do not imply Sentinel read file contents.

## Landing Copy Snippets

Short headline:

```txt
Know when AI pull requests touch sensitive files.
```

Subheadline:

```txt
Sentinel adds an advisory Change Passport to PRs: protected surface, evidence state, reviewer and next action.
```

Boundary:

```txt
Advisory demo. No file content reading, no blocking check by default.
```
