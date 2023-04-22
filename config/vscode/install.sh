#!/usr/bin/env bash
set -euo pipefail

main() {
	prompt_yes_no "[vscode] setup?"
	if [[ $? -eq 1 ]]; then
		return 1
	fi

	# vscode-vim suggested configs
	if [[ $(os_name) == "macos" ]]; then
		defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
		defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
	fi

	# extensions
	vscode_extensions=(
		astro-build.astro-vscode
		asvetliakov.vscode-neovim
		bbenoist.vagrant
		christian-kohler.npm-intellisense
		christian-kohler.path-intellisense
		clinyong.vscode-css-modules
		dbaeumer.vscode-eslint
		eamodio.gitlens
		EditorConfig.EditorConfig
		esbenp.prettier-vscode
		exiasr.hadolint
		formulahendry.auto-rename-tag
		foxundermoon.shell-format
		GitHub.copilot
		github.vscode-github-actions
		hashicorp.terraform
		janisdd.vscode-edit-csv
		kumar-harsh.graphql-for-vscode
		mattpocock.ts-error-translator
		mechatroner.rainbow-csv
		meganrogge.template-string-converter
		mhutchie.git-graph
		mikestead.dotenv
		mkxml.vscode-filesize
		mrmlnc.vscode-postcss-sorting
		ms-azuretools.vscode-docker
		ms-playwright.playwright
		ms-python.isort
		ms-python.python
		ms-python.vscode-pylance
		qinjia.seti-icons
		redhat.ansible
		redhat.vscode-yaml
		richie5um2.vscode-sort-json
		rsbondi.highlight-words
		ryuta46.multi-command
		samuelcolvin.jinjahtml
		SirTori.indenticator
		streetsidesoftware.code-spell-checker
		styled-components.vscode-styled-components
		stylelint.vscode-stylelint
		timonwong.shellcheck
		Tyriar.sort-lines
		usernamehw.errorlens
		wholroyd.jinja
		william-voyek.vscode-nginx
		wix.vscode-import-cost
		xabikos.JavaScriptSnippets
	)

	for extension in "${vscode_extensions[@]}"; do
		code --install-extension "$extension" --force
	done

	# settings
	if [[ $(os_name) == "macos" ]]; then
		mkdir macos/Library/Application\ Support/Code
		mkdir macos/Library/Application\ Support/Code/User
		vscode_rc_dir=macos/Library/Application\ Support/Code/User
	elif [[ $(os_name) == "ubuntu" ]]; then
		mkdir ubuntu/.config
		mkdir ubuntu/.config/Code
		mkdir ubuntu/.config/Code/User
		vscode_rc_dir=ubuntu/.config/Code/User
	fi

	vscode_rc="${vscode_rc_dir}"/settings.json
	keybindings_rc="${vscode_rc_dir}"/keybindings.json

	sed \
		-e "s|__SHELLCHECK_EXECUTABLE_PATH__|$(command -v shellcheck)|g" \
		-e "s|__GIT_EXECUTABLE_PATH__|$(command -v git)|g" \
		config/vscode/settings.template.json >"${vscode_rc}"

	cp config/vscode/keybindings.json "${keybindings_rc}"
}

main
