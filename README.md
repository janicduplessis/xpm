# xpm

Cross-package-manager executor - automatically detects and runs the right package manager (npm, yarn, or pnpm) based on your project's lock files.

## Why?

Tired of remembering which package manager each project uses? `xpm` detects it automatically by looking for lock files and runs the appropriate command.

## Installation

### Global Installation (Recommended)

```bash
npm install -g x-package-manager
```

### Standalone Script

```bash
curl -o xpm https://raw.githubusercontent.com/janicduplessis/xpm/main/bin/xpm.sh
chmod +x xpm
mv xpm /usr/local/bin/
```

## Usage

Use `xpm` exactly as you would use npm, yarn, or pnpm:

```bash
# Install dependencies
xpm install

# Add a package
xpm add react

# Run scripts
xpm run build
xpm test

# Any other command
xpm --version
```

## How It Works

`xpm` walks up the directory tree from your current location looking for lock files:

- `pnpm-lock.yaml` → uses **pnpm**
- `yarn.lock` → uses **yarn**
- `package-lock.json` → uses **npm**

If no lock file is found, it defaults to **npm**.

## Requirements

- Bash (included on macOS and Linux)
- At least one of: npm, yarn, or pnpm installed

## License

MIT
