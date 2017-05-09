STAGING_URL=https://teachdentistryhugo.stage.ccnmtl.columbia.edu/
PROD_URL=https://teachdentistry.ctl.columbia.edu/
STAGING_BUCKET=teachdentistryhugo.stage.ccnmtl.columbia.edu
PROD_BUCKET=teachdentistry.ctl.columbia.edu
INTERMEDIATE_STEPS ?= echo nothing

JS_FILES=themes/ctl-book/static/js/


all: jshint jscs

include *.mk

$(PUBLIC)/js/all.json: $(PUBLIC)/json/all/index.html
	mkdir $(PUBLIC)/js/ || true
	mv $< $@ && ./checkjson.py

runserver-zarina:
	hugo --buildDrafts --verboseLog=true -v
	hugo server --baseUrl=http://kodos.ccnmtl.columbia.edu/ --bind=0.0.0.0 --port=13093 --watch --buildDrafts --verboseLog=true -v
