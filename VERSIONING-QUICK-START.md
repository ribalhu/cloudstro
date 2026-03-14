# Guía Rápida de Versionado

## TL;DR

Durante el desarrollo (fase 0.0.x), usa commits convencionales y bumpa versiones manualmente.

## Cómo Hacer Commits

### Formato Simple
```bash
git commit -m "feat(auth): add login form component"
git commit -m "fix(mailing): resolve SMTP timeout error"
git commit -m "docs: update installation guide"
```

### Formato Completo (cuando necesites detalles)
```bash
git commit -m "feat(dashboard): add analytics widget

- Integrate Chart.js for data visualization
- Add real-time data updates
- Create reusable AnalyticsWidget component

Closes #42"
```

## Tipos de Commits Permitidos

| Tipo | Uso | Ejemplo |
|------|-----|---------|
| `feat` | Nueva funcionalidad | `feat(auth): add JWT authentication` |
| `fix` | Corrección de bug | `fix(deploy): resolve Cloudflare config issue` |
| `docs` | Documentación | `docs: add deployment guide` |
| `refactor` | Reorganizar código | `refactor(components): restructure button component` |
| `perf` | Mejora de rendimiento | `perf(api): optimize database queries` |
| `test` | Tests | `test(auth): add login integration tests` |
| `chore` | Tareas administrativas | `chore: update dependencies` |
| `style` | Formato (no funcional) | `style: add prettier formatting` |

## Bumpar Versión

### Opción 1: Usar npm scripts (RECOMENDADO)

```bash
# Para patch release (bug fixes)
# 0.0.1 → 0.0.2
pnpm version:patch

# Para minor release (nuevas features)
# 0.0.1 → 0.1.0
pnpm version:minor

# Para major release (breaking changes)
# 0.0.1 → 1.0.0
pnpm version:major
```

### Opción 2: Script directo

```bash
bash scripts/version.sh patch
bash scripts/version.sh minor
bash scripts/version.sh major
```

### Opción 3: Manual con npm

```bash
npm version patch
npm version minor
npm version major
git push origin master --tags
```

## Flujo Completo: De Feature a Release

### 1. Trabajar en una feature
```bash
# Hacer cambios...
git add .
git commit -m "feat(mailing): add email template system"
git commit -m "feat(mailing): add email scheduler"
```

### 2. Listo para release
```bash
# Verificar que todo está clean
git status
# En rama: master
# nada a commitear

# Ver commits desde última versión
git log v0.0.1..HEAD --oneline
```

### 3. Bumpar versión
```bash
pnpm version:minor
```

Esto automáticamente:
- ✅ Actualiza `package.json` (0.0.1 → 0.1.0)
- ✅ Crea commit de versión
- ✅ Crea tag `v0.1.0`

### 4. Hacer push
```bash
git push origin master --tags
```

## Ver Tags y Versiones

```bash
# Ver todos los tags
git tag -l

# Ver commits desde última versión
git log v0.0.1..HEAD --pretty=format:"%h - %s"

# Ver información del tag
git show v0.0.1
```

## Actualizar CHANGELOG

Cuando haces un release, actualiza `CHANGELOG.md`:

```markdown
## [0.1.0] - 2026-04-15

### Added
- Email template system
- Email scheduler with cron support
- SMTP configuration validation

### Fixed
- SMTP connection timeout issues

### Changed
- Updated Astro to v6.1.0

[0.1.0]: https://github.com/ribalhu/cloudstro/compare/v0.0.1...v0.1.0
[0.0.1]: https://github.com/ribalhu/cloudstro/releases/tag/v0.0.1
```

## Flujo de Ramas (Futuro)

Cuando crezca el equipo, considera usar Git Flow:

```
main               ← Producción (releases)
development        ← Rama principal de desarrollo
├── feature/*       ← Nuevas features
├── bugfix/*        ← Bug fixes
└── hotfix/*        ← Fixes urgentes en prod
```

Por ahora, todo en `master` durante 0.0.x.

## Buenas Prácticas

✅ **Haz commits pequeños y atómicos**
```bash
# ✅ Bien: commits pequeños y específicos
git commit -m "feat(auth): add login component"
git commit -m "feat(auth): add password validation"
git commit -m "test(auth): add login tests"

# ❌ Evita: commits grandes que mezclan features
git commit -m "feat: add auth, mailing, and dashboard"
```

✅ **Usa mensajes descriptivos**
```bash
# ✅ Descriptivo
git commit -m "fix(mailing): resolve SMTP timeout with 30s retry"

# ❌ Vago
git commit -m "fix: stuff"
```

✅ **Bumpa versión cuando agregues features importantes**
```bash
# Cuando termines una feature grande
pnpm version:minor
git push origin master --tags
```

✅ **Mantén CHANGELOG actualizado**
- Después de cada release
- Agrupa cambios por tipo (Added, Fixed, Changed, etc.)

## Automatización Futura

Para cuando crezca el proyecto, considera:

### Commitizen (CLI interactivo)

```bash
pnpm add -D commitizen cz-conventional-changelog
pnpm commitizen init cz-conventional-changelog
npx cz commit  # vs git commit
```

### Standard Version (auto-changelog)

```bash
pnpm add -D standard-version
pnpm standard-version
```

### Semantic Release (automatización completa)

```bash
pnpm add -D semantic-release
# Automatiza: changelog, version bump, npm publish, GitHub release
```

---

**Ejemplo rápido para hoy:**

```bash
# Hacer cambios
echo "// nuevo código" >> src/components/Button.astro

# Commitear con convención
git add .
git commit -m "feat(ui): add Button component"

# Cuando tengas varias features, bumpa versión
pnpm version:minor

# Push
git push origin master --tags
```

¡Eso es todo! 🚀
