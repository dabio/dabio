#!/bin/sh

.PHONY: build clean install run test uninstall

default: run

build: clean
	@bundle exec jekyll build

clean:
	@rm -fr _site

install:
	@echo "Installing gems…"
	@bundle config build.nokogiri \
	    --use-system-libraries \
	    --with-xml2-include=/usr/include/libxml2 \
	    --with-libxslt-include=/usr/include/libxslt
	    #--with-xml2-lib=/usr/lib
	@bundle install \
		--binstubs vendor/bundle/bin \
		--path vendor/bundle \
		--jobs 4 \
		--without production
	@echo "Removing jekyll templates…"
	@rm -fr vendor/bundle/ruby/*/gems/jekyll-*/spec/fixtures
	@rm -fr vendor/bundle/ruby/*/gems/jekyll-*/lib/site_template

run: clean
	@bundle exec jekyll serve --drafts

test: build
	@bundle exec htmlproofer ./_site/ \
		--disable-external \
		--check-html \
		--check-opengraph

uninstall: clean
	@rm -fr vendor/ .bundle/
