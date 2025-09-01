SHELL=/bin/bash

# brew install optipng jpegoptim

dev:
	toucan generate

dist:
	toucan generate --target live

watch:
	toucan watch -s 3

serve:
	toucan serve -p 3000

png:
	find ./* -type f -name '*.png' -exec optipng -o7 {} \;

jpg:
	find ./* -type f -name '*.jpg' | xargs jpegoptim --all-progressive '*.jpg'
