# Versionado de Cloudstro

Este documento describe la estrategia de versionado utilizada en el proyecto Cloudstro.

## Semantic Versioning (SemVer)

Cloudstro sigue el estándar [Semantic Versioning 2.0.0](https://semver.org/).

### Formato: `MAJOR.MINOR.PATCH`

- **MAJOR**: Cambios incompatibles en la API (breaking changes)
- **MINOR**: Nuevas funcionalidades compatibles hacia atrás
- **PATCH**: Correcciones de errores y mejoras menores

### Ejemplos:

- `0.1.0` - Primera versión funcional (pre-release)
- `0.2.0` - Nuevas características agregadas
- `0.2.1` - Bug fix en versión 0.2.0
- `1.0.0` - Versión estable productiva
- `1.1.0` - Nueva característica en v1.x
- `2.0.0` - Breaking change, cambio importante

## Estado Actual del Proyecto

```
Versión: 0.0.1 (pre-alpha)
```

El proyecto se encuentra en fase **pre-alpha** (0.0.x). Durante esta fase:

- Se están estableciendo los fundamentos del framework
- Cambios frecuentes en la API y estructura
- NO hay garantía de estabilidad
- Cada commit avanza hacia 0.1.0

## Conveción de Commits

Usamos [Conventional Commits](https://www.conventionalcommits.org/) para automatizar el versionado.

### Formato

```
<tipo>(<scope>): <descripción>

<cuerpo>

<footer>
```

### Tipos de Commit

| Tipo | Descripción | Impacto SemVer |
|------|-------------|---|
| `feat` | Nueva funcionalidad | MINOR (cuando lleguemos a v1.0.0) |
| `fix` | Corrección de errores | PATCH (cuando lleguemos a v1.0.0) |
| `docs` | Cambios en documentación | SIN CAMBIO |
| `style` | Cambios de formato, sin afectar código | SIN CAMBIO |
| `refactor` | Refactorización de código | SIN CAMBIO |
| `perf` | Mejoras de rendimiento | PATCH (cuando lleguemos a v1.0.0) |
| `test` | Agregación o actualización de tests | SIN CAMBIO |
| `chore` | Cambios en build, deps, etc. | SIN CAMBIO |

### Breaking Changes

Si un commit introduce un **breaking change**, debe incluir `BREAKING CHANGE:` en el footer:

```
feat(auth): replace session tokens with JWT

BREAKING CHANGE: Old session tokens are no longer accepted.
Clients must migrate to JWT-based authentication.
```

Durante la fase pre-alpha (0.0.x), los breaking changes ocurren dentro de versiones (0.0.1 → 0.0.2), no requieren MAJOR bump.

### Ejemplos de Commits

```bash
# Nueva funcionalidad
git commit -m "feat(auth): add JWT-based authentication"

# Corrección de bug
git commit -m "fix(mailing): resolve SMTP connection timeout issue"

# Documentación
git commit -m "docs: update installation instructions"

# Refactorización sin cambios de API
git commit -m "refactor(components): reorganize button component structure"

# Con descripción detallada
git commit -m "feat(dashboard): add user analytics widget

- Integrate chart.js for data visualization
- Add real-time update support
- Create reusable analytics component

Closes #42"
```

## Roadmap de Versiones

### 0.0.x (Fase Pre-Alpha)
- Estableccimiento de arquitectura base
- Configuración de Cloudflare Workers
- Fundamentos del sistema de autenticación
- Status: EN DESARROLLO

### 0.1.0 (Alpha)
- ✅ Sistema de autenticación funcional
- ✅ Integración de mailing
- ✅ Gestión básica de usuarios
- ✅ Componentes UI principales
- Plazo estimado: Q2 2026

### 0.2.0 (Beta)
- ✅ Dashboard completo
- ✅ Sistema de roles y permisos
- ✅ Validación y manejo de errores robusto
- ✅ Documentación completa
- Plazo estimado: Q3 2026

### 1.0.0 (Estable)
- ✅ API estable y sin breaking changes frecuentes
- ✅ Tests completos de cobertura
- ✅ Documentación de producción
- ✅ Sistema de plugins/extensiones
- Plazo estimado: Q4 2026

## Gestión de Versiones en package.json

El archivo `package.json` contiene:

```json
{
  "version": "0.0.1",
  "name": "cloudstro"
}
```

### Actualización Manual

Cuando estés listo para hacer una nueva versión:

```bash
# Ver versión actual
npm version

# Actualizar versión (automático con cambios de tipo)
npm version minor  # 0.0.1 → 0.1.0
npm version patch  # 0.0.1 → 0.0.2
npm version major  # 0.0.1 → 1.0.0

# Esto crea un tag y commit automáticamente
```

### Automatización (Futuro)

Se recomienda usar herramientas como:

- **[semantic-release](https://github.com/semantic-release/semantic-release)**: Automatiza versioning y releases basado en commits
- **[commitizen](https://commitizen-tools.github.io/commitizen/)**: Interfaz interactiva para crear commits convencionales
- **[standard-version](https://github.com/conventional-changelog/standard-version)**: Genera CHANGELOG automáticamente

## CHANGELOG

El CHANGELOG se genera automáticamente a partir de los commits convencionales.

Formato: `CHANGELOG.md`

Ejemplo:
```markdown
## [0.1.0] - 2026-06-30

### Added
- Authentication system with JWT tokens
- Email service integration
- User management dashboard

### Fixed
- Cloudflare Workers configuration issues

### Changed
- Updated Astro to v6.0.4

## [0.0.1] - 2026-03-13

### Added
- Initial project setup with Astro + Cloudflare Workers
- Tailwind CSS configuration
- MIT License
```

## Tagging de Versiones

Cada versión debe tener un tag en Git:

```bash
# Crear tag
git tag -a v0.1.0 -m "Release version 0.1.0"

# Listar tags
git tag -l

# Push de tags
git push origin --tags
```

## Ramas de Trabajo

```
main         ← Versión estable en producción (solo releases)
development  ← Rama principal de desarrollo
feature/*    ← Ramas de features
hotfix/*     ← Ramas para hotfixes en producción
```

Durante la fase 0.0.x, todo el desarrollo ocurre en `master` o `main`.

## Publicación en npm (Futuro)

Cuando llegues a v1.0.0, podrás publicar en npm:

```bash
npm publish
```

Esto permitirá que otros desarrolladores instalen Cloudstro como dependencia:

```bash
npm install cloudstro
```

---

**Resumen**: Durante 0.0.x usa `chore:` para cambios de infraestructura, `feat:` para funcionalidades nuevas y `fix:` para bugs. Cuando llegues a 0.1.0, empezarás a usar versionado más formal.
