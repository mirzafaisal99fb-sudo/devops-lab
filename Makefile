
#
# Rename this to Makefile and complete every TODO.
# Requirements are listed in Section 4.1 of the lab manual.
#

SRC_DIR := src
OUT_DIR := out

SOURCES := $(wildcard $(SRC_DIR)/*.txt)
OUTPUTS := $(patsubst $(SRC_DIR)/%.txt,$(OUT_DIR)/%.txt,$(SOURCES))

.PHONY: all check build test clean ci

all: test

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.txt: $(SRC_DIR)/%.txt | $(OUT_DIR)
	@echo "BUILD $< -> $@"
	@tr '[:lower:]' '[:upper:]' < "$<" > "$@"

check:
	@if [ ! -d "$(SRC_DIR)" ]; then \
		echo "ERROR: source directory '$(SRC_DIR)' does not exist"; \
		exit 1; \
	fi
	@if [ -z "$(wildcard $(SRC_DIR)/*.txt)" ]; then \
		echo "ERROR: no .txt files found in $(SRC_DIR)"; \
		exit 1; \
	fi
	@echo "CHECK: found $(words $(SOURCES)) source file(s) in $(SRC_DIR)"

build: $(OUTPUTS)

test: build
	@if grep -n '[[:lower:]]' $(OUTPUTS) >/dev/null 2>&1; then \
		echo "TEST FAILED: lowercase characters remain"; \
		exit 1; \
	fi
	@echo "TEST PASSED"

clean:
	rm -rf $(OUT_DIR)

ci: clean check test
