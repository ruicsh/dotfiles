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
		asvetliakov.vscode-neovim
		christian-kohler.npm-intellisense
		christian-kohler.path-intellisense
		clinyong.vscode-css-modules
		danprince.vsnetrw
		dbaeumer.vscode-eslint
		eamodio.gitlens
		editorconfig.editorconfig
		esbenp.prettier-vscode
		formulahendry.auto-rename-tag
		foxundermoon.shell-format
		github.copilot
		github.copilot-chat
		github.vscode-github-actions
		jeff-hykin.better-dockerfile-syntax
		kumar-harsh.graphql-for-vscode
		mattpocock.ts-error-translator
		mechatroner.rainbow-csv
		meganrogge.template-string-converter
		mhutchie.git-graph
		mikestead.dotenv
		mkxml.vscode-filesize
		mrmlnc.vscode-postcss-sorting
		ms-playwright.playwright
		ms-vscode-remote.remote-ssh
		ms-vscode-remote.remote-ssh-edit
		ms-vscode.remote-explorer
		qinjia.seti-icons
		redhat.vscode-yaml
		richie5um2.vscode-sort-json
		ruicsh.vscode-theme-nordstone
		samuelcolvin.jinjahtml
		sirtori.indenticator
		streetsidesoftware.code-spell-checker
		styled-components.vscode-styled-components
		stylelint.vscode-stylelint
		timonwong.shellcheck
		tobias-z.vscode-harpoon
		usernamehw.errorlens
		william-voyek.vscode-nginx
		wix.vscode-import-cost
		xabikos.javascriptsnippets
		yoavbls.pretty-ts-errors
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
