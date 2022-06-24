# See in https://www.gnu.org/software/make/manual/html_node/index.html
# for more information about Makefile.
.POSIX:
SHELL := /bin/bash
GO :=  $(shell which go)
YARN :=  $(shell which yarn)

BIN_NAME := alist

# Build the project.
build: fmt
	@echo -e "\033[32mBuilding the application...\033[0m"
	$(GO) build -ldflags "-s -w" -o ./dist/$(BIN_NAME) ./cmd/$(BIN_NAME)/main.go
	@echo -e "\033[32mBuild finished.\033[0m"

# Local development
dev:
	$(GO) build -o ./dist/$(BIN_NAME) ./cmd/$(BIN_NAME)/main.go
	./dist/$(BIN_NAME)

# Format the code
fmt:
	@echo -e "\033[32mFormatting the code...\033[0m"
	$(GO) fmt ./...
	$(YARN) run fmt
	@echo -e "\033[32mFormatting finished.\033[0m"

# Install dependencies
install:
	@echo -e "\033[32mInstalling dependencies...\033[0m"
	if [ ! -d "node_modules" ]; then $(YARN); fi
	@echo -e "\033[32mDependencies installed.\033[0m"
