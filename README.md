# code-remote-environment
This Docker image aims to provide a development environment to use as base a image for [vscode-remote containers](https://code.visualstudio.com/docs/remote/containers). An example .devcontainer configuration can be found in the .devcontainer folder.

## contents
os: [ubuntu](https://ubuntu.com)
shell: [fish](https://fishshell.com)
tools:
- [git](https://git-scm.com)
languages:
- [go](https://golang.org)
- [node](https://nodejs.org) ([npm](https://npmjs.com) & [yarn](https://yarnpkg.com) & [n](https://github.com/tj/n))
- [rust](https://rustlang.org) (stable - [rustup](https://rustup.rs))

## usage
Copy the .devcontainer folder into your project, use dockerfile to add anything that is missing and start developing.

## licence
This project is licenced under the MIT licence. Full details in LICENCE file.
