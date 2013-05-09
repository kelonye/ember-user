SRC = $(shell find src -name "*.coffee" -type f)
LIB = $(SRC:src/%.coffee=lib/%.js)

TEST_COFFEE = $(shell find test/src -name "*.coffee" -type f)
TEST_JS = $(TEST_COFFEE:test/src/%.coffee=test/lib/%.js)

test: node_modules components build test/lib $(TEST_JS) test/support/index.html
	@mocha-phantomjs -R dot test/support/index.html

node_modules:
	@npm install

components:
	@component install --dev

build: lib $(LIB)
	@component build --dev

test/lib:
	@mkdir -p test/lib

lib:
	@mkdir -p lib

lib/%.js: src/%.coffee
	coffee -bcj $@ $<

test/lib/%.js: test/src/%.coffee
	coffee -bcj $@ $<

test/support/index.html: test/support/index.jade
	jade < $< --path $< > $@

clean:
	@rm -rf lib build test/lib test/support/index.html

.PHONY: clean test