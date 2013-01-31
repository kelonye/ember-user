JADE = test/support/index.jade
HTML = $(JADE:.jade=.html)

COFFEE = test/index.coffee index.coffee
JS = $(COFFEE:.coffee=.js)

# test: build
# 	@mocha-phantomjs -R dot test/support/index.html

build: $(HTML) $(JS)
#	@component build --dev

%.html: %.jade
	jade < $< --path $< > $@

%.js: %.coffee
	coffee -bc $<

clean:
	rm -rf $(HTML) $(JS) build

.PHONY: clean test