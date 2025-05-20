# Joshua Hunsberger's dotfiles

The repo contains my dotfiles, managed with [`chezmoi`](https://github.com/twpayne/chezmoi). 

## Installation

### Install `chezmoi`

#### macOS

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
Github automatically clones this repo into new Codepaces and runs `install.sh`.

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
