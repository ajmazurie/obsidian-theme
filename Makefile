
.PHONY: build
build: target/obsidian.css

target/%.css: %.sass
	@sass --no-source-map $? $@

clean:
	@rm -rf target

install: target/obsidian.css
ifndef OBSIDIAN_VAULT
	$(error "OBSIDIAN_VAULT is undefined")
endif
	@cp $? $(OBSIDIAN_VAULT)/.obsidian/snippets/
