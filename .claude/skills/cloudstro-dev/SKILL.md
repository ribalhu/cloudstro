---
name: cloudstro-dev
description: Development workflow and contribution guidelines for Cloudstro framework. Use when making commits, versioning releases, or setting up development tasks for the admin dashboard framework.
version: 0.1.0
---

# Cloudstro Development Skill

Professional development workflow for Cloudstro, an Astro-based admin dashboard framework for Cloudflare Workers.

## Quick Reference

**Current Version**: v0.0.1 (Pre-Alpha)
**Repository**: https://github.com/ribalhu/cloudstro
**Maintainer**: Ricardo Ballesteros

---

## 1. Commits & Conventional Format

### Commit Types

```
feat(scope):   Nueva funcionalidad
fix(scope):    Corrección de bug
docs:          Cambios en documentación
style:         Formato de código
refactor:      Reorganización de código
perf:          Mejoras de rendimiento
test:          Tests y cobertura
chore:         Tareas administrativas
ci:            Cambios en CI/CD
build:         Sistema de build
```

### Commit Examples

```bash
# Funcionalidad nueva
git commit -m "feat(auth): add JWT token refresh mechanism"

# Bug fix
git commit -m "fix(mailing): resolve SMTP timeout with 30s retry"

# Documentación
git commit -m "docs: add deployment guide for Cloudflare Workers"

# Refactor
git commit -m "refactor(components): reorganize button component structure"

# Con descripción completa
git commit -m "feat(dashboard): add analytics widget

- Integrate Chart.js for visualization
- Add real-time WebSocket updates
- Create reusable AnalyticsWidget component

Closes #42"
```

### Rules

✅ Scope en minúsculas: `auth`, `mailing`, `dashboard`
✅ Mensaje imperativo: "add", "fix", "refactor"
✅ Commits pequeños y atómicos
✅ Máximo 72 caracteres en línea principal
✅ Include `Closes #XX` si corresponde a issue

**See [DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md#conventional-commits) for full reference.**

---

## 2. Semantic Versioning

### Current Status

```
Version: 0.0.1 (Pre-Alpha)

0.0.x  → Development phase (current)
0.1.0  → Alpha (auth + mailing ready)
0.2.0  → Beta (dashboard complete)
1.0.0  → Production stable
```

### How to Version

When you complete a feature or group of fixes, bump the version:

```bash
# Bug fixes: 0.0.1 → 0.0.2
pnpm version:patch

# New features: 0.0.1 → 0.1.0
pnpm version:minor

# Breaking changes: 0.0.1 → 1.0.0 (after v1.0.0)
pnpm version:major
```

This automatically:
- Updates `package.json` with new version
- Creates commit: `chore(release): bump version to X.Y.Z`
- Creates git tag: `vX.Y.Z`
- Ready for: `git push origin master --tags`

### Update CHANGELOG

After bumping version, update `CHANGELOG.md`:

```markdown
## [0.1.0] - 2026-04-15

### Added
- JWT authentication system
- Email template builder
- User dashboard

### Fixed
- SMTP timeout issues

### Changed
- Updated Astro to v6.1.0

[0.1.0]: https://github.com/ribalhu/cloudstro/compare/v0.0.1...v0.1.0
```

**See [VERSIONING.md](../../VERSIONING.md) for complete guide and [VERSIONING-QUICK-START.md](../../VERSIONING-QUICK-START.md) for quick reference.**

---

## 3. Development Workflow

### Setup

```bash
git clone https://github.com/ribalhu/cloudstro.git
cd cloudstro
pnpm install
pnpm dev
```

### Available Scripts

```bash
pnpm dev              # Start dev server (localhost:4321)
pnpm build            # Build for production
pnpm preview          # Preview production build
pnpm generate-types   # Generate Cloudflare types
pnpm test             # Run tests (future)
```

### Project Structure

```
src/
├── components/       # Reusable UI components
├── layouts/          # Page layouts
├── pages/            # Routes (auto in Astro)
├── styles/           # Global styles + Tailwind
└── assets/           # Images, icons
```

**See [README.md](../../README.md#project-structure) for details.**

---

## 4. Code Style Standards

### TypeScript

- Strict mode enabled
- Explicit typing on public functions
- Avoid `any` when possible

### Astro Components

- Use `.astro` for server components
- PascalCase names: `LoginForm.astro`, `DashboardWidget.astro`
- Export types separately when needed

### Tailwind CSS

- Logical order: layout → spacing → colors → typography
- Create reusable components instead of custom CSS
- Prefer Tailwind utilities over custom styles

### Naming

```
Components:    LoginForm.astro, UserCard.astro
Functions:     calculateTotal(), formatDate()
Constants:     MAX_RETRIES, DEFAULT_TIMEOUT
Folders:       lowercase, src/components/
```

**See [DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md#code-style) for full standards.**

---

## 5. Testing Requirements

### Required For

- Utility functions
- Authentication logic
- External API integrations
- Bug fixes (include test reproducing bug)

### Optional For

- Simple UI components
- Documentation changes
- Refactoring without logic changes

### Run Tests

```bash
pnpm test
pnpm test:watch
pnpm test:coverage
```

**See [DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md#testing) for details.**

---

## 6. Pull Request Workflow

### Before Opening PR

- [ ] Tests pass: `pnpm test`
- [ ] Build succeeds: `pnpm build`
- [ ] Commits follow Conventional Commits
- [ ] CHANGELOG.md updated
- [ ] Code reviewed locally

### PR Description Template

```markdown
## Summary
Brief description of changes

## Changes
- Change 1
- Change 2
- Change 3

## Testing
How to test:
1. ...
2. ...

## Related Issues
Closes #42
```

**See [DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md#pull-request-guidelines) for full guidelines.**

---

## 7. Breaking Changes Policy

### During 0.0.x (Current Phase)

Breaking changes are allowed but must be marked in commit footer:

```bash
git commit -m "refactor(auth): replace session tokens with JWT

BREAKING CHANGE: Old session tokens no longer accepted.
Migrate clients to JWT authentication."
```

### After v1.0.0

Breaking changes require MAJOR version bump:
```bash
pnpm version:major  # v1.0.0 → v2.0.0
```

---

## 8. Resources & References

### Documentation Files

- **[DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md)** - Full development standards
- **[VERSIONING.md](../../VERSIONING.md)** - Complete versioning guide
- **[VERSIONING-QUICK-START.md](../../VERSIONING-QUICK-START.md)** - Quick versioning reference
- **[README.md](../../README.md)** - Project overview
- **[CHANGELOG.md](../../CHANGELOG.md)** - Version history

### External Resources

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
- [Astro Documentation](https://docs.astro.build)
- [Cloudflare Workers](https://developers.cloudflare.com/workers/)

---

## Typical Development Cycle

```
1. Create feature branch (or work on master during 0.0.x)
   git checkout -b feature/auth-system

2. Make commits with conventional format
   git commit -m "feat(auth): add login form"
   git commit -m "feat(auth): add JWT token generation"
   git commit -m "test(auth): add login integration tests"

3. Ensure tests and build pass
   pnpm test
   pnpm build

4. Push and create PR (or merge directly during 0.0.x)
   git push origin feature/auth-system

5. When feature complete, bump version
   pnpm version:minor

6. Update CHANGELOG.md

7. Push with tags
   git push origin master --tags

8. GitHub releases page auto-updates
```

---

## Quick Commit Checklist

- [ ] Changes tested locally
- [ ] Commits follow `type(scope): message` format
- [ ] Commit messages are descriptive and imperative
- [ ] No `any` types in TypeScript
- [ ] Tailwind classes organized logically
- [ ] Tests added for new logic
- [ ] Build passes: `pnpm build`

---

**Last Updated**: 2026-03-13
**Framework Version**: Astro 6.0.4 + Cloudflare Workers
