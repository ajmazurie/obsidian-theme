
.PHONY: build
build: target/obsidian.css

target/obsidian.css: obsidian.sass $(wildcard _*.sass)
	@sass --no-source-map $< $@

.PHONY: clean
clean:
	@rm -rf target

install: target/obsidian.css
ifndef OBSIDIAN_VAULT
	$(error "OBSIDIAN_VAULT is undefined")
endif
	@cp $? $(OBSIDIAN_VAULT)/.obsidian/snippets/
