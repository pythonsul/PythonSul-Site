OS := $(shell uname -s)
HUGO := $(shell command -v hugo 2>/dev/null)

MIN_VERSION := 0.148.2

ifeq ($(OS),Linux)
	SYSTEM := linux
	BIN_PATH := $(HOME)/.local/bin
else ifeq ($(OS),Darwin)
	SYSTEM := macos
	BIN_PATH := /usr/local/bin
else ifeq ($(OS),Windows_NT)
	SYSTEM := windows
	# Use forward slashes for paths inside Makefile shell commands
	BIN_PATH := $(subst \,/,$(USERPROFILE))/bin
else
	SYSTEM := unknown
	BIN_PATH := unknown
endif

RELEASE_URL = https://github.com/gohugoio/hugo/releases/download/v$(MIN_VERSION)/hugo_extended_$(MIN_VERSION)_$(SYSTEM)-64bit.tar.gz

.PHONY: check install update serve build create_post

check:
	@if [ -z "$(HUGO)" ]; then \
		echo "Hugo is not installed. Run 'make install' to install Hugo Extended."; \
		exit 1; \
	else \
		echo "Hugo found at $(HUGO)"; \
		HUGO_VERSION=$$($(HUGO) version | awk '{print $$2}' | sed 's/v//' | cut -d'-' -f1); \
		if [ "$$HUGO_VERSION" != "$(MIN_VERSION)" ]; then \
			echo "Warning: Installed Hugo version ($$HUGO_VERSION) does not match the required version ($(MIN_VERSION)). Consider updating."; \
		else \
			echo "Hugo version is up to date."; \
		fi; \
	fi

update:
	@echo "Updating to Hugo Extended version $(MIN_VERSION)..."
	@if [ -z "$(HUGO)" ]; then \
		echo "Hugo is not installed. Run 'make install' to install Hugo Extended."; \
		exit 1; \
	else \
		HUGO_VERSION=$$($(HUGO) version | awk '{print $$2}' | sed 's/v//' | cut -d'-' -f1); \
		if [ "$$HUGO_VERSION" = "$(MIN_VERSION)" ]; then \
			echo "Hugo is already at the required version ($(MIN_VERSION)). No update needed."; \
		else \
			echo "Current Hugo version is $$HUGO_VERSION. Updating to $(MIN_VERSION)..."; \
			echo "Removing existing Hugo at $(HUGO)..."; \
			if [ "$(SYSTEM)" = "windows" ]; then \
				del "$(HUGO)" || echo "Failed to remove Hugo executable. Please remove manually."; \
			else \
				sudo rm -f "$(HUGO)" || echo "Failed to remove Hugo executable. Please remove manually."; \
			fi; \
			$(MAKE) install; \
		fi; \
	fi

install:
	@echo "Detected OS: $(SYSTEM)"
	@if [ "$(SYSTEM)" = "unknown" ]; then \
		echo "Unsupported OS. Please install Hugo manually."; \
		exit 1; \
	fi

	@if [ -z "$(HUGO)" ]; then \
		echo "Installing Hugo Extended version $(MIN_VERSION)..."; \
		TEMP_DIR=$$(mktemp -d); \
		cd $$TEMP_DIR; \
		echo "Downloading $(RELEASE_URL)..."; \
		curl -L -o hugo.tar.gz "$(RELEASE_URL)"; \
		tar -xzf hugo.tar.gz; \
		if [ "$(SYSTEM)" = "windows" ]; then \
			mkdir -p "$(BIN_PATH)"; \
			mv hugo.exe "$(BIN_PATH)/hugo.exe"; \
			echo "Moved hugo.exe to $(BIN_PATH). Make sure it's in your PATH."; \
		else \
			sudo mkdir -p "$(BIN_PATH)"; \
			mv hugo "$(BIN_PATH)/hugo"; \
			echo "Moved hugo to $(BIN_PATH)."; \
			echo "If on Linux or macOS, ensure $(BIN_PATH) is in your PATH."; \
		fi; \
		echo "Installation complete."; \
	else \
		echo "Hugo is already installed at $(HUGO)"; \
	fi

serve: check
	@$(HUGO) server --renderToMemory --disableFastRender

create_post:
	@echo "Creating a new post..."
	@read -p "Enter the title of the post: " title; \
	if [ -z "$$title" ]; then \
		echo "Title cannot be empty. Post creation aborted."; \
		exit 1; \
	fi; \
	read -p "Enter the language of the post *default is 'portuguese': " lang; \
	if [ -z "$$lang" ]; then \
		lang="portuguese"; \
	fi; \
	$(HUGO) new "$$lang"/blog/"$$title".md; \
	echo "Post created at content/markdown/$$lang/blog/$$title.md"

build: check
	@$(HUGO) --minify --gc
	@rm -rf resources
	@rm -rf .hugo_build.lock
	@echo "Build complete. Check the 'public' directory for the output."
