---
name: commits-reference
description: Complete reference for Conventional Commits format used in Cloudstro
---

# Conventional Commits Reference

## Commit Types

| Type | Use Case | Example |
|------|----------|---------|
| `feat` | New feature | `feat(auth): add JWT token refresh` |
| `fix` | Bug fix | `fix(mailing): resolve SMTP timeout` |
| `docs` | Documentation | `docs: update README` |
| `style` | Code formatting (no logic change) | `style: format imports` |
| `refactor` | Code restructuring | `refactor(components): reorganize` |
| `perf` | Performance improvement | `perf(api): optimize queries` |
| `test` | Tests or coverage | `test(auth): add login tests` |
| `chore` | Admin tasks (deps, build) | `chore: update dependencies` |
| `ci` | CI/CD pipeline | `ci: add GitHub Actions` |
| `build` | Build system | `build: update webpack config` |

## Format

### Simple Format
```
<type>(<scope>): <subject>
```

**Example:**
```
feat(auth): add JWT token refresh mechanism
```

### Full Format
```
<type>(<scope>): <subject>

<body>

<footer>
```

**Example:**
```
feat(dashboard): add analytics widget

- Integrate Chart.js for data visualization
- Add real-time updates via WebSocket
- Create reusable AnalyticsWidget component
- Add unit tests for calculations

Closes #42
Related-To: #40
```

## Rules

### Subject
- ✅ Imperative mood: "add", "fix", "refactor" (NOT "added", "fixed")
- ✅ No capital letter at start: `add` not `Add`
- ✅ No period at end
- ✅ Max 50 characters (try to keep under 50)

### Scope
- ✅ Lowercase
- ✅ Relevant to change: `auth`, `mailing`, `dashboard`, `components`
- ❌ Don't be too generic: avoid `misc`, `general`, `stuff`
- 📝 Optional but recommended

### Body
- ✅ Wrap at 72 characters
- ✅ Use bullet points for multiple changes
- ✅ Explain *why* not *what* (what is obvious from code)
- ✅ Reference related issues: `Closes #42`

### Footer
- ✅ Reference issues: `Closes #42`, `Related-To: #40`
- ✅ Breaking changes: `BREAKING CHANGE: description`
- 📝 Only when needed

## Examples by Type

### feat: New Feature
```
feat(auth): add two-factor authentication

- Implement TOTP verification
- Add backup codes generation
- Create 2FA setup wizard

Closes #123
```

### fix: Bug Fix
```
fix(mailing): resolve SMTP connection timeout

Root cause was 30s timeout too short for slow SMTP servers.
Increased to 60s and added retry logic with exponential backoff.

Closes #456
```

### docs: Documentation
```
docs: add Cloudflare Workers deployment guide
```

### refactor: Code Reorganization
```
refactor(components): split Button into compound components

Separates Button, ButtonGroup, and ButtonBar into individual
files for better reusability and testing.
```

### perf: Performance
```
perf(api): memoize expensive calculations

Reduce dashboard load time by 40% through memoization
of analytics calculations.
```

### test: Tests
```
test(auth): add comprehensive login flow tests

Add integration tests covering:
- Email/password login
- Social login (Google, GitHub)
- Error handling
- Session persistence
```

### chore: Maintenance
```
chore: update Astro to 6.1.0

Updates dependencies to latest stable versions:
- astro: 6.0.4 → 6.1.0
- tailwindcss: 4.2.1 → 4.3.0
- wrangler: 4.73.0 → 4.80.0
```

### ci: CI/CD
```
ci: add pre-commit hooks

Install husky and commitlint to validate commits
before they're created.
```

## Breaking Changes

### Mark Breaking Changes
```
feat(auth): replace session tokens with JWT

BREAKING CHANGE: Old session tokens are no longer supported.
Clients must migrate to JWT-based authentication.
```

### In 0.0.x Phase
Breaking changes are allowed (don't require version bump to MAJOR).

### After v1.0.0
Breaking changes require MAJOR version bump.

## Scope Examples

```
auth       ← Authentication and authorization
mailing    ← Email services and templates
dashboard  ← Admin dashboard pages
components ← UI components
api        ← API endpoints and integration
db         ← Database and models
config     ← Configuration files
docs       ← Documentation
ci         ← CI/CD pipeline
deps       ← Dependencies and packages
```

## Anti-Patterns

❌ **Vague commits:**
```
git commit -m "fix: stuff"
git commit -m "feat: changes"
```

❌ **Too long subject:**
```
git commit -m "feat(auth): add functionality that allows users to authenticate with their email and password"
```

❌ **Non-imperative mood:**
```
git commit -m "feat(auth): adds JWT token support"
git commit -m "feat(auth): added login form"
```

❌ **Multiple unrelated changes:**
```
git commit -m "feat: add auth, mailing, and dashboard"
```

## Good Practices

✅ **Atomic commits** - One logical change per commit
```
git commit -m "feat(auth): add login form"
git commit -m "feat(auth): add password validation"
git commit -m "feat(auth): add JWT token generation"
git commit -m "test(auth): add login tests"
```

✅ **Descriptive with body** - When needed
```
git commit -m "fix(mailing): resolve SMTP timeout

Increased timeout from 30s to 60s and added exponential
backoff retry logic for slow SMTP servers."
```

✅ **Reference issues** - When applicable
```
git commit -m "feat(dashboard): add user analytics

Implements charts and metrics requested in issue.

Closes #123"
```

## Tools to Help

### Git Hooks (Pre-commit)
Validate commits before creating them with `husky` and `commitlint`.

### Commitizen (CLI)
Interactive commit prompt:
```bash
pnpm add -D commitizen cz-conventional-changelog
pnpm commitizen init cz-conventional-changelog
npx cz commit
```

### Standard Version
Auto-generate CHANGELOG from commits:
```bash
pnpm add -D standard-version
pnpm standard-version
```

---

**Reference**: https://www.conventionalcommits.org/
