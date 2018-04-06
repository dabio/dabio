.PHONY: build clean install serve test

all: build

build:
	bundle exec nanoc

clean:
	rm -r tmp/ output/ vendor/bundle/

install:
	@bundle config build.nokogiri \
		--use-system-libraries \
		--with-xml2-include=/usr/include/libxml2 \
		--with-libxslt-include=/usr/include/libxslt
		#--with-xml2-lib=/usr/lib
	bundle install \
		--jobs 4 \
		--path vendor/bundle

serve:
	bundle exec nanoc view

test: build
	# Not using css validator, because css3 is the default validation option,
	# but we need css3svg.
	#bundle exec nanoc check --all
	bundle exec nanoc check external_links html internal_links mixed_content stale

watch: build
	@fswatch \
		-0 \
		-i "content/" \
		-i "Rules" \
		-i "lib/" \
		-i "layouts/" \
		-e ".*" \
		. | xargs -0 -I{} -n1 make build
