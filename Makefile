STAGING_URL=https://teachdentistryhugo.stage.ccnmtl.columbia.edu/
PROD_URL=https://teachdentistry.org/
STAGING_BUCKET=teachdentistryhugo.stage.ccnmtl.columbia.edu
PROD_BUCKET=teachdentistry.org
INTERMEDIATE_STEPS ?= echo nothing
HUGO=/usr/local/bin/hugo-0.47.1
JS_FILES=themes/ctl-book/static/js/


all: eslint

include *.mk

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py
