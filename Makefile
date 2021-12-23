VERSION ?= `[ -d ".git" ] && git describe --tags --long --dirty || date +%Y.%m.%d-dev`
LDFLAGS=-ldflags "-s -w -X main.appVersion=${VERSION}"
BINARY="tproxy-go"

MAKEFLAGS += --no-print-directory

build: *.go go.*
	go build ${LDFLAGS} -o ${BINARY}

clean:
	rm -f ${BINARY}

arm:
	GOOS=linux GOARCH=arm GOARM=5 $(MAKE) build