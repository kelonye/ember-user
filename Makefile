SRC = $(shell find src -name "*.coffee" -type f)
LIB = $(SRC:src/%.coffee=lib/%.js)

TEST_COFFEE = $(shell find test/src -name "*.coffee" -type f)
TEST_JS = $(TEST_COFFEE:test/src/%.coffee=test/lib/%.js)

test: node_modules build test/lib $(TEST_JS) test/support/index.html
	@mocha-phantomjs -R dot test/support/index.html

node_modules: package.json
	@npm install

build: components lib $(LIB)
	@component build --dev

test/lib:
	@mkdir -p test/lib

components: component.json
	@component install --dev

lib:
	@mkdir -p lib

lib/%.js: src/%.coffee
	coffee -bcj $@ $<

test/lib/%.js: test/src/%.coffee
	coffee -bcj $@ $<

%.js: %.coffee
	coffee -bcj $@ $<

test/support/index.html: test/support/index.jade
	jade < $< --path $< > $@

clean:
	@rm -rf lib build test/lib test/support/index.html

.PHONY: clean test