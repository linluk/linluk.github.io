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
BLOG-TEMPLATE=blog-template.html

PANDOC-FLAGS=--from=markdown --to=html5 --template $(TEMPLATE) --smart --email-obfuscation=javascript

blog:
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-blog=1 --output $(WWW-DIR)/blog/metagamejam2018-lessons-learned.html  blog/metagamejam2018-lessons-learned.md

default: blog
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-home=1 --output $(WWW-DIR)/index.html  index.md
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-about=1 --output $(WWW-DIR)/about.html  about.md
	$(PANDOC) $(PANDOC-FLAGS) --template $(TEMPLATE) --variable nav-blog=1 --output $(WWW-DIR)/blog.html  blog.md


serve:
	( \
	  cd $(WWW-DIR) ; \
	  python3 -m http.server 8080 --bind 127.0.0.1 ; \
	  xdg-open http://127.0.0.1:8080/index.html ; \
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

