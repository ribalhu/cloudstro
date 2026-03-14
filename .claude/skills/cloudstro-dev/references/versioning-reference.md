---
name: versioning-reference
description: Complete reference for Semantic Versioning in Cloudstro
---

# Semantic Versioning Reference

## Version Format

```
MAJOR.MINOR.PATCH[-prerelease][+build]
```

**Examples:**
```
0.0.1       ← Current version (0 major, 0 minor, 1 patch)
0.1.0       ← Alpha release (0 major, 1 minor)
1.0.0       ← Production stable (1 major)
1.1.0-beta  ← Pre-release
1.0.0+build.123  ← Build metadata
```

## What Each Number Means

| Number | Name | When to Bump | Example |
|--------|------|--------------|---------|
| MAJOR | Major | Breaking changes | 0.0.1 → 1.0.0 |
| MINOR | Minor | New features (backward-compatible) | 0.0.1 → 0.1.0 |
| PATCH | Patch | Bug fixes | 0.0.1 → 0.0.2 |

## Current Roadmap

```
0.0.x  ✨ Pre-Alpha (current phase)
       ├─ Core framework setup
       ├─ Initial features
       ├─ Breaking changes allowed
       └─ No major version bump needed

0.1.0  🚀 Alpha Release
       ├─ JWT authentication functional
       ├─ Email service integrated
       ├─ User management working
       └─ First significant release

0.2.0  🔧 Beta Release
       ├─ Complete dashboard
       ├─ Role-based access control
       ├─ Production-ready configuration
       └─ Documentation complete

1.0.0  ✅ Stable Release
       ├─ API stability guaranteed
       ├─ Zero breaking changes per version
       ├─ Full test coverage
       └─ Production ready for enterprises
```

## How to Version in Cloudstro

### Automatic (Recommended)

```bash
# Patch release (bug fixes): 0.0.1 → 0.0.2
pnpm version:patch

# Minor release (new features): 0.0.1 → 0.1.0
pnpm version:minor

# Major release (breaking changes): 0.0.1 → 1.0.0
pnpm version:major
```

This automatically:
1. Updates `package.json`
2. Creates commit: `chore(release): bump version to X.Y.Z`
3. Creates git tag: `vX.Y.Z`

### Manual (Advanced)

```bash
# Using npm
npm version patch
npm version minor
npm version major

# Manual control
npm version 0.1.0 --no-git-tag-version
git add package.json
git commit -m "chore(release): bump version to 0.1.0"
git tag -a v0.1.0 -m "Release v0.1.0"
```

## When to Bump Each Number

### PATCH (Bug Fixes & Minor Fixes)

```
0.0.1 → 0.0.2 → 0.0.3 → ...
```

Bump PATCH for:
- ✅ Bug fixes
- ✅ Security patches
- ✅ Performance optimizations
- ✅ Documentation typos

**Example commit:**
```
fix(mailing): resolve SMTP timeout
fix(auth): fix JWT expiration validation
```

### MINOR (New Features, Backward-Compatible)

```
0.0.x → 0.1.0 → 0.2.0 → ...
```

Bump MINOR for:
- ✅ New features
- ✅ New optional parameters
- ✅ Deprecations with warnings
- ✅ Significant enhancements

**Example commits:**
```
feat(auth): add two-factor authentication
feat(dashboard): add analytics widget
feat(mailing): add email template builder
```

### MAJOR (Breaking Changes)

```
0.0.x → 1.0.0 → 2.0.0 → ...
```

Bump MAJOR for:
- ✅ Incompatible API changes
- ✅ Removed features (no deprecation period)
- ✅ Changed behavior significantly
- ✅ Changed data formats

**Example commits:**
```
BREAKING CHANGE: replace session tokens with JWT

feat!: restructure authentication API
```

## Phase-Specific Rules

### During 0.0.x (Pre-Alpha)

- **All changes allowed**, including breaking changes
- Breaking changes don't require MAJOR bump
- Focus on getting to 0.1.0 (Alpha)
- Version bumps are optional but recommended

```bash
# Both allowed during 0.0.x
feat: add new major component      # 0.0.1 → 0.1.0 (minor)
feat!: completely change auth API  # Still 0.0.2 (patch is ok too)
```

### During 0.1.0 - 0.9.x (Pre-Release)

- Breaking changes still allowed
- But should be documented
- Approaching stability
- Focus on feature completeness

### After 1.0.0 (Stable)

- **NO breaking changes within major version**
- Strict semver adherence
- Use MAJOR version for incompatible changes
- Regular patch/minor releases

```bash
feat: new optional feature          # 1.0.0 → 1.1.0 (minor)
fix: bug fix                        # 1.0.0 → 1.0.1 (patch)
feat!: breaking API change         # 1.0.0 → 2.0.0 (major)
```

## After Bumping Version

### 1. Update CHANGELOG.md

```markdown
## [0.1.0] - 2026-04-15

### Added
- JWT authentication system
- Email template builder
- User dashboard
- Analytics widget

### Fixed
- SMTP timeout issues
- JWT token expiration validation

### Changed
- Updated Astro to v6.1.0
- Reorganized component structure

### Deprecated
- Old session token API (will be removed in v1.0.0)

[0.1.0]: https://github.com/ribalhu/cloudstro/compare/v0.0.1...v0.1.0
[0.0.1]: https://github.com/ribalhu/cloudstro/releases/tag/v0.0.1
```

### 2. Push with Tags

```bash
git push origin master --tags
```

### 3. Create GitHub Release (Optional)

GitHub automatically creates release from tag, but you can add notes:
1. Go to https://github.com/ribalhu/cloudstro/releases
2. Click "Create release" on tag
3. Add release notes from CHANGELOG

## Comparison: Patch vs Minor vs Major

| Scenario | Type | Example | 0.0.1 →  |
|----------|------|---------|----------|
| Fix typo in docs | Patch | `fix: typo` | 0.0.2 |
| Fix bug in auth | Patch | `fix(auth): token validation` | 0.0.2 |
| Add new component | Minor | `feat(ui): new Button variant` | 0.1.0 |
| Add new feature | Minor | `feat(dashboard): analytics` | 0.1.0 |
| Remove API endpoint | Major | `BREAKING CHANGE: remove /v1/auth` | 1.0.0 |
| Change parameter | Major | `BREAKING CHANGE: auth requires JWT` | 1.0.0 |

## Common Questions

### Q: Should I version every commit?
**A:** No. Batch related commits (feature group, bug fix set) then version.

### Q: What if I made a mistake in my version?
**A:** Delete and recreate tag:
```bash
git tag -d v0.1.0
git push origin :refs/tags/v0.1.0
# Fix version in package.json
git tag -a v0.1.1 -m "Release v0.1.1"
```

### Q: Can I skip versions?
**A:** Yes. Go from 0.0.1 directly to 0.2.0 if needed. But try to be sequential.

### Q: What about release candidates (RC)?
**A:** Use semver pre-release format:
```bash
0.1.0-rc.1  ← Release Candidate 1
0.1.0-rc.2  ← Release Candidate 2
0.1.0       ← Final Release
```

### Q: When should we reach 1.0.0?
**A:** When:
- API is stable (no planned breaking changes)
- Core features are complete and tested
- Documentation is comprehensive
- Framework is production-ready
- Estimated: Q4 2026

---

**Reference**: https://semver.org/
