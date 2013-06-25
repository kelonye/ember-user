public: node_modules components
	@component build --dev -n $@ -o $@

node_modules:
	@npm install

components:
	@component install --dev

clean:
	@rm -rf public

.PHONY: clean