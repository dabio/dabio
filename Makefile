all: server

server: clean
	bundle exec jekyll --pygments --safe --server 9393 --auto

clean:
	rm -fr _site/

deploy:
	git push origin gh-pages
	curl www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2Fdab.io%2Ffeeds%2Fsitemap.xml

install:
	gem install bundler
	rbenv rehash
	bundle install --binstubs --path vendor/gems --without production

uninstall:
	rm -fr Gemfile.lock vendor/ bin/
