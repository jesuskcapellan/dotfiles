# Dotfiles

My personal dotfiles for setting up a new development environment quickly and consistently. This repository includes configurations for:

- Bash/Zsh shell configuration
- Neovim setup
- Tmux configuration
- Git configuration
- SSH setup
- Starship prompt
- Node.js via nvm

## Prerequisites

The setup scripts support both macOS and Linux (Debian-based) systems. The scripts will automatically detect your OS and use the appropriate package manager:

- **macOS**: Uses Homebrew (will be installed automatically if missing)
- **Linux**: Uses apt-get (for Debian-based distributions)

Basic requirements:

**macOS:**

```bash
# Nothing needed! The script will install Homebrew automatically.
```

**Linux:**

```bash
sudo apt-get update
sudo apt-get install -y curl git
```

## Quick Start

1. Generate and set up SSH keys for GitHub:

   ```bash
   curl -fsSL https://raw.githubusercontent.com/jesuskcapellan/dotfiles/master/ssh | bash -s your.email@example.com
   ```

   The script will automatically:

   - Generate an ED25519 SSH key
   - Configure the SSH agent
   - Copy the public key to your clipboard (if possible)
   - Provide instructions for adding the key to GitHub

2. Run the main installation script:
   ```bash
   curl -fsSL https://raw.githubusercontent.com/jesuskcapellan/dotfiles/master/install | bash
   ```

## What Gets Installed

The installation script will:

- Install essential development tools:
  - macOS: via Homebrew (git, stow, tmux, fzf, etc.)
  - Linux: via apt-get (git, stow, tmux, fzf, etc.)
- Set up Neovim:
  - macOS: via Homebrew
  - Linux: built from source
- Configure dotfiles using GNU Stow
- Install Node.js via nvm
- Set up Starship prompt
- Back up any existing configurations
- Configure the appropriate shell:
  - macOS: Zsh (default) or Bash
  - Linux: Bash

## Features

- **Cross-Platform**: Works on both macOS and Linux
- **Idempotent Installation**: Safe to run multiple times
- **Automatic Backups**: Existing configurations are backed up before being replaced
- **Error Handling**: Comprehensive error checking and reporting
- **Progress Feedback**: Clear visual feedback during installation
- **Modular Configuration**: Uses GNU Stow for managing symlinks
- **Shell Detection**: Automatically configures the appropriate shell (Zsh/Bash)
- **Clipboard Support**: Automatically copies SSH keys when possible

## Manual Installation

If you prefer to run the scripts manually:

1. Clone the repository:

   ```bash
   git clone https://github.com/jesuskcapellan/dotfiles.git ~/.dotfiles
   ```

2. Run the SSH setup (if needed):

   ```bash
   cd ~/.dotfiles
   ./ssh your.email@example.com
   ```

3. Run the installation script:
   ```bash
   cd ~/.dotfiles
   ./install
   ```

## Customization

The dotfiles are organized by topic and managed with GNU Stow:

1. Modify files in the respective directories:

   - `bash/` - Bash configuration
   - `zsh/` - Zsh configuration (for macOS)
   - `nvim/` - Neovim configuration
   - `tmux/` - Tmux configuration

2. Use `stow` to manage symlinks:
   ```bash
   cd ~/.dotfiles
   stow --target="$HOME" bash     # for bash configuration
   stow --target="$HOME" zsh      # for zsh configuration (macOS)
   stow --target="$HOME/.config/nvim" nvim  # for neovim configuration
   ```

## Troubleshooting

- If you encounter permission errors, ensure you have the necessary sudo privileges
- For SSH issues:
  - macOS: Make sure the Keychain is accessible
  - Linux: Ensure ssh-agent is running
- If a tool fails to install:
  - macOS: Try running `brew doctor`
  - Linux: Check apt-get logs
- Check the backup directory (`~/.dotfiles_backup/`) for any backed-up configurations
- For macOS-specific issues, ensure Command Line Tools are installed: `xcode-select --install`

## Contributing

Feel free to fork this repository and customize it for your needs. Pull requests for improvements are welcome!
