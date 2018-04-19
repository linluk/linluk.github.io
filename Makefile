#
# Makefile for my Website @ linluk.github.io
#
# Author: Lukas Singer
#
# Created: 2018-04-09
#


PANDOC=pandoc

WWW-DIR=www

REMOTE=https://github.com/linluk/linluk.github.io.git

WWW-BRANCH=master
SOURCE-BRANCH=source

TEMPLATE=template.html
CSS-DIR=css
JS-DIR=js
IMAGE-DIR=images

PANDOC-FLAGS=--from=markdown --to=html5 --template $(TEMPLATE) --smart --email-obfuscation=javascript


default: build


blog:
	mkdir -p $(WWW-DIR)/blog
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-blog=1 --variable is-blog=1 --output $(WWW-DIR)/blog/metagamejam2018.html  blog/metagamejam2018.md

build: blog
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-home=1 --output $(WWW-DIR)/index.html  index.md
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-about=1 --output $(WWW-DIR)/about.html  about.md
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-blog=1 --output $(WWW-DIR)/blog.html  blog.md
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --output $(WWW-DIR)/legal.html  legal.md
	cp -rf $(CSS-DIR) $(WWW-DIR)/
	cp -rf $(JS-DIR) $(WWW-DIR)/
	cp -rf $(IMAGE-DIR) $(WWW-DIR)/

serve: build
	( \
	  cd $(WWW-DIR) ; \
	  python3 -m http.server 8080 --bind 127.0.0.1 ; \
	)

init:
	( \
	  if [ ! -d "$(WWW-DIR)" ]; then ( \
	    git clone $(REMOTE) $(WWW-DIR) ; \
	    cd $(WWW-DIR) ; \
	    git checkout $(WWW-BRANCH) ; ) ; \
	  fi ; \
	)

publish:
	( \
	  cd $(WWW-DIR) ; \
	  git add . ; \
	  git commit --message "publish @$$(date)" ; \
	  git push origin $(WWW-BRANCH) ; \
	)

clean:
	rm -rf $(WWW-DIR)

.PHONY: blog build serve init publish clean

