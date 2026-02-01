#!/usr/bin/env sh
set -e

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
ISO="$ROOT_DIR/iso/arainos.iso"

if [ ! -f "$ISO" ]; then
	echo "ISO not found. Run 'make iso' first."
	exit 1
fi

qemu-system-i386 -cdrom "$ISO" -m 256M
