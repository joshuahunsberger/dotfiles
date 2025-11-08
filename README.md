# Joshua Hunsberger's dotfiles

The repo contains my dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi). 

## Supported Platforms

- **macOS**: Full support with Homebrew packages and GUI applications
- **Ubuntu on WSL**: Full support with Homebrew packages (requires Homebrew pre-installed)
- **Windows**: PowerShell configuration with winget packages
- **GitHub Codespaces**: Auto-configures on launch

## Installation

### Prerequisites

#### Ubuntu on WSL
Install Homebrew first:
```console
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-installation instructions to add Homebrew to your PATH.

### Install `chezmoi`

#### macOS

```console
brew install chezmoi
```

#### Ubuntu on WSL
```console
brew install chezmoi
```

#### Windows
```console
winget install twpayne.chezmoi
```

#### Other options
https://www.chezmoi.io/install/

#### GitHub Codespaces
Github automatically clones this repo into new Codespaces and runs `install.sh`.

### Initialize
```console
chezmoi init --apply joshuahunsberger
```

## Manual Setup Options

### Git Aliases
You can include the additional aliases in .gitalias.txt by adding the following to your .gitconfig :
```
[include]
	path = /path/to/dotfiles/.gitalias.txt
```

### Git Attributes
A global attributes file can be set by adding this to your global .gitconfig:
```
[core]
	attributesfile = /path/to/dotfiles/.gitattributes
```

Alternative:
```
git config --global core.attributesfile /path/to/dotfiles/.gitattributes
```

## References

.gitalias.txt example taken from https://github.com/GitAlias/gitalias
