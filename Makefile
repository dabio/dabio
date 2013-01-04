all: server

server: clean
	nanoc autocompile

clean:
	rm -fR tmp/ output/*

install:
	bundle install --binstubs --path vendor/gems --without production
	@echo "Run: rbenv rehash"

uninstall: clean
	rm -fR tmp/ bin/ vendor/ Gemfile.lock