BIN := bin/gendiff

build:
	go build -o $(BIN) ./cmd/gendiff/main.go

install:
	go install ./cmd/gendiff

uninstall:
	go clean -i ./cmd/gendiff

lint:
	golangci-lint run

lint-fix:
	golangci-lint run --fix

fmt:
	golangci-lint fmt

test:
	go test -coverprofile=coverage.out ./...

cover:
	go tool cover -func=coverage.out

cover-html: cover
	go tool cover -html=coverage.out

check: test lint build clean
	@echo "✅ All checks passed"

clean:
	rm -f $(BIN) coverage*.out

.PHONY: install uninstall test fmt lint-fix lint build cover cover-html clean check
