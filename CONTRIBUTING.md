# Contributing to Cloudstro

Thank you for your interest in contributing to Cloudstro!

## Quick Links

All development guidance is available through the **Claude Code Skill**:

```
/cloudstro-dev
```

This skill includes:
- ✅ Commit conventions and examples
- ✅ Versioning guidelines
- ✅ Code style standards
- ✅ Testing requirements
- ✅ Workflow instructions
- ✅ Complete reference documentation

## Development Setup

```bash
git clone https://github.com/ribalhu/cloudstro.git
cd cloudstro
pnpm install
pnpm dev
```

## Contribution Steps

1. **Code**: Make your changes following the guidelines in `/cloudstro-dev`
2. **Commit**: Use Conventional Commits format
3. **Test**: Ensure `pnpm test` and `pnpm build` pass
4. **Push**: Create a pull request
5. **Version**: When releasing, use `pnpm version:*` scripts

## Key Resources

| Resource | Purpose |
|----------|---------|
| `/cloudstro-dev` | Complete development guidance (use this!) |
| `package.json` | Available scripts and dependencies |
| `astro.config.mjs` | Astro framework configuration |
| `wrangler.jsonc` | Cloudflare Workers configuration |

## Guidelines Summary

- **Commits**: Use `feat:`, `fix:`, `docs:`, etc. - See skill for full list
- **Versioning**: `pnpm version:patch|minor|major`
- **TypeScript**: Strict mode, explicit typing
- **Styles**: Tailwind CSS with logical class ordering
- **Testing**: Required for utils, auth, and API integrations

## Questions?

If you need guidance on:
- How to write commits → `/cloudstro-dev`
- How to version releases → `/cloudstro-dev`
- How to set up your environment → `/cloudstro-dev`
- How to structure code → `/cloudstro-dev`

**All development decisions are documented in the `/cloudstro-dev` skill.**

---

**Everything you need is in the `/cloudstro-dev` skill.**
