#!/bin/bash

# function cargo() {
# 	echo $*
# }

function help_func() {
	echo """
Help:
	
	
	
"""
}
function clean_func() {
	echo Cleaning target/$'\n'
	cargo clean
}

function build_windows() {
	echo Building windows binaries in target/x86_64-pc-windows-gnu/anomaly.exe$'\n'
	cargo build --target x86_64-pc-windows-gnu --features windows-os
}
function build_linux() {
	echo Building linux binaries in target/x86_64-pc-windows-gnu/anomaly$'\n'
	cargo build --target x86_64-unknown-linux-gnu --features linux-os
}
function build_native() {
	echo Building native binaries
	cargo build
}

[[ -z $@ ]] && {
	build_native
	exit
}

for arg in "$@"
do
	case "$arg" in
	windows)
	build_windows
	;;
	linux)
	build_linux
	;;
	native)
	build_native
	;;
	all)
	build_native
	build_linux
	build_windows
	;;
	all_features)
	cargo build --all-features
	;;
	clean)
	clean_func
	;;
	help)
	help_func
	;;
	-h)
	help_func
	;;
	--help)
	help_func
	;;
	wine)
	WINEPREFIX=$PWD/.wine_prefix wine ./target/x86_64-pc-windows-gnu/debug/anomaly.exe
	;;
	*)
	echo Invalid input.
	help_func
	exit
	;;
	esac
done
