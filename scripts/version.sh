#!/bin/bash

# Script para manejar el versionado de Cloudstro
# Uso: ./scripts/version.sh <major|minor|patch>

set -e

CURRENT_VERSION=$(node -p "require('./package.json').version")
BUMP_TYPE=${1:-patch}

if [[ ! "$BUMP_TYPE" =~ ^(major|minor|patch)$ ]]; then
  echo "❌ Error: Tipo de bump inválido. Usa: major, minor o patch"
  echo ""
  echo "Uso: ./scripts/version.sh <major|minor|patch>"
  echo ""
  echo "Ejemplos:"
  echo "  ./scripts/version.sh patch   # 0.0.1 → 0.0.2"
  echo "  ./scripts/version.sh minor   # 0.0.1 → 0.1.0"
  echo "  ./scripts/version.sh major   # 0.0.1 → 1.0.0"
  exit 1
fi

echo "📦 Versionado de Cloudstro"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Versión actual: $CURRENT_VERSION"
echo "Tipo de bump: $BUMP_TYPE"
echo ""

# Validar que estemos en una rama limpia
if [[ -n $(git status -s) ]]; then
  echo "❌ Error: Hay cambios sin commitear. Realiza un commit primero."
  echo ""
  echo "Cambios pendientes:"
  git status -s
  exit 1
fi

# Bumpar versión
NEW_VERSION=$(npm version $BUMP_TYPE --no-git-tag-version)
echo "✅ Versión actualizada a: $NEW_VERSION"

# Crear commit de versión
git add package.json package-lock.json pnpm-lock.yaml 2>/dev/null || true
git commit -m "chore(release): bump version to $NEW_VERSION"

# Crear tag
git tag -a "$NEW_VERSION" -m "Release $NEW_VERSION"
echo "✅ Tag creado: $NEW_VERSION"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✨ Versionado completado exitosamente"
echo ""
echo "Próximos pasos:"
echo "  1. Revisar los cambios: git log --oneline -3"
echo "  2. Hacer push: git push origin master --tags"
echo ""
echo "O para cancelar (deshacer):"
echo "  git tag -d $NEW_VERSION"
echo "  git reset HEAD~1"
echo "  git restore package.json"
