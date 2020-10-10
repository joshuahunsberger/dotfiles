# Joshua Hunsberger's dotfiles

The repo contains configuration files that track the way I have configured various command line tools, such as git.

.gitalias.txt example taken from https://github.com/GitAlias/gitalias

## Installation

Clone this repo in your home directory, then run `./install.sh`.

As of October 2020, GitHub Codespaces automatically clones a dotfiles repo to the home directory when creating a new Codespace and runs the install.sh script.  

See this link for more information:
https://docs.github.com/en/free-pro-team@latest/github/developing-online-with-codespaces/personalizing-codespaces-for-your-account

## Git

### Aliases
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
