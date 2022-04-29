#!/usr/bin/bash

set -euo pipefail

add-plugins() {
	set +e
	asdf plugin add deno
	asdf plugin add golang
	asdf plugin add nodejs
	asdf plugin add python
	asdf plugin add ruby
}

install-plugins() {
	set -e
	DENO_VERSION="$(asdf list-all deno | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | tail -n 1)" && asdf install deno "$DENO_VERSION" && asdf global deno "$DENO_VERSION"
	GOLANG_VERSION="$(asdf list-all golang | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | tail -n 1)" && asdf install golang "$GOLANG_VERSION" && asdf global golang "$GOLANG_VERSION"
	NODEJS_VERSION="$(asdf list-all nodejs | grep -E "^lts$" | tail -n 1)" && asdf install nodejs "$NODEJS_VERSION" && asdf global nodejs "$NODEJS_VERSION"
	PYTHON_VERSION="$(asdf list-all python | grep -E "^[0-9]+\.[0-9]+\.[0-9]+$" | tail -n 1)" && asdf install python "$PYTHON_VERSION" && asdf global python "$PYTHON_VERSION"
	RUBY2_VERSION="$(asdf list-all ruby | grep -E "^2+\.[0-9]+\.[0-9]+$" | tail -n 1)" && asdf install ruby "$RUBY2_VERSION" && asdf global ruby "$RUBY2_VERSION"
}

main() {
	add-plugins
	install-plugins
}

main
