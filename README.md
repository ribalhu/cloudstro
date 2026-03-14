# Cloudstro

A robust **Astro + Cloudflare Workers** admin dashboard framework designed to accelerate the development of enterprise-grade administration panels. Zero cold starts, lightning-fast deployments, and serverless scalability at the edge.

## Vision

Cloudstro eliminates the repetitive work of building admin dashboards from scratch by leveraging the power of Cloudflare Workers for serverless edge computing. It provides a production-ready foundation with authentication, email systems, user management, and extensible component architecture—all running globally distributed without managing servers. Teams can focus on business logic rather than infrastructure while enjoying the benefits of edge computing: minimal latency, automatic scaling, and reduced operational complexity.

## Key Features

- **🔐 Authentication System**: Built-in JWT-based authentication with session management
- **📧 Mailing Integration**: Pre-configured email service for notifications and alerts
- **👥 User Management**: Complete user lifecycle management (CRUD operations, roles, permissions)
- **🎨 UI Components**: Pre-built, customizable dashboard components
- **⚡ Performance**: Deployed on Cloudflare Workers for edge computing with minimal latency
- **🔧 Developer Experience**: TypeScript support, modern tooling, hot module reloading
- **📱 Responsive Design**: Mobile-first approach with Tailwind CSS
- **🛠️ Modular Architecture**: Build on top of pre-configured modules, extend as needed

## Technology Stack

- **Framework**: [Astro 6.0](https://astro.build) - Zero JavaScript by default, selective hydration
- **Styling**: [Tailwind CSS 4.2](https://tailwindcss.com) - Utility-first CSS framework
- **Deployment**: [Cloudflare Workers](https://workers.cloudflare.com) - Serverless edge computing
- **Runtime**: Node.js 22.12.0 or higher
- **Package Manager**: pnpm

## Quick Start

### Prerequisites

- Node.js >= 22.12.0
- pnpm (recommended) or npm/yarn

### Installation

```bash
# Clone the repository
git clone https://github.com/ribalhu/cloudstro.git
cd cloudstro

# Install dependencies
pnpm install

# Start development server
pnpm dev
```

The application will be available at `http://localhost:4321`

## Project Structure

```
cloudstro/
├── src/
│   ├── components/          # Reusable UI components
│   ├── layouts/             # Page layouts
│   ├── pages/               # Route definitions
│   ├── styles/              # Global styles and Tailwind configuration
│   └── assets/              # Static assets (images, icons, etc.)
├── public/                  # Public assets (favicon, robots.txt, etc.)
├── astro.config.mjs         # Astro configuration
├── tsconfig.json            # TypeScript configuration
├── tailwind.config.js       # Tailwind CSS configuration
├── wrangler.jsonc           # Cloudflare Workers configuration
└── package.json             # Project dependencies and scripts
```

## Available Scripts

| Command | Description |
|---------|-------------|
| `pnpm dev` | Start local development server with hot reload |
| `pnpm build` | Build for production and deploy to Cloudflare |
| `pnpm preview` | Preview production build locally |
| `pnpm generate-types` | Generate TypeScript types from Wrangler configuration |
| `pnpm astro ...` | Run Astro CLI commands |

## Development Workflow

### Local Development

```bash
pnpm dev
```

This starts the development server with hot module reloading. Changes are reflected immediately in your browser.

### Building for Production

```bash
pnpm build
```

This creates an optimized production build ready for deployment to Cloudflare Workers.

### Type Safety

```bash
pnpm generate-types
```

Ensures your project has the latest Cloudflare Workers types.

## Deployment

Cloudstro is designed to run on Cloudflare Workers. Configuration is managed through `wrangler.jsonc`.

### Deploy to Cloudflare

```bash
pnpm build
wrangler deploy
```

## Roadmap

- [ ] Authentication system implementation
- [ ] Email service integration
- [ ] User management dashboard
- [ ] Role-based access control (RBAC)
- [ ] Admin panel components library
- [ ] Documentation and examples
- [ ] Testing utilities and examples

## Contributing

We welcome contributions! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 📚 [Astro Documentation](https://docs.astro.build)
- ☁️ [Cloudflare Workers Docs](https://developers.cloudflare.com/workers/)
- 🎨 [Tailwind CSS Guide](https://tailwindcss.com/docs)

## Maintainers

- [@ribalhu](https://github.com/ribalhu)

---

**Cloudstro** - Building admin dashboards, faster.
