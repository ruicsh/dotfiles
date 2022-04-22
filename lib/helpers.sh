#!/usr/bin/env bash

os_name() {
	if [[ $(uname) == "Darwin" ]]; then
		echo "macos"
	elif [[ $(lsb_release -is) == "Ubuntu" ]]; then
		echo "ubuntu"
	else
		echo "Operative system not supported."
		exit 1
	fi
}

prompt_yes_no() {
	local question="${1:?}"
	read -r -p "${question} [yN]: " reply </dev/tty
	if [[ "${reply}" =~ ^[Yy]$ ]]; then
		return 0
	fi
	return 1
}
