#!/bin/sh

.PHONY: clean install run uninstall

default: run

clean:
	@rm -fr _site

install:
	@echo "Installing gems…"
	@bundle install \
		--binstubs vendor/bundle/bin \
		--path vendor/bundle \
		--jobs 4 \
		--without production
	@echo "Removing jekyll templates…"
	@rm -fr vendor/bundle/ruby/*/gems/jekyll-*/spec/fixtures
	@rm -fr vendor/bundle/ruby/*/gems/jekyll-*/lib/site_template

run: clean
	@bundle exec jekyll serve

uninstall: clean
	@rm -fr vendor/ .bundle/
