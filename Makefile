all: server

server: clean
	bundle exec jekyll --pygments --safe --server 9393

sass:
	bundle exec sass --style compressed --scss --watch css/site.scss

clean:
	rm -fr _site/*

deploy:
	git push origin gh-pages
	curl www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2Fdab.io%2Ffeeds%2Fsitemap.xml

update:
	@echo "Updating Submodules"
	@git submodule foreach git pull

install:
	gem install bundler
	rbenv rehash
	bundle install --binstubs --path vendor/gems --without production
	# Removes jekyll test files
	rm -r vendor/gems/ruby/1.9.1/gems/jekyll-*/test/source/*

uninstall:
	rm -fr Gemfile.lock vendor/ bin/ .bundle/
