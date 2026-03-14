# Cloudstro Development Skill

Professional development workflow and guidelines for Cloudstro framework.

## What is This?

This is a Claude Code **Skill** that provides development guidance for the Cloudstro project. It includes:

- **SKILL.md** - Main skill with quick reference and concise guidance
- **references/** - Detailed reference documents for extended reading
- This **README.md** - Skill structure and usage guide

## How to Use

### In Claude Code

Use the skill with:
```
/cloudstro-dev
```

This triggers the skill and provides:
- Quick reference for commits, versioning, and workflows
- Links to detailed documentation
- Code examples and best practices

### When to Use This Skill

- ✅ Making commits to Cloudstro
- ✅ Bumping version releases
- ✅ Setting up development environment
- ✅ Writing code that follows project standards
- ✅ Need guidance on PR workflows
- ✅ Understanding project structure

### Example Uses

**Question:** "How do I make a commit for new authentication feature?"
**Skill Response:** Shows commit format, examples, and best practices

**Question:** "It's time to release what we've built, what do I do?"
**Skill Response:** Shows versioning commands, CHANGELOG update, and push instructions

**Question:** "What code style should I follow?"
**Skill Response:** Shows TypeScript, Astro, Tailwind standards with examples

## Skill Structure

```
cloudstro-dev/
├── SKILL.md                          # Main skill file
├── README.md                         # This file
└── references/
    ├── commits-reference.md          # Complete commits guide
    └── versioning-reference.md       # Complete versioning guide
```

### SKILL.md

**Purpose:** Quick, scannable reference
**Length:** ~300 lines
**Format:** Sections with examples and links to detailed docs
**Use:** Primary entry point when calling `/cloudstro-dev`

### references/commits-reference.md

**Purpose:** Deep dive into Conventional Commits
**Includes:**
- Complete type reference
- Examples for each type
- Rules and anti-patterns
- Tools and helpers
- Real-world examples

**Use:** When you need detailed commit guidance

### references/versioning-reference.md

**Purpose:** Deep dive into Semantic Versioning
**Includes:**
- Version format explanation
- Phase-specific rules (0.0.x vs 1.0.0+)
- When to bump each number
- CHANGELOG formatting
- Real-world scenarios

**Use:** When planning releases or need versioning details

## Key Sections in SKILL.md

1. **Commits & Conventional Format** - How to write commits
2. **Semantic Versioning** - How to version releases
3. **Development Workflow** - Setup and available scripts
4. **Code Style Standards** - TypeScript, Astro, Tailwind rules
5. **Testing Requirements** - When and what to test
6. **Pull Request Workflow** - PR template and checklist
7. **Breaking Changes Policy** - How to handle breaking changes
8. **Resources & References** - Links to docs and external resources

## Quick Command Reference

```bash
# Development
pnpm dev              # Start dev server
pnpm build            # Production build
pnpm test             # Run tests

# Commits
git commit -m "feat(auth): add login form"

# Versioning
pnpm version:patch    # 0.0.1 → 0.0.2
pnpm version:minor    # 0.0.1 → 0.1.0
pnpm version:major    # 0.0.1 → 1.0.0

# Push
git push origin master --tags
```

## Integration with Project

This skill references and complements these project documents:

- **[README.md](../../README.md)** - Project overview
- **[DEVELOPMENT-GUIDELINES.md](../../DEVELOPMENT-GUIDELINES.md)** - Full guidelines
- **[VERSIONING.md](../../VERSIONING.md)** - Complete versioning guide
- **[VERSIONING-QUICK-START.md](../../VERSIONING-QUICK-START.md)** - Quick start
- **[CHANGELOG.md](../../CHANGELOG.md)** - Version history

The skill provides quick references and links to these documents for deeper dives.

## When to Update This Skill

Update the skill when:

- ✅ Development workflow changes
- ✅ Commit conventions change
- ✅ Versioning strategy changes
- ✅ New code style standards established
- ✅ New project structure established
- ✅ Deployment process changes

Do NOT update skill for:
- ❌ Individual project changes (use project docs instead)
- ❌ Feature-specific guidance
- ❌ Temporary instructions

## Example Workflow

1. **Developer calls skill:** `/cloudstro-dev`
2. **Claude responds with:** Quick reference + examples
3. **Developer needs more detail:** Clicks reference link
4. **Claude shows:** Detailed reference doc (commits-reference.md, etc.)
5. **Developer has specific question:** Calls skill again with context

This two-tier system keeps the skill fast and scannable while providing depth when needed.

## Version

- **Skill Version:** 0.1.0
- **Framework Version:** Astro 6.0.4 + Cloudflare Workers
- **Last Updated:** 2026-03-13

---

**Invoke with:** `/cloudstro-dev`
