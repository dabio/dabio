all: server

server:
	rm -fR output/*
	nanoc autocompile

install:
	bundle install --binstubs --path vendor/gems --without production
	@echo "Run: rbenv rehash"

clean:
	rm -fR output/* tmp/ bin/ vendor/ Gemfile.lock

