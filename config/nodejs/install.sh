#!/usr/bin/env bash
set -euo pipefail

main() {
	npm install -g @angular/language-server
	npm install -g css-variables-language-server
	npm install -g cssmodules-language-server
	npm install -g dockerfile-language-server-nodejs
	npm install -g vscode-langservers-extracted
}

main
