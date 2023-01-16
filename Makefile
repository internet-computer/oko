.PHONY: all build test testc format

all: format test

build:
	go build ./cmd/main.go
	mv ./main ./oko
	chmod +x ./oko
	./oko version

test:
	go test -v ./...

testc:
	go test -v -coverpkg=./... -coverprofile=coverage.out.tmp ./...
	cat coverage.out.tmp | grep -v "main.go" > coverage.out
	rm coverage.out.tmp
	go tool cover -func=coverage.out
	go tool cover -html=coverage.out

format:
	go fmt ./...
	goarrange run -r .